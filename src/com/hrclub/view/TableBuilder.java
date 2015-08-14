package com.hrclub.view;

import java.util.*;

import com.hrclub.*;
import com.hrclub.to.*;

public class TableBuilder implements java.io.Serializable {
	private String strTable = "";

	private String strTitle = "";

	private String strHead = "";

	private String strBody = "";

	private String strFoot = "";

	private String strButtons = "";

	private int colNum;

	private boolean isError = false;

	private boolean selectEnabled = false;

	private boolean isTrType = false;

	private boolean sortable = false;

	private String sortScriptSrc = null;

	private String[] sortType = null;

	private boolean bExcel = false;

	private String selectedId = "rowid";

	private String formName = "tableform";

	private boolean mulSelected = false;

	private int tableBorder;

	private String rowcolor1 = null;

	private String rowcolor2 = null;

	private String rowcolorSelected = null;

	private String titleColor = null;

	private boolean showAllEnable = true;

	private List hiddens = new ArrayList();

	private List scriptsFiles = new ArrayList();

	public TableBuilder() {
	}

	public void addHidden(String hidden) {
		hiddens.add(hidden);
	}

	public void addScriptsFiles(String script) {
		scriptsFiles.add(script);
	}

	public String getFormName() {
		return this.formName;
	}

	public String getSelectedId() {
		return this.selectedId;
	}

	public void setTableBorder(int border) {
		this.tableBorder = border;
	}

	public void setSortable(boolean f, String scriptSrc) {
		this.sortable = f;
		this.sortScriptSrc = scriptSrc;
	}

	public void setSortable(boolean f, String scriptSrc, String[] sortType) {
		this.sortable = f;
		this.sortScriptSrc = scriptSrc;
		this.sortType = sortType;
	}

	public void setToExcel(boolean f) {
		this.bExcel = f;
	}

	public void setSelectEnabled(boolean f, boolean isTrType) {
		this.selectEnabled = f;
		this.isTrType = isTrType;
	}

	public void setSelectEnabled(boolean f) {
		this.selectEnabled = f;
	}

	public void setSelectIdName(String name) {
		this.selectedId = name;
	}

	public void setMulSelected(boolean f) {
		this.mulSelected = f;
	}

	public String getTable() {
		if (this.sortable) {
			strTable += "<SCRIPT src=\""
					+ ((ApplicationResources.WEB_CONTEXT.equals("")) ? ""
							: ApplicationResources.WEB_CONTEXT + "/")
					+ this.sortScriptSrc
					+ "\" type=\"text/javascript\"></SCRIPT>";
		}
		strTable += "<form method=post name=\"" + this.formName + "\"> ";
		Iterator it = hiddens.iterator();
		while (it.hasNext()) {
			String h = (String) it.next();
			strTable += h;
		}
		it = scriptsFiles.iterator();
		while (it.hasNext()) {
			String s = (String) it.next();
			strTable += "<SCRIPT src=\"" + s
					+ "\" type=\"text/javascript\"></SCRIPT>";

		}
		strTable += "<table "
				// + (this.sortable ? "id=\"tableresult\"" : "")
				+ "id=\"tableresult\""
				+ " align=center cellspacing=\"1\" width=\"100%\" bordercolor=\"#000080\" bordercolordark=\"#FFFFFF\" border=\""
				+ tableBorder + "\">" + strTitle;
		if (isError) {
			strTable += strBody;
			strTable += "</table></form>";
			strTable += strButtons;
		} else {
			if (this.sortable) {
				strTable += "<thead>";
			}
			strTable += strHead;
			if (this.sortable) {
				strTable += "</thead>";
			}

			strTable += strBody;
			strTable += "</table></form>";
			strTable += strFoot;
			strTable += strButtons;
			if (this.sortable) {
				strTable += "<SCRIPT type=\"text/javascript\">var IsRoot = false;var st = new SortableTable(document.getElementById(\"tableresult\"),";
				if (this.sortType == null) {
					strTable += "[\"String\"]";
				} else {
					strTable += "[";
					for (int i = 0; i < sortType.length; i++) {
						strTable += "\"" + sortType[i] + "\"";
						if (i < sortType.length - 1) {
							strTable += ",";
						}
					}
					strTable += "]";
				}
				strTable += ");</SCRIPT>";
			}
		}
		return strTable;
	}

