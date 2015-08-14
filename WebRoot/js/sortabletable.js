function SortableTable(oTable, oSortTypes) {

	this.element = oTable;
	this.tHead = oTable.tHead;
	this.tBody = oTable.tBodies[0];
	this.document = oTable.ownerDocument || oTable.document;
	
	this.sortColumn = null;
	this.descending = null;
	
	var oThis = this;
	this._headerOnclick = function (e) {
		oThis.headerOnclick(e);
	};
	
	
	// only IE needs this
	var win = this.document.defaultView || this.document.parentWindow;
	this._onunload = function () {
		oThis.destroy();
	};
	if (win && typeof win.attachEvent != "undefined") {
		win.attachEvent("onunload", this._onunload);
	}
	this.initHeader(oSortTypes || []);
}

SortableTable.gecko = navigator.product == "Gecko";
SortableTable.msie = /msie/i.test(navigator.userAgent);
// Mozilla is faster when doing the DOM manipulations on
// an orphaned element. MSIE is not
SortableTable.removeBeforeSort = SortableTable.gecko;

SortableTable.prototype.onsort = function () {};

// adds arrow containers and events
// also binds sort type to the header cells so that reordering columns does
// not break the sort types
SortableTable.prototype.initHeader = function (oSortTypes) {
	var cells = this.tHead.rows[0].cells;
	var l = cells.length;
	var img, c;
	for (var i = 0; i < l; i++) {
		c = cells[i];
		/******************ÏÔÊ¾±êÌâÍ¼Æ¬***************************/
		//img = this.document.createElement("IMG");
		//img.src = ((IsRoot!=null && IsRoot)?'':'../') + "images/blank.png";
		//c.appendChild(img);
		/**************************************/
	    if (oSortTypes[i] != null) {
			c._sortType = oSortTypes[i];
		}
		if (typeof c.addEventListener != "undefined")
			c.addEventListener("click", this._headerOnclick, false);
		else if (typeof c.attachEvent != "undefined")		
			c.attachEvent("onclick", this._headerOnclick);
	}
	//this.updateHeaderArrows();
};

// remove arrows and events
SortableTable.prototype.uninitHeader = function () {
	var cells = this.tHead.rows[0].cells;
	var l = cells.length;
	var c;
	for (var i = 0; i < l; i++) {
		c = cells[i];
		c.removeChild(c.lastChild);
		if (typeof c.removeEventListener != "undefined")
			c.removeEventListener("click", this._headerOnclick, false);
		else if (typeof c.detachEvent != "undefined")
			c.detachEvent("onclick", this._headerOnclick);
	}
};

SortableTable.prototype.updateHeaderArrows = function () {
	//var cells = this.tHead.rows[0].cells;
	//var l = cells.length;
	//var img;
	//for (var i = 0; i < l; i++) {
		//img = cells[i].lastChild;
		//if (i == this.sortColumn)
			//img.className = "sort-arrow " + (this.descending ? "descending" : "ascending");
		//else
			//img.className = "sort-arrow";			
	//}
};

SortableTable.prototype.headerOnclick = function (e) {
	// find TD element
	var el = e.target || e.srcElement;
	while (el.tagName != "TD")
		el = el.parentNode;
	
	this.sort(el.cellIndex);	
};

SortableTable.prototype.getSortType = function (nColumn) {
	var cell = this.tHead.rows[0].cells[nColumn];
	var val = cell._sortType;
	if (val != "")
		return val;
	return "String";
};

// only nColumn is required
// if bDescending is left out the old value is taken into account
// if sSortType is left out the sort type is found from the sortTypes array

SortableTable.prototype.sort = function (nColumn, bDescending, sSortType) {
	if (sSortType == null)
		sSortType = this.getSortType(nColumn);

	// exit if None	
	if (sSortType == "None")
		return;
	
	if (bDescending == null) {
		if (this.sortColumn != nColumn)
			this.descending = true;
		else
			this.descending = !this.descending;
	}	
	
	this.sortColumn = nColumn;
	
	if (typeof this.onbeforesort == "function")
		this.onbeforesort();
	
	var f = this.getSortFunction(sSortType, nColumn);
	var a = this.getCache(sSortType, nColumn);
	var tBody = this.tBody;
	
	// hacked by ULION for keep last order in this sort
	if (this.descending)
		a.reverse();
	
	a.sort(f);
	
	if (this.descending)
		a.reverse();
	
	if (SortableTable.removeBeforeSort) {
		// remove from doc
		var nextSibling = tBody.nextSibling;
		var p = tBody.parentNode;
		p.removeChild(tBody);
	}
	
	// insert in the new order
	var l = a.length;
	for (var i = 0; i < l; i++)
		tBody.appendChild(a[i].element);
	
	if (SortableTable.removeBeforeSort) {	
		// insert into doc
		p.insertBefore(tBody, nextSibling);
	}
	
	this.updateHeaderArrows();
	
	this.destroyCache(a);
	
	if (typeof this.onsort == "function")
		this.onsort();
};

