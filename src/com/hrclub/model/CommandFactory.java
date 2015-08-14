package com.hrclub.model;

import java.util.*;
import com.hrclub.model.command.*;
import com.hrclub.model.command.admininfo.*;
import com.hrclub.model.command.advertisement.*;
import com.hrclub.model.command.configuration.*;
import com.hrclub.model.command.cooperateutil.*;
import com.hrclub.model.command.document.*;
import com.hrclub.model.command.hr.*;
import com.hrclub.model.command.integral.*;

import com.hrclub.model.command.it.*;
import com.hrclub.model.command.itintegral.*;
import com.hrclub.model.command.job.*;
import com.hrclub.model.command.mail.*;
import com.hrclub.model.command.message.*;
import com.hrclub.model.command.movement.*;
import com.hrclub.model.command.movementactor.*;
import com.hrclub.model.command.serverorder.*;
import com.hrclub.util.Logger;

public class CommandFactory {
	private static HashMap commandTimes = new HashMap();

	private static HashMap commandUsedTime = new HashMap();

	public static final String REDIRECT = "redirect";

	public static final String LOGIN = "login";

	public static final String LOGOUT = "logout";

	public static final String SEARCH = "search";

	public static final String NOTICE_LIST = "noticelist";

	public static final String NOTICE_EDIT = "noticeedit";

	public static final String NOTICE_MANAGER_DETAIL = "noticemanagerdetail";

	public static final String NOTICE = "notice";

	public static final String NOTICE_DETAIL = "noticedetail";

	public static final String RECOMMEND = "recommend";

	public static final String EXPERT_DETAIL = "expertdetail";

	public static final String EXPERT_EDIT = "expertedit";

	public static final String EXPERT_INFO = "expertinfo";

	public static final String EXPERT_REGISTER = "expertregister";

	public static final String USER_REGISTER = "userregister";

	public static final String USER_DETAIL = "userdetail";

	public static final String USER_EDIT = "useredit";

	public static final String USER_LIST = "userlist";

	public static final String TRAINING_DETAIL = "trainingdetail";

	public static final String WORK_DETAIL = "workdetail";

	public static final String WANTED_ORDER = "wantedorder";

	public static final String WANTED_DETAIL = "wanteddetail";

	public static final String WANTED_EDIT = "wantededit";

	public static final String WANTED_LIST = "wantedlist";

	public static final String SEND_MESSAGE = "sendmessage";

	public static final String LIST_MESSAGE = "listmessage";

	public static final String MESSAGE_DETAIL = "messagedetail";

	public static final String TRAINING_ORDER = "trainingorder";

	public static final String TRAINING_EDIT = "trainingedit";

	public static final String TRAINING_LIST = "traininglist";

	public static final String WORK_ORDER = "workorder";

	public static final String WORK_EDIT = "workedit";

	public static final String WORK_LIST = "worklist";

	public static final String EXPERT_BASIC_MODIFY = "expertbasicmodify";

	public static final String EXPERT_FLEXIBLE_MODIFY = "expertflexiblemodify";

	public static final String EXPERT_LIST = "expertlist";

	public static final String EXPERT_LEVEL = "expertlevel";

	public static final String USER_LEVEL = "userlevel";

	public static final String CHANGE_PASSWORD = "changepassword";

	public static final String RESET_PASSWORD = "resetpassword";

	public static final String UPLOAD_EXPERT_IMAGE = "uploadimage";

	public static final String ORDER_LIST = "orderlist";

	public static final String ORDER_UNDOEN_LIST = "orderundonelist";

	public static final String ORDER_DETAIL = "orderdetail";

	public static final String ORDER_EDIT = "orderedit";

	public static final String ORDER_QUALITY = "orderquality";

	public static final String ORDER_QUALITY_LIST = "orderqualitylist";

	public static final String WANTED_APPLY = "wantedapply";

	public static final String INBILL_LIST = "inbilllist";

	public static final String OUTBILL_LIST = "outbilllist";

	public static final String INBILL_EDIT = "inbilledit";

	public static final String OUTBILL_EDIT = "outbilledit";

	public static final String EXPERT_MOD_LIST = "expertmodlist";

	public static final String EXPERT_MOD_DETAIL = "expertmoddetail";

	public static final String EXPERT_MOD_EDIT = "expertmodedit";

	public static final String RECOMMEND_LIST = "recommendlist";

	public static final String RECOMMEND_EDIT = "recommendedit";

	public static final String RECOMMEND_DETAIL = "recommenddetail";

	public static final String MANAGER_LIST = "managerlist";

	public static final String MANAGER_EDIT = "manageredit";

	public static final String MANAGER_DETAIL = "managerdetail";

	public static final String ADVERTISE_LIST = "advertiselist";

	public static final String ADVERTISE_EDIT = "advertiseedit";

	public static final String ADVERTISE_DETAIL = "advertisedetail";
	
	
	public static final String LINK_LIST = "linklist";

	public static final String LINK_EDIT = "linkedit";

	public static final String LINK_DETAIL = "linkdetail";
	public static final String LINK_APPLY = "linkapply";
	public static final String LINK_GO = "linkgo";

	public static final String VIPREQUEST_LIST = "viprequestlist";

	public static final String VIPREQUEST_EDIT = "viprequestedit";
	
	public static final String COMMENT_LIST = "commentlist";
	
    public static final String SERVERORDER_ADD = "serverorderadd";               //服务订单新增
	
	public static final String SERVERORDER_EDIT = "serverorderedit";             //服务订单修改
	
	public static final String SERVERORDER_DELETE = "serverorderdelete";         //服务订单删除
	
	public static final String SERVERORDER_LIST = "serverorderlist";             //服务订单列表
	
	public static final String SERVERORDER_QUERY = "serverorderquery";           //服务订单查看
	
	public static final String SERVER_QUERY = "serverquery";                     //服务订单查看
	
	public static final String COOPERATEUTIL_ADD = "cooperateutiladd";           //单位信息新增
	
	public static final String COOPERATEUTIL_EDIT = "cooperateutiledit";         //单位信息修改
	
	public static final String COOPERATEUTIL_DELETE = "cooperateutildelete";     //单位信息删除
	
	public static final String COOPERATEUTIL_LIST = "cooperateutillist";         //单位信息列表
	
	public static final String COOPERATEUTIL_QUERY = "cooperateutilquery";       //单位信息查看
	
	public static final String ADMININFODAO_ADD ="admininfoadd";                 //新增管理员