	public void buildErrorBody(String errorInfo) {
		strBody = "<tr><td align=center><font color=red >" + errorInfo
				+ "</font></td></tr>";
		isError = true;
	}

	public void buildTitle(String title) {
		if (title != null) {
			strTitle = "<caption ><font color=blue><b>" + title
					+ "</b></font></caption>";
		}
	}

	public void buildTitle(String title, String color) {
		strTitle = "<caption><font color=" + color + "><b>" + title
				+ "</b></font></caption>";
	}

	public void buildHead(String[] head) {
		colNum = head.length;
		String c = "";
		if (this.titleColor != null) {
			c = " bgcolor='" + this.titleColor + "' ";
		}

		strHead = "<tr" + c + ">";
		if (this.selectEnabled) {
			if (this.isTrType) {
				strHead += "<td></td>";
			} else {
				strHead += "<td align=center width='30'><b>选择</b></td>";
			}

		}
		for (int i = 0; i < head.length; i++) {
			strHead += "<td "
					+ (this.sortable ? "class=table-bar style=\"cursor:hand\""
							: "") + " align=center><b>" + head[i] + "</b></td>";
		}
		strHead += "</tr>";
		// System.out.println("head: "+strHead);
	}

	// private void processSelect2(StringBuffer sb, String value) {
	// if (this.selectEnabled) {
	// if (this.mulSelected) {
	// sb.append("<td><input type=\"checkbox\" name=\""
	// + this.selectedId + "\" value=\"" + value + "\"></td>");
	// } else {
	// sb.append("<td><input type=\"radio\" name=\"" + this.selectedId
	// + "\" value=\"" + value + "\"></td>");
	// }
	// }
	//
	// }
	private void processSelect(StringBuffer sb, String value) {
		if (this.selectEnabled) {
			if (this.mulSelected) {
				sb.append("<td><input type=\"checkbox\" name=\""
						+ this.selectedId + "\" value=\"" + value + "\"");
				if (this.isTrType) {
					sb.append(" style='border:0px;display:none'");
				}
				sb.append("></td>");
			} else {
				sb.append("<td><input type=\"radio\" name=\"" + this.selectedId
						+ "\" value=\"" + value + "\"");
				if (this.isTrType) {
					sb.append(" style='border:0px;display:none'");
				}
				sb.append("></td>");
			}
		}

	}

	public void buildBody(List datalist) {
		StringBuffer sb = new StringBuffer();
		Iterator it = datalist.iterator();
		String c1 = "";
		String c2 = "";
		if (this.rowcolor1 != null) {
			c1 = " bgcolor='" + this.rowcolor1 + "' ";
		}
		if (this.rowcolor2 != null) {
			c2 = " bgcolor='" + this.rowcolor2 + "' ";
		}
		int k = 0;
		while (it.hasNext()) {
			String[] data = (String[]) it.next();
			if (k % 2 == 0) {
				sb.append("<tr" + c1);

			} else {
				sb.append("<tr" + c2);

			}
			if (this.isTrType) {
				sb.append(" onclick=fwSetListCheckbox(tableresult,this,'"
						+ this.selectedId + "'," + this.mulSelected + ",'"
						+ this.rowcolorSelected + "','" + this.rowcolor1
						+ "','" + this.rowcolor2 + "'); ");
			}

			sb.append(">");
			processSelect(sb, data[0]);
			for (int i = 1; i < data.length; i++) {
				sb.append("<td align=center>" + data[i] + "</td>");
			}
			sb.append("</tr>");
			k++;
		}
		strBody = sb.toString();
	}

