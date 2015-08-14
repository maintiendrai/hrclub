
function initArray()
{
      this.length = initArray.arguments.length
      for (var i = 0; i < this.length; i++)
      this[i+1] = initArray.arguments[i]
}

function openHelp(strURL)
{
  window.open(strURL,"help", "scrollbars=yes,width=530,height=500,left=100,top=30");
}

function system_topEx(title,subtitle,strAuthority)
{
	  var strAuth= new initArray('0','0','0','0','0','0','0','0','0','0');

	  strAuth[0] = strAuthority.charAt(0);
	  strAuth[1] = strAuthority.charAt(1);
	  strAuth[2] = strAuthority.charAt(2);
	  strAuth[3] = strAuthority.charAt(3);
	  strAuth[4] = strAuthority.charAt(4);
	  strAuth[5] = strAuthority.charAt(5);
	  strAuth[6] = strAuthority.charAt(6);
	  strAuth[7] = strAuthority.charAt(7);
	  strAuth[8] = strAuthority.charAt(8);
	  strAuth[9] = strAuthority.charAt(9);

	  document.write("<br>");
	  document.write("<TABLE width='100%' border='0'>");
	  if(title=="1")
	  {
	  	document.write("<TR>");
    	document.write("<TD width='2%' height='19'>&nbsp;</TD>");
    	document.write("<TD align='left' width='80%'><FONT size='2'>");

    	if(strAuth[0]=='1')
    	{
    	  if(subtitle=="1")
    		document.write("<A href='DepartTypeListServlet'><font color='#FF99CC'>部门类型管理</font></A> | ");
          else
    		document.write("<A href='DepartTypeListServlet'>部门类型管理</A> | ");
        }
    	else
    	  document.write("部门管理 | ");

		if(strAuth[1]=='1')
    	{
    	  if(subtitle=="2")
    		document.write("<A href='DepartmentListServlet'><font color='#FF99CC'>部门管理</font></A> | ");
          else
    		document.write("<A href='DepartmentListServlet'>部门管理</A> | ");
        }
    	else
    	  document.write("部门管理 | ");

     	if(strAuth[2]=='1')
     	{
     	  if(subtitle=="3")
    		document.write("<A href='UserListServlet'><font color='#FF99CC'>用户管理</font></A> | ");
    	  else
     		document.write("<A href='UserListServlet'>用户管理</A> | ");

        }
		else
		{
          if(subtitle=="3")
    		document.write("<A href='UserDetailServlet?strFlag=true'><font color='#FF99CC'>修改密码</font></A> | ");
    	  else
     		document.write("<A href='UserDetailServlet?strFlag=true'>修改密码</A> | ");
		 }
		if(strAuth[3]=='1')
     	{
     	  if(subtitle=="4")
    		document.write("<A href='StorageListServlet'><font color='#FF99CC'>仓库管理</font></A> | ");
    	  else
     		document.write("<A href='StorageListServlet'>仓库管理</A> | ");
        }
 		else
 		  document.write("仓库管理 | ");

    	if(strAuth[4]=='1')
    	{
    	  if(subtitle=="5")
    		document.write("<A href='LogQuery.jsp?XTGL="+strAuthority+"'><font color='#FF99CC'>日志管理</font></A></FONT><BR></TD>");
    	  else
    		document.write("<A href='LogQuery.jsp?XTGL="+strAuthority+"'>日志管理</A></FONT><BR></TD>");
    	}
    	else
    	  document.write("日志管理</FONT><BR></TD>");

    	if(subtitle=="1")
    	  document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/xtgl01.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
    	else if(subtitle=="2")
    	  document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/xtgl02.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
        else if(subtitle=="3")
    	  document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/xtgl03.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
        else if(subtitle=="4")
    	  document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/xtgl04.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
        else if(subtitle=="5")
    	  document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/xtgl05.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
        else
          document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/xtgl.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
        document.write("<TD width='2%' height='19'>&nbsp;</TD></TR>");
        document.write("<TR>");
    	document.write("<TD width='2%' height='21'>&nbsp;</TD>");
    	document.write("<TD colspan='2' align='right' width='96%' background='images/main/Line0.gif' height='21'><IMG height='29' src='images/main/line2.gif' width='105'></TD>");
    	document.write("<TD width='2%' height='21'>&nbsp;</TD>");
  		document.write("</TR>");
	  }

	  /*库存管理*/
      if(title=="2")
	  {
	   	document.write("<TR>");
	    document.write("<TD width='2%' height='19'>&nbsp;</TD>");
	    document.write("<TD align=left width='80%'><FONT size='2'>");

        if(strAuth[0]=='1')
        {
	      if(subtitle=="1")
	        document.write("<A href='CategoryListServlet'><font color='#FF99CC'>产品分类</font></A> | ");
	      else
	        document.write("<A href='CategoryListServlet'>产品分类</A> | ");
	    }
	    else document.write("产品分类 | ");

	    if(strAuth[1]=='1')
	    {
	      if(subtitle=="2")
	        document.write("<A href='ProductQuery.jsp?KCGL="+strAuthority+"'><font color='#FF99CC'>产品信息</font></A>| ");
	      else
	        document.write("<A href='ProductQuery.jsp?KCGL="+strAuthority+"'>产品信息</A>| ");
	    }
	    else
	      document.write("产品信息| ");


	    if(strAuth[2]=='1')
	    {
	      if(subtitle=="3")
	        document.write("<A href='StoreQuery.jsp?KCGL="+strAuthority+"'><font color='#FF99CC'>库存管理</font></A>| ");
	      else
	        document.write("<A href='StoreQuery.jsp?KCGL="+strAuthority+"'>库存管理</A>| ");
	    }
	    else
	      document.write("库存管理| ");
		if(strAuth[3]=='1')
	    {
	      if(subtitle=="4")
	        document.write("<A href='StoreHisStat.jsp?KCGL="+strAuthority+"'><font color='#FF99CC'>历史库存统计</font></A>| ");
	      else
	        document.write("<A href='StoreHisStat.jsp?KCGL="+strAuthority+"'>历史库存统计</A>| ");
	    }
	    else
	      document.write("历史库存统计| ");
		if(strAuth[4]=='1')
	    {
	      if(subtitle=="5")
	        document.write("<A href='StorereportQuery.jsp?KCGL="+strAuthority+"'><font color='#FF99CC'>库存量报表</A>|");
	      else
	        document.write("<A href='StorereportQuery.jsp?KCGL="+strAuthority+"'>库存量报表</A>|");
	    }
	    else
	        document.write("出入库报表|");

		if(strAuth[5]=='1')
	    {
	      if(subtitle=="6")
	        document.write("<A href='Checkoutreport.jsp?KCGL="+strAuthority+"'><font color='#FF99CC'>出入库报表</A></FONT><BR></TD>");
	      else
	        document.write("<A href='Checkoutreport.jsp?KCGL="+strAuthority+"'>出入库报表</A></FONT><BR></TD> ");
	    }
	    else
	        document.write("出入库报表</FONT><BR></TD>");

       if(subtitle=="1")
    	 document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/kcgl01.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
       else if(subtitle=="2")
    	 document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/kcgl02.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
       else if(subtitle=="3")
    	 document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/kcgl03.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
       else if(subtitle=="4")
    	 document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/kcgl04.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
       else
         document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/kcgl.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
       document.write("<TD width='2%' height='19'>&nbsp;</TD></TR>");
	   document.write("<TR>");
	   document.write("<TD width='2%' height='21'>&nbsp;</TD>");
	   document.write("<TD colspan='2' align='right' width='96%' background='images/main/Line0.gif' height='21'><IMG height='29' src='images/main/line2.gif' width='105'></TD>");
	   document.write("<TD width='2%' height='21'>&nbsp;</TD>");
	   document.write("</TR>");
	  }

	  //备品备件申请
	  if(title=="3")
	  {
	   	document.write("<TR>");
	    document.write("<TD width='2%' height='19'>&nbsp;</TD>");
	    document.write("<TD align=left width='80%'><FONT size='2'>");

	   if(strAuth[0]=='1')
	    {
	      if(subtitle=="1")
	        document.write("<A href='ApplyRegistServlet?OPER=new'><font color='#FF99CC'>申请登记</font></A> | ");
	      else
	        document.write("<A href='ApplyRegistServlet?OPER=new'>申请登记</A> | ");
	    }
	    else
	      document.write("申请登记 | ");

	    if(strAuth[1]=='1')
	    {
	      if(subtitle=="2")
	    	document.write("<A href='ApplyQuery.jsp?BPBJSQ="+strAuthority+"'><font color='#FF99CC'>申请查询</A></font>| ");
	      else
	    	document.write("<A href='ApplyQuery.jsp?BPBJSQ="+strAuthority+"'>申请查询</A>| ");
	    }
	    else
	       document.write("申请查询| ");

	    if(strAuth[2]=='1')
	    {
	      if(subtitle=="3")
	        document.write("<A href='ApplyManageQuery.jsp?BPBJSQ="+strAuthority+"'><font color='#FF99CC'>申请处理</font></A>");
	      else
	        document.write("<A href='ApplyManageQuery.jsp?BPBJSQ="+strAuthority+"'>申请处理</A> ");
	    }
	    else
            document.write("申请处理</FONT><BR></TD> ");
	  /*    document.write("申请处理| ");

	    if(strAuth[3]=='1')
	    {
		  if(subtitle=="4")
	        document.write("<A href='ApplyStat.jsp?BPBJSQ="+strAuthority+"'><font color='#FF99CC'>申请统计</font></A></FONT><BR></TD>");
	      else
	        document.write("<A href='ApplyStat.jsp?BPBJSQ="+strAuthority+"'>申请统计</A></FONT><BR></TD>");
		}
		else
		  document.write("申请统计</FONT><BR></TD>");*/

	   if(subtitle=="1")
    	 document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/bpbjsq01.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
       else if(subtitle=="2")
    	 document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/bpbjsq02.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
       else if(subtitle=="3")
    	 document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/bpbjsq03.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
       else if(subtitle=="4")
    	 document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/bpbjsq04.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
       else
         document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/bpbjsq.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
	    document.write("<TD width='2%' height='19'>&nbsp;</TD></TR>");
	    document.write("<TR>");
	    document.write("<TD width='2%' height='21'>&nbsp;</TD>");
	    document.write("<TD colspan='2' align='right' width='96%' background='images/main/Line0.gif' height='21'><IMG height='29' src='images/main/line2.gif' width='105'></TD>");
	    document.write("<TD width='2%' height='21'>&nbsp;</TD>");
	  	document.write("</TR>");
	  }

	 /*入库管理*/
      if(title=="4")
	  {
		document.write("<TR>");
	    document.write("<TD width='2%' height='19'>&nbsp;</TD>");
	    document.write("<TD align=left width='80%'><FONT size='2'>");
	    if(strAuth[0]=='1')
	    {
	      if(subtitle=="1")
	        document.write("<A href='CheckinRegist.jsp?RKGL="+strAuthority+"'><font color='#FF99CC'>入库登记</font></A> | ");
	      else
	        document.write("<A href='CheckinRegist.jsp?RKGL="+strAuthority+"'>入库登记</A> | ");
	    }
	    else
	        document.write("入库登记 | ");

	    if(strAuth[1]=='1')
	    {
	      if(subtitle=="2")
	        document.write("<A href='CheckinQuery.jsp?RKGL="+strAuthority+"'><font color='#FF99CC'>入库查询</A></font>| ");
	      else
	        document.write("<A href='CheckinQuery.jsp?RKGL="+strAuthority+"'>入库查询</A>| ");
	    }
	    else
	      document.write("入库查询| ");
		if(strAuth[2]=='1')
	    {
	      if(subtitle=="3")
	        document.write("<A href='CheckinStat.jsp?RKGL="+strAuthority+"'><font color='#FF99CC'>入库统计</FONT></A>| ");
	      else
	        document.write("<A  href='CheckinStat.jsp?RKGL="+strAuthority+"'>入库统计</A>| ");
	    }
	    else
	      document.write("入库统计| ");
        if(strAuth[3]=='1')
	    {
	      if(subtitle=="4")
	        document.write("<A href='store_presentiment_listservlet?RKGL="+strAuthority+"&qurey=1'><font color='#FF99CC'>产品预警</FONT></A>| ");
	      else
	        document.write("<A href='store_presentiment_listservlet?RKGL="+strAuthority+"&qurey=1'>产品预警</A>| ");
	    }
	    else
	        document.write("产品预警| ");
		if(strAuth[4]=='1')
	    {
	      if(subtitle=="5")
	        document.write("<A href='store_presentiment_listservlet?RKGL="+strAuthority+"&qurey=2'><font color='#FF99CC'>部门预警</FONT></A>|  ");
	      else
	        document.write("<A href='store_presentiment_listservlet?RKGL="+strAuthority+"&qurey=2'>部门预警</A>|  ");
	    }
	    else
	        document.write("部门预警| ");
		if(strAuth[5]=='1')
	    {
	      if(subtitle=="6")
	        document.write("<A href='store_presentiment_listservlet?RKGL="+strAuthority+"&qurey=3'><font color='#FF99CC'>仓库预警</A></FONT><BR></TD>");
	      else
	        document.write("<A href='store_presentiment_listservlet?RKGL="+strAuthority+"&qurey=3'>仓库预警</A></FONT><BR></TD>");
	    }
	    else
	        document.write("仓库预警</FONT><BR></TD>");


       if(subtitle=="1")
    	 document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/rkgl01.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
       else if(subtitle=="2")
    	 document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/rkgl02.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
       else if(subtitle=="3")
    	 document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/rkgl03.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
       else
         document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/rkgl.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
        document.write("<TD width='2%' height='19'>&nbsp;</TD></TR>");
	    document.write("<TR>");
	    document.write("<TD width='2%' height='21'>&nbsp;</TD>");
	    document.write("<TD colspan='2' align='right' width='96%' background='images/main/Line0.gif' height='21'><IMG height='29' src='images/main/line2.gif' width='105'></TD>");
	    document.write("<TD width='2%' height='21'>&nbsp;</TD>");
	  	document.write("</TR>");
	  }

	  /*出库管理*/
	  if(title=="5")
	  {
		document.write("<TR>");
	    document.write("<TD width='2%' height='19'>&nbsp;</TD>");
	    document.write("<TD align=left width='80%'><FONT size='2'>");
	    if(strAuth[0]=='1')
	    {
	      if(subtitle=="1")
	        document.write("<A href='CORLDQServlet'><font color='#FF99CC'>出库登记</font></A> | ");
	      else
	        document.write("<A href='CORLDQServlet'>出库登记</A> | ");
	    }
	    else
	      document.write("出库登记 | ");

	    if(strAuth[1]=='1')
	    {
	      if(subtitle=="2")
	        document.write("<A href='CheckoutQuery.jsp?CKGL="+strAuthority+"'><font color='#FF99CC'>出库查询</A></font>| ");
	      else
	        document.write("<A href='CheckoutQuery.jsp?CKGL="+strAuthority+"'>出库查询</A>| ");
	    }
	    else
	      document.write("出库查询| ");

       if(strAuth[2]=='1')
	   {
         if(subtitle=="3")
	       document.write("<A href='CheckoutStat.jsp?CKGL="+strAuthority+"'><font color='#FF99CC'>出库统计</font></A></FONT></FONT><BR></TD>");
	     else
	       document.write("<A href='CheckoutStat.jsp?CKGL="+strAuthority+"'>出库统计</A></FONT><BR></TD>");
	   }
	   else
	     document.write("出库统计</FONT><BR></TD>");

	   if(subtitle=="1")
    	 document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/ckgl01.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
       else if(subtitle=="2")
    	 document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/ckgl02.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
       else if(subtitle=="3")
    	 document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/ckgl03.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
       else
         document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/ckgl.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
	   document.write("<TD width='2%' height='19'>&nbsp;</TD></TR>");
	   document.write("<TR>");
	   document.write("<TD width='2%' height='21'>&nbsp;</TD>");
	   document.write("<TD colspan='2' align='right' width='96%' background='images/main/Line0.gif' height='21'><IMG height='29' src='images/main/line2.gif' width='105'></TD>");
	   document.write("<TD width='2%' height='21'>&nbsp;</TD>");
	   document.write("</TR>");
	 }

	  /*故障品管理*/
	  if(title=="6")
	  {
		document.write("<TR>");
	    document.write("<TD width='2%' height='19'>&nbsp;</TD>");
	    document.write("<TD align=left width='80%'><FONT size='2'>");
	    if(strAuth[0]=='1')
     	{
	      if(subtitle=="1")
	        document.write("<A href='MalfunctionRegist.jsp?GZPGL="+strAuthority+"'><font color='#FF99CC'>故障品登记</font></A> | ");
	      else
	        document.write("<A href='MalfunctionRegist.jsp?GZPGL="+strAuthority+"'>故障品登记</A> | ");
        }
        else
	      document.write("故障品登记 | ");

        if(strAuth[1]=='1')
     	{
     	  if(subtitle=="2")
           //FLAG是用来查出待送修的和待批的.
    		document.write("<A href='MalfunctionListServlet?FLAG=0'><font color='#FF99CC'>故障品送修</font></A> | ");
    	  else
     		document.write("<A href='MalfunctionListServlet?FLAG=0'>故障品送修</A> | ");
        }
 		else
 		  document.write("故障品送修 | ");

		if(strAuth[2]=='1')
     	{
     	  if(subtitle=="3")
    		document.write("<A href='MalfunctionListServlet?FLAG=3'><font color='#FF99CC'>故障品审批</font></A> | ");
    	  else
     		document.write("<A href='MalfunctionListServlet?FLAG=3'>故障品审批</A> | ");
        }
 		else
 		  document.write("故障品审批 | ");

	    if(strAuth[3]=='1')
     	{
     	  if(subtitle=="4")
    		document.write("<A href='MFManage.jsp?GZPGL="+strAuthority+"'><font color='#FF99CC'>故障品管理</font></A> | ");
    	  else
     		document.write("<A href='MFManage.jsp?GZPGL="+strAuthority+"'>故障品管理</A> | ");
        }
 		else
 		  document.write("故障品管理 |");

	    if(strAuth[4]=='1')
     	{
     	  if(subtitle=="5")
    		document.write("<A href='MFQuery.jsp?GZPGL="+strAuthority+"'><font color='#FF99CC'>故障品查询</font></A><BR></TD> ");
    	  else
     		document.write("<A href='MFQuery.jsp?GZPGL="+strAuthority+"'>故障品查询</A><BR></TD>  ");
        }
 		else
 		  document.write("故障品查询  </FONT><BR></TD>");
		/*  document.write("故障品管理 | ");
       if(strAuth[5]=='1')
       {
         if(subtitle=="6")
	       document.write("<A href='MalfunctionStat.jsp?GZPGL="+strAuthority+"'><font color='#FF99CC'>故障品统计</font></A></FONT><BR></TD>");
	     else
	       document.write("<A href='MalfunctionStat.jsp?GZPGL="+strAuthority+"'>故障品统计</A></FONT><BR></TD>");
	  }
      else
	    document.write("故障品统计</FONT><BR></TD>");
	  */
	  if(subtitle=="1")
    	document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/gzpgl01.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
      else if(subtitle=="2")
    	document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/gzpgl02.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
      else if(subtitle=="3")
    	document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/gzpgl03.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
      else if(subtitle=="4")
    	document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/gzpgl04.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
      else
        document.write("<TD width='16%' align='left' height='19'><a href=\"javascript:onClick=openHelp('help/gzpgl.html')\"><img src='images/main/help.gif' border='0' ></a></TD>");
	  document.write("<TD width='2%' height='19'>&nbsp;</TD></TR>");
	  document.write("<TR>");
	  document.write("<TD width='2%' height='21'>&nbsp;</TD>");
	  document.write("<TD colspan='2' align='right' width='96%' background='images/main/Line0.gif' height='21'><IMG height='29' src='images/main/line2.gif' width='105'></TD>");
	  document.write("<TD width='2%' height='21'>&nbsp;</TD>");
	  document.write("</TR>");
	}
    document.write("</TABLE>");
}