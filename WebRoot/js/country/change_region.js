

var country = new Array(
"Beijing" , "北京",
"Shanghai" , "上海",
"Tianjin" , "天津",
"Chongqing" , "重庆",
"Anhui" , "安徽",
"Fujian" , "福建",
"Gansu" , "甘肃",
"Hebei" , "河北",
"Heilongjiang" , "黑龙江",
"Guangdong" , "广东",
"Guangxi" , "广西",
"Guizhou" , "贵州",
"Henan" , "河南",
"Hubei" , "湖北",
"Hunan" , "湖南",
"Hainan" , "海南",
"Jiangsu" , "江苏",
"Jiangxi" , "江西",
"Jilin" , "吉林",
"Liaoning" , "辽宁",
"Neimenggu" , "内蒙古",
"Ningxia" , "宁夏",
"Qinghai" , "青海",
"Shandong" , "山东",
"Shanxi" , "山西",
"Shaanxi" , "陕西",
"Sichuan" , "四川",
"Xinjiang" , "新疆",
"Xizang" , "西藏",
"Yunnan" , "云南",
"Zhejiang" , "浙江",
"Hongkong" , "香港",
"Macao" , "澳门",
"Taiwan" , "台湾") ;



var Beijing = new Array(
"0" , "北京市") ;

var Shanghai = new Array(
"1" , "上海市") ;

var Tianjin = new Array(
"2" , "天津市") ;

var Chongqing = new Array(
"3" , "重庆市") ;

var Anhui = new Array(
"4" , "合肥市",
"5" , "宿州市",
"6" , "淮北市",
"7" , "阜阳市",
"8" , "蚌埠市",
"9" , "淮南市",
"10" , "滁州市",
"11" , "马鞍山市",
"12" , "芜湖市",
"13" , "铜陵市",
"14" , "安庆市",
"15" , "黄山市",
"16" , "六安市",
"17" , "巢湖市",
"18" , "池州市",
"19" , "宣城市",
"20" , "亳州市",
"21" , "其它地区") ;

var Fujian = new Array( 
"22" , "福州市",
"23" , "南平市",
"24" , "三明市",
"25" , "莆田市",
"26" , "泉州市",
"27" , "厦门市",
"28" , "漳州市",
"29" , "龙岩市",
"30" , "宁德市",
"31" , "其它地区") ;

var Gansu = new Array( 
"32" , "兰州市",
"33" , "嘉峪关市",
"34" , "金昌市",
"35" , "白银市",
"36" , "天水市",
"37" , "酒泉市",
"38" , "张掖市",
"39" , "武威市",
"40" , "庆阳市",
"41" , "平凉市",
"42" , "定西市",
"43" , "陇南地区",
"44" , "临夏回族自治州",
"45" , "甘南藏族自治州",
"46" , "玉门市",
"47" , "敦煌市",
"48" , "其它地区") ;

var Hebei = new Array( 
"49" , "石家庄市",
"50" , "张家口市",
"51" , "承德市",
"52" , "秦皇岛市",
"53" , "唐山市",
"54" , "廊坊市",
"55" , "保定市",
"56" , "沧州市",
"57" , "衡水市",
"58" , "邢台市",
"59" , "邯郸市",
"60" , "其它地区") ;

var Heilongjiang = new Array( 
"61" , "哈尔滨市",
"62" , "齐齐哈尔市",
"63" , "黑河市",
"64" , "大庆市",
"65" , "伊春市",
"66" , "鹤岗市",
"67" , "佳木斯市",
"68" , "双鸭山市",
"69" , "七台河市",
"70" , "鸡西市",
"71" , "牡丹江市",
"72" , "绥化地区",
"73" , "大兴安岭地区",
"74" , "其它地区") ;