	/**
	 * public void buildBody(Collection col) { StringBuffer sb = new
	 * StringBuffer(); Iterator it = col.iterator(); //System.out.println("kkk: " +
	 * col.size()); while (it.hasNext()) {
	 * //System.out.println("...............@"); Object obj = it.next(); if (obj
	 * instanceof MuticastInfo) { MuticastInfo info = (MuticastInfo) obj; int id =
	 * info.getId(); String destid = info.getDestid(); int jobid =
	 * info.getJobid(); String sendTime = info.getSendTime(); String operator =
	 * info.getOperator(); String status = info.getStatus(); sb.append("
	 * <tr>"); processSelect(sb, "" + id); sb.append("
	 * <td>" + jobid + "</td>
	 * "); sb.append("
	 * <td>" + destid + "</td>
	 * "); sb.append("
	 * <td>" + sendTime + "</td>
	 * "); sb.append("
	 * <td>" + operator + "</td>
	 * "); sb.append("
	 * <td>" + status + "</td>
	 * "); sb.append( "
	 * <td><a href=\"#\"
	 * onclick=\"ondetail('stat.act?operation=multicast&suboperation=multicast_detail&id=" +
	 * id + "')\">查看</a></td>
	 * "); sb.append("</tr>
	 * "); } else if (obj instanceof MulticastCaller) { MulticastCaller caller =
	 * (MulticastCaller) obj; String callernum = caller.getCallerNum(); String
	 * desc = caller.getDescription(); sb.append("
	 * <tr>"); processSelect(sb, callernum); //System.out.println("caller:
	 * "+callernum); sb.append("
	 * <td>" + callernum + "</td>
	 * "); sb.append("
	 * <td>" + desc + "</td>
	 * "); sb.append("</tr>
	 * "); } else if (obj instanceof PlatformUser) { PlatformUser user =
	 * (PlatformUser) obj; String adminId = user.getAdminId(); String duration =
	 * user.getDuration(); sb.append("
	 * <tr>"); processSelect(sb, adminId); sb.append("
	 * <td>" + adminId + "</td>
	 * "); sb.append("
	 * <td>" + duration + "</td>
	 * "); sb.append("</tr>
	 * "); } else { sb.append("
	 * <tr>
	 * <td cols=" + colNum + " align=center><font color=red >错误：未知数据类型！</font></td>
	 * </tr>
	 * "); } } strBody = sb.toString(); }
	 */

