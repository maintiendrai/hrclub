package com.hrclub.view;

import java.util.*;

import com.hrclub.to.*;

import com.hrclub.model.ComfManager;
import com.hrclub.model.HRManager;
import com.hrclub.model.ITUserManager;
import com.hrclub.model.JobManager;
import com.hrclub.model.MessageManager;
import com.hrclub.model.MovementManager;
import com.hrclub.model.ServerorderMannager;
import com.hrclub.util.*;

public class ViewHelper implements java.io.Serializable {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	private String userid;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public ITUserTO selectITUser(String userid) {
		ITUserManager ituserdao = ITUserManager.getInstance();

		ITUserTO to = new ITUserTO();
		to = ituserdao.findUserByID(userid);
		return to;

	}

	public Page findUserByPage(int pagenum, int pagelen) {
		ITUserManager ituserdao = ITUserManager.getInstance();
		Page page = ituserdao.findUserByPage(pagenum, pagelen);
		return page;
	}

	public ITUserSpecialityTO selectITUserSpeciality(String userid) {
		ITUserManager ituserdao = ITUserManager.getInstance();
		ITUserSpecialityTO to = new ITUserSpecialityTO();
		to = ituserdao.findUserSpecialityByID(userid);
		return to;

	}

	public List getListWork(String userid) {
		List list = new ArrayList();
		ITUserManager worddao = ITUserManager.getInstance();
		list = worddao.findITworkByID(userid);
		return list;

	}

	public WorkexperienceTO getWorkByWordID(int wordID) {
		ITUserManager worddao = ITUserManager.getInstance();
		WorkexperienceTO to = new WorkexperienceTO();
		to = worddao.findITworkBywordID(wordID);
		return to;

	}

	public List getListProject(String userid) {
		List list = new ArrayList();
		ITUserManager projectdao = ITUserManager.getInstance();
		list = projectdao.findITprojectByuserID(userid);
		return list;

	}

	public ProjectTO getProjectTO(int projectID) {
		ProjectTO to = new ProjectTO();
		ITUserManager projectdao = ITUserManager.getInstance();
		to = projectdao.findITprojectByprojectID(projectID);
		return to;
	}

	public List getCertificate(String userid) {
		List list = new ArrayList();
		ITUserManager certdao = ITUserManager.getInstance();
		list = certdao.findCertificateByID(userid);
		return list;

	}

	public CertificateTO getCertificate(int certificateID) {
		CertificateTO to = new CertificateTO();
		ITUserManager certificateDAO = ITUserManager.getInstance();
		to = certificateDAO.findCertificateByID(certificateID);
		return to;
	}

	public HashMap getCertificateComf() {// ֤�����ñ�
		HashMap list = new HashMap();
		ComfManager certomf = ComfManager.getInstance();
		list = certomf.certificateList();
		return list;

	}
	public HashMap getCertListComf(int kind) {// ֤�����ñ�
		HashMap map = new HashMap();
		List list ;
		ComfManager certomf = ComfManager.getInstance();
		list = certomf.certList();
		for(int i=0;i<list.size();i++){
			if(((CertificateComfTO)list.get(i)).getKind()==kind)
				map.put(((CertificateComfTO)list.get(i)).getCertificateID(), ((CertificateComfTO)list.get(i)).getCertificatename());
		}
      return map;
	}
	public String getCertificateComf(String certificateIDs) {// ֤��ID��Ӧ����
		int certificateID = Integer.parseInt(certificateIDs);
		ComfManager certomf = ComfManager.getInstance();
		String name = ((CertificateComfTO) certomf
				.findCertificateByID(certificateID)).getCertificatename();
		return name;

	}

	public HashMap getCallingcomf() {// ��ҵ������Ϣ
		HashMap map = new HashMap();
		ComfManager callingcomfDAO = ComfManager.getInstance();
		map = callingcomfDAO.callingcomfList();
		return map;

	}

	public String getCallingcomf(int callingID) {// ��ҵID��Ӧ����

		ComfManager certomf = ComfManager.getInstance();
		String name = ((CallingcomfTO) certomf.findCallingByID(callingID))
				.getCallingname();
		return name;

	}

	public HashMap getJobcomf() {// ְλ������Ϣ
		HashMap list = new HashMap();
		ComfManager jobComfDAO = ComfManager.getInstance();
		list = jobComfDAO.jobList();

		return list;

	}

	public String getJobcomf(int jobID) {// ְλID��Ӧ����

		ComfManager certomf = ComfManager.getInstance();
		String name = ((JobComfTO) certomf.findJobByID(jobID)).getJobame();
		return name;

	}

	public String getJobcomf(String jobIDs) {// ְλID��Ӧ����
		int jobID ;
    	if(!jobIDs.equals("no")&&!jobIDs.equals(""))
		{
		 jobID = Integer.parseInt(jobIDs);

		ComfManager certomf = ComfManager.getInstance();
		String name = ((JobComfTO) certomf.findJobByID(jobID)).getJobame();
		return name;
		}
		else 
			return "��ְλ��Ϣ";
	}
	
	
	
	  public String getMoreJobcomf(String jobIDs) {// ְλID��Ӧ����
		String[] s=jobIDs.split(",");
       String name="";
       for(int i=0;i<s.length;i++){
    	   if(!s[i].equals(""))
    	   name=getJobcomf(s[i])+","+name;
       }
		return name;

	}

	public HashMap getITskillcomf() {// IT����������Ϣ
		HashMap map = new HashMap();
		ComfManager itskillcomfDAO = ComfManager.getInstance();
		map = itskillcomfDAO.ITskillcomfList();
		return map;

	}

	public String getITskillcomf(int skilID) {// IT����ID��Ӧ����

		ComfManager certomf = ComfManager.getInstance();
		String name = ((ITskillcomfTO) certomf.findITskillByID(skilID))
				.getSkillame();
		return name;

	}

	public HashMap getSpecialitycomf() {// רҵ������Ϣ
		HashMap map = new HashMap();
		ComfManager itskillcomfDAO = ComfManager.getInstance();
		map = itskillcomfDAO.specialitycomfList();
		return map;

	}