	public static final String ADMININFODAO_EDIT ="admininfoedit";               //修改管理员
	
	public static final String ADMININFODAO_DELETE ="admininfodelete";           //删除管理员
	
	public static final String ADMININFODAO_LIST ="admininfolist";               //管理员列表
	
	public static final String ADMININFODAO_QUERY ="admininfoquery";             //查看管理员
	  
	public static final String ADMIN_LOGIN ="adminlogin";                        //管理员登陆
	
	public static final String ADMIN_LOGIN_OUT ="adminloginout";                 //管理员退出系统
	
	public static final String Message_ADD ="messageadd";                        //发布信息
	
	public static final String Message_EDIT ="messageedit";                      //修改信息
	
	public static final String Message_DELETE ="messagedelete";                  //删除信息
	
	public static final String Message_LIST ="messagelist";                      //信息列表
	
	public static final String Message_QUERY ="messagequery";                    //查看信息
	
	public static final String Mess_QUERY ="messquery";                          //查看信息
	
	public static final String CALLINGCOMF_ADD ="callingcomfadd";                //添加行业
	
	public static final String CALLINGCOMF_EDIT ="callingcomfedit";              //修改行业
	
	public static final String CALLINGCOMF_DELETE ="callingcomfdelete";          //删除行业
	
	public static final String CALLINGCOMF_LIST ="callingcomflist";              //行业列表
	
	public static final String CALLINGCOMF_QUERY ="callingcomfquery";            //查看行业
	
	public static final String CERTIFICATECOMF_ADD = "certificatecomfadd";       //添加证书
	
	public static final String CERTIFICATECOMF_EDIT = "certificatecomfedit";     //修改证书
	
	public static final String CERTIFICATECOMF_DELETE = "certificatecomfdelete"; //删除证书
	
	public static final String CERTIFICATECOMF_LIST = "certificatecomflist";     //证书列表
	
	public static final String CERTIFICATECOMF_QUERY = "certificatecomfquery";   //查看证书
	
	public static final String ITSKILLCOMF_ADD = "itskillcomfadd";               //添加技能
	
	public static final String ITSKILLCOMF_EDIT = "itskillcomfedit";             //修改技能
	
	public static final String ITSKILLCOMF_DELETE = "itskillcomfdelete";         //删除技能
	
	public static final String ITSKILLCOMF_LIST = "itskillcomflist";             //技能列表
	
	public static final String ITSKILLCOMF_QUERY = "itskillcomfquery";           //查看技能
	
	public static final String JOBCOMF_ADD = "jobcomfadd";                       //添加职位
	
	public static final String JOBCOMF_EDIT = "jobcomfedit";                     //修改职位
	
	public static final String JOBCOMF_DELETE = "jobcomfdelete";                 //删除职位
	
	public static final String JOBCOMF_LIST = "jobcomflist";                     //职位列表
	
	public static final String JOBCOMF_QUERY = "jobcomfquery";                   //查看职位
	
	public static final String SPECIAlITYCOMF_ADD = "specialitycomfadd";         //添加专业
	
	public static final String SPECIAlITYCOMF_EDIT = "specialitycomfedit";       //修改专业
	
	public static final String SPECIAlITYCOMF_DELETE = "specialitycomfdelete";   //删除专业
	
	public static final String SPECIAlITYCOMF_LIST = "specialitycomflist";       //专业列表
	
	public static final String SPECIAlITYCOMF_QUERY = "specialitycomfquery";     //查看专业
	  
    public final static String INTEGRAL_ADD="integraladd";                       //积分增加

    public final static String INTEGRAL_DELETE = "integraldelete";               //积分删除

    public final static String INTEGRAL_EDIT = "integraledit";                   //积分编辑

    public final static String INTEGRAL_LIST ="integrallist";                    //积分列表

    public final static String INTEGRAL_QUERY ="integralquery";                  //积分查询
    
    public final static String ITINTEGRAL_EDIT = "itintegraledit";               //积分编辑

    public final static String ITINTEGRAL_LIST ="itintegrallist";                //积分列表

    public final static String ITINTEGRAL_QUERY ="itintegralquery";              //积分查询

    public final static String MOVEMENT_ADD = "movementadd";                     //增加活动

    public final static String MOVEMENT_DELETE = "movementdelete";               //删除活动

    public final static String MOVEMENT_EDIT = "movementedit";                   //活动编辑

    public final static String MOVEMENT_LIST = "movementlist";                   //活动列表

    public final static String MOVEMENT_QUERY = "movementquery";                 //活动查询
    
    public final static String MOVE_QUERY = "movequery";                         //活动查询
    
    public final static String MAIL_ADD = "mailadd";                             //发送邮件
    
    public final static String MAIL_DELETE = "maildelete";                       //发送邮件
    
    public final static String MAIL_EDIT = "mailedit";                           //发送邮件
    
    public final static String MAIL_LIST = "maillist";                           //发送邮件
    
    public final static String MAIL_QUERY = "mailquery";                         //发送邮件
    
    public final static String MAIL_OUT = "mailout";                             //外部邮件
    
    public final static String MOVEMENTACTOR_ADD = "movementactoradd";           //参与活动
    
    public final static String MOVEMENTACTOR_DELETE = "movementactordelete";     //参与者删除
    
    public final static String MOVEMENTACTOR_EDIT = "movementactoredit";         //参与者修改
    
    public final static String MOVEMENTACTOR_LIST = "movementactorlist";         //参与者列表
    
    public final static String MOVACTOR_LIST = "movactorlist";                   //参与者列表
    
    public final static String MOVEMENTACTOR_QUERY = "movementactorquery";       //参与者查询
    
    public final static String MOVEMENTACTOR_CHANGE = "statuschange";            //参与者审批
    
    public final static String MOVEMENTACTOR_CHANGE_PART = "statuschangepart";   //参与者审批
	  
    public final static String DOCUMENT_ADD = "documentadd";                     //上传资料
    
    public final static String DOCUMENT_DELETE = "documentdelete";               //删除资料
    
    public final static String DOCUMENT_EDIT = "documentedit";                   //编辑资料
    
    public final static String DOCUMENT_LIST = "documentlist";                   //资料列表
    
    public final static String DOCUMENT_LIST_HR_ALL = "documentlisthrall";       //资料列表
    
    public final static String DOCUMENT_QUERY = "documentquery";                 //资料查询
    
    public final static String DOCUMENT_DOWN = "documentdown";                   //资料下载
    