	public void buildFoot(Page page, Properties prop) {
		StringBuffer sb = new StringBuffer();
		String url = this.getRequestURL(prop);
		sb.append("<table width=100% align=center><tr><td align=center>");
		sb.append("【" + page.getPageNum() + "/" + page.getPageCount() + "】  ");
		sb.append("【每页" + page.getPageLength() + "条】 ");
		if (page.getPageNum() == 1) {
			sb.append("【首页】 ");
		} else {
			sb.append("【<a href=\"" + url + "&pageNum=1&pageLength="
					+ page.getPageLength() + "\" >首页</a>】  ");
		}
		if (page.getPageNum() == 1) {
			sb.append("【前页】 ");
		} else {
			sb.append("【<a href=\"" + url + "&pageNum="
					+ (page.getPageNum() - 1) + "&pageLength="
					+ page.getPageLength() + "\" >前页</a>】  ");
		}
		if (page.getPageNum() == page.getPageCount()) {
			sb.append("【后页】 ");
		} else {
			sb.append("【<a href=\"" + url + "&pageNum="
					+ (page.getPageNum() + 1) + "&pageLength="
					+ page.getPageLength() + "\" >后页</a>】 ");
		}
		if (page.getPageNum() == page.getPageCount()) {
			sb.append("【尾页】 ");
		} else {
			sb.append("【<a href=\"" + url + "&pageNum=" + (page.getPageCount())
					+ "&pageLength=" + page.getPageLength() + "\" >尾页</a>】 ");
		}
		if (page.getPageCount() > 1 && this.showAllEnable) {
			sb.append("【<a href=\"" + url + "&pageNum=1&pageLength="
					+ page.getRecordNum() + "\" >显示全部</a>】 ");
		}

		sb
				.append("转到第<SELECT name=\"jumpPage\" onchange=\"JumpingPage(this)\">");
		for (int i = 1; i <= page.getPageCount(); i++) {
			if (i == page.getPageNum()) {
				sb
						.append("<OPTION selected value=" + i + ">" + i
								+ "</OPTION>");
			} else {
				sb.append("<OPTION value=" + i + ">" + i + "</OPTION>");
			}
		}

		sb.append("</select>页");
		sb.append("<SCRIPT LANGUAGE=\"JavaScript\"> \n");
		sb.append("function JumpingPage(selObj){ \n");
		sb.append("  window.location.href=\"" + url + "&pageLength="
				+ page.getPageLength()
				+ "&pageNum=\"+selObj.options[selObj.selectedIndex].value"
				+ "; \n");
		sb.append("  return ; \n");
		sb.append("} \n");
		sb.append("</SCRIPT> \n");

		sb.append("【共" + page.getRecordNum() + "条】  ");

		if (this.bExcel) {
			sb.append("</td><td align=right>");
			sb.append("<a href=\"" + url + "&excel=true&pageNum="
					+ page.getPageNum() + "&pageLength=" + page.getPageLength()
					+ "\" >导出本页</a>&nbsp;");
			sb.append("<a href=\"" + url + "&excel=true&pageNum=1&pageLength="
					+ page.getRecordNum() + "\" >导出全部</a>");

		}

		sb.append("</td></tr></table>");

		sb.append("<SCRIPT LANGUAGE=\"JavaScript\"> \n");
		sb.append("function ondetail(url){ \n");
		sb
				.append("window.open(url,\"_blank\",\"scrollbars=yes,resizable=yes, status=yes,width=550,height=300\");");

		sb.append("  return ; \n");
		sb.append("} \n");
		sb.append("</SCRIPT> \n");

		strFoot = sb.toString();
	}

	private String getRequestURL(Properties prop) {
		String url = "page.act?";
		// if
		// (!com.ffcs.smnms.statistic.ApplicationResources.WEB_CONTEXT.equals(""))
		// {
		// url = "/servlets/smstatfrontcontroller?";
		// }
		Enumeration enu = prop.propertyNames();
		while (enu.hasMoreElements()) {
			String key = (String) enu.nextElement();
			Object value = prop.get(key);
			if (value == null) {
				continue;
			} else if (value instanceof String) {
				url += key + "=" + (String) value;
			} else if (value instanceof String[]) {
				String[] temp = (String[]) value;
				for (int i = 0; i < temp.length; i++) {
					url += key + "=" + temp[i];
					if (i < temp.length - 1) {
						url += "&";
					}
				}
			} else if (value instanceof List) {
				Iterator it = ((List) value).iterator();
				while (it.hasNext()) {
					url += key + "=" + (String) it.next();
					if (it.hasNext()) {
						url += "&";
					}
				}
			} else {
				continue;
			}
			// url += key + "=" + prop.getProperty(key);
			if (enu.hasMoreElements()) {
				url += "&";
			}
		}
		return url;
	}