SortableTable.prototype.asyncSort = function (nColumn, bDescending, sSortType) {
	var oThis = this;
	this._asyncsort = function () {
		oThis.sort(nColumn, bDescending, sSortType);
	};
	window.setTimeout(this._asyncsort, 1);	
};

SortableTable.prototype.getCache = function (sType, nColumn) {
	var rows = this.tBody.rows;
	var l = rows.length;
	var a = new Array(l);
	var r;
	for (var i = 0; i < l; i++) {
		r = rows[i];
		a[i] = {
			value:		this.getRowValue(r, sType, nColumn),
			element:	r
		};
	};
	return a;
};

SortableTable.prototype.destroyCache = function (oArray) {
	var l = oArray.length;
	for (var i = 0; i < l; i++) {
		oArray[i].value = null;
		oArray[i].element = null;
		oArray[i] = null;
	}
}

SortableTable.prototype.getRowValue = function (oRow, sType, nColumn) {
	var s;
	var c = oRow.cells[nColumn];
	if (typeof c.innerText != "undefined")
		s = c.innerText;
	else
		s = SortableTable.getInnerText(c);
	return this.getValueFromString(s, sType);
};

SortableTable.getInnerText = function (oNode) {
	var s = "";	
	var cs = oNode.childNodes;
	var l = cs.length;
	for (var i = 0; i < l; i++) {
		switch (cs[i].nodeType) {
			case 1: //ELEMENT_NODE
				s += SortableTable.getInnerText(cs[i]);
				break;
			case 3:	//TEXT_NODE
				s += cs[i].nodeValue;
				break;
		}
	}
	return s;
}

SortableTable.prototype.getValueFromString = function (sText, sType) {
	switch (sType) {
		case "Number":
			return Number(sText);
		case "CaseInsensitiveString":
			return sText.toUpperCase();
		case "Date":
			var parts = sText.split("-");
			var d = new Date(0);
			d.setFullYear(parts[0]);
			d.setDate(parts[2]);
			d.setMonth(parts[1] - 1);			
			return d.valueOf();		
	}
	return sText;
};

SortableTable.prototype.getSortFunction = function (sType, nColumn) {
	return function compare(n1, n2) {
		if (n1.value < n2.value)
			return -1;
		if (n2.value < n1.value)
			return 1;
		return 0;
	};
};

SortableTable.prototype.destroy = function () {
	this.uninitHeader();
	var win = this.document.parentWindow;
	if (win && typeof win.detachEvent != "undefined") {	// only IE needs this
		win.detachEvent("onunload", this._onunload);
	}	
	this._onunload = null;
	this.element = null;
	this.tHead = null;
	this.tBody = null;
	this.document = null;
	this._headerOnclick = null;
	this.sortTypes = null;
	this._asyncsort = null;
	this.onsort = null;
};

// Title: Tigra Hints
// URL: http://www.softcomplex.com/products/tigra_hints/
// Version: 1.2
// Date: 04/18/2003 (mm/dd/yyyy)
// Feedback: feedback@softcomplex.com (specify product title in the subject)
// Note: Permission given to use this script in ANY kind of applications if
//    header lines are left unchanged.
// About us: Our company provides offshore IT consulting services.
//    Contact us at sales@softcomplex.com if you have any programming task you
//    want to be handled by professionals. Our typical hourly rate is $20.