    public final static String Message_LIST_LIMT = "messagelistlimt";            //消息首页展示
    
    public final static String MOVEMENT_LIST_LIMT = "movementlistlimt";          //活动首页展示
    
    public final static String Message_PART = "messagelistpart";                 //消息首页分类展示
    
    public final static String ADVERT_ADD = "advertadd";                         //增加广告

    public final static String ADVERT_DELETE = "advertdelete";                   //删除广告

    public final static String ADVERT_EDIT = "advertedit";                       //广告编辑

    public final static String ADVERT_LIST = "advertlist";                       //广告列表

    public final static String ADVERT_QUERY = "advertquery";                     //广告查询
	  
	  
    public final static String ITREGEDIT="itregedit";//IT注册
	  public final static String ITLOGIN="itlogin";//IT登录
	  public final static String ITLOGOUT="logout";//IT退出xit
	  
	  
	  public final static String SHOWIT="showit";//显示人才
	  
	  
	  public final static String STOPSTATE="stopstate";//冻结人才
	  public final static String CHANGECORE="changecore";//转为核心人才
	  
	
	  public final static String EDITIT= "editit";
	  
	  public final static String DELIT= "delit";
	  
	  public final static String  UPDATEIT="updateit";//修改信息
	  
	  
	
	  
	  public final static String  UPPASSWORD= "uppassword";//修改个人密码
	  
	  
	  public final static String  ITBASEINFO= "itbaseinfo";//修改个人基本信息
	  public final static String  ITINFOUP= "itinfoup";//修改个人基本信息
	  
	  public final static String  ADDWORD="addwork"; //增加工作经历
	  public final static String UPWORD="upwork";//修改工作经历
	  public final static String DELWORK="delwork";//删除工作经历
	  
	  public final static String ADDPROJECT="addproject";//增加项目经验
	  public static final String  UPPROJECT="upproject";//修改项目
	  public static final String DELPROJECT="delproject";//删除项目
	  
	  public static final String ADDCERT="addcert";//增加证书
	  public static final String DELCERT="delcert";//删除证书
	  public static final String UPCERT="upcert";//修改证书
	  
	  public static final String ADDSKILL="addskill";//增加技能
	  public static final String DELSKILL="delskill";//删除技能
	  public static final String UPITSKILL="upitskill";//修改技能
	  
	  
	  public static final String ADDLAUGUAGE="addlanguage";//增加外语
	  public static final String DELLAUGUAGE="dellanguage";//删除外语
	  public static final String UPLAUGUAGE="uplanguage";//修改外语
	  
	  public static final String UPITINFO="upitinfo";//显示修改基本信息
	  public static final String UPSPEINFO="upspeinfo";//修改专业信息
	  public static final String ITINFOEDU="itinfoedu";//显示编辑专业信息
	  
	  
	  public final static String  HRREGEDIT="hrregedit";//hr注册
	  public final static String  HRLOGIN="hrlogin";//hr登录
	  public final static String  HRADDINFO="hraddinfo";//hr增加详细信息
	  public final static String  SHOWHR="showhr";//hr管理显示界面
	  public final static String  HRSTATUS="hrstatus";//hr状态转变
	  public final static String  UPHRPASSWORD="uphrpassword";//hr修改密码
	  public final static String  UPHRINFO="uphrinfo";//hr修改信息显示界面
	  

	  public final static String FINDIT="findit";//IT人才搜索
	 
	  public final static String SIMFINDJOB="simfindjob";//职位简单搜索
	  public final static String HIGHFIND="highfind";//职位简单搜索
	  
	  
	  public final static String  PUTJOB="putjob";//发布职位信息
	  public final static String  SHOWJOB="showjob";//职位信息管理
	  public final static String  JOBSTATUS="jobstatus";//职位状态管理
	  public final static String  QUERYJOB="queryjob";//发布职位信息
	  
	  public final static String  TOJOB="tojob";//应聘职位
	  public final static String  SHOWJOBLETER="showjobleter";//查看应聘情况
	  public final static String  DELLETER="delleter";//查看应聘情况
	  
	  
	  public final static String  BYADDRESS="byaddress";//按地址搜索职位
	  
	
	  public final static String  COMMENDIT="commendit";//推荐人才
	  public final static String  COMMENDITSPE="commenditspe";//推荐人才
	  
	  public final static String  COMMENDITWORK="commenditwork";//推荐人才
	  public final static String  COMMENDITPRO="commenditpro";//推荐人才
	  public final static String  COMMENDITSKILL="commenditskill";//推荐人才
	  public final static String  COMMENDITCERT="commenditcert";//推荐人才
	  public final static String  COMMENDITLANG="commenditlang";//推荐人才
	  
	  public final static String  SHOWALLJOB="showalljob";//显示所有职位信息
	  
	  public final static String  QEUEYHR="qeueyhr";//显示
	  
	  public final static String  ADMINJOB="adminjob";//显示


	  public final static String  ADMINSHOWJOB="adminshowjob";//显示
	 
	  public final static String  HRLOGOUT="hrlogout";//显示

	  public final static String  SHOWLETTER="showletter";//显示
	  
	  public final static String  QUERYLETTER="queryletter";//显示
	  
	  public final static String  RESTORELETTER="restoreletter";
	  
	  public final static String  LETTERMANAGER="lettermanager";
	  public final static String  ADMINUPJOB="adminupjob";

	  public final static String HRAUDITING="hrauditing";

	  public final static String COREIT="coreit";
	  
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	private static CommandFactory instance = null;

	private HashMap commands = new HashMap();