	public void buildButtons(String addname, String delname, String modname,
			String addUrl, String delUrl, String modUrl) {
		StringBuffer sb = new StringBuffer();
		sb
				.append("<p><table align=center  width=\"100%\"><tr><td align=center>");
		if (addname != null) {
			sb.append("<input type=button value=\"" + addname
					+ "\" onclick=\"window.location.href='" + addUrl
					+ "'\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		}
		if (delname != null) {
			sb
					.append("<input type=button value=\""
							+ delname
							+ "\" onclick=\"delFunction();\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		}
		if (modname != null) {
			sb.append("<input type=button value=\"" + modname
					+ "\" onclick=\"modFunction();\">");
		}

		sb.append("</td></tr></table>");
		sb.append("<SCRIPT LANGUAGE=\"JavaScript\"> \n");
		sb
				.append("function isChecked(r){ if(r.checked){return true;} for(var i=0;i<r.length;i++){  if(r[i].checked) return true;}return false;}");
		sb
				.append("function delFunction(){if(!isChecked(document."
						+ this.formName
						+ "."
						+ this.selectedId
						+ ")){alert(\"请先选择记录！\"); return false;}if(confirm(\"您确定继续吗？\")){document."
						+ this.formName + ".action=\"" + delUrl
						+ "\";document." + this.formName
						+ ".submit();return true;}}");
		sb.append("function modFunction(){if(!isChecked(document."
				+ this.formName + "." + this.selectedId
				+ ")){alert(\"请先选择记录！\");return false;}document."
				+ this.formName + ".action=\"" + modUrl + "\";document."
				+ this.formName + ".submit();return true;}");

		sb.append("</SCRIPT> \n");
		strButtons = sb.toString();

	}

	public void buildButtons(String addUrl, String delUrl, String modUrl) {
		StringBuffer sb = new StringBuffer();
		sb.append("<p><table align=center  width=\"100%\"><tr align=center>");
		sb
				.append("<td><input type=button value=\"增加\" onclick=\"window.location.href='"
						+ addUrl + "'\"></td>");
		sb
				.append("<td><input type=button value=\"删除\" onclick=\"delFunction();\"></td>");
		sb
				.append("<td><input type=button value=\"修改\" onclick=\"modFunction();\"></td>");
		sb.append("</tr></table>");
		sb.append("<SCRIPT LANGUAGE=\"JavaScript\"> \n");
		sb
				.append("function isChecked(r){ if(r.checked){return true;} for(var i=0;i<r.length;i++){  if(r[i].checked) return true;}return false;}");
		sb
				.append("function delFunction(){if(!isChecked(document."
						+ this.formName
						+ "."
						+ this.selectedId
						+ ")){alert(\"请选择要删除的记录！\"); return false;}if(confirm(\"确定要删除吗？\")){document."
						+ this.formName + ".action=\"" + delUrl
						+ "\";document." + this.formName
						+ ".submit();return true;}}");
		sb.append("function modFunction(){if(!isChecked(document."
				+ this.formName + "." + this.selectedId
				+ ")){alert(\"请选择要修改的记录！\");return false;}document."
				+ this.formName + ".action=\"" + modUrl + "\";document."
				+ this.formName + ".submit();return true;}");

		sb.append("</SCRIPT> \n");
		strButtons = sb.toString();
	}

	public void buildImageButtons(String addUrl, String delUrl, String modUrl) {

	}

	public String getRowcolor1() {
		return rowcolor1;
	}

	public void setRowcolor1(String rowcolor1) {
		this.rowcolor1 = rowcolor1;
	}

	public String getRowcolor2() {
		return rowcolor2;
	}

	public void setRowcolor2(String rowcolor2) {
		this.rowcolor2 = rowcolor2;
	}

	public String getTitleColor() {
		return titleColor;
	}

	public void setTitleColor(String titleColor) {
		this.titleColor = titleColor;
	}

	public String getRowcolorSelected() {
		return rowcolorSelected;
	}

	public void setRowcolorSelected(String rowcolorSelected) {
		this.rowcolorSelected = rowcolorSelected;
	}

	public boolean isShowAllEnable() {
		return showAllEnable;
	}

	public void setShowAllEnable(boolean showAllEnable) {
		this.showAllEnable = showAllEnable;
	}

	public String getSelect(String name, List list, String seclet) {
		StringBuffer sb = new StringBuffer();
		sb.append("<select name=" + name + ">");
		if (seclet != null)
			sb.append("<option value=" + seclet + " select >" + seclet
					+ "</option>");
		for (int i = 0; i < list.size(); i++)
			sb.append("<option value=" + list.get(i).toString() + " >"
					+ list.get(i).toString() + "</option>");
		return sb.toString();

	}
	public String getSelect(String name, HashMap map, String seclet) {
		StringBuffer sb = new StringBuffer();
		sb.append("<select name=" + name + ">");
		if (seclet != null)
			sb.append("<option value=" + seclet + " select >" + seclet
					+ "</option>");
		Iterator iterator = map.keySet().iterator();
		while (iterator.hasNext()) {
			Object key = iterator.next();
			sb.append("<option value=" + key + " >" + map.get(key)
					+ "</option>");
		}
		return sb.toString();

	}
	public String getSelect(String name, HashMap map, String seclet,String secletvalue) {
		StringBuffer sb = new StringBuffer();
		sb.append("<select name=" + name + ">");
		if (seclet != null)
			sb.append("<option value=" + secletvalue + " select >" + seclet
					+ "</option>");
		Iterator iterator = map.keySet().iterator();
		while (iterator.hasNext()) {
			Object key = iterator.next();
			sb.append("<option value=" + key + " >" + map.get(key)
					+ "</option>");
		}
		return sb.toString();

	}

	public String getMapSelect(String name, HashMap hashmap, String seclet) {

		StringBuffer sb = new StringBuffer();
		String key = null;

		sb.append("<select name=" + name + ">");
		if (seclet != null)
			sb.append("<option value=" + seclet + " select >" + seclet
					+ "</option>");
		for (int i = 0; i < hashmap.size(); i++) {

			key = String.valueOf(i + 1);
			sb.append("<option value=" + (i + 1) + " >"
					+ hashmap.get(key).toString() + "</option>");

		}

		return sb.toString();

	}

	public String getalert(String msg){
		StringBuffer sb = new StringBuffer();
		sb.append("<SCRIPT Language = javascript> window.alert( '");
		sb.append(msg);
		sb.append("');</SCRIPT>");
		return sb.toString();
	}
	
	public String getURL(Properties prop) {
		String url = "page.do?";
		// if
		// (!com.ffcs.smnms.statistic.ApplicationResources.WEB_CONTEXT.equals(""))
		// {
		// url = "/servlets/smstatfrontcontroller?";
		// }
		Enumeration enu = prop.propertyNames();
		while (enu.hasMoreElements()) {
			String key = (String) enu.nextElement();
			Object value = prop.get(key);
			if (value == null) {
				continue;
			} else if (value instanceof String) {
				url += key + "=" + (String) value;
			} else if (value instanceof String[]) {
				String[] temp = (String[]) value;
				for (int i = 0; i < temp.length; i++) {
					url += key + "=" + temp[i];
					if (i < temp.length - 1) {
						url += "&";
					}
				}
			} else if (value instanceof List) {
				Iterator it = ((List) value).iterator();
				while (it.hasNext()) {
					url += key + "=" + (String) it.next();
					if (it.hasNext()) {
						url += "&";
					}
				}
			} else {
				continue;
			}
			// url += key + "=" + prop.getProperty(key);
			if (enu.hasMoreElements()) {
				url += "&";
			}
		}
		return url;
	}
	public static void main(String args[]) {
		TableBuilder tb = new TableBuilder();
		HashMap languages = new HashMap();
		languages.put("1", "英语");
		languages.put("2", "日语");
		languages.put("3", "法语");
		languages.put("4", "德语");
		languages.put("5", "俄语");
		languages.put("6", "西班牙");
		languages.put("7", "朝鲜语");
		languages.put("8", "阿拉伯");
		languages.put("9", "汉语");

		languages.put("10", "无");

	//	System.out.println(tb.getMapSelect("sd", languages, "qita"));

		System.out.println(tb.getalert("sdf"));
		// List<String> list=new ArrayList<String>();
		// list.add("sffs");
		// list.add("sdf");
		// System.out.println(tb.getSelect("name", list, null));
	}
}