function THints (o_cfg, items) {
	this.top = o_cfg.top ? o_cfg.top : 0;
	this.left = o_cfg.left ? o_cfg.left : 0;
	this.n_dl_show = o_cfg.show_delay;
	this.n_dl_hide = o_cfg.hide_delay;
	this.b_wise = o_cfg.wise;
	this.b_follow = o_cfg.follow;
	this.out_delay = o_cfg.out_delay;
	this.x = 0;
	this.y = 0;
	this.divs = [];
	this.show  = TTipShow;
	this.showD = TTipShowD;
	this.hide = TTipHide;
	this.hideD = TTipHideD;
	this.move = TTipMove;
	this.items = items;
	if (document.layers) return;
	this.b_IE = navigator.userAgent.indexOf('MSIE') > -1 && !window.opera,
	s_tag = ['<div id="TTip%name%" style="visibility:hidden;position:absolute;top:0px;left:0px;',   this.b_IE ? 'width:1px;height:1px;' : '', o_cfg['z-index'] != null ? 'z-index:' + o_cfg['z-index'] : '', '" onMouseOver="myHint.show();" onMouseOut="myHint.hide(' + o_cfg.out2_delay + ');"><table cellpadding="0" cellspacing="0" border="0"><tr><td id="ToolTip%name%" class="', o_cfg.css, '" nowrap>%text%</td></tr></table></div>'].join('');


	this.getElem = 
		function (id) { return document.all ? document.all[id] : document.getElementById(id); };
	this.showElem = 
		function (id, hide) { this.divs[id].o_css.visibility = hide ? 'hidden' : 'visible'; };
	this.getWinSz = window.innerHeight != null 
		? function (b_hight) { return b_hight ? innerHeight : innerWidth; }
		: function (b_hight) { return document.body[b_hight ? 'clientHeight' : 'clientWidth']; };	
	this.getWinSc = window.innerHeight != null 
		? function (b_hight) { return b_hight ? pageYOffset : pageXOffset; }
		: function (b_hight) { return document.body[b_hight ? 'scrollTop' : 'scrollLeft']; };	
	if (document.all) {
		document.onclick = function (e) {
      whichIt = event.srcElement;
  		while (whichIt != myHint.divs[0].o_obj) {
	  		whichIt = whichIt.parentElement;
		  	if (whichIt == null){
    		  myHint.hide(0);
		  	  return true;
		  	}
		  }
		  return true;
		};
	}
	if (window.opera) {
		this.getSize = function (id, b_hight) { 
			return this.divs[id].o_css[b_hight ? 'pixelHeight' : 'pixelWidth']
		};
		document.onmousemove = function () {
			myHint.x = event.clientX;
			myHint.y = event.clientY;
			if (myHint.b_follow && myHint.visible!=null) myHint.move(0);
			return true;
		};
	}
	else {
		this.getSize = function (id, b_hight) { 
			return this.divs[id].o_obj[b_hight ? 'offsetHeight' : 'offsetWidth'] 
		};
		if(!document.all){
		window.onmousedown = function (evt) {
      whichIt = evt.target;
  		while (whichIt != myHint.divs[0].o_obj) {
	  		whichIt = whichIt.parentNode;
		  	if (whichIt == null){
    		  myHint.hide(0);
		  	  return true;
		  	}
		  }
		  return true;
		};
		}
		document.onmousemove = this.b_IE
		? function () {
			myHint.x = event.clientX + document.body.scrollLeft;
			myHint.y = event.clientY + document.body.scrollTop;
			if (myHint.b_follow && myHint.visible!=null) myHint.move(0)
			return true;
		} 
		: function (e) {
			myHint.x = e.pageX;
			myHint.y = e.pageY;
			if (myHint.b_follow && myHint.visible!=null) myHint.move(0)
			return true;
		};
	}
	document.write (s_tag.replace(/%text%/g, '').replace(/%name%/g, 0));
	this.divs[0] = { 'o_obj' : this.getElem('TTip' + 0), 'o_content' : this.getElem('ToolTip' + 0) };
	this.divs[0].o_css = this.divs[0].o_obj.style;
/*	for (i in items) {
		document.write (s_tag.replace(/%text%/, items[i]).replace(/%name%/, i));
		this.divs[i] = { 'o_obj' : this.getElem('TTip' + i) };
		this.divs[i].o_css = this.divs[i].o_obj.style;
	}*/
}

function TTipShow (id) {
	if (document.layers) return;
  if (this.timer2) clearTimeout(this.timer2);
  if (id==null){
//    if (this.divs[0].timer) clearTimeout(this.divs[0].timer);
    return;
  }
	if (this.visible!=null && this.visible==id){
	  return;
	}
 	this.hide(0);
	if (this.divs[0] && this.items[id]) {
		if (this.n_dl_show) this.divs[0].timer = setTimeout("myHint.showD(" + id + ")", this.n_dl_show);
		else this.showD(id);
	}
}

function TTipShowD (id) {
  this.divs[0].o_content.innerHTML = this.items[id];
  init_btchina(this.divs[0].o_content);
	if((this.move(0)&2)!=0 && this.b_IE){
  	var mySels = document.getElementsByTagName('select');
    for (var i = 0; i < mySels.length; i++){
  	  var e = mySels[i];
  	  var t=e.offsetTop;  
  	  var l=e.offsetLeft;  
  while(e=e.offsetParent){  
    t+=e.offsetTop;  
    l+=e.offsetLeft; 
    }
    var obj = this.divs[0].o_obj;
  	  if(obj.offsetTop<t+mySels[i].offsetHeight 
  	  && obj.offsetTop + obj.offsetHeight>=t
  	  && obj.offsetLeft<l+mySels[i].offsetWidth
  	  && obj.offsetLeft + obj.offsetWidth>=l){
  	    mySels[i].style.display='none';
  	  }
  	}
	}
	this.showElem(0);
	if (this.n_dl_hide) this.timer = setTimeout("myHint.hide(0)", this.n_dl_hide);
	this.visible = id;
}