var Guangdong = new Array(
"75" , "广州市",
"76" , "清远市",
"77" , "韶关市",
"78" , "河源市",
"79" , "梅州市",
"80" , "潮州市",
"81" , "汕头市",
"82" , "揭阳市",
"83" , "汕尾市",
"84" , "惠州市",
"85" , "东莞市",
"86" , "深圳市",
"87" , "珠海市",
"88" , "中山市",
"89" , "江门市",
"90" , "佛山市",
"91" , "肇庆市",
"92" , "云浮市",
"93" , "阳江市",
"94" , "茂名市",
"95" , "湛江市",
"96" , "其它地区") ;

var Guangxi = new Array( 
"97" , "南宁市",
"98" , "桂林市",
"99" , "柳州市",
"100" , "梧州市",
"101" , "贵港市",
"102" , "玉林市",
"103" , "钦州市",
"104" , "北海市",
"105" , "防城港市",
"106" , "百色市",
"107" , "河池地区",
"108" , "贺州地区",
"109" , "崇左市",
"110" , "凭祥市",
"111" , "来宾市",
"112" , "其它地区") ;

var Guizhou = new Array( 
"113","贵阳市",
"114","六盘水市",
"115","遵义市",
"116","毕节地区",
"117","铜仁地区",
"118","安顺市",
"119","黔东南苗族侗族自治州",
"120","黔南布依族苗族自治州",
"121","黔西南布依族苗族自治州",
"122","其它地区") ;

var Henan = new Array(
"123","郑州市",
"124","三门峡市",
"125","洛阳市",
"126","焦作市",
"127","新乡市",
"128","鹤壁市",
"129","安阳市",
"130","濮阳市",
"131","开封市",
"132","商丘市",
"133","许昌市",
"134","漯河市",
"135","平顶山市",
"136","南阳市",
"137","信阳市",
"138","济源市",
"139","周口市",
"140","驻马店市",
"141","其它地区") ;

var Hubei = new Array( 
"142","武汉市",
"143","十堰市",
"144","襄樊市",
"145","荆门市",
"146","孝感市",
"147","黄冈市",
"148","鄂州市",
"149","黄石市",
"150","咸宁市",
"151","荆州市",
"152","宜昌市",
"153","随州市",
"154","仙桃市",
"155","天门市",
"156","潜江市",
"157","神农架林区",
"158","恩施土家族苗族自治州",
"159","其它地区") ;

var Hunan = new Array( 
"160","长沙市",
"161","张家界市",
"162","常德市",
"163","益阳市",
"164","岳阳市",
"165","株洲市",
"166","湘潭市",
"167","衡阳市",
"168","郴州市",
"169","永州市",
"170","邵阳市",
"171","怀化市",
"172","娄底市",
"173","湘西土家族苗族自治州",
"174","其它地区") ;

var Hainan = new Array( 
"175","海口市",
"176","三亚市",
"177","琼山市",
"178","文昌市",
"179","琼海市",
"180","万宁市",
"181","东方市",
"182","儋州市",
"183","五指山市",
"184","其它地区") ;

var Jiangsu = new Array(
"185","南京市",
"186","徐州市",
"187","连云港市",
"188","宿迁市",
"189","淮阴市",
"190","盐城市",
"191","扬州市",
"192","泰州市",
"193","南通市",
"194","镇江市",
"195","常州市",
"196","无锡市",
"197","苏州市",
"198","淮安市",
"199","其它地区") ;

var Jiangxi = new Array(
"200","南昌市",
"201","九江市",
"202","景德镇市",
"203","鹰潭市",
"204","新余市",
"205","萍乡市",
"206","赣州市",
"207","上饶市",
"208","抚州市",
"209","宜春市",
"210","吉安市",
"211","其它地区") ;

var Jilin = new Array( 
"212","长春市",
"213","白城市",
"214","松原市",
"215","吉林市",
"216","四平市",
"217","辽源市",
"218","通化市",
"219","白山市",
"220","延边朝鲜族自治州",
"221","其它地区") ;

var Liaoning = new Array( 
"222","沈阳市",
"223","朝阳市",
"224","阜新市",
"225","铁岭市",
"226","抚顺市",
"227","本溪市",
"228","辽阳市",
"229","鞍山市",
"230","丹东市",
"231","大连市",
"232","营口市",
"233","盘锦市",
"234","锦州市",
"235","葫芦岛市",
"236","其它地区") ;

