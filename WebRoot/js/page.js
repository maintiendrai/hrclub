
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
    		document.write("<A href='DepartTypeListServlet'><font color='#FF99CC'>�������͹���</font></A> | ");
          else
    		document.write("<A href='DepartTypeListServlet'>�������͹���</A> | ");
        }
    	else
    	  document.write("���Ź��� | ");

		if(strAuth[1]=='1')
    	{
    	  if(subtitle=="2")
    		document.write("<A href='DepartmentListServlet'><font color='#FF99CC'>���Ź���</font></A> | ");
          else
    		document.write("<A href='DepartmentListServlet'>���Ź���</A> | ");
        }
    	else
    	  document.write("���Ź��� | ");

     	if(strAuth[2]=='1')
     	{
     	  if(subtitle=="3")
    		document.write("<A href='UserListServlet'><font color='#FF99CC'>�û�����</font></A> | ");
    	  else
     		document.write("<A href='UserListServlet'>�û�����</A> | ");

        }
		else
		{
          if(subtitle=="3")
    		document.write("<A href='UserDetailServlet?strFlag=true'><font color='#FF99CC'>�޸�����</font></A> | ");
    	  else
     		document.write("<A href='UserDetailServlet?strFlag=true'>�޸�����</A> | ");
		 }
		if(strAuth[3]=='1')
     	{
     	  if(subtitle=="4")
    		document.write("<A href='StorageListServlet'><font color='#FF99CC'>�ֿ����</font></A> | ");
    	  else
     		document.write("<A href='StorageListServlet'>�ֿ����</A> | ");
        }
 		else
 		  document.write("�ֿ���� | ");

    	if(strAuth[4]=='1')
    	{
    	  if(subtitle=="5")
    		document.write("<A href='LogQuery.jsp?XTGL="+strAuthority+"'><font color='#FF99CC'>��־����</font></A></FONT><BR></TD>");
    	  else
    		document.write("<A href='LogQuery.jsp?XTGL="+strAuthority+"'>��־����</A></FONT><BR></TD>");
    	}
    	else
    	  document.write("��־����</FONT><BR></TD>");

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

	  /*������*/
      if(title=="2")
	  {
	   	document.write("<TR>");
	    document.write("<TD width='2%' height='19'>&nbsp;</TD>");
	    document.write("<TD align=left width='80%'><FONT size='2'>");

        if(strAuth[0]=='1')
        {
	      if(subtitle=="1")
	        document.write("<A href='CategoryListServlet'><font color='#FF99CC'>��Ʒ����</font></A> | ");
	      else
	        document.write("<A href='CategoryListServlet'>��Ʒ����</A> | ");
	    }
	    else document.write("��Ʒ���� | ");

	    if(strAuth[1]=='1')
	    {
	      if(subtitle=="2")
	        document.write("<A href='ProductQuery.jsp?KCGL="+strAuthority+"'><font color='#FF99CC'>��Ʒ��Ϣ</font></A>| ");
	      else
	        document.write("<A href='ProductQuery.jsp?KCGL="+strAuthority+"'>��Ʒ��Ϣ</A>| ");
	    }
	    else
	      document.write("��Ʒ��Ϣ| ");


	    if(strAuth[2]=='1')
	    {
	      if(subtitle=="3")
	        document.write("<A href='StoreQuery.jsp?KCGL="+strAuthority+"'><font color='#FF99CC'>������</font></A>| ");
	      else
	        document.write("<A href='StoreQuery.jsp?KCGL="+strAuthority+"'>������</A>| ");
	    }
	    else
	      document.write("������| ");
		if(strAuth[3]=='1')
	    {
	      if(subtitle=="4")
	        document.write("<A href='StoreHisStat.jsp?KCGL="+strAuthority+"'><font color='#FF99CC'>��ʷ���ͳ��</font></A>| ");
	      else
	        document.write("<A href='StoreHisStat.jsp?KCGL="+strAuthority+"'>��ʷ���ͳ��</A>| ");
	    }
	    else
	      document.write("��ʷ���ͳ��| ");
		if(strAuth[4]=='1')
	    {
	      if(subtitle=="5")
	        document.write("<A href='StorereportQuery.jsp?KCGL="+strAuthority+"'><font color='#FF99CC'>���������</A>|");
	      else
	        document.write("<A href='StorereportQuery.jsp?KCGL="+strAuthority+"'>���������</A>|");
	    }
	    else
	        document.write("����ⱨ��|");

		if(strAuth[5]=='1')
	    {
	      if(subtitle=="6")
	        document.write("<A href='Checkoutreport.jsp?KCGL="+strAuthority+"'><font color='#FF99CC'>����ⱨ��</A></FONT><BR></TD>");
	      else
	        document.write("<A href='Checkoutreport.jsp?KCGL="+strAuthority+"'>����ⱨ��</A></FONT><BR></TD> ");
	    }
	    else
	        document.write("����ⱨ��</FONT><BR></TD>");

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

	  //��Ʒ��������
	  if(title=="3")
	  {
	   	document.write("<TR>");
	    document.write("<TD width='2%' height='19'>&nbsp;</TD>");
	    document.write("<TD align=left width='80%'><FONT size='2'>");

	   if(strAuth[0]=='1')
	    {
	      if(subtitle=="1")
	        document.write("<A href='ApplyRegistServlet?OPER=new'><font color='#FF99CC'>����Ǽ�</font></A> | ");
	      else
	        document.write("<A href='ApplyRegistServlet?OPER=new'>����Ǽ�</A> | ");
	    }
	    else
	      document.write("����Ǽ� | ");

	    if(strAuth[1]=='1')
	    {
	      if(subtitle=="2")
	    	document.write("<A href='ApplyQuery.jsp?BPBJSQ="+strAuthority+"'><font color='#FF99CC'>�����ѯ</A></font>| ");
	      else
	    	document.write("<A href='ApplyQuery.jsp?BPBJSQ="+strAuthority+"'>�����ѯ</A>| ");
	    }
	    else
	       document.write("�����ѯ| ");

	    if(strAuth[2]=='1')
	    {
	      if(subtitle=="3")
	        document.write("<A href='ApplyManageQuery.jsp?BPBJSQ="+strAuthority+"'><font color='#FF99CC'>���봦��</font></A>");
	      else
	        document.write("<A href='ApplyManageQuery.jsp?BPBJSQ="+strAuthority+"'>���봦��</A> ");
	    }
	    else
            document.write("���봦��</FONT><BR></TD> ");
	  /*    document.write("���봦��| ");

	    if(strAuth[3]=='1')
	    {
		  if(subtitle=="4")
	        document.write("<A href='ApplyStat.jsp?BPBJSQ="+strAuthority+"'><font color='#FF99CC'>����ͳ��</font></A></FONT><BR></TD>");
	      else
	        document.write("<A href='ApplyStat.jsp?BPBJSQ="+strAuthority+"'>����ͳ��</A></FONT><BR></TD>");
		}
		else
		  document.write("����ͳ��</FONT><BR></TD>");*/

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

	 /*������*/
      if(title=="4")
	  {
		document.write("<TR>");
	    document.write("<TD width='2%' height='19'>&nbsp;</TD>");
	    document.write("<TD align=left width='80%'><FONT size='2'>");
	    if(strAuth[0]=='1')
	    {
	      if(subtitle=="1")
	        document.write("<A href='CheckinRegist.jsp?RKGL="+strAuthority+"'><font color='#FF99CC'>���Ǽ�</font></A> | ");
	      else
	        document.write("<A href='CheckinRegist.jsp?RKGL="+strAuthority+"'>���Ǽ�</A> | ");
	    }
	    else
	        document.write("���Ǽ� | ");

	    if(strAuth[1]=='1')
	    {
	      if(subtitle=="2")
	        document.write("<A href='CheckinQuery.jsp?RKGL="+strAuthority+"'><font color='#FF99CC'>����ѯ</A></font>| ");
	      else
	        document.write("<A href='CheckinQuery.jsp?RKGL="+strAuthority+"'>����ѯ</A>| ");
	    }
	    else
	      document.write("����ѯ| ");
		if(strAuth[2]=='1')
	    {
	      if(subtitle=="3")
	        document.write("<A href='CheckinStat.jsp?RKGL="+strAuthority+"'><font color='#FF99CC'>���ͳ��</FONT></A>| ");
	      else
	        document.write("<A  href='CheckinStat.jsp?RKGL="+strAuthority+"'>���ͳ��</A>| ");
	    }
	    else
	      document.write("���ͳ��| ");
        if(strAuth[3]=='1')
	    {
	      if(subtitle=="4")
	        document.write("<A href='store_presentiment_listservlet?RKGL="+strAuthority+"&qurey=1'><font color='#FF99CC'>��ƷԤ��</FONT></A>| ");
	      else
	        document.write("<A href='store_presentiment_listservlet?RKGL="+strAuthority+"&qurey=1'>��ƷԤ��</A>| ");
	    }
	    else
	        document.write("��ƷԤ��| ");
		if(strAuth[4]=='1')
	    {
	      if(subtitle=="5")
	        document.write("<A href='store_presentiment_listservlet?RKGL="+strAuthority+"&qurey=2'><font color='#FF99CC'>����Ԥ��</FONT></A>|  ");
	      else
	        document.write("<A href='store_presentiment_listservlet?RKGL="+strAuthority+"&qurey=2'>����Ԥ��</A>|  ");
	    }
	    else
	        document.write("����Ԥ��| ");
		if(strAuth[5]=='1')
	    {
	      if(subtitle=="6")
	        document.write("<A href='store_presentiment_listservlet?RKGL="+strAuthority+"&qurey=3'><font color='#FF99CC'>�ֿ�Ԥ��</A></FONT><BR></TD>");
	      else
	        document.write("<A href='store_presentiment_listservlet?RKGL="+strAuthority+"&qurey=3'>�ֿ�Ԥ��</A></FONT><BR></TD>");
	    }
	    else
	        document.write("�ֿ�Ԥ��</FONT><BR></TD>");


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

	  /*�������*/
	  if(title=="5")
	  {
		document.write("<TR>");
	    document.write("<TD width='2%' height='19'>&nbsp;</TD>");
	    document.write("<TD align=left width='80%'><FONT size='2'>");
	    if(strAuth[0]=='1')
	    {
	      if(subtitle=="1")
	        document.write("<A href='CORLDQServlet'><font color='#FF99CC'>����Ǽ�</font></A> | ");
	      else
	        document.write("<A href='CORLDQServlet'>����Ǽ�</A> | ");
	    }
	    else
	      document.write("����Ǽ� | ");

	    if(strAuth[1]=='1')
	    {
	      if(subtitle=="2")
	        document.write("<A href='CheckoutQuery.jsp?CKGL="+strAuthority+"'><font color='#FF99CC'>�����ѯ</A></font>| ");
	      else
	        document.write("<A href='CheckoutQuery.jsp?CKGL="+strAuthority+"'>�����ѯ</A>| ");
	    }
	    else
	      document.write("�����ѯ| ");

       if(strAuth[2]=='1')
	   {
         if(subtitle=="3")
	       document.write("<A href='CheckoutStat.jsp?CKGL="+strAuthority+"'><font color='#FF99CC'>����ͳ��</font></A></FONT></FONT><BR></TD>");
	     else
	       document.write("<A href='CheckoutStat.jsp?CKGL="+strAuthority+"'>����ͳ��</A></FONT><BR></TD>");
	   }
	   else
	     document.write("����ͳ��</FONT><BR></TD>");

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

	  /*����Ʒ����*/
	  if(title=="6")
	  {
		document.write("<TR>");
	    document.write("<TD width='2%' height='19'>&nbsp;</TD>");
	    document.write("<TD align=left width='80%'><FONT size='2'>");
	    if(strAuth[0]=='1')
     	{
	      if(subtitle=="1")
	        document.write("<A href='MalfunctionRegist.jsp?GZPGL="+strAuthority+"'><font color='#FF99CC'>����Ʒ�Ǽ�</font></A> | ");
	      else
	        document.write("<A href='MalfunctionRegist.jsp?GZPGL="+strAuthority+"'>����Ʒ�Ǽ�</A> | ");
        }
        else
	      document.write("����Ʒ�Ǽ� | ");

        if(strAuth[1]=='1')
     	{
     	  if(subtitle=="2")
           //FLAG��������������޵ĺʹ�����.
    		document.write("<A href='MalfunctionListServlet?FLAG=0'><font color='#FF99CC'>����Ʒ����</font></A> | ");
    	  else
     		document.write("<A href='MalfunctionListServlet?FLAG=0'>����Ʒ����</A> | ");
        }
 		else
 		  document.write("����Ʒ���� | ");

		if(strAuth[2]=='1')
     	{
     	  if(subtitle=="3")
    		document.write("<A href='MalfunctionListServlet?FLAG=3'><font color='#FF99CC'>����Ʒ����</font></A> | ");
    	  else
     		document.write("<A href='MalfunctionListServlet?FLAG=3'>����Ʒ����</A> | ");
        }
 		else
 		  document.write("����Ʒ���� | ");

	    if(strAuth[3]=='1')
     	{
     	  if(subtitle=="4")
    		document.write("<A href='MFManage.jsp?GZPGL="+strAuthority+"'><font color='#FF99CC'>����Ʒ����</font></A> | ");
    	  else
     		document.write("<A href='MFManage.jsp?GZPGL="+strAuthority+"'>����Ʒ����</A> | ");
        }
 		else
 		  document.write("����Ʒ���� |");

	    if(strAuth[4]=='1')
     	{
     	  if(subtitle=="5")
    		document.write("<A href='MFQuery.jsp?GZPGL="+strAuthority+"'><font color='#FF99CC'>����Ʒ��ѯ</font></A><BR></TD> ");
    	  else
     		document.write("<A href='MFQuery.jsp?GZPGL="+strAuthority+"'>����Ʒ��ѯ</A><BR></TD>  ");
        }
 		else
 		  document.write("����Ʒ��ѯ  </FONT><BR></TD>");
		/*  document.write("����Ʒ���� | ");
       if(strAuth[5]=='1')
       {
         if(subtitle=="6")
	       document.write("<A href='MalfunctionStat.jsp?GZPGL="+strAuthority+"'><font color='#FF99CC'>����Ʒͳ��</font></A></FONT><BR></TD>");
	     else
	       document.write("<A href='MalfunctionStat.jsp?GZPGL="+strAuthority+"'>����Ʒͳ��</A></FONT><BR></TD>");
	  }
      else
	    document.write("����Ʒͳ��</FONT><BR></TD>");
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