	private CommandFactory() {
		 
		AdvertiseDetailCommand advertiseDetailCommand = new AdvertiseDetailCommand();
		commands.put(advertiseDetailCommand.getName().toLowerCase(),
				advertiseDetailCommand);

		AdvertiseEditCommand advertiseEditCommand = new AdvertiseEditCommand();
		commands.put(advertiseEditCommand.getName().toLowerCase(),
				advertiseEditCommand);

		AdvertiseListCommand advertiseListCommand = new AdvertiseListCommand();
		commands.put(advertiseListCommand.getName().toLowerCase(),
				advertiseListCommand);

		ChangePasswordCommand changePasswordCommand = new ChangePasswordCommand();
		commands.put(changePasswordCommand.getName().toLowerCase(),
				changePasswordCommand);
 

		UploadImageCommand uploadImageCommand = new UploadImageCommand();
		commands.put(uploadImageCommand.getName().toLowerCase(),
				uploadImageCommand);

		UserDetailCommand userDetailCommand = new UserDetailCommand();
		commands.put(userDetailCommand.getName().toLowerCase(),
				userDetailCommand);

		UserEditCommand userEditCommand = new UserEditCommand();
		commands.put(userEditCommand.getName().toLowerCase(), userEditCommand);

		UserLevelCommand userLevelCommand = new UserLevelCommand();
		commands
				.put(userLevelCommand.getName().toLowerCase(), userLevelCommand);

		UserListCommand userListCommand = new UserListCommand();
		commands.put(userListCommand.getName().toLowerCase(), userListCommand);

		UserRegisterCommand userRegisterCommand = new UserRegisterCommand();
		commands.put(userRegisterCommand.getName().toLowerCase(),
				userRegisterCommand);
        
		ServerorderAddCommand serverorderAddCommand = new ServerorderAddCommand();                 //服务订单新增
		commands.put(serverorderAddCommand.getName().toLowerCase(),
				serverorderAddCommand);
		
		ServerorderListCommand serverorderListCommand = new ServerorderListCommand();              //服务订单列表
		commands.put(serverorderListCommand.getName().toLowerCase(),
				serverorderListCommand);
		
		ServerorderEditCommand serverorderEditCommand = new ServerorderEditCommand();              //服务订单修改
		commands.put(serverorderEditCommand.getName().toLowerCase(),
				serverorderEditCommand);
		
		ServerorderDelCommand serverorderDelCommand = new ServerorderDelCommand();                 //服务订单删除
		commands.put(serverorderDelCommand.getName().toLowerCase(),
				serverorderDelCommand);
		
		ServerorderQueryCommand serverorderQueryCommand = new ServerorderQueryCommand();           //服务订单查看
		commands.put(serverorderQueryCommand.getName().toLowerCase(),
				serverorderQueryCommand);
		
		ServerQueryCommand serverQueryCommand = new ServerQueryCommand();                          //服务订单查看
		commands.put(serverQueryCommand.getName().toLowerCase(),
				serverQueryCommand);
		
		CooperateutilAddCommand cooperateutilAddCommand = new CooperateutilAddCommand();           //单位信息新增
		commands.put(cooperateutilAddCommand.getName().toLowerCase(),
				cooperateutilAddCommand);
		
		CooperateutilListCommand cooperateutilListCommand = new CooperateutilListCommand();        //单位信息列表
		commands.put(cooperateutilListCommand.getName().toLowerCase(),
				cooperateutilListCommand);
		
		CooperateutilEditCommand cooperateutileditCommand = new CooperateutilEditCommand();        //单位信息修改
		commands.put(cooperateutileditCommand.getName().toLowerCase(),
				cooperateutileditCommand);
		
		CooperateutilDelCommand cooperateutilDelCommand = new CooperateutilDelCommand();           //单位信息删除
		commands.put(cooperateutilDelCommand.getName().toLowerCase(),
				cooperateutilDelCommand);
		
		CooperateutilQueryCommand cooperateutilQueryCommand = new CooperateutilQueryCommand();     //单位信息查看
		commands.put(cooperateutilQueryCommand.getName().toLowerCase(),
				cooperateutilQueryCommand);
		
		AdmininfoAddCommand admininfoAddCommand = new AdmininfoAddCommand();                       //新增管理员
		commands.put(admininfoAddCommand.getName().toLowerCase(),
				admininfoAddCommand);
		
		AdmininfoListCommand admininfoListCommand = new AdmininfoListCommand();                    //管理员列表
		commands.put(admininfoListCommand.getName().toLowerCase(),
				admininfoListCommand);
		
		AdmininfoEditCommand admininfoEditCommand = new AdmininfoEditCommand();                    //修改管理员
		commands.put(admininfoEditCommand.getName().toLowerCase(),
				admininfoEditCommand);
		
		AdmininfoDelCommand admininfoDelCommand = new AdmininfoDelCommand();                       //删除管理员
		commands.put(admininfoDelCommand.getName().toLowerCase(),
				admininfoDelCommand);
		
		AdmininfoQueryCommand admininfoQueryCommand = new AdmininfoQueryCommand();                 //查看管理员
		commands.put(admininfoQueryCommand.getName().toLowerCase(),
				admininfoQueryCommand);
		
		MessageAddCommand messageaddCommand = new MessageAddCommand();                             //发布信息
		commands.put(messageaddCommand.getName().toLowerCase(),
				messageaddCommand);
		
		MessageListCommand messagelistCommand = new MessageListCommand();                          //信息列表
		commands.put(messagelistCommand.getName().toLowerCase(),
				messagelistCommand);
		
		MessageEditCommand messageeditCommand = new MessageEditCommand();                          //修改信息
		commands.put(messageeditCommand.getName().toLowerCase(),
				messageeditCommand);
		
		MessageDelCommand messagedelCommand = new MessageDelCommand();                             //删除信息
		commands.put(messagedelCommand.getName().toLowerCase(),
				messagedelCommand);
		
		MessageQueryCommand messagequeryCommand = new MessageQueryCommand();                       //查看信息
		commands.put(messagequeryCommand.getName().toLowerCase(),
				messagequeryCommand);
		
		MessQueryCommand messqueryCommand = new MessQueryCommand();                                //查看信息
		commands.put(messqueryCommand.getName().toLowerCase(),
				messqueryCommand);
		
		AdminLoginCommand adminLoginCommand = new AdminLoginCommand();                             //管理员登陆
		commands.put(adminLoginCommand.getName().toLowerCase(),
				adminLoginCommand);
		
		AdminOutCommand adminOutCommand = new AdminOutCommand();                                   //管理员退出系统
		commands.put(adminOutCommand.getName().toLowerCase(),
				adminOutCommand);
		
		CallingcomfAddCommand callingcomfAddCommand = new CallingcomfAddCommand();                 //添加行业
		commands.put(callingcomfAddCommand.getName().toLowerCase(), 
				callingcomfAddCommand);
		
		CallingcomfListCommand callingcomfListCommand = new CallingcomfListCommand();              //行业列表
		commands.put(callingcomfListCommand.getName().toLowerCase(), 
				callingcomfListCommand);
		
		CallingcomfEditCommand callingcomfEditCommand = new CallingcomfEditCommand();              //修改行业
		commands.put(callingcomfEditCommand.getName().toLowerCase(), 
				callingcomfEditCommand);
		
		CallingcomfDelCommand callingcomfDelCommand = new CallingcomfDelCommand();                 //删除行业
		commands.put(callingcomfDelCommand.getName().toLowerCase(), 
				callingcomfDelCommand);
		
		CallingcomfQueryCommand callingcomfQueryCommand = new CallingcomfQueryCommand();           //查询行业
		commands.put(callingcomfQueryCommand.getName().toLowerCase(), 
				callingcomfQueryCommand);
		
		CertificateComAddCommand certificateComAddCommand = new CertificateComAddCommand();        //添加证书
		commands.put(certificateComAddCommand.getName().toLowerCase(),                
				certificateComAddCommand);
		
		CertificateComListCommand certificateComListCommand = new CertificateComListCommand();     //证书列表
		commands.put(certificateComListCommand.getName().toLowerCase(),               
				certificateComListCommand);
		
		CertificateComEditCommand certificateComEditCommand = new CertificateComEditCommand();     //修改证书
		commands.put(certificateComEditCommand.getName().toLowerCase(),               
				certificateComEditCommand);
		
		CertificateComDelCommand certificateComDelCommand = new CertificateComDelCommand();        //删除证书
		commands.put(certificateComDelCommand.getName().toLowerCase(),                
				certificateComDelCommand);
		
		CertificateComQueryCommand certificateComQueryCommand = new CertificateComQueryCommand();  //查询证书
		commands.put(certificateComQueryCommand.getName().toLowerCase(),                
				certificateComQueryCommand);
		
		ITskillcomfAddCommand itskillcomfAddCommand = new ITskillcomfAddCommand();                 //添加技能
		commands.put(itskillcomfAddCommand.getName().toLowerCase(), 
				itskillcomfAddCommand);
		
		ITskillcomfListCommand itskillcomfListCommand = new ITskillcomfListCommand();              //技能列表
		commands.put(itskillcomfListCommand.getName().toLowerCase(), 
				itskillcomfListCommand);
		
		ITskillcomfEditCommand itskillcomfEditCommand = new ITskillcomfEditCommand();              //修改技能
		commands.put(itskillcomfEditCommand.getName().toLowerCase(), 
				itskillcomfEditCommand);
		
		ITskillcomfDelCommand itskillcomfDelCommand = new ITskillcomfDelCommand();                 //删除技能
		commands.put(itskillcomfDelCommand.getName().toLowerCase(), 
				itskillcomfDelCommand);
		
		ITskillcomfQueryCommand itskillcomfQueryCommand = new ITskillcomfQueryCommand();           //查询技能
		commands.put(itskillcomfQueryCommand.getName().toLowerCase(), 
				itskillcomfQueryCommand);
		
		JobComfAddCommand jobComfAddCommand = new JobComfAddCommand();                             //添加职位
		commands.put(jobComfAddCommand.getName().toLowerCase(),
				jobComfAddCommand);
		
		JobComfListCommand jobComfListCommand = new JobComfListCommand();                          //职位列表
		commands.put(jobComfListCommand.getName().toLowerCase(),
				jobComfListCommand);
		
		JobComfEditCommand jobComfEditCommand = new JobComfEditCommand();                          //修改职位
		commands.put(jobComfEditCommand.getName().toLowerCase(),
				jobComfEditCommand);
		
		JobComfDelCommand jobComfDelCommand = new JobComfDelCommand();                             //删除职位
		commands.put(jobComfDelCommand.getName().toLowerCase(),
				jobComfDelCommand);
		
		JobComfQueryCommand jobComfQueryCommand = new JobComfQueryCommand();                       //查询职位
		commands.put(jobComfQueryCommand.getName().toLowerCase(),
				jobComfQueryCommand);
		
		SpecialitycomfAddCommand specialitycomfAddCommand = new SpecialitycomfAddCommand();        //添加专业
		commands.put(specialitycomfAddCommand.getName().toLowerCase(),
				specialitycomfAddCommand);
		
		SpecialitycomfListCommand specialitycomfListCommand = new SpecialitycomfListCommand();     //专业列表
		commands.put(specialitycomfListCommand.getName().toLowerCase(),
				specialitycomfListCommand);
		
		SpecialitycomfEditCommand specialitycomfEditCommand = new SpecialitycomfEditCommand();     //修改专业
		commands.put(specialitycomfEditCommand.getName().toLowerCase(),
				specialitycomfEditCommand);
		
		SpecialitycomfDelCommand specialitycomfDelCommand = new SpecialitycomfDelCommand();        //删除专业
		commands.put(specialitycomfDelCommand.getName().toLowerCase(),
				specialitycomfDelCommand);
		
		SpecialitycomfQueryCommand specialitycomfQueryCommand = new SpecialitycomfQueryCommand();  //查询专业
		commands.put(specialitycomfQueryCommand.getName().toLowerCase(),
				specialitycomfQueryCommand);
		
		IntegralAddCommand integralAddCommand=new IntegralAddCommand();                            //积分新增
		commands.put(integralAddCommand.getName().toLowerCase(), integralAddCommand);              
		
		IntegralListCommand integralListCommand=new IntegralListCommand();                         //积分列表
		commands.put(integralListCommand.getName().toLowerCase(), integralListCommand);            
		
		IntegralEditCommand integralEditCommand=new IntegralEditCommand();                         //积分编辑
		commands.put(integralEditCommand.getName().toLowerCase(), integralEditCommand);            
		
		IntegralDelCommand integralDeleteCommand=new IntegralDelCommand();                         //积分删除
		commands.put(integralDeleteCommand.getName().toLowerCase(), integralDeleteCommand);
		
		IntegralQueryCommand integralQueryCommand=new IntegralQueryCommand();                      //积分查询
		commands.put(integralQueryCommand.getName().toLowerCase(), integralQueryCommand);
		
		ItintegralListCommand itintegralListCommand=new ItintegralListCommand();                   //积分列表
		commands.put(itintegralListCommand.getName().toLowerCase(), itintegralListCommand); 
		
		ItintegralQueryCommand itintegralQueryCommand=new ItintegralQueryCommand();                //积分查询
		commands.put(itintegralQueryCommand.getName().toLowerCase(), itintegralQueryCommand);
		
		ItintegralEditCommand itintegralEditCommand=new ItintegralEditCommand();                   //积分编辑
		commands.put(itintegralEditCommand.getName().toLowerCase(), itintegralEditCommand);  

		MovementAddCommand movementAddCommand=new MovementAddCommand();                            //活动增加 
		commands.put(movementAddCommand.getName().toLowerCase(), movementAddCommand);
		
		MovementListCommand movementListCommand=new MovementListCommand();                         //活动列表
		commands.put(movementListCommand.getName().toLowerCase(), movementListCommand);
		
		MovementEditCommand movementEditCommand=new MovementEditCommand();                         //活动编辑
		commands.put(movementEditCommand.getName().toLowerCase(), movementEditCommand);
		
		MovementDelCommand movementDelCommand=new MovementDelCommand();                            //活动删除
		commands.put(movementDelCommand.getName().toLowerCase(), movementDelCommand);
		
		MovementQueryCommand movementQueryCommand=new MovementQueryCommand();                      //活动查询
		commands.put(movementQueryCommand.getName().toLowerCase(), movementQueryCommand);
		
		MoveQueryCommand moveQueryCommand=new MoveQueryCommand();                                  //活动查询
		commands.put(moveQueryCommand.getName().toLowerCase(), moveQueryCommand);
		
		MailAddCommand mailAddCommand=new MailAddCommand();                                        //发送邮件
		commands.put(mailAddCommand.getName().toLowerCase(),mailAddCommand);
		
		MailListCommand mailListCommand=new MailListCommand();                                     //邮件列表
		commands.put(mailListCommand.getName().toLowerCase(),mailListCommand);
		
		MailEditCommand mailEditCommand=new MailEditCommand();                                     //修改邮件
		commands.put(mailEditCommand.getName().toLowerCase(),mailEditCommand);
		
		MailDelCommand mailDelCommand=new MailDelCommand();                                        //删除邮件
		commands.put(mailDelCommand.getName().toLowerCase(),mailDelCommand);
		
		MailQueryCommand mailQueryCommand=new MailQueryCommand();                                  //查看邮件
		commands.put(mailQueryCommand.getName().toLowerCase(),mailQueryCommand);
		
		MailOutsideCommand mailOutsideCommand=new MailOutsideCommand();                            //外部邮件
		commands.put(mailOutsideCommand.getName().toLowerCase(),mailOutsideCommand);
		
		MovementactorAddCommand movementactorAddCommand=new MovementactorAddCommand();             //参与活动
		commands.put(movementactorAddCommand.getName().toLowerCase(),movementactorAddCommand);
		
		MovementactorListCommand movementactorListCommand=new MovementactorListCommand();          //参与者列表
		commands.put(movementactorListCommand.getName().toLowerCase(),movementactorListCommand);
		
		MovementactorEditCommand movementactorEditCommand=new MovementactorEditCommand();          //参与者修改
		commands.put(movementactorEditCommand.getName().toLowerCase(),movementactorEditCommand);
		
		MovementactorDelCommand movementactorDelCommand=new MovementactorDelCommand();             //参与者删除
		commands.put(movementactorDelCommand.getName().toLowerCase(),movementactorDelCommand);
		
		MovementactorQueryCommand movementactorQueryCommand=new MovementactorQueryCommand();       //参与者查看
		commands.put(movementactorQueryCommand.getName().toLowerCase(),movementactorQueryCommand);
		
		MovactorListCommand movactorListCommand=new MovactorListCommand();                        //参与者列表
		commands.put(movactorListCommand.getName().toLowerCase(),movactorListCommand);
		
		DocumentAddCommand documentAddCommand=new DocumentAddCommand();                            //上传资料
		commands.put(documentAddCommand.getName().toLowerCase(),documentAddCommand);
		
		DocumentListCommand documentListCommand=new DocumentListCommand();                         //资料列表
		commands.put(documentListCommand.getName().toLowerCase(),documentListCommand);
		
		DocumentListHrCommand documentListHrCommand=new DocumentListHrCommand();                   //资料列表
		commands.put(documentListHrCommand.getName().toLowerCase(),documentListHrCommand);
		
		DocumentEditCommand documentEditCommand=new DocumentEditCommand();                         //编辑资料
		commands.put(documentEditCommand.getName().toLowerCase(),documentEditCommand);
		
		DocumentDelCommand documentDelCommand=new DocumentDelCommand();                            //删除资料
		commands.put(documentDelCommand.getName().toLowerCase(),documentDelCommand);
		
		DocumentQueryCommand documentQueryCommand=new DocumentQueryCommand();                      //资料查看
		commands.put(documentQueryCommand.getName().toLowerCase(),documentQueryCommand);
		
		StatusChangeCommand statusChangeCommand=new StatusChangeCommand();                         //报名审批
		commands.put(statusChangeCommand.getName().toLowerCase(),statusChangeCommand);
		
		StatusChangePartCommand statusChangePartCommand=new StatusChangePartCommand();             //报名审批
		commands.put(statusChangePartCommand.getName().toLowerCase(),statusChangePartCommand);
		
		DocumentDownCommand documentDownCommand=new DocumentDownCommand();                         //资料下载
		commands.put(documentDownCommand.getName().toLowerCase(),documentDownCommand);
		
		MessageListlimtCommand messageListlimtCommand=new MessageListlimtCommand();                //消息首页展示
		commands.put(messageListlimtCommand.getName().toLowerCase(),messageListlimtCommand);
		
		MovementListlimtCommand movementListlimtCommand=new MovementListlimtCommand();             //活动首页展示
		commands.put(movementListlimtCommand.getName().toLowerCase(),movementListlimtCommand);
		
		MessageListpartCommand messageListpartCommand=new MessageListpartCommand();                //消息首页分类展示
		commands.put(messageListpartCommand.getName().toLowerCase(),messageListpartCommand);
		
		AdvertAddCommand advertAddCommand=new AdvertAddCommand();                                  //增加广告
		commands.put(advertAddCommand.getName().toLowerCase(),advertAddCommand);
		
		AdvertEditCommand advertEditCommand=new AdvertEditCommand();                               //编辑广告
		commands.put(advertEditCommand.getName().toLowerCase(),advertEditCommand);
		
		AdvertDelCommand advertDelCommand=new AdvertDelCommand();                                  //删除广告
		commands.put(advertDelCommand.getName().toLowerCase(),advertDelCommand);
		
		AdvertListCommand advertListCommand=new AdvertListCommand();                               //显示广告
		commands.put(advertListCommand.getName().toLowerCase(),advertListCommand);
		
		AdvertQueryCommand advertQueryCommand=new AdvertQueryCommand();                            //查看广告
		commands.put(advertQueryCommand.getName().toLowerCase(),advertQueryCommand);
		
		ITUserRegisterCommand ituserRegisterCommand=new ITUserRegisterCommand();//IT人才注册
		commands.put(ituserRegisterCommand.getName().toLowerCase(),ituserRegisterCommand);

		ShowitCommand showitComman=new ShowitCommand();//显示IT人才
		commands.put(showitComman.getName().toLowerCase(), showitComman);
		
		StopstateCommand stopstateCommand=new StopstateCommand();//IT人才状态修改
		commands.put(stopstateCommand.getName().toLowerCase(), stopstateCommand);
		
		ITbaseinfoCommand itbaseinfoCommand=new ITbaseinfoCommand();//IT人才显示具体信息
		commands.put(itbaseinfoCommand.getName().toLowerCase(), itbaseinfoCommand);
		
		
		UpitinfoCommand upitinfoCommand=new UpitinfoCommand();//显示修改IT人才基本信息
		commands.put(upitinfoCommand.getName().toLowerCase(), upitinfoCommand);
		
		ITinfoeduCommand itinfoeduCommand=new ITinfoeduCommand();//显示修改IT专业信息
		commands.put(itinfoeduCommand.getName().toLowerCase(), itinfoeduCommand);
		
		
		EdititCommand edititCommand=new EdititCommand();//修改IT人才信息
		commands.put(edititCommand.getName().toLowerCase(), edititCommand);
		
		UpdateitCommand updateitCommand=new UpdateitCommand();
		commands.put(updateitCommand.getName().toLowerCase(), updateitCommand);
		
		DelitCommand delitCommand=new DelitCommand();
		commands.put(delitCommand.getName().toLowerCase(), delitCommand);
		
		ITloginCommand itloginCommand=new ITloginCommand();//it登录
		commands.put(itloginCommand.getName().toLowerCase(), itloginCommand);
		LogoutCommand logoutCommand=new LogoutCommand();//it退出系统
		commands.put(logoutCommand.getName().toLowerCase(), logoutCommand);
		
		

		SimfinjobCommand simfinjobCommand=new SimfinjobCommand();
		commands.put(simfinjobCommand.getName().toLowerCase(),simfinjobCommand);
		
		ITinfoupCommand itinfoupCommand=new ITinfoupCommand();
		commands.put(itinfoupCommand.getName().toLowerCase(), itinfoupCommand);//IT修改个人基本信息
		
		UppasswordCommand uppasswordCommand=new UppasswordCommand();
		commands.put(uppasswordCommand.getName().toLowerCase(), uppasswordCommand);//IT修改个人密码
		
			
		AddworkCommand addwordCommand=new AddworkCommand();
		commands.put(addwordCommand.getName().toLowerCase(), addwordCommand);//增加工作经历
		UPwordCommand upwordCommand=new UPwordCommand();
		commands.put(upwordCommand.getName().toLowerCase(), upwordCommand);//修改工作经历
		
		DelworkCommand delworkCommand=new DelworkCommand();
		commands.put(delworkCommand.getName().toLowerCase(), delworkCommand);//删除工作经历
		
		AddprojectCommand addprojectCommand=new AddprojectCommand();
		commands.put(addprojectCommand.getName().toLowerCase(), addprojectCommand);//增加项目经验
	
		UpprojectCommand upprojectCommand=new UpprojectCommand();
		commands.put(upprojectCommand.getName().toLowerCase(), upprojectCommand);//修改项目
		
		DelprojectCommand delprojectCommand=new DelprojectCommand();
		commands.put(delprojectCommand.getName().toLowerCase(), delprojectCommand);//删除项目
	   
	
		AddcertCommand addcertCommand=new AddcertCommand();
		commands.put(addcertCommand.getName().toLowerCase(), addcertCommand);//增加证书
		
		DelcertCommand delcertCommand=new DelcertCommand();
		commands.put(delcertCommand.getName().toLowerCase(), delcertCommand);//删除证书
	
		UpcertCommand upcertCommand=new UpcertCommand();
		commands.put(upcertCommand.getName().toLowerCase(), upcertCommand);//修改证书
	
		AddskillCommand addskillCommand=new AddskillCommand();
		commands.put(addskillCommand.getName().toLowerCase(), addskillCommand);//增加IT技能
		
		DelskillCommand delskillCommand=new DelskillCommand();
		commands.put(delskillCommand.getName().toLowerCase(), delskillCommand);//删除IT技能
		UpitskillCommand upitskillCommand=new UpitskillCommand();
		commands.put(upitskillCommand.getName().toLowerCase(), upitskillCommand);//修改IT技能
		
		
		AddlanguageCommand addlanguageCommand=new AddlanguageCommand();
		commands.put(addlanguageCommand.getName().toLowerCase(), addlanguageCommand);//增加外语
		DellanguageCommand dellanguageCommand=new DellanguageCommand();
		commands.put(dellanguageCommand.getName().toLowerCase(), dellanguageCommand);//删除外语
		UplanguageCommand uplanguageCommand=new UplanguageCommand();
		commands.put(uplanguageCommand.getName().toLowerCase(), uplanguageCommand);//修改外语
		
		UpspeinfoCommand upspeinfoCommand=new UpspeinfoCommand();
		commands.put(upspeinfoCommand.getName().toLowerCase(), upspeinfoCommand);//修改专业信息
		

		HRregeditCcommand hRregeditCcommand=new HRregeditCcommand();//HR注册
		commands.put(hRregeditCcommand.getName().toLowerCase(), hRregeditCcommand);
		HRloginCommand hrloginCommand=new HRloginCommand();//HR登录
		commands.put(hrloginCommand.getName().toLowerCase(), hrloginCommand);
		HRaddinfoCommand hraddinfoCommand=new HRaddinfoCommand();//HR增加详细信息
		commands.put(hraddinfoCommand.getName().toLowerCase(), hraddinfoCommand);
		
		UphrinfoCommand uphrinfoCommand=new UphrinfoCommand();//HR详细信息编辑显示
		commands.put(uphrinfoCommand.getName().toLowerCase(), uphrinfoCommand);
		
		ShowHRCommand showHRCommand=new ShowHRCommand();//管理HR显示界面
		commands.put(showHRCommand.getName().toLowerCase(), showHRCommand);
		HRstatusCommand hrstatusCommand=new HRstatusCommand();//管理HR状态
		commands.put(hrstatusCommand.getName().toLowerCase(), hrstatusCommand);
		UphrpasswordCommand uphrpasswordCommand=new UphrpasswordCommand();//修改HR密码/账户
		commands.put(uphrpasswordCommand.getName().toLowerCase(), uphrpasswordCommand);
		
		
		
		PutJobCommand putJobCommand=new PutJobCommand();//发布职位信息
		commands.put(putJobCommand.getName().toLowerCase(), putJobCommand);
		ShowjobCommand showjobCommand=new ShowjobCommand();//发布职位信息
		commands.put(showjobCommand.getName().toLowerCase(), showjobCommand);
		JobstatsCommand jobstatsCommand=new JobstatsCommand();//发布职位信息
		commands.put(jobstatsCommand.getName().toLowerCase(), jobstatsCommand);
		QueryjobCommand queryjobCommand=new QueryjobCommand();//显示职位信息
		commands.put(queryjobCommand.getName().toLowerCase(), queryjobCommand);
		
		TojobCommand tojobCommand=new TojobCommand();//显示职位信息
		commands.put(tojobCommand.getName().toLowerCase(), tojobCommand);
		
		ShowJobLeterCommand showJobLeterCommand=new ShowJobLeterCommand();//显示应聘情况
		commands.put(showJobLeterCommand.getName().toLowerCase(), showJobLeterCommand);
		
		DelleterCommand delleterCommand=new DelleterCommand();//删除求职信
		commands.put(delleterCommand.getName().toLowerCase(), delleterCommand);
		
		
		ByaddressCommand byaddressCommand=new ByaddressCommand();//按地址搜索职位信息
		commands.put(byaddressCommand.getName().toLowerCase(), byaddressCommand);
		
		HighfindCommand highfindCommand=new HighfindCommand();//高级搜索职位信息
		commands.put(highfindCommand.getName().toLowerCase(), highfindCommand);
		
		FindITCommand findITCommand=new FindITCommand();//人才搜索
		commands.put(findITCommand.getName().toLowerCase(), findITCommand);
		
		CommendITCommand commendITCommand=new CommendITCommand();//推荐IT基本信息提交
		commands.put(commendITCommand.getName().toLowerCase(), commendITCommand);
		
		CommendITspeCommand commendITspeCommand=new CommendITspeCommand();//推荐IT专业信息提交
		commands.put(commendITspeCommand.getName().toLowerCase(), commendITspeCommand);

		CommendITworkCommand commendITworkCommand=new CommendITworkCommand();//推荐IT工作经历提交
		commands.put(commendITworkCommand.getName().toLowerCase(), commendITworkCommand);
		
		CommendITproCommand commendITproCommand=new CommendITproCommand();//推荐IT项目提交
		commands.put(commendITproCommand.getName().toLowerCase(), commendITproCommand);
		
		CommendITskillCommand commendITskillCommand=new CommendITskillCommand();//推荐IT技能提交
		commands.put(commendITskillCommand.getName().toLowerCase(), commendITskillCommand);
		
		CommendITcert commendITcert=new CommendITcert();//推荐人才证书提交
		commands.put(commendITcert.getName().toLowerCase(), commendITcert);
		
		CommendITlangCommand commendITlangCommand=new CommendITlangCommand();//推荐IT外语提交
		commands.put(commendITlangCommand.getName().toLowerCase(), commendITlangCommand);
		
		ShowalljobCommand showalljobCommand=new ShowalljobCommand();//显示所有职位信息
		commands.put(showalljobCommand.getName().toLowerCase(), showalljobCommand);
		
		QeueyHRCommand qeueyHRCommand=new QeueyHRCommand();//显示HR信息
		commands.put(qeueyHRCommand.getName().toLowerCase(), qeueyHRCommand);
		
		
		AdminjobmanCommand adminjobmanCommand=new AdminjobmanCommand();//
		commands.put(adminjobmanCommand.getName().toLowerCase(), adminjobmanCommand);
		

		AdminshowjobCommand adminshowjobCommand=new AdminshowjobCommand();//
		commands.put(adminshowjobCommand.getName().toLowerCase(), adminshowjobCommand);
		
		
		HRlogoutCommand hrlogoutCommand=new HRlogoutCommand();//
		commands.put(hrlogoutCommand.getName().toLowerCase(), hrlogoutCommand);
		
		
		
		ShowletterCommand showletterCommand=new ShowletterCommand();//
		commands.put(showletterCommand.getName().toLowerCase(), showletterCommand);
		
		QueryletterCommand queryletterCommand=new QueryletterCommand();//
		commands.put(queryletterCommand.getName().toLowerCase(), queryletterCommand);
		
		RestoreletterCommand restoreletterCommand=new RestoreletterCommand();//
		commands.put(restoreletterCommand.getName().toLowerCase(), restoreletterCommand);
		
		LettermanagerCommand lettermanagerCommand=new LettermanagerCommand();//
		commands.put(lettermanagerCommand.getName().toLowerCase(), lettermanagerCommand);
		
		AdminupjobCommand adminupjobCommand=new AdminupjobCommand();//
		commands.put(adminupjobCommand.getName().toLowerCase(), adminupjobCommand);
		
		CoreitCommand coreitCommand=new CoreitCommand();//
		commands.put(coreitCommand.getName().toLowerCase(), coreitCommand);
		
		
		HRauditingCommand hrauditingCommand=new HRauditingCommand();//
		commands.put(hrauditingCommand.getName().toLowerCase(), hrauditingCommand);
		
		
	}

	public static CommandFactory getInstance() {
		if (instance == null)
			instance = new CommandFactory();
		return instance;
	}

	public Command create(String cmdType) {
		// System.out.println("Command: "+cmdType);
		String commandName = cmdType.toLowerCase();

		Command cmd = (Command) commands.get(commandName);

		if (cmd != null) {
			if (commandTimes.containsKey(commandName)) {
				long t = ((Long) commandTimes.get(commandName)).longValue();
				commandTimes.put(commandName, new Long(t + 1));
				
			} else {
				commandTimes.put(commandName, new Long(1));
			}
		}
		return cmd;
	}

	public static void commandUsedTime(String commandName, long usedtime) {
		if (commandUsedTime.containsKey(commandName)) {
			long t = ((Long) commandUsedTime.get(commandName)).longValue();
			commandUsedTime.put(commandName, new Long(t + usedtime));
		} else {
			commandUsedTime.put(commandName, new Long(usedtime));
		}
	}

	public static void showCommandHistory() {
		logger.info("showCommandHistory...");
		logger.info("Commands invoked times: "+commandTimes.toString());
		logger.info("Commands cost time (ms): "+commandUsedTime.toString());
		logger.info("showCommandHistory end.");
	}

}