var Neimenggu = new Array( 
"237","呼和浩特市",
"238","包头市",
"239","乌海市",
"240","赤峰市",
"241","呼伦贝尔",
"242","兴安盟",
"243","锡林郭勒盟",
"244","乌兰察布市",
"245","巴彦淖尔市",
"246","阿拉善盟",
"247","鄂尔多斯市",
"248","通辽市",
"249","其它地区") ;

var Ningxia = new Array( 
"250" , "银川市",
"251" , "石嘴山市",
"252" , "吴忠市",
"253" , "固原市",
"254" , "其它地区") ;

var Qinghai = new Array( 
"255","西宁市",
"256","海东地区",
"257","海北藏族自治州",
"258","海南藏族自治州",
"259","黄南藏族自治州",
"260","果洛藏族自治州",
"261","玉树藏族自治州",
"262","海西蒙古族藏族自治州",
"263","其它地区") ;

var Shandong = new Array( 
"264","济南市",
"265","聊城市",
"266","德州市",
"267","东营市",
"268","淄博市",
"269","潍坊市",
"270","烟台市",
"271","威海市",
"272","青岛市",
"273","日照市",
"274","临沂市",
"275","枣庄市",
"276","济宁市",
"277","泰安市",
"278","莱芜市",
"279","滨州市",
"280","菏泽市",
"281","其它地区") ;

var Shanxi = new Array( 
"282","太原市",
"283","大同市",
"284","朔州市",
"285","阳泉市",
"286","长治市",
"287","晋城市",
"288","忻州市",
"289","吕梁市",
"290","晋中市",
"291","临汾市",
"292","运城市",
"293","其它地区") ;

var Shaanxi = new Array( 
"294","西安市",
"295","延安市",
"296","铜川市",
"297","渭南市",
"298","咸阳市",
"299","宝鸡市",
"300","汉中市",
"301","榆林市",
"302","商洛市",
"303","安康市",
"304","其它地区") ;

var Sichuan = new Array( 
"305","成都市",
"306","广元市",
"307","绵阳市",
"308","德阳市",
"309","南充市",
"310","广安市",
"311","遂宁市",
"312","内江市",
"313","乐山市",
"314","自贡市",
"315","泸州市",
"316","宜宾市",
"317","攀枝花市",
"318","巴中市",
"319","达州市",
"320","资阳市",
"321","眉山市",
"322","雅安市",
"323","阿坝藏族羌族自治州",
"324","甘孜藏族自治州",
"325","凉山彝族自治州",
"326","其它地区") ;

var Xinjiang = new Array( 
"327","乌鲁木齐市",
"328","克拉玛依市",
"329","石河子市",
"330","喀什地区",
"331","阿克苏地区",
"332","和田地区",
"333","吐鲁番地区",
"334","哈密地区",
"335","克孜勒苏柯尔克孜自治州",
"336","博尔塔拉蒙古自治州",
"337","昌吉回族自治州",
"338","巴音郭楞蒙古自治州",
"339","伊犁哈萨克自治州",
"340","其它地区") ;

var Xizang = new Array( 
"341","拉萨市",
"342","那曲地区",
"343","昌都地区",
"344","林芝地区",
"345","山南地区",
"346","日喀则地区",
"347","阿里地区",
"348","其它地区") ;

var Yunnan = new Array( 
"349","昆明市",
"350","曲靖市",
"351","玉溪市",
"352","丽江市",
"353","昭通市",
"354","思茅市",
"355","临沧地区",
"356","保山市",
"357","德宏傣族景颇族自治州",
"358","怒江傈傈族自治州",
"359","迪庆藏族自治州",
"360","大理白族自治州",
"361","楚雄彝族自治州",
"362","红河哈尼族彝族自治州",
"363","文山壮族苗族自治州",
"364","西双版纳傣族自治州",
"365","其它地区") ;