	public String getSpecialitycomf(String specialityIDs) {// רҵID��Ӧ����

		int specialityID = Integer.parseInt(specialityIDs);
		ComfManager certomf = ComfManager.getInstance();
		String name = ((SpecialitycomfTO) certomf
				.findSpecialityByID(specialityID)).getSpecialityname();
		return name;

	}

	public List getITskill(String userid) {
		List list = new ArrayList();
		ITUserManager itskillDAO = ITUserManager.getInstance();
		list = itskillDAO.findITskillByID(userid);
		return list;

	}

	public List getITLanguage(String userid) {
		List list = new ArrayList();
		ITUserManager languageDAO = ITUserManager.getInstance();
		list = languageDAO.findLanguageByID(userid);
		return list;

	}

	public LanguageTO getLanguageTO(int languageID) {
		LanguageTO to = new LanguageTO();
		ITUserManager languageDAO = ITUserManager.getInstance();
		to = languageDAO.findLanguageBylanguageID(languageID);
		return to;

	}

	public ITskillTO getITskillTO(int skillID) {
		ITskillTO to = new ITskillTO();
		ITUserManager itskillDAO = ITUserManager.getInstance();
		to = itskillDAO.findITskilleByITskillID(skillID);
		return to;

	}

	public HRinfoTO selectHRinfo(String hrID) {
		HRManager dao = HRManager.getInstance();

		HRinfoTO to = new HRinfoTO();
		to = dao.findHRByID(hrID);
		return to;

	}

	public List getServer(int i) {
		List list = ServerorderMannager.getInstance().findServerByputdate(i);
		if (null != list)
			return list;
		else
			return null;

	}

	public List getMovement(int i) {
		List list = MovementManager.getInstance().findMovementByputdate(10);
		return list;

	}

	public List getMessage(int i, String kind) {

		List list = MessageManager.getInstance().findMessageByputdate(10, kind);
		return list;

	}

	public List getJob(int i) {

		List list = JobManager.getInstance().findJobByputdate(10);
		return list;

	}

	public JobinfoTO selectJobinfo(String jobID) {
		int jobid = Integer.parseInt(jobID);
		JobManager dao = JobManager.getInstance();
		JobinfoTO to = new JobinfoTO();
		to = dao.findJobinfoByjobID(jobid);
		return to;

	}

	public HashMap getLanguage() {// ��������
		HashMap languages = new HashMap();

		languages.put(1, "Ӣ��");
		languages.put(2, "����");
		languages.put(3, "����");
		languages.put(4, "����");
		languages.put(5, "����");
		languages.put(6, "������");
		languages.put(7, "������");
		languages.put(8, "������");
		languages.put(9, "����");

		languages.put(10, "����");
		languages.put(11, "��");
		return languages;
	}

	public String getDegree(int i) {// ѧλ����
		HashMap languages = new HashMap();

		languages.put(1, "����");
		languages.put(2, "��ר");
		languages.put(3, "����");
		languages.put(4, "��ר");
		languages.put(5, "����");
		languages.put(6, "˶ʿ");
		languages.put(7, "��ʿ");

		languages.put(0, "����");

		return languages.get(i).toString();
	}

	public HashMap getWage() {// Ԥ��нˮ����
		HashMap wages = new HashMap();
		wages.put(0, "����");
		wages.put(1, "1000����");
		wages.put(2, "1000��2000");
		wages.put(3, "2000��3000");
		wages.put(4, "3000��4000");
		wages.put(5, "4000��5000");
		wages.put(6, "5000��6000");
		wages.put(7, "6000��8000");
		wages.put(8, "8000��10000");
		wages.put(9, "12000~15000");

		wages.put(10, "15000~18000");
		wages.put(11, "18000~25000");
		wages.put(12, "25000����");
		return wages;
	}

	public String getWage(int i) {
		HashMap wages = getWage();
		if(i<13){
		return wages.get(i).toString();}
		else
			return "����";
	}

	public HashMap getMainCity() {// ��Ҫ��������
		HashMap city = new HashMap();

		city.put(1, "�Ϻ�");
		city.put(2, "����");
		city.put(3, "����");
		city.put(4, "����");
		city.put(5, "�Ͼ�");
		city.put(6, "�㶫");
		city.put(7, "�㽭");
		city.put(8, "Ȫ��");
		city.put(9, "����");

		return city;
	}

	public HashMap getProvince() {
		HashMap province = new HashMap();
		province.put("Beijing", "����");
		province.put("Shanghai", "�Ϻ�");
		province.put("Tianjin", "���");
		province.put("Chongqing", "����");
		province.put("Anhui", "����");
		province.put("Fujian", "����");
		province.put("Gansu", "����");
		province.put("Hebei", "�ӱ�");
		province.put("Heilongjiang", "������");
		province.put("Guangdong", "�㶫");
		province.put("Guangxi", "����");
		province.put("Guizhou", "����");
		province.put("Henan", "����");
		province.put("Hubei", "����");
		province.put("Hunan", "����");
		province.put("Hainan", "����");
		province.put("Jiangsu", "����");
		province.put("Jiangxi", "����");
		province.put("Jilin", "����");
		province.put("Liaoning", "����");
		province.put("Neimenggu", "���ɹ�");
		province.put("Ningxia", "����");
		province.put("Qinghai", "�ຣ");
		province.put("Shandong", "ɽ��");
		province.put("Shanxi", "ɽ��");
		province.put("Shaanxi", "����");
		province.put("Sichuan", "�Ĵ�");
		province.put("Xinjiang", "�½�");
		province.put("Xizang", "����");
		province.put("Yunnan", "����");
		province.put("Zhejiang", "�㽭");
		province.put("Hongkong", "���");
		province.put("Macao", "����");
		province.put("Taiwan", "̨��");

		return province;

	}

	public String getProvince(String p) {
		HashMap province = new HashMap();
		province = getProvince();

		String buxiang = "����";
		// String ps=province.get(p).toString();
		if (p == null || p == "")
			return buxiang;
		else
			return province.get(p).toString();

	}

