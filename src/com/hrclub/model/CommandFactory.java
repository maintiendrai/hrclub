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
	
    public static final String SERVERORDER_ADD = "serverorderadd";               //���񶩵�����
	
	public static final String SERVERORDER_EDIT = "serverorderedit";             //���񶩵��޸�
	
	public static final String SERVERORDER_DELETE = "serverorderdelete";         //���񶩵�ɾ��
	
	public static final String SERVERORDER_LIST = "serverorderlist";             //���񶩵��б�
	
	public static final String SERVERORDER_QUERY = "serverorderquery";           //���񶩵��鿴
	
	public static final String SERVER_QUERY = "serverquery";                     //���񶩵��鿴
	
	public static final String COOPERATEUTIL_ADD = "cooperateutiladd";           //��λ��Ϣ����
	
	public static final String COOPERATEUTIL_EDIT = "cooperateutiledit";         //��λ��Ϣ�޸�
	
	public static final String COOPERATEUTIL_DELETE = "cooperateutildelete";     //��λ��Ϣɾ��
	
	public static final String COOPERATEUTIL_LIST = "cooperateutillist";         //��λ��Ϣ�б�
	
	public static final String COOPERATEUTIL_QUERY = "cooperateutilquery";       //��λ��Ϣ�鿴
	
	public static final String ADMININFODAO_ADD ="admininfoadd";                 //��������Ա

	public static final String ADMININFODAO_EDIT ="admininfoedit";               //�޸Ĺ���Ա
	
	public static final String ADMININFODAO_DELETE ="admininfodelete";           //ɾ������Ա
	
	public static final String ADMININFODAO_LIST ="admininfolist";               //����Ա�б�
	
	public static final String ADMININFODAO_QUERY ="admininfoquery";             //�鿴����Ա
	  
	public static final String ADMIN_LOGIN ="adminlogin";                        //����Ա��½
	
	public static final String ADMIN_LOGIN_OUT ="adminloginout";                 //����Ա�˳�ϵͳ
	
	public static final String Message_ADD ="messageadd";                        //������Ϣ
	
	public static final String Message_EDIT ="messageedit";                      //�޸���Ϣ
	
	public static final String Message_DELETE ="messagedelete";                  //ɾ����Ϣ
	
	public static final String Message_LIST ="messagelist";                      //��Ϣ�б�
	
	public static final String Message_QUERY ="messagequery";                    //�鿴��Ϣ
	
	public static final String Mess_QUERY ="messquery";                          //�鿴��Ϣ
	
	public static final String CALLINGCOMF_ADD ="callingcomfadd";                //�����ҵ
	
	public static final String CALLINGCOMF_EDIT ="callingcomfedit";              //�޸���ҵ
	
	public static final String CALLINGCOMF_DELETE ="callingcomfdelete";          //ɾ����ҵ
	
	public static final String CALLINGCOMF_LIST ="callingcomflist";              //��ҵ�б�
	
	public static final String CALLINGCOMF_QUERY ="callingcomfquery";            //�鿴��ҵ
	
	public static final String CERTIFICATECOMF_ADD = "certificatecomfadd";       //���֤��
	
	public static final String CERTIFICATECOMF_EDIT = "certificatecomfedit";     //�޸�֤��
	
	public static final String CERTIFICATECOMF_DELETE = "certificatecomfdelete"; //ɾ��֤��
	
	public static final String CERTIFICATECOMF_LIST = "certificatecomflist";     //֤���б�
	
	public static final String CERTIFICATECOMF_QUERY = "certificatecomfquery";   //�鿴֤��
	
	public static final String ITSKILLCOMF_ADD = "itskillcomfadd";               //��Ӽ���
	
	public static final String ITSKILLCOMF_EDIT = "itskillcomfedit";             //�޸ļ���
	
	public static final String ITSKILLCOMF_DELETE = "itskillcomfdelete";         //ɾ������
	
	public static final String ITSKILLCOMF_LIST = "itskillcomflist";             //�����б�
	
	public static final String ITSKILLCOMF_QUERY = "itskillcomfquery";           //�鿴����
	
	public static final String JOBCOMF_ADD = "jobcomfadd";                       //���ְλ
	
	public static final String JOBCOMF_EDIT = "jobcomfedit";                     //�޸�ְλ
	
	public static final String JOBCOMF_DELETE = "jobcomfdelete";                 //ɾ��ְλ
	
	public static final String JOBCOMF_LIST = "jobcomflist";                     //ְλ�б�
	
	public static final String JOBCOMF_QUERY = "jobcomfquery";                   //�鿴ְλ
	
	public static final String SPECIAlITYCOMF_ADD = "specialitycomfadd";         //���רҵ
	
	public static final String SPECIAlITYCOMF_EDIT = "specialitycomfedit";       //�޸�רҵ
	
	public static final String SPECIAlITYCOMF_DELETE = "specialitycomfdelete";   //ɾ��רҵ
	
	public static final String SPECIAlITYCOMF_LIST = "specialitycomflist";       //רҵ�б�
	
	public static final String SPECIAlITYCOMF_QUERY = "specialitycomfquery";     //�鿴רҵ
	  
    public final static String INTEGRAL_ADD="integraladd";                       //��������

    public final static String INTEGRAL_DELETE = "integraldelete";               //����ɾ��

    public final static String INTEGRAL_EDIT = "integraledit";                   //���ֱ༭

    public final static String INTEGRAL_LIST ="integrallist";                    //�����б�

    public final static String INTEGRAL_QUERY ="integralquery";                  //���ֲ�ѯ
    
    public final static String ITINTEGRAL_EDIT = "itintegraledit";               //���ֱ༭

    public final static String ITINTEGRAL_LIST ="itintegrallist";                //�����б�

    public final static String ITINTEGRAL_QUERY ="itintegralquery";              //���ֲ�ѯ

    public final static String MOVEMENT_ADD = "movementadd";                     //���ӻ

    public final static String MOVEMENT_DELETE = "movementdelete";               //ɾ���

    public final static String MOVEMENT_EDIT = "movementedit";                   //��༭

    public final static String MOVEMENT_LIST = "movementlist";                   //��б�

    public final static String MOVEMENT_QUERY = "movementquery";                 //���ѯ
    
    public final static String MOVE_QUERY = "movequery";                         //���ѯ
    
    public final static String MAIL_ADD = "mailadd";                             //�����ʼ�
    
    public final static String MAIL_DELETE = "maildelete";                       //�����ʼ�
    
    public final static String MAIL_EDIT = "mailedit";                           //�����ʼ�
    
    public final static String MAIL_LIST = "maillist";                           //�����ʼ�
    
    public final static String MAIL_QUERY = "mailquery";                         //�����ʼ�
    
    public final static String MAIL_OUT = "mailout";                             //�ⲿ�ʼ�
    
    public final static String MOVEMENTACTOR_ADD = "movementactoradd";           //����
    
    public final static String MOVEMENTACTOR_DELETE = "movementactordelete";     //������ɾ��
    
    public final static String MOVEMENTACTOR_EDIT = "movementactoredit";         //�������޸�
    
    public final static String MOVEMENTACTOR_LIST = "movementactorlist";         //�������б�
    
    public final static String MOVACTOR_LIST = "movactorlist";                   //�������б�
    
    public final static String MOVEMENTACTOR_QUERY = "movementactorquery";       //�����߲�ѯ
    
    public final static String MOVEMENTACTOR_CHANGE = "statuschange";            //����������
    
    public final static String MOVEMENTACTOR_CHANGE_PART = "statuschangepart";   //����������
	  
    public final static String DOCUMENT_ADD = "documentadd";                     //�ϴ�����
    
    public final static String DOCUMENT_DELETE = "documentdelete";               //ɾ������
    
    public final static String DOCUMENT_EDIT = "documentedit";                   //�༭����
    
    public final static String DOCUMENT_LIST = "documentlist";                   //�����б�
    
    public final static String DOCUMENT_LIST_HR_ALL = "documentlisthrall";       //�����б�
    
    public final static String DOCUMENT_QUERY = "documentquery";                 //���ϲ�ѯ
    
    public final static String DOCUMENT_DOWN = "documentdown";                   //��������
    
    public final static String Message_LIST_LIMT = "messagelistlimt";            //��Ϣ��ҳչʾ
    
    public final static String MOVEMENT_LIST_LIMT = "movementlistlimt";          //���ҳչʾ
    
    public final static String Message_PART = "messagelistpart";                 //��Ϣ��ҳ����չʾ
    
    public final static String ADVERT_ADD = "advertadd";                         //���ӹ��

    public final static String ADVERT_DELETE = "advertdelete";                   //ɾ�����

    public final static String ADVERT_EDIT = "advertedit";                       //���༭

    public final static String ADVERT_LIST = "advertlist";                       //����б�

    public final static String ADVERT_QUERY = "advertquery";                     //����ѯ
	  
	  
    public final static String ITREGEDIT="itregedit";//ITע��
	  public final static String ITLOGIN="itlogin";//IT��¼
	  public final static String ITLOGOUT="logout";//IT�˳�xit
	  
	  
	  public final static String SHOWIT="showit";//��ʾ�˲�
	  
	  
	  public final static String STOPSTATE="stopstate";//�����˲�
	  public final static String CHANGECORE="changecore";//תΪ�����˲�
	  
	
	  public final static String EDITIT= "editit";
	  
	  public final static String DELIT= "delit";
	  
	  public final static String  UPDATEIT="updateit";//�޸���Ϣ
	  
	  
	
	  
	  public final static String  UPPASSWORD= "uppassword";//�޸ĸ�������
	  
	  
	  public final static String  ITBASEINFO= "itbaseinfo";//�޸ĸ��˻�����Ϣ
	  public final static String  ITINFOUP= "itinfoup";//�޸ĸ��˻�����Ϣ
	  
	  public final static String  ADDWORD="addwork"; //���ӹ�������
	  public final static String UPWORD="upwork";//�޸Ĺ�������
	  public final static String DELWORK="delwork";//ɾ����������
	  
	  public final static String ADDPROJECT="addproject";//������Ŀ����
	  public static final String  UPPROJECT="upproject";//�޸���Ŀ
	  public static final String DELPROJECT="delproject";//ɾ����Ŀ
	  
	  public static final String ADDCERT="addcert";//����֤��
	  public static final String DELCERT="delcert";//ɾ��֤��
	  public static final String UPCERT="upcert";//�޸�֤��
	  
	  public static final String ADDSKILL="addskill";//���Ӽ���
	  public static final String DELSKILL="delskill";//ɾ������
	  public static final String UPITSKILL="upitskill";//�޸ļ���
	  
	  
	  public static final String ADDLAUGUAGE="addlanguage";//��������
	  public static final String DELLAUGUAGE="dellanguage";//ɾ������
	  public static final String UPLAUGUAGE="uplanguage";//�޸�����
	  
	  public static final String UPITINFO="upitinfo";//��ʾ�޸Ļ�����Ϣ
	  public static final String UPSPEINFO="upspeinfo";//�޸�רҵ��Ϣ
	  public static final String ITINFOEDU="itinfoedu";//��ʾ�༭רҵ��Ϣ
	  
	  
	  public final static String  HRREGEDIT="hrregedit";//hrע��
	  public final static String  HRLOGIN="hrlogin";//hr��¼
	  public final static String  HRADDINFO="hraddinfo";//hr������ϸ��Ϣ
	  public final static String  SHOWHR="showhr";//hr������ʾ����
	  public final static String  HRSTATUS="hrstatus";//hr״̬ת��
	  public final static String  UPHRPASSWORD="uphrpassword";//hr�޸�����
	  public final static String  UPHRINFO="uphrinfo";//hr�޸���Ϣ��ʾ����
	  

	  public final static String FINDIT="findit";//IT�˲�����
	 
	  public final static String SIMFINDJOB="simfindjob";//ְλ������
	  public final static String HIGHFIND="highfind";//ְλ������
	  
	  
	  public final static String  PUTJOB="putjob";//����ְλ��Ϣ
	  public final static String  SHOWJOB="showjob";//ְλ��Ϣ����
	  public final static String  JOBSTATUS="jobstatus";//ְλ״̬����
	  public final static String  QUERYJOB="queryjob";//����ְλ��Ϣ
	  
	  public final static String  TOJOB="tojob";//ӦƸְλ
	  public final static String  SHOWJOBLETER="showjobleter";//�鿴ӦƸ���
	  public final static String  DELLETER="delleter";//�鿴ӦƸ���
	  
	  
	  public final static String  BYADDRESS="byaddress";//����ַ����ְλ
	  
	
	  public final static String  COMMENDIT="commendit";//�Ƽ��˲�
	  public final static String  COMMENDITSPE="commenditspe";//�Ƽ��˲�
	  
	  public final static String  COMMENDITWORK="commenditwork";//�Ƽ��˲�
	  public final static String  COMMENDITPRO="commenditpro";//�Ƽ��˲�
	  public final static String  COMMENDITSKILL="commenditskill";//�Ƽ��˲�
	  public final static String  COMMENDITCERT="commenditcert";//�Ƽ��˲�
	  public final static String  COMMENDITLANG="commenditlang";//�Ƽ��˲�
	  
	  public final static String  SHOWALLJOB="showalljob";//��ʾ����ְλ��Ϣ
	  
	  public final static String  QEUEYHR="qeueyhr";//��ʾ
	  
	  public final static String  ADMINJOB="adminjob";//��ʾ


	  public final static String  ADMINSHOWJOB="adminshowjob";//��ʾ
	 
	  public final static String  HRLOGOUT="hrlogout";//��ʾ

	  public final static String  SHOWLETTER="showletter";//��ʾ
	  
	  public final static String  QUERYLETTER="queryletter";//��ʾ
	  
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
        
		ServerorderAddCommand serverorderAddCommand = new ServerorderAddCommand();                 //���񶩵�����
		commands.put(serverorderAddCommand.getName().toLowerCase(),
				serverorderAddCommand);
		
		ServerorderListCommand serverorderListCommand = new ServerorderListCommand();              //���񶩵��б�
		commands.put(serverorderListCommand.getName().toLowerCase(),
				serverorderListCommand);
		
		ServerorderEditCommand serverorderEditCommand = new ServerorderEditCommand();              //���񶩵��޸�
		commands.put(serverorderEditCommand.getName().toLowerCase(),
				serverorderEditCommand);
		
		ServerorderDelCommand serverorderDelCommand = new ServerorderDelCommand();                 //���񶩵�ɾ��
		commands.put(serverorderDelCommand.getName().toLowerCase(),
				serverorderDelCommand);
		
		ServerorderQueryCommand serverorderQueryCommand = new ServerorderQueryCommand();           //���񶩵��鿴
		commands.put(serverorderQueryCommand.getName().toLowerCase(),
				serverorderQueryCommand);
		
		ServerQueryCommand serverQueryCommand = new ServerQueryCommand();                          //���񶩵��鿴
		commands.put(serverQueryCommand.getName().toLowerCase(),
				serverQueryCommand);
		
		CooperateutilAddCommand cooperateutilAddCommand = new CooperateutilAddCommand();           //��λ��Ϣ����
		commands.put(cooperateutilAddCommand.getName().toLowerCase(),
				cooperateutilAddCommand);
		
		CooperateutilListCommand cooperateutilListCommand = new CooperateutilListCommand();        //��λ��Ϣ�б�
		commands.put(cooperateutilListCommand.getName().toLowerCase(),
				cooperateutilListCommand);
		
		CooperateutilEditCommand cooperateutileditCommand = new CooperateutilEditCommand();        //��λ��Ϣ�޸�
		commands.put(cooperateutileditCommand.getName().toLowerCase(),
				cooperateutileditCommand);
		
		CooperateutilDelCommand cooperateutilDelCommand = new CooperateutilDelCommand();           //��λ��Ϣɾ��
		commands.put(cooperateutilDelCommand.getName().toLowerCase(),
				cooperateutilDelCommand);
		
		CooperateutilQueryCommand cooperateutilQueryCommand = new CooperateutilQueryCommand();     //��λ��Ϣ�鿴
		commands.put(cooperateutilQueryCommand.getName().toLowerCase(),
				cooperateutilQueryCommand);
		
		AdmininfoAddCommand admininfoAddCommand = new AdmininfoAddCommand();                       //��������Ա
		commands.put(admininfoAddCommand.getName().toLowerCase(),
				admininfoAddCommand);
		
		AdmininfoListCommand admininfoListCommand = new AdmininfoListCommand();                    //����Ա�б�
		commands.put(admininfoListCommand.getName().toLowerCase(),
				admininfoListCommand);
		
		AdmininfoEditCommand admininfoEditCommand = new AdmininfoEditCommand();                    //�޸Ĺ���Ա
		commands.put(admininfoEditCommand.getName().toLowerCase(),
				admininfoEditCommand);
		
		AdmininfoDelCommand admininfoDelCommand = new AdmininfoDelCommand();                       //ɾ������Ա
		commands.put(admininfoDelCommand.getName().toLowerCase(),
				admininfoDelCommand);
		
		AdmininfoQueryCommand admininfoQueryCommand = new AdmininfoQueryCommand();                 //�鿴����Ա
		commands.put(admininfoQueryCommand.getName().toLowerCase(),
				admininfoQueryCommand);
		
		MessageAddCommand messageaddCommand = new MessageAddCommand();                             //������Ϣ
		commands.put(messageaddCommand.getName().toLowerCase(),
				messageaddCommand);
		
		MessageListCommand messagelistCommand = new MessageListCommand();                          //��Ϣ�б�
		commands.put(messagelistCommand.getName().toLowerCase(),
				messagelistCommand);
		
		MessageEditCommand messageeditCommand = new MessageEditCommand();                          //�޸���Ϣ
		commands.put(messageeditCommand.getName().toLowerCase(),
				messageeditCommand);
		
		MessageDelCommand messagedelCommand = new MessageDelCommand();                             //ɾ����Ϣ
		commands.put(messagedelCommand.getName().toLowerCase(),
				messagedelCommand);
		
		MessageQueryCommand messagequeryCommand = new MessageQueryCommand();                       //�鿴��Ϣ
		commands.put(messagequeryCommand.getName().toLowerCase(),
				messagequeryCommand);
		
		MessQueryCommand messqueryCommand = new MessQueryCommand();                                //�鿴��Ϣ
		commands.put(messqueryCommand.getName().toLowerCase(),
				messqueryCommand);
		
		AdminLoginCommand adminLoginCommand = new AdminLoginCommand();                             //����Ա��½
		commands.put(adminLoginCommand.getName().toLowerCase(),
				adminLoginCommand);
		
		AdminOutCommand adminOutCommand = new AdminOutCommand();                                   //����Ա�˳�ϵͳ
		commands.put(adminOutCommand.getName().toLowerCase(),
				adminOutCommand);
		
		CallingcomfAddCommand callingcomfAddCommand = new CallingcomfAddCommand();                 //�����ҵ
		commands.put(callingcomfAddCommand.getName().toLowerCase(), 
				callingcomfAddCommand);
		
		CallingcomfListCommand callingcomfListCommand = new CallingcomfListCommand();              //��ҵ�б�
		commands.put(callingcomfListCommand.getName().toLowerCase(), 
				callingcomfListCommand);
		
		CallingcomfEditCommand callingcomfEditCommand = new CallingcomfEditCommand();              //�޸���ҵ
		commands.put(callingcomfEditCommand.getName().toLowerCase(), 
				callingcomfEditCommand);
		
		CallingcomfDelCommand callingcomfDelCommand = new CallingcomfDelCommand();                 //ɾ����ҵ
		commands.put(callingcomfDelCommand.getName().toLowerCase(), 
				callingcomfDelCommand);
		
		CallingcomfQueryCommand callingcomfQueryCommand = new CallingcomfQueryCommand();           //��ѯ��ҵ
		commands.put(callingcomfQueryCommand.getName().toLowerCase(), 
				callingcomfQueryCommand);
		
		CertificateComAddCommand certificateComAddCommand = new CertificateComAddCommand();        //���֤��
		commands.put(certificateComAddCommand.getName().toLowerCase(),                
				certificateComAddCommand);
		
		CertificateComListCommand certificateComListCommand = new CertificateComListCommand();     //֤���б�
		commands.put(certificateComListCommand.getName().toLowerCase(),               
				certificateComListCommand);
		
		CertificateComEditCommand certificateComEditCommand = new CertificateComEditCommand();     //�޸�֤��
		commands.put(certificateComEditCommand.getName().toLowerCase(),               
				certificateComEditCommand);
		
		CertificateComDelCommand certificateComDelCommand = new CertificateComDelCommand();        //ɾ��֤��
		commands.put(certificateComDelCommand.getName().toLowerCase(),                
				certificateComDelCommand);
		
		CertificateComQueryCommand certificateComQueryCommand = new CertificateComQueryCommand();  //��ѯ֤��
		commands.put(certificateComQueryCommand.getName().toLowerCase(),                
				certificateComQueryCommand);
		
		ITskillcomfAddCommand itskillcomfAddCommand = new ITskillcomfAddCommand();                 //��Ӽ���
		commands.put(itskillcomfAddCommand.getName().toLowerCase(), 
				itskillcomfAddCommand);
		
		ITskillcomfListCommand itskillcomfListCommand = new ITskillcomfListCommand();              //�����б�
		commands.put(itskillcomfListCommand.getName().toLowerCase(), 
				itskillcomfListCommand);
		
		ITskillcomfEditCommand itskillcomfEditCommand = new ITskillcomfEditCommand();              //�޸ļ���
		commands.put(itskillcomfEditCommand.getName().toLowerCase(), 
				itskillcomfEditCommand);
		
		ITskillcomfDelCommand itskillcomfDelCommand = new ITskillcomfDelCommand();                 //ɾ������
		commands.put(itskillcomfDelCommand.getName().toLowerCase(), 
				itskillcomfDelCommand);
		
		ITskillcomfQueryCommand itskillcomfQueryCommand = new ITskillcomfQueryCommand();           //��ѯ����
		commands.put(itskillcomfQueryCommand.getName().toLowerCase(), 
				itskillcomfQueryCommand);
		
		JobComfAddCommand jobComfAddCommand = new JobComfAddCommand();                             //���ְλ
		commands.put(jobComfAddCommand.getName().toLowerCase(),
				jobComfAddCommand);
		
		JobComfListCommand jobComfListCommand = new JobComfListCommand();                          //ְλ�б�
		commands.put(jobComfListCommand.getName().toLowerCase(),
				jobComfListCommand);
		
		JobComfEditCommand jobComfEditCommand = new JobComfEditCommand();                          //�޸�ְλ
		commands.put(jobComfEditCommand.getName().toLowerCase(),
				jobComfEditCommand);
		
		JobComfDelCommand jobComfDelCommand = new JobComfDelCommand();                             //ɾ��ְλ
		commands.put(jobComfDelCommand.getName().toLowerCase(),
				jobComfDelCommand);
		
		JobComfQueryCommand jobComfQueryCommand = new JobComfQueryCommand();                       //��ѯְλ
		commands.put(jobComfQueryCommand.getName().toLowerCase(),
				jobComfQueryCommand);
		
		SpecialitycomfAddCommand specialitycomfAddCommand = new SpecialitycomfAddCommand();        //���רҵ
		commands.put(specialitycomfAddCommand.getName().toLowerCase(),
				specialitycomfAddCommand);
		
		SpecialitycomfListCommand specialitycomfListCommand = new SpecialitycomfListCommand();     //רҵ�б�
		commands.put(specialitycomfListCommand.getName().toLowerCase(),
				specialitycomfListCommand);
		
		SpecialitycomfEditCommand specialitycomfEditCommand = new SpecialitycomfEditCommand();     //�޸�רҵ
		commands.put(specialitycomfEditCommand.getName().toLowerCase(),
				specialitycomfEditCommand);
		
		SpecialitycomfDelCommand specialitycomfDelCommand = new SpecialitycomfDelCommand();        //ɾ��רҵ
		commands.put(specialitycomfDelCommand.getName().toLowerCase(),
				specialitycomfDelCommand);
		
		SpecialitycomfQueryCommand specialitycomfQueryCommand = new SpecialitycomfQueryCommand();  //��ѯרҵ
		commands.put(specialitycomfQueryCommand.getName().toLowerCase(),
				specialitycomfQueryCommand);
		
		IntegralAddCommand integralAddCommand=new IntegralAddCommand();                            //��������
		commands.put(integralAddCommand.getName().toLowerCase(), integralAddCommand);              
		
		IntegralListCommand integralListCommand=new IntegralListCommand();                         //�����б�
		commands.put(integralListCommand.getName().toLowerCase(), integralListCommand);            
		
		IntegralEditCommand integralEditCommand=new IntegralEditCommand();                         //���ֱ༭
		commands.put(integralEditCommand.getName().toLowerCase(), integralEditCommand);            
		
		IntegralDelCommand integralDeleteCommand=new IntegralDelCommand();                         //����ɾ��
		commands.put(integralDeleteCommand.getName().toLowerCase(), integralDeleteCommand);
		
		IntegralQueryCommand integralQueryCommand=new IntegralQueryCommand();                      //���ֲ�ѯ
		commands.put(integralQueryCommand.getName().toLowerCase(), integralQueryCommand);
		
		ItintegralListCommand itintegralListCommand=new ItintegralListCommand();                   //�����б�
		commands.put(itintegralListCommand.getName().toLowerCase(), itintegralListCommand); 
		
		ItintegralQueryCommand itintegralQueryCommand=new ItintegralQueryCommand();                //���ֲ�ѯ
		commands.put(itintegralQueryCommand.getName().toLowerCase(), itintegralQueryCommand);
		
		ItintegralEditCommand itintegralEditCommand=new ItintegralEditCommand();                   //���ֱ༭
		commands.put(itintegralEditCommand.getName().toLowerCase(), itintegralEditCommand);  

		MovementAddCommand movementAddCommand=new MovementAddCommand();                            //����� 
		commands.put(movementAddCommand.getName().toLowerCase(), movementAddCommand);
		
		MovementListCommand movementListCommand=new MovementListCommand();                         //��б�
		commands.put(movementListCommand.getName().toLowerCase(), movementListCommand);
		
		MovementEditCommand movementEditCommand=new MovementEditCommand();                         //��༭
		commands.put(movementEditCommand.getName().toLowerCase(), movementEditCommand);
		
		MovementDelCommand movementDelCommand=new MovementDelCommand();                            //�ɾ��
		commands.put(movementDelCommand.getName().toLowerCase(), movementDelCommand);
		
		MovementQueryCommand movementQueryCommand=new MovementQueryCommand();                      //���ѯ
		commands.put(movementQueryCommand.getName().toLowerCase(), movementQueryCommand);
		
		MoveQueryCommand moveQueryCommand=new MoveQueryCommand();                                  //���ѯ
		commands.put(moveQueryCommand.getName().toLowerCase(), moveQueryCommand);
		
		MailAddCommand mailAddCommand=new MailAddCommand();                                        //�����ʼ�
		commands.put(mailAddCommand.getName().toLowerCase(),mailAddCommand);
		
		MailListCommand mailListCommand=new MailListCommand();                                     //�ʼ��б�
		commands.put(mailListCommand.getName().toLowerCase(),mailListCommand);
		
		MailEditCommand mailEditCommand=new MailEditCommand();                                     //�޸��ʼ�
		commands.put(mailEditCommand.getName().toLowerCase(),mailEditCommand);
		
		MailDelCommand mailDelCommand=new MailDelCommand();                                        //ɾ���ʼ�
		commands.put(mailDelCommand.getName().toLowerCase(),mailDelCommand);
		
		MailQueryCommand mailQueryCommand=new MailQueryCommand();                                  //�鿴�ʼ�
		commands.put(mailQueryCommand.getName().toLowerCase(),mailQueryCommand);
		
		MailOutsideCommand mailOutsideCommand=new MailOutsideCommand();                            //�ⲿ�ʼ�
		commands.put(mailOutsideCommand.getName().toLowerCase(),mailOutsideCommand);
		
		MovementactorAddCommand movementactorAddCommand=new MovementactorAddCommand();             //����
		commands.put(movementactorAddCommand.getName().toLowerCase(),movementactorAddCommand);
		
		MovementactorListCommand movementactorListCommand=new MovementactorListCommand();          //�������б�
		commands.put(movementactorListCommand.getName().toLowerCase(),movementactorListCommand);
		
		MovementactorEditCommand movementactorEditCommand=new MovementactorEditCommand();          //�������޸�
		commands.put(movementactorEditCommand.getName().toLowerCase(),movementactorEditCommand);
		
		MovementactorDelCommand movementactorDelCommand=new MovementactorDelCommand();             //������ɾ��
		commands.put(movementactorDelCommand.getName().toLowerCase(),movementactorDelCommand);
		
		MovementactorQueryCommand movementactorQueryCommand=new MovementactorQueryCommand();       //�����߲鿴
		commands.put(movementactorQueryCommand.getName().toLowerCase(),movementactorQueryCommand);
		
		MovactorListCommand movactorListCommand=new MovactorListCommand();                        //�������б�
		commands.put(movactorListCommand.getName().toLowerCase(),movactorListCommand);
		
		DocumentAddCommand documentAddCommand=new DocumentAddCommand();                            //�ϴ�����
		commands.put(documentAddCommand.getName().toLowerCase(),documentAddCommand);
		
		DocumentListCommand documentListCommand=new DocumentListCommand();                         //�����б�
		commands.put(documentListCommand.getName().toLowerCase(),documentListCommand);
		
		DocumentListHrCommand documentListHrCommand=new DocumentListHrCommand();                   //�����б�
		commands.put(documentListHrCommand.getName().toLowerCase(),documentListHrCommand);
		
		DocumentEditCommand documentEditCommand=new DocumentEditCommand();                         //�༭����
		commands.put(documentEditCommand.getName().toLowerCase(),documentEditCommand);
		
		DocumentDelCommand documentDelCommand=new DocumentDelCommand();                            //ɾ������
		commands.put(documentDelCommand.getName().toLowerCase(),documentDelCommand);
		
		DocumentQueryCommand documentQueryCommand=new DocumentQueryCommand();                      //���ϲ鿴
		commands.put(documentQueryCommand.getName().toLowerCase(),documentQueryCommand);
		
		StatusChangeCommand statusChangeCommand=new StatusChangeCommand();                         //��������
		commands.put(statusChangeCommand.getName().toLowerCase(),statusChangeCommand);
		
		StatusChangePartCommand statusChangePartCommand=new StatusChangePartCommand();             //��������
		commands.put(statusChangePartCommand.getName().toLowerCase(),statusChangePartCommand);
		
		DocumentDownCommand documentDownCommand=new DocumentDownCommand();                         //��������
		commands.put(documentDownCommand.getName().toLowerCase(),documentDownCommand);
		
		MessageListlimtCommand messageListlimtCommand=new MessageListlimtCommand();                //��Ϣ��ҳչʾ
		commands.put(messageListlimtCommand.getName().toLowerCase(),messageListlimtCommand);
		
		MovementListlimtCommand movementListlimtCommand=new MovementListlimtCommand();             //���ҳչʾ
		commands.put(movementListlimtCommand.getName().toLowerCase(),movementListlimtCommand);
		
		MessageListpartCommand messageListpartCommand=new MessageListpartCommand();                //��Ϣ��ҳ����չʾ
		commands.put(messageListpartCommand.getName().toLowerCase(),messageListpartCommand);
		
		AdvertAddCommand advertAddCommand=new AdvertAddCommand();                                  //���ӹ��
		commands.put(advertAddCommand.getName().toLowerCase(),advertAddCommand);
		
		AdvertEditCommand advertEditCommand=new AdvertEditCommand();                               //�༭���
		commands.put(advertEditCommand.getName().toLowerCase(),advertEditCommand);
		
		AdvertDelCommand advertDelCommand=new AdvertDelCommand();                                  //ɾ�����
		commands.put(advertDelCommand.getName().toLowerCase(),advertDelCommand);
		
		AdvertListCommand advertListCommand=new AdvertListCommand();                               //��ʾ���
		commands.put(advertListCommand.getName().toLowerCase(),advertListCommand);
		
		AdvertQueryCommand advertQueryCommand=new AdvertQueryCommand();                            //�鿴���
		commands.put(advertQueryCommand.getName().toLowerCase(),advertQueryCommand);
		
		ITUserRegisterCommand ituserRegisterCommand=new ITUserRegisterCommand();//IT�˲�ע��
		commands.put(ituserRegisterCommand.getName().toLowerCase(),ituserRegisterCommand);

		ShowitCommand showitComman=new ShowitCommand();//��ʾIT�˲�
		commands.put(showitComman.getName().toLowerCase(), showitComman);
		
		StopstateCommand stopstateCommand=new StopstateCommand();//IT�˲�״̬�޸�
		commands.put(stopstateCommand.getName().toLowerCase(), stopstateCommand);
		
		ITbaseinfoCommand itbaseinfoCommand=new ITbaseinfoCommand();//IT�˲���ʾ������Ϣ
		commands.put(itbaseinfoCommand.getName().toLowerCase(), itbaseinfoCommand);
		
		
		UpitinfoCommand upitinfoCommand=new UpitinfoCommand();//��ʾ�޸�IT�˲Ż�����Ϣ
		commands.put(upitinfoCommand.getName().toLowerCase(), upitinfoCommand);
		
		ITinfoeduCommand itinfoeduCommand=new ITinfoeduCommand();//��ʾ�޸�ITרҵ��Ϣ
		commands.put(itinfoeduCommand.getName().toLowerCase(), itinfoeduCommand);
		
		
		EdititCommand edititCommand=new EdititCommand();//�޸�IT�˲���Ϣ
		commands.put(edititCommand.getName().toLowerCase(), edititCommand);
		
		UpdateitCommand updateitCommand=new UpdateitCommand();
		commands.put(updateitCommand.getName().toLowerCase(), updateitCommand);
		
		DelitCommand delitCommand=new DelitCommand();
		commands.put(delitCommand.getName().toLowerCase(), delitCommand);
		
		ITloginCommand itloginCommand=new ITloginCommand();//it��¼
		commands.put(itloginCommand.getName().toLowerCase(), itloginCommand);
		LogoutCommand logoutCommand=new LogoutCommand();//it�˳�ϵͳ
		commands.put(logoutCommand.getName().toLowerCase(), logoutCommand);
		
		

		SimfinjobCommand simfinjobCommand=new SimfinjobCommand();
		commands.put(simfinjobCommand.getName().toLowerCase(),simfinjobCommand);
		
		ITinfoupCommand itinfoupCommand=new ITinfoupCommand();
		commands.put(itinfoupCommand.getName().toLowerCase(), itinfoupCommand);//IT�޸ĸ��˻�����Ϣ
		
		UppasswordCommand uppasswordCommand=new UppasswordCommand();
		commands.put(uppasswordCommand.getName().toLowerCase(), uppasswordCommand);//IT�޸ĸ�������
		
			
		AddworkCommand addwordCommand=new AddworkCommand();
		commands.put(addwordCommand.getName().toLowerCase(), addwordCommand);//���ӹ�������
		UPwordCommand upwordCommand=new UPwordCommand();
		commands.put(upwordCommand.getName().toLowerCase(), upwordCommand);//�޸Ĺ�������
		
		DelworkCommand delworkCommand=new DelworkCommand();
		commands.put(delworkCommand.getName().toLowerCase(), delworkCommand);//ɾ����������
		
		AddprojectCommand addprojectCommand=new AddprojectCommand();
		commands.put(addprojectCommand.getName().toLowerCase(), addprojectCommand);//������Ŀ����
	
		UpprojectCommand upprojectCommand=new UpprojectCommand();
		commands.put(upprojectCommand.getName().toLowerCase(), upprojectCommand);//�޸���Ŀ
		
		DelprojectCommand delprojectCommand=new DelprojectCommand();
		commands.put(delprojectCommand.getName().toLowerCase(), delprojectCommand);//ɾ����Ŀ
	   
	
		AddcertCommand addcertCommand=new AddcertCommand();
		commands.put(addcertCommand.getName().toLowerCase(), addcertCommand);//����֤��
		
		DelcertCommand delcertCommand=new DelcertCommand();
		commands.put(delcertCommand.getName().toLowerCase(), delcertCommand);//ɾ��֤��
	
		UpcertCommand upcertCommand=new UpcertCommand();
		commands.put(upcertCommand.getName().toLowerCase(), upcertCommand);//�޸�֤��
	
		AddskillCommand addskillCommand=new AddskillCommand();
		commands.put(addskillCommand.getName().toLowerCase(), addskillCommand);//����IT����
		
		DelskillCommand delskillCommand=new DelskillCommand();
		commands.put(delskillCommand.getName().toLowerCase(), delskillCommand);//ɾ��IT����
		UpitskillCommand upitskillCommand=new UpitskillCommand();
		commands.put(upitskillCommand.getName().toLowerCase(), upitskillCommand);//�޸�IT����
		
		
		AddlanguageCommand addlanguageCommand=new AddlanguageCommand();
		commands.put(addlanguageCommand.getName().toLowerCase(), addlanguageCommand);//��������
		DellanguageCommand dellanguageCommand=new DellanguageCommand();
		commands.put(dellanguageCommand.getName().toLowerCase(), dellanguageCommand);//ɾ������
		UplanguageCommand uplanguageCommand=new UplanguageCommand();
		commands.put(uplanguageCommand.getName().toLowerCase(), uplanguageCommand);//�޸�����
		
		UpspeinfoCommand upspeinfoCommand=new UpspeinfoCommand();
		commands.put(upspeinfoCommand.getName().toLowerCase(), upspeinfoCommand);//�޸�רҵ��Ϣ
		

		HRregeditCcommand hRregeditCcommand=new HRregeditCcommand();//HRע��
		commands.put(hRregeditCcommand.getName().toLowerCase(), hRregeditCcommand);
		HRloginCommand hrloginCommand=new HRloginCommand();//HR��¼
		commands.put(hrloginCommand.getName().toLowerCase(), hrloginCommand);
		HRaddinfoCommand hraddinfoCommand=new HRaddinfoCommand();//HR������ϸ��Ϣ
		commands.put(hraddinfoCommand.getName().toLowerCase(), hraddinfoCommand);
		
		UphrinfoCommand uphrinfoCommand=new UphrinfoCommand();//HR��ϸ��Ϣ�༭��ʾ
		commands.put(uphrinfoCommand.getName().toLowerCase(), uphrinfoCommand);
		
		ShowHRCommand showHRCommand=new ShowHRCommand();//����HR��ʾ����
		commands.put(showHRCommand.getName().toLowerCase(), showHRCommand);
		HRstatusCommand hrstatusCommand=new HRstatusCommand();//����HR״̬
		commands.put(hrstatusCommand.getName().toLowerCase(), hrstatusCommand);
		UphrpasswordCommand uphrpasswordCommand=new UphrpasswordCommand();//�޸�HR����/�˻�
		commands.put(uphrpasswordCommand.getName().toLowerCase(), uphrpasswordCommand);
		
		
		
		PutJobCommand putJobCommand=new PutJobCommand();//����ְλ��Ϣ
		commands.put(putJobCommand.getName().toLowerCase(), putJobCommand);
		ShowjobCommand showjobCommand=new ShowjobCommand();//����ְλ��Ϣ
		commands.put(showjobCommand.getName().toLowerCase(), showjobCommand);
		JobstatsCommand jobstatsCommand=new JobstatsCommand();//����ְλ��Ϣ
		commands.put(jobstatsCommand.getName().toLowerCase(), jobstatsCommand);
		QueryjobCommand queryjobCommand=new QueryjobCommand();//��ʾְλ��Ϣ
		commands.put(queryjobCommand.getName().toLowerCase(), queryjobCommand);
		
		TojobCommand tojobCommand=new TojobCommand();//��ʾְλ��Ϣ
		commands.put(tojobCommand.getName().toLowerCase(), tojobCommand);
		
		ShowJobLeterCommand showJobLeterCommand=new ShowJobLeterCommand();//��ʾӦƸ���
		commands.put(showJobLeterCommand.getName().toLowerCase(), showJobLeterCommand);
		
		DelleterCommand delleterCommand=new DelleterCommand();//ɾ����ְ��
		commands.put(delleterCommand.getName().toLowerCase(), delleterCommand);
		
		
		ByaddressCommand byaddressCommand=new ByaddressCommand();//����ַ����ְλ��Ϣ
		commands.put(byaddressCommand.getName().toLowerCase(), byaddressCommand);
		
		HighfindCommand highfindCommand=new HighfindCommand();//�߼�����ְλ��Ϣ
		commands.put(highfindCommand.getName().toLowerCase(), highfindCommand);
		
		FindITCommand findITCommand=new FindITCommand();//�˲�����
		commands.put(findITCommand.getName().toLowerCase(), findITCommand);
		
		CommendITCommand commendITCommand=new CommendITCommand();//�Ƽ�IT������Ϣ�ύ
		commands.put(commendITCommand.getName().toLowerCase(), commendITCommand);
		
		CommendITspeCommand commendITspeCommand=new CommendITspeCommand();//�Ƽ�ITרҵ��Ϣ�ύ
		commands.put(commendITspeCommand.getName().toLowerCase(), commendITspeCommand);

		CommendITworkCommand commendITworkCommand=new CommendITworkCommand();//�Ƽ�IT���������ύ
		commands.put(commendITworkCommand.getName().toLowerCase(), commendITworkCommand);
		
		CommendITproCommand commendITproCommand=new CommendITproCommand();//�Ƽ�IT��Ŀ�ύ
		commands.put(commendITproCommand.getName().toLowerCase(), commendITproCommand);
		
		CommendITskillCommand commendITskillCommand=new CommendITskillCommand();//�Ƽ�IT�����ύ
		commands.put(commendITskillCommand.getName().toLowerCase(), commendITskillCommand);
		
		CommendITcert commendITcert=new CommendITcert();//�Ƽ��˲�֤���ύ
		commands.put(commendITcert.getName().toLowerCase(), commendITcert);
		
		CommendITlangCommand commendITlangCommand=new CommendITlangCommand();//�Ƽ�IT�����ύ
		commands.put(commendITlangCommand.getName().toLowerCase(), commendITlangCommand);
		
		ShowalljobCommand showalljobCommand=new ShowalljobCommand();//��ʾ����ְλ��Ϣ
		commands.put(showalljobCommand.getName().toLowerCase(), showalljobCommand);
		
		QeueyHRCommand qeueyHRCommand=new QeueyHRCommand();//��ʾHR��Ϣ
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