var Zhejiang = new Array( 
"366","杭州市",
"367","湖州市",
"368","嘉兴市",
"369","舟山市",
"370","宁波市",
"371","绍兴市",
"372","金华市",
"373","台州市",
"374","温州市",
"375","丽水市",
"376","衢州市",
"377","其它地区") ;

var Hongkong = new Array( 
"378" , "香港") ;

var Macao = new Array(
"379" , "澳门") ;

var Taiwan = new Array(
"380" , "台湾") ;








var degree = new Array(
"Doctoral","博士",
"Master","硕士",
"Bachelor","大学",
"Junior college","大专",
"Below junior college","大专以下"
) ;






function change_region( state_select, country_name )
{
	var state_array ;
	var state_select_num ;
	var i ;
	var city_array ;
	state_select.selectedIndex = 0 ;


				

	country_name = country_name.replace(" " , "_" ) ;
	country_name = country_name.replace(" " , "_" ) ;
	state_array = eval( country_name ) ;
	state_select_num = state_array.length/2 +1 ;
	
	state_select.options.length = state_select_num ;
	for( i=1 ; i<state_select_num ; i++ )
	{
		state_select.options[i].value = state_array[(i-1)*2] ;
		state_select.options[i].text = state_array[(i-1)*2+1] ;
	}
}

function set_select_options( select_name, array , selected_option )
{
	var select_num ;
	var i ;
	
	select_num = array.length/2 +1 ;
	
	select_name.options.length = select_num ;
	select_name.selectedIndex = 0 ;
	for( i=1 ; i<select_num ; i++ )
	{
		select_name.options[i].value = array[(i-1)*2] ;
		select_name.options[i].text = array[(i-1)*2+1] ;
		
		if( array[(i-1)*2] == selected_option )
			select_name.selectedIndex = i ;	
	}
}

function change_regions( state_select, city_select , country_name )
{
	var state_array ;
	var state_select_num ;
	var i ;
	
	change_region( city_select , "Not set") ;
	state_select.selectedIndex = 0 ;
	
	if( country_name == "Not set" )
	{
		state_select.options.length = 1 ;	
		
		return ;	
	}
	
	state_array = eval( country_name ) ;
	state_select_num = state_array.length/2 +1 ;
	
	state_select.options.length = state_select_num ;
	for( i=1 ; i<state_select_num ; i++ )
	{
		state_select.options[i].value = state_array[(i-1)*2] ;
		state_select.options[i].text = state_array[(i-1)*2+1] ;
	}
	
		
}

function checkhtml(object , object1 , object2 , object3 , object4 , object5 )
{
	
	var r ;
	if ( object )
	{
		r = object.match(/\<.*?>/ig,"");
		if ( r ) 
		{
			alert("标题不允许含有javascript及html标记!!") ;
			return false;
		}
	}
	
	if ( object1 )
	{
		r = object1.match(/\<.*?>/ig,"");
		if ( r ) 
		{
			alert("标题不允许含有javascript及html标记!!") ;
			return false;
		}
	}
	
	if ( object2)
	{
		r = object2.match(/\<.*?>/ig,"");
		if ( r ) 
		{
			alert("标题不允许含有javascript及html标记!!") ;
			return false;
		}
	}
	if ( object3 )
	{
		r = object3.match(/(<|<\/)(html|body|pre|iframe|head|script|embed|meta|form|noscript)[\w|\t|\r|\W]*/i) ;
		if ( r ) 
		{
			alert("内容不允许含有javascript及特殊html标记(编辑器提供以外的标记)!") ;
			return false;
		}
	}
	
	if ( object4 )
	{
		r = object4.match(/(<|<\/)(html|body|pre|iframe|head|script|embed|meta|form|noscript)[\w|\t|\r|\W]*/i) ;
		if ( r ) 
		{
			alert("内容不允许含有javascript及特殊html标记(编辑器提供以外的标记)!") ;
			return false;
		}
	}
	
	object5.value = true ;
	
	return true ;
}

function set_textarea_value( textarea1 )
{
	textarea1.value = editor.getHTML();
	return true ;	
}