	public HashMap getAllCtiy(){
		
		HashMap city = new HashMap();
		city.put(0, "������");
		city.put(1, "�Ϻ���");
		city.put(2, "�����");
		city.put(3, "������");
		city.put(4,"�Ϸ���");
		city.put(5,"������");
		city.put(6,"������");
		city.put(7,"������");
		city.put(8,"������");
		city.put(9,"������");
		city.put(10,"������");
		city.put(11,"��ɽ��");
		city.put(12,"�ߺ���");
		city.put(13,"ͭ����");
		city.put(14,"������");
		city.put(15,"��ɽ��");
		city.put(16,"������");
		city.put(17,"������");
		city.put(18,"������");
		city.put(19,"������");
		city.put(20,"������");
		city.put(21,"��������");

		city.put(22,"������");
		city.put(23,"��ƽ��");
		city.put(24,"������");
		city.put(25,"������");
		city.put(26,"Ȫ����");
		city.put(27,"������");
		city.put(28,"������");
		city.put(29,"������");
		city.put(30,"������");
		city.put(31,"��������");
		
		city.put(32,"������");
		city.put(33,"��������");
		city.put(34,"�����");
		city.put(35,"������");
		city.put(36,"��ˮ��");
		city.put(37,"��Ȫ��");
		city.put(38,"��Ҵ��");
		city.put(39,"������");
		city.put(40,"������");
		city.put(41,"ƽ����");
		city.put(42,"������");
		city.put(43,"¤�ϵ���");
		city.put(44,"���Ļ���������");
		city.put(45,"���ϲ���������");
		city.put(46,"������");
		city.put(47,"�ػ���");
		city.put(48,"��������");

		city.put(49,"ʯ��ׯ��");
		city.put(50,"�żҿ���");
		city.put(51,"�е���");
		city.put(52,"�ػʵ���");
		city.put(53,"��ɽ��");
		city.put(54,"�ȷ���");
		city.put(55,"������");
		city.put(56,"������");
		city.put(57,"��ˮ��");
		city.put(58,"��̨��");
		city.put(59,"������");
		city.put(60,"��������");
		
		city.put(61,"��������");
		city.put(62,"���������");
		city.put(63,"�ں���");
		city.put(64,"������");
		city.put(65,"������");
		city.put(66,"�׸���");
		city.put(67,"��ľ˹��");
		city.put(68,"˫Ѽɽ��");
		city.put(69,"��̨����");
		city.put(70,"������");
		city.put(71,"ĵ������");
		city.put(72,"�绯����");
		city.put(73,"���˰������");
		city.put(74,"��������");

		city.put(75,"������");
		city.put(76,"��Զ��");
		city.put(77,"�ع���");
		city.put(78,"��Դ��");
		city.put(79,"÷����");
		city.put(80,"������");
		city.put(81,"��ͷ��");
		city.put(82,"������");
		city.put(83,"��β��");
		city.put(84,"������");
		city.put(85,"��ݸ��");
		city.put(86,"������");
		city.put(87,"�麣��");
		city.put(88,"��ɽ��");
		city.put(89,"������");
		city.put(90,"��ɽ��");
		city.put(91,"������");
		city.put(92,"�Ƹ���");
		city.put(93,"������");
		city.put(94,"ï����");
		city.put(95,"տ����");
		city.put(96,"��������");

		city.put(97,"������");
		city.put(98,"������");
		city.put(99,"������");
		city.put(100,"������");
		city.put(101,"�����");
		city.put(102,"������");
		city.put(103,"������");
		city.put(104,"������");
		city.put(105,"���Ǹ���");
		city.put(106,"��ɫ��");
		city.put(107,"�ӳص���");
		city.put(108,"���ݵ���");
		city.put(109,"������");
		city.put(110,"ƾ����");
		city.put(111,"������");
		city.put(112,"��������");

		city.put(113,"������");
		city.put(114,"����ˮ��");
		city.put(115,"������");
		city.put(116,"�Ͻڵ���");
		city.put(117,"ͭ�ʵ���");
		city.put(118,"��˳��");
		city.put(119,"ǭ�������嶱��������");
		city.put(120,"ǭ�ϲ���������������");
		city.put(121,"ǭ���ϲ���������������");
		city.put(122,"��������");

		city.put(123,"֣����");
		city.put(124,"����Ͽ��");
		city.put(125,"������");
		city.put(126,"������");
		city.put(127,"������");
		city.put(128,"�ױ���");
		city.put(129,"������");
		city.put(130,"�����");
		city.put(131,"������");
		city.put(132,"������");
		city.put(133,"�����");
		city.put(134,"�����");
		city.put(135,"ƽ��ɽ��");
		city.put(136,"������");
		city.put(137,"������");
		city.put(138,"��Դ��");
		city.put(139,"�ܿ���");
		city.put(140,"פ�����");
		city.put(141,"��������");

		city.put(142,"�人��");
		city.put(143,"ʮ����");
		city.put(144,"�差��");
		city.put(145,"������");
		city.put(146,"Т����");
		city.put(147,"�Ƹ���");
		city.put(148,"������");
		city.put(149,"��ʯ��");
		city.put(150,"������");
		city.put(151,"������");
		city.put(152,"�˲���");
		city.put(153,"������");
		city.put(154,"������");
		city.put(155,"������");
		city.put(156,"Ǳ����");
		city.put(157,"��ũ������");
		city.put(158,"��ʩ����������������");
		city.put(159,"��������");

		city.put(160,"��ɳ��");
		city.put(161,"�żҽ���");
		city.put(162,"������");
		city.put(163,"������");
		city.put(164,"������");
		city.put(165,"������");
		city.put(166,"��̶��");
		city.put(167,"������");
		city.put(168,"������");
		city.put(169,"������");
		city.put(170,"������");
		city.put(171,"������");
		city.put(172,"¦����");
		city.put(173,"��������������������");
		city.put(174,"��������");

		city.put(175,"������");
		city.put(176,"������");
		city.put(177,"��ɽ��");
		city.put(178,"�Ĳ���");
		city.put(179,"����");
		city.put(180,"������");
		city.put(181,"������");
		city.put(182,"������");
		city.put(183,"��ָɽ��");
		city.put(184,"��������");

		city.put(185,"�Ͼ���");
		city.put(186,"������");
		city.put(187,"���Ƹ���");
		city.put(188,"��Ǩ��");
		city.put(189,"������");
		city.put(190,"�γ���");
		city.put(191,"������");
		city.put(192,"̩����");
		city.put(193,"��ͨ��");
		city.put(194,"����");
		city.put(195,"������");
		city.put(196,"������");
		city.put(197,"������");
		city.put(198,"������");
		city.put(199,"��������");

		city.put(200,"�ϲ���");
		city.put(201,"�Ž���");
		city.put(202,"��������");
		city.put(203,"ӥ̶��");
		city.put(204,"������");
		city.put(205,"Ƽ����");
		city.put(206,"������");
		city.put(207,"������");
		city.put(208,"������");
		city.put(209,"�˴���");
		city.put(210,"������");
		city.put(211,"��������");

		city.put(212,"������");
		city.put(213,"�׳���");
		city.put(214,"��ԭ��");
		city.put(215,"������");
		city.put(216,"��ƽ��");
		city.put(217,"��Դ��");
		city.put(218,"ͨ����");
		city.put(219,"��ɽ��");
		city.put(220,"�ӱ߳�����������");
		city.put(221,"��������");

		city.put(222,"������");
		city.put(223,"������");
		city.put(224,"������");
		city.put(225,"������");
		city.put(226,"��˳��");
		city.put(227,"��Ϫ��");
		city.put(228,"������");
		city.put(229,"��ɽ��");
		city.put(230,"������");
		city.put(231,"������");
		city.put(232,"Ӫ����");
		city.put(233,"�̽���");
		city.put(234,"������");
		city.put(235,"��«����");
		city.put(236,"��������");

		city.put(237,"���ͺ�����");
		city.put(238,"��ͷ��");
		city.put(239,"�ں���");
		city.put(240,"�����");
		city.put(241,"���ױ���");
		city.put(242,"�˰���");
		city.put(243,"���ֹ�����");
		city.put(244,"�����첼��");
		city.put(245,"�����׶���");
		city.put(246,"��������");
		city.put(247,"������˹��");
		city.put(248,"ͨ����");
		city.put(249,"��������");

		city.put(250,"������");
		city.put(251,"ʯ��ɽ��");
		city.put(252,"������");
		city.put(253,"��ԭ��");
		city.put(254,"��������");

		city.put(255,"������");
		city.put(256,"��������");
		city.put(257,"��������������");
		city.put(258,"���ϲ���������");
		city.put(259,"���ϲ���������");
		city.put(260,"�������������");
		city.put(261,"��������������");
		city.put(262,"�����ɹ������������");
		city.put(263,"��������");

		city.put(264,"������");
		city.put(265,"�ĳ���");
		city.put(266,"������");
		city.put(267,"��Ӫ��");
		city.put(268,"�Ͳ���");
		city.put(269,"Ϋ����");
		city.put(270,"��̨��");
		city.put(271,"������");
		city.put(272,"�ൺ��");
		city.put(273,"������");
		city.put(274,"������");
		city.put(275,"��ׯ��");
		city.put(276,"������");
		city.put(277,"̩����");
		city.put(278,"������");
		city.put(279,"������");
		city.put(280,"������");
		city.put(281,"��������");

		city.put(282,"̫ԭ��");
		city.put(283,"��ͬ��");
		city.put(284,"˷����");
		city.put(285,"��Ȫ��");
		city.put(286,"������");
		city.put(287,"������");
		city.put(288,"������");
		city.put(289,"������");
		city.put(290,"������");
		city.put(291,"�ٷ���");
		city.put(292,"�˳���");
		city.put(293,"��������");

		city.put(294,"������");
		city.put(295,"�Ӱ���");
		city.put(296,"ͭ����");
		city.put(297,"μ����");
		city.put(298,"������");
		city.put(299,"������");
		city.put(300,"������");
		city.put(301,"������");
		city.put(302,"������");
		city.put(303,"������");
		city.put(304,"��������");

		city.put(305,"�ɶ���");
		city.put(306,"��Ԫ��");
		city.put(307,"������");
		city.put(308,"������");
		city.put(309,"�ϳ���");
		city.put(310,"�㰲��");
		city.put(311,"������");
		city.put(312,"�ڽ���");
		city.put(313,"��ɽ��");
		city.put(314,"�Թ���");
		city.put(315,"������");
		city.put(316,"�˱���");
		city.put(317,"��֦����");
		city.put(318,"������");
		city.put(319,"������");
		city.put(320,"������");
		city.put(321,"üɽ��");
		city.put(322,"�Ű���");
		city.put(323,"���Ӳ���Ǽ��������");
		city.put(324,"���β���������");
		city.put(325,"��ɽ����������");
		city.put(326,"��������");

		city.put(327,"��³ľ����");
		city.put(328,"����������");
		city.put(329,"ʯ������");
		city.put(330,"��ʲ����");
		city.put(331,"�����յ���");
		city.put(332,"�������");
		city.put(333,"��³������");
		city.put(334,"���ܵ���");
		city.put(335,"�������տ¶�����������");
		city.put(336,"���������ɹ�������");
		city.put(337,"��������������");
		city.put(338,"���������ɹ�������");
		city.put(339,"���������������");
		city.put(340,"��������");

		city.put(341,"������");
		city.put(342,"��������");
		city.put(343,"��������");
		city.put(344,"��֥����");
		city.put(345,"ɽ�ϵ���");
		city.put(346,"�տ������");
		city.put(347,"�������");
		city.put(348,"��������");

		city.put(349,"������");
		city.put(350,"������");
		city.put(351,"��Ϫ��");
		city.put(352,"������");
		city.put(353,"��ͨ��");
		city.put(354,"˼é��");
		city.put(355,"�ٲ׵���");
		city.put(356,"��ɽ��");
		city.put(357,"�º���徰����������");
		city.put(358,"ŭ��������������");
		city.put(359,"�������������");
		city.put(360,"�������������");
		city.put(361,"��������������");
		city.put(362,"��ӹ���������������");
		city.put(363,"��ɽ׳������������");
		city.put(364,"��˫���ɴ���������");
		city.put(365,"��������");

		city.put(366,"������");
		city.put(367,"������");
		city.put(368,"������");
		city.put(369,"��ɽ��");
		city.put(370,"������");
		city.put(371,"������");
		city.put(372,"����");
		city.put(373,"̨����");
		city.put(374,"������");
		city.put(375,"��ˮ��");
		city.put(376,"������");
		city.put(377,"��������");

		city.put(378,"���");
		city.put(379,"����");
		city.put(380,"̨��");
		
		return city;
	}
	
	public String getCtiyname(String cs){
		 
		if(!cs.equals("no")&&!cs.equals("")){
			HashMap city=getAllCtiy();
		   String[] c=cs.split(",");
		   String cn="";
		   for(int i=0;i<c.length;i++)
		   { 
                  if(!c[i].equals(""))
			   cn=city.get(Integer.parseInt(c[i])).toString()+","+cn;
		   }
		   return cn;
		}
		else
			return "�޵�ַ��Ϣ";
		
	}
	
	public HashMap getCity() {
		HashMap city = new HashMap();

		HashMap Beijing = new HashMap();
		Beijing.put(0, "������");
		city.put("Beijing", Beijing);

		HashMap Shanghai = new HashMap();
		Shanghai.put(1, "�Ϻ���");

		city.put("Shanghai", Shanghai);

		HashMap Tianjin = new HashMap();
		Tianjin.put(2, "�����");

		city.put("Tianjin", Tianjin);

		HashMap Chongqing = new HashMap();
		Chongqing.put(3, "������");

		city.put("Chongqing", Chongqing);

		HashMap Anhui = new HashMap();
		Anhui.put(4, "�Ϸ���");
		Anhui.put(5, "������");
		Anhui.put(6, "������");
		Anhui.put(7, "������");
		Anhui.put(8, "������");
		Anhui.put(9, "������");
		Anhui.put(10, "������");
		Anhui.put(11, "��ɽ��");
		Anhui.put(12, "�ߺ���");
		Anhui.put(13, "ͭ����");
		Anhui.put(14, "������");
		Anhui.put(15, "��ɽ��");
		Anhui.put(16, "������");
		Anhui.put(17, "������");
		Anhui.put(18, "������");
		Anhui.put(19, "������");
		Anhui.put(20, "������");
		Anhui.put(21, "��������");
		city.put("Anhui", Anhui);

		HashMap Fujian = new HashMap();
		Fujian.put(22, "������");
		Fujian.put(23, "��ƽ��");
		Fujian.put(24, "������");
		Fujian.put(25, "������");
		Fujian.put(26, "Ȫ����");
		Fujian.put(27, "������");
		Fujian.put(28, "������");
		Fujian.put(29, "������");
		Fujian.put(30, "������");
		Fujian.put(31, "��������");
		;

		city.put("Fujian", Fujian);

		HashMap Gansu = new HashMap();
		Gansu.put(32, "������");
		Gansu.put(33, "��������");
		Gansu.put(34, "�����");
		Gansu.put(35, "������");
		Gansu.put(36, "��ˮ��");
		Gansu.put(37, "��Ȫ��");
		Gansu.put(38, "��Ҵ��");
		Gansu.put(39, "������");
		Gansu.put(40, "������");
		Gansu.put(41, "ƽ����");
		Gansu.put(42, "������");
		Gansu.put(43, "¤�ϵ���");
		Gansu.put(44, "���Ļ���������");
		Gansu.put(45, "���ϲ���������");
		Gansu.put(46, "������");
		Gansu.put(47, "�ػ���");
		Gansu.put(48, "��������");

		city.put("Gansu", Gansu);

		HashMap Hebei = new HashMap();
		Hebei.put(49, "ʯ��ׯ��");
		Hebei.put(50, "�żҿ���");
		Hebei.put(51, "�е���");
		Hebei.put(52, "�ػʵ���");
		Hebei.put(53, "��ɽ��");
		Hebei.put(54, "�ȷ���");
		Hebei.put(55, "������");
		Hebei.put(56, "������");
		Hebei.put(57, "��ˮ��");
		Hebei.put(58, "��̨��");
		Hebei.put(59, "������");
		Hebei.put(60, "��������");

		city.put("Hebei", Hebei);

		HashMap Heilongjiang = new HashMap();
		Heilongjiang.put(61, "��������");
		Heilongjiang.put(62, "���������");
		Heilongjiang.put(63, "�ں���");
		Heilongjiang.put(64, "������");
		Heilongjiang.put(65, "������");
		Heilongjiang.put(66, "�׸���");
		Heilongjiang.put(67, "��ľ˹��");
		Heilongjiang.put(68, "˫Ѽɽ��");
		Heilongjiang.put(69, "��̨����");
		Heilongjiang.put(70, "������");
		Heilongjiang.put(71, "ĵ������");
		Heilongjiang.put(72, "�绯����");
		Heilongjiang.put(73, "���˰������");
		Heilongjiang.put(74, "��������");

		city.put("Heilongjiang", Heilongjiang);

		HashMap Guangdong = new HashMap();
		Guangdong.put(75, "������");
		Guangdong.put(76, "��Զ��");
		Guangdong.put(77, "�ع���");
		Guangdong.put(78, "��Դ��");
		Guangdong.put(79, "÷����");
		Guangdong.put(80, "������");
		Guangdong.put(81, "��ͷ��");
		Guangdong.put(82, "������");
		Guangdong.put(83, "��β��");
		Guangdong.put(84, "������");
		Guangdong.put(85, "��ݸ��");
		Guangdong.put(86, "������");
		Guangdong.put(87, "�麣��");
		Guangdong.put(88, "��ɽ��");
		Guangdong.put(89, "������");
		Guangdong.put(90, "��ɽ��");
		Guangdong.put(91, "������");
		Guangdong.put(92, "�Ƹ���");
		Guangdong.put(93, "������");
		Guangdong.put(94, "ï����");
		Guangdong.put(95, "տ����");
		Guangdong.put(96, "��������");

		city.put("Guangdong", Guangdong);

		HashMap Guangxi = new HashMap();
		Guangxi.put(97, "������");
		Guangxi.put(98, "������");
		Guangxi.put(99, "������");
		Guangxi.put(100, "������");
		Guangxi.put(101, "�����");
		Guangxi.put(102, "������");
		Guangxi.put(103, "������");
		Guangxi.put(104, "������");
		Guangxi.put(105, "���Ǹ���");
		Guangxi.put(106, "��ɫ��");
		Guangxi.put(107, "�ӳص���");
		Guangxi.put(108, "���ݵ���");
		Guangxi.put(109, "������");
		Guangxi.put(110, "ƾ����");
		Guangxi.put(111, "������");
		Guangxi.put(112, "��������");

		city.put("Guangxi", Guangxi);

		HashMap Guizhou = new HashMap();

		Guizhou.put(113, "������");
		Guizhou.put(114, "����ˮ��");
		Guizhou.put(115, "������");
		Guizhou.put(116, "�Ͻڵ���");
		Guizhou.put(117, "ͭ�ʵ���");
		Guizhou.put(118, "��˳��");
		Guizhou.put(119, "ǭ�������嶱��������");
		Guizhou.put(120, "ǭ�ϲ���������������");
		Guizhou.put(121, "ǭ���ϲ���������������");
		Guizhou.put(122, "��������");

		city.put("Guizhou", Guizhou);

		HashMap Henan = new HashMap();
		Henan.put(123, "֣����");
		Henan.put(124, "����Ͽ��");
		Henan.put(125, "������");
		Henan.put(126, "������");
		Henan.put(127, "������");
		Henan.put(128, "�ױ���");
		Henan.put(129, "������");
		Henan.put(130, "�����");
		Henan.put(131, "������");
		Henan.put(132, "������");
		Henan.put(133, "�����");
		Henan.put(134, "�����");
		Henan.put(135, "ƽ��ɽ��");
		Henan.put(136, "������");
		Henan.put(137, "������");
		Henan.put(138, "��Դ��");
		Henan.put(139, "�ܿ���");
		Henan.put(140, "פ�����");
		Henan.put(141, "��������");

		city.put("Henan", Henan);

		HashMap Hubei = new HashMap();
		Hubei.put(142, "�人��");
		Hubei.put(143, "ʮ����");
		Hubei.put(144, "�差��");
		Hubei.put(145, "������");
		Hubei.put(146, "Т����");
		Hubei.put(147, "�Ƹ���");
		Hubei.put(148, "������");
		Hubei.put(149, "��ʯ��");
		Hubei.put(150, "������");
		Hubei.put(151, "������");
		Hubei.put(152, "�˲���");
		Hubei.put(153, "������");
		Hubei.put(154, "������");
		Hubei.put(155, "������");
		Hubei.put(156, "Ǳ����");
		Hubei.put(157, "��ũ������");
		Hubei.put(158, "��ʩ����������������");
		Hubei.put(159, "��������");

		city.put("Hubei", Hubei);

		HashMap Hunan = new HashMap();
		Hunan.put(160, "��ɳ��");
		Hunan.put(161, "�żҽ���");
		Hunan.put(162, "������");
		Hunan.put(163, "������");
		Hunan.put(164, "������");
		Hunan.put(165, "������");
		Hunan.put(166, "��̶��");
		Hunan.put(167, "������");
		Hunan.put(168, "������");
		Hunan.put(169, "������");
		Hunan.put(170, "������");
		Hunan.put(171, "������");
		Hunan.put(172, "¦����");
		Hunan.put(173, "��������������������");
		Hunan.put(174, "��������");

		city.put("Hunan", Hunan);

		HashMap Hainan = new HashMap();
		Hainan.put(175, "������");
		Hainan.put(176, "������");
		Hainan.put(177, "��ɽ��");
		Hainan.put(178, "�Ĳ���");
		Hainan.put(179, "����");
		Hainan.put(180, "������");
		Hainan.put(181, "������");
		Hainan.put(182, "������");
		Hainan.put(183, "��ָɽ��");
		Hainan.put(184, "��������");

		city.put("Hainan", Hainan);

		HashMap Jiangsu = new HashMap();

		Jiangsu.put(185, "�Ͼ���");
		Jiangsu.put(186, "������");
		Jiangsu.put(187, "���Ƹ���");
		Jiangsu.put(188, "��Ǩ��");
		Jiangsu.put(189, "������");
		Jiangsu.put(190, "�γ���");
		Jiangsu.put(191, "������");
		Jiangsu.put(192, "̩����");
		Jiangsu.put(193, "��ͨ��");
		Jiangsu.put(194, "����");
		Jiangsu.put(195, "������");
		Jiangsu.put(196, "������");
		Jiangsu.put(197, "������");
		Jiangsu.put(198, "������");
		Jiangsu.put(199, "��������");

		city.put("Jiangsu", Jiangsu);

		HashMap Jiangxi = new HashMap();
		Jiangxi.put(200, "�ϲ���");
		Jiangxi.put(201, "�Ž���");
		Jiangxi.put(202, "��������");
		Jiangxi.put(203, "ӥ̶��");
		Jiangxi.put(204, "������");
		Jiangxi.put(205, "Ƽ����");
		Jiangxi.put(206, "������");
		Jiangxi.put(207, "������");
		Jiangxi.put(208, "������");
		Jiangxi.put(209, "�˴���");
		Jiangxi.put(210, "������");
		Jiangxi.put(211, "��������");

		city.put("Jiangxi", Jiangxi);

		HashMap Jilin = new HashMap();
		Jilin.put(212, "������");
		Jilin.put(213, "�׳���");
		Jilin.put(214, "��ԭ��");
		Jilin.put(215, "������");
		Jilin.put(216, "��ƽ��");
		Jilin.put(217, "��Դ��");
		Jilin.put(218, "ͨ����");
		Jilin.put(219, "��ɽ��");
		Jilin.put(220, "�ӱ߳�����������");
		Jilin.put(221, "��������");

		city.put("Jilin", Jilin);

		HashMap Liaoning = new HashMap();

		Liaoning.put(222, "������");
		Liaoning.put(223, "������");
		Liaoning.put(224, "������");
		Liaoning.put(225, "������");
		Liaoning.put(226, "��˳��");
		Liaoning.put(227, "��Ϫ��");
		Liaoning.put(228, "������");
		Liaoning.put(229, "��ɽ��");
		Liaoning.put(230, "������");
		Liaoning.put(231, "������");
		Liaoning.put(232, "Ӫ����");
		Liaoning.put(233, "�̽���");
		Liaoning.put(234, "������");
		Liaoning.put(235, "��«����");
		Liaoning.put(236, "��������");

		city.put("Liaoning", Liaoning);

		HashMap Neimenggu = new HashMap();

		Neimenggu.put(237, "���ͺ�����");
		Neimenggu.put(238, "��ͷ��");
		Neimenggu.put(239, "�ں���");
		Neimenggu.put(240, "�����");
		Neimenggu.put(241, "���ױ���");
		Neimenggu.put(242, "�˰���");
		Neimenggu.put(243, "���ֹ�����");
		Neimenggu.put(244, "�����첼��");
		Neimenggu.put(245, "�����׶���");
		Neimenggu.put(246, "��������");
		Neimenggu.put(247, "������˹��");
		Neimenggu.put(248, "ͨ����");
		Neimenggu.put(249, "��������");

		city.put("Neimenggu", Neimenggu);

		HashMap Ningxia = new HashMap();

		Ningxia.put(250, "������");
		Ningxia.put(251, "ʯ��ɽ��");
		Ningxia.put(252, "������");
		Ningxia.put(253, "��ԭ��");
		Ningxia.put(254, "��������");

		city.put("Ningxia", Ningxia);

		HashMap Qinghai = new HashMap();

		Qinghai.put(255, "������");
		Qinghai.put(256, "��������");
		Qinghai.put(257, "��������������");
		Qinghai.put(258, "���ϲ���������");
		Qinghai.put(259, "���ϲ���������");
		Qinghai.put(260, "�������������");
		Qinghai.put(261, "��������������");
		Qinghai.put(262, "�����ɹ������������");
		Qinghai.put(263, "��������");

		city.put("Qinghai", Qinghai);

		HashMap Shandong = new HashMap();

		Shandong.put(264, "������");
		Shandong.put(265, "�ĳ���");
		Shandong.put(266, "������");
		Shandong.put(267, "��Ӫ��");
		Shandong.put(268, "�Ͳ���");
		Shandong.put(269, "Ϋ����");
		Shandong.put(270, "��̨��");
		Shandong.put(271, "������");
		Shandong.put(272, "�ൺ��");
		Shandong.put(273, "������");
		Shandong.put(274, "������");
		Shandong.put(275, "��ׯ��");
		Shandong.put(276, "������");
		Shandong.put(277, "̩����");
		Shandong.put(278, "������");
		Shandong.put(279, "������");
		Shandong.put(280, "������");
		Shandong.put(281, "��������");

		city.put("Shandong", Shandong);

		HashMap Shanxi = new HashMap();

		Shanxi.put(282, "̫ԭ��");
		Shanxi.put(283, "��ͬ��");
		Shanxi.put(284, "˷����");
		Shanxi.put(285, "��Ȫ��");
		Shanxi.put(286, "������");
		Shanxi.put(287, "������");
		Shanxi.put(288, "������");
		Shanxi.put(289, "������");
		Shanxi.put(290, "������");
		Shanxi.put(291, "�ٷ���");
		Shanxi.put(292, "�˳���");
		Shanxi.put(293, "��������");

		city.put("Shanxi", Shanxi);

		HashMap Shaanxi = new HashMap();

		Shaanxi.put(294, "������");
		Shaanxi.put(295, "�Ӱ���");
		Shaanxi.put(296, "ͭ����");
		Shaanxi.put(297, "μ����");
		Shaanxi.put(298, "������");
		Shaanxi.put(299, "������");
		Shaanxi.put(300, "������");
		Shaanxi.put(301, "������");
		Shaanxi.put(302, "������");
		Shaanxi.put(303, "������");
		Shaanxi.put(304, "��������");

		city.put("Shaanxi", Shaanxi);

		HashMap Sichuan = new HashMap();

		Sichuan.put(305, "�ɶ���");
		Sichuan.put(306, "��Ԫ��");
		Sichuan.put(307, "������");
		Sichuan.put(308, "������");
		Sichuan.put(309, "�ϳ���");
		Sichuan.put(310, "�㰲��");
		Sichuan.put(311, "������");
		Sichuan.put(312, "�ڽ���");
		Sichuan.put(313, "��ɽ��");
		Sichuan.put(314, "�Թ���");
		Sichuan.put(315, "������");
		Sichuan.put(316, "�˱���");
		Sichuan.put(317, "��֦����");
		Sichuan.put(318, "������");
		Sichuan.put(319, "������");
		Sichuan.put(320, "������");
		Sichuan.put(321, "üɽ��");
		Sichuan.put(322, "�Ű���");
		Sichuan.put(323, "���Ӳ���Ǽ��������");
		Sichuan.put(324, "���β���������");
		Sichuan.put(325, "��ɽ����������");
		Sichuan.put(326, "��������");

		city.put("Sichuan", Sichuan);

		HashMap Xinjiang = new HashMap();

		Xinjiang.put(327, "��³ľ����");
		Xinjiang.put(328, "����������");
		Xinjiang.put(329, "ʯ������");
		Xinjiang.put(330, "��ʲ����");
		Xinjiang.put(331, "�����յ���");
		Xinjiang.put(332, "�������");
		Xinjiang.put(333, "��³������");
		Xinjiang.put(334, "���ܵ���");
		Xinjiang.put(335, "�������տ¶�����������");
		Xinjiang.put(336, "���������ɹ�������");
		Xinjiang.put(337, "��������������");
		Xinjiang.put(338, "���������ɹ�������");
		Xinjiang.put(339, "���������������");
		Xinjiang.put(340, "��������");

		city.put("Xinjiang", Xinjiang);

		HashMap Xizang = new HashMap();

		Xizang.put(341, "������");
		Xizang.put(342, "��������");
		Xizang.put(343, "��������");
		Xizang.put(344, "��֥����");
		Xizang.put(345, "ɽ�ϵ���");
		Xizang.put(346, "�տ������");
		Xizang.put(347, "�������");
		Xizang.put(348, "��������");

		city.put("Xizang", Xizang);

		HashMap Yunnan = new HashMap();

		Yunnan.put(349, "������");
		Yunnan.put(350, "������");
		Yunnan.put(351, "��Ϫ��");
		Yunnan.put(352, "������");
		Yunnan.put(353, "��ͨ��");
		Yunnan.put(354, "˼é��");
		Yunnan.put(355, "�ٲ׵���");
		Yunnan.put(356, "��ɽ��");
		Yunnan.put(357, "�º���徰����������");
		Yunnan.put(358, "ŭ��������������");
		Yunnan.put(359, "�������������");
		Yunnan.put(360, "�������������");
		Yunnan.put(361, "��������������");
		Yunnan.put(362, "��ӹ���������������");
		Yunnan.put(363, "��ɽ׳������������");
		Yunnan.put(364, "��˫���ɴ���������");
		Yunnan.put(365, "��������");

		city.put("Yunnan", Yunnan);

		HashMap Zhejiang = new HashMap();

		Zhejiang.put(366, "������");
		Zhejiang.put(367, "������");
		Zhejiang.put(368, "������");
		Zhejiang.put(369, "��ɽ��");
		Zhejiang.put(370, "������");
		Zhejiang.put(371, "������");
		Zhejiang.put(372, "����");
		Zhejiang.put(373, "̨����");
		Zhejiang.put(374, "������");
		Zhejiang.put(375, "��ˮ��");
		Zhejiang.put(376, "������");
		Zhejiang.put(377, "��������");

		city.put("Zhejiang", Zhejiang);

		HashMap Hongkong = new HashMap();
		Hongkong.put(378, "���");

		city.put("Hongkong", Hongkong);

		HashMap Macao = new HashMap();
		Macao.put(379, "����");

		city.put("Macao", Macao);

		HashMap Taiwan = new HashMap();
		Taiwan.put(380, "̨��");
		city.put("Taiwan", Taiwan);
		return city;
	}