function TTipMove (id) {
	var n_x = this.x + this.left, n_y = this.y + this.top;
	if(window.opera){
		n_x += this.getWinSc();
		n_y += this.getWinSc(true);
	}
	var ret = 0;
	if (this.b_wise!=0) {
		var n_w = this.getSize(id), n_h = this.getSize(id, true),
		n_win_w = this.getWinSz(), n_win_h = this.getWinSz(true),
		n_win_l = this.getWinSc(), n_win_t = this.getWinSc(true);
		if (n_x + n_w > n_win_w + n_win_l) n_x = n_win_w + n_win_l - n_w;
		if (n_x < n_win_l) n_x = n_win_l;
		if (n_x != this.x + this.left) ret++;
		if (this.b_wise==2 || n_x > this.x){
  		if (n_y + n_h > n_win_h + n_win_t) n_y = n_win_h + n_win_t - n_h;
	  	if (n_y < n_win_t) n_y = n_win_t;
	  	if (n_y != this.y + this.top) ret+=2;
	  }
	}
	this.divs[id].o_css.left = n_x;
	this.divs[id].o_css.top = n_y;
	return ret;
}

function TTipHide (delay) {
	if (this.timer) clearTimeout(this.timer);
  if (this.divs[0].timer) clearTimeout(this.divs[0].timer);
	if (this.visible != null) {
		if(delay==null){
		  delay = this.out_delay;
		}
		if(delay){
			this.timer2 = setTimeout("myHint.hideD()", delay);
		}
		else{
		  this.hideD();
		}
	}
}

function TTipHideD () {
  myHint.showElem(0, true);
	this.visible = null;
	if(this.b_IE){
	  var mySels = document.getElementsByTagName('select');
    for (var i = 0; i < mySels.length; i++)
      mySels[i].style.display='';
 	}
}

var btchina_text_color = '#000000';

var btchina_link_colors = new Array('#ffff66','#a0ffff','#99ff99','#ff9999','#ff66ff');

function init_btchina(container){
	if(btchina_query!=null && btchina_query!=''){
		go_btchina(btchina_query,container);
		return;
	}
	var url_parts = document.location.href.split('?');
	if (url_parts[1]){ 
		var url_args = url_parts[1].split('&');
		for(var i=0; i<url_args.length; i++){
			var keyval = url_args[i].split('=');
			if (keyval[0] == 'query'){
				go_btchina(decode_url(keyval[1]),container);
				return;
			}
		}
	}
}

function decode_url(url){
	return unescape(url.replace(/\+/g,' '));
}

function go_btchina(terms,container){
	terms = terms.replace(/([*\"]|and|or|not)/g,"");
	var terms_split = terms.split(' ');
	var c = 0;
	for(var i=0; i<terms_split.length; i++){
		highlight_btchina(terms_split[i], container==null?document.body:container,btchina_link_colors[c]);
		c = (c == btchina_link_colors.length-1)?0:c+1;
	}
}

function highlight_btchina(term, container, color){
	var term_low = term.toLowerCase();

	for(var i=0; i<container.childNodes.length; i++){
		var node = container.childNodes[i];

		if (node.nodeType == 3){
			var data = node.data;
			var data_low = data.toLowerCase();
			if (data_low.indexOf(term_low) != -1){
				//term found!
				var new_node = document.createElement('SPAN');
				node.parentNode.replaceChild(new_node,node);
				var result;
				while((result = data_low.indexOf(term_low)) != -1){
					new_node.appendChild(document.createTextNode(data.substr(0,result)));
					new_node.appendChild(create_node_btchina(document.createTextNode(data.substr(result,term.length)),color));
					data = data.substr(result + term.length);
					data_low = data_low.substr(result + term.length);
				}
				new_node.appendChild(document.createTextNode(data));
			}
		}else{
			//recurse
			highlight_btchina(term, node, color);
		}
	}
}

function create_node_btchina(child, color){
	var node = document.createElement('SPAN');
	node.style.backgroundColor = color;
	node.style.color = btchina_text_color;
	node.appendChild(child);
	return node;
}