	public String getCity(String p, String cs) {

		HashMap city = new HashMap();

		city = getCity();

		String buxiang = "����";
		if (p == null || p == "")
			return buxiang;

		else {
			int c = Integer.parseInt(cs);
			String citys = ((HashMap) city.get(p)).get(c).toString();
			return citys;
		}

	}

	public String getCity(String cs) {

		HashMap city = new HashMap();

		city = getCity();
		String[] c = cs.split(",");
		String sr = "";
		for (int i = 0; i < c.length; i++) {
			int ci = Integer.parseInt(cs);
			sr = city.get(ci).toString() + sr;
		}

		return sr;

	}

	public String getProCity(String ps) {
		StringBuffer sb = new StringBuffer();
		String[] c = ps.split(",");
		for (int i = 1; i < c.length; i++) { // System.out.println(c[i].trim());
			String[] pcs;

			if (c[i].contains(":")) {
				pcs = c[i].split(":");
				sb.append(getProvince(pcs[0]) + ":" + getCity(pcs[0], pcs[1])
						+ ",");
			} else
				sb.append(getProvince(c[i]) + ",");

		}

		return sb.toString().substring(0, sb.length() - 1);
	}

	public static void main(String args[]) {
		ViewHelper viewHelper = new ViewHelper();
		String cs="22,4,";
		System.out.print(viewHelper.getMoreJobcomf(cs));
//		HashMap province = viewHelper.getProvince();
//		HashMap city = viewHelper.getCity();
//		String addrname = "";
//		String addrkey = "";
//		String citykey = "";
//		String cityname = "";
//		int i = 1;


		
		// HashMap a = (HashMap) city.get("Fujian");
		//
		// Iterator it = a.keySet().iterator();
		//			
		// while (it.hasNext()) {
		// Object key=it.next();
		// System.out.println("key:"+key);
		// System.out.println("value:"+a.get(key));
		// }
//
//		Iterator iterator = province.keySet().iterator();
//
//		while (iterator.hasNext()) {
//			addrkey = iterator.next().toString();
//			addrname = province.get(addrkey).toString();
//			System.out.println(addrkey);
//			// System.out.println(addrname);
//
//			HashMap citys = (HashMap) city.get(addrkey);
//
//			Iterator ci = citys.keySet().iterator();
//			while (ci.hasNext()) {
//				Object key = ci.next();
//				System.out.println("key:" + key);
//				System.out.println("value:" + citys.get(key));
//			}
//		}

		// System.out.print("Province:"+viewHelper.getProvince("Shanghai")+"City:"+viewHelper.getCity("Shanghai",
		// 4));
		// System.out.print(viewHelper.getSpecialitycomf("7"));

		// String city = ",Fujian:0,Shanghai,Shandong:0,Beijing";
		//		
		// System.out.print(viewHelper.getProCity(city));
		// HashMap pc = new HashMap();
		// String[] c=city.split(",");
		// for(int i=1;i<c.length;i++)
		// { //System.out.println(c[i].trim());
		// String[] pcs;
		//	     
		// if(c[i].contains(":"))
		// { pcs=c[i].split(":");
		// System.out.println(viewHelper.getProvince(pcs[0]));
		// System.out.println(viewHelper.getCity(pcs[0],pcs[1]));
		// System.out.print(pcs[0]+pcs[1]);
		// }
		// else
		// System.out.println(viewHelper.getProvince(c[i]));
		//		
		// }

		// String[] Guizhou = new String[] { "0", "������", "1", "����ˮ��", "2",
		// "������",
		// "3", "�Ͻڵ���", "4", "ͭ�ʵ���", "5", "��˳��", "6", "ǭ�������嶱��������", "7",
		// "ǭ�ϲ���������������", "8", "ǭ���ϲ���������������", "9", "��������" };
		// char a = '"';
		//
		// for (int i = 0; i < Guizhou.length;) {
		// System.out.println("Guizhou.put("
		// + (Integer.parseInt(Guizhou[i]) + 113) + "," + a
		// + Guizhou[i + 1] + a + ");");
		// i = i + 2;
		// }

		// List list = null;
		// list=viewHelper.getCallingcomf();
		// System.out.print(((HashMap)list.get(1)).get(Integer.valueOf(1)));
		//		
		// HashMap commands = new HashMap();
		// commands=viewHelper.getLanguage();
		//       
		// System.out.print(commands.get(3));
	}

}
