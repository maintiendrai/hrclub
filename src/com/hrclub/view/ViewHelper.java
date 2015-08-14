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

	public HashMap getCertificateComf() {// 证书配置表
		HashMap list = new HashMap();
		ComfManager certomf = ComfManager.getInstance();
		list = certomf.certificateList();
		return list;

	}
	public HashMap getCertListComf(int kind) {// 证书配置表
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
	public String getCertificateComf(String certificateIDs) {// 证书ID对应名称
		int certificateID = Integer.parseInt(certificateIDs);
		ComfManager certomf = ComfManager.getInstance();
		String name = ((CertificateComfTO) certomf
				.findCertificateByID(certificateID)).getCertificatename();
		return name;

	}

	public HashMap getCallingcomf() {// 行业配置信息
		HashMap map = new HashMap();
		ComfManager callingcomfDAO = ComfManager.getInstance();
		map = callingcomfDAO.callingcomfList();
		return map;

	}

	public String getCallingcomf(int callingID) {// 行业ID对应名称

		ComfManager certomf = ComfManager.getInstance();
		String name = ((CallingcomfTO) certomf.findCallingByID(callingID))
				.getCallingname();
		return name;

	}

	public HashMap getJobcomf() {// 职位配置信息
		HashMap list = new HashMap();
		ComfManager jobComfDAO = ComfManager.getInstance();
		list = jobComfDAO.jobList();

		return list;

	}

	public String getJobcomf(int jobID) {// 职位ID对应名称

		ComfManager certomf = ComfManager.getInstance();
		String name = ((JobComfTO) certomf.findJobByID(jobID)).getJobame();
		return name;

	}

	public String getJobcomf(String jobIDs) {// 职位ID对应名称
		int jobID ;
    	if(!jobIDs.equals("no")&&!jobIDs.equals(""))
		{
		 jobID = Integer.parseInt(jobIDs);

		ComfManager certomf = ComfManager.getInstance();
		String name = ((JobComfTO) certomf.findJobByID(jobID)).getJobame();
		return name;
		}
		else 
			return "无职位信息";
	}
	
	
	
	  public String getMoreJobcomf(String jobIDs) {// 职位ID对应名称
		String[] s=jobIDs.split(",");
       String name="";
       for(int i=0;i<s.length;i++){
    	   if(!s[i].equals(""))
    	   name=getJobcomf(s[i])+","+name;
       }
		return name;

	}

	public HashMap getITskillcomf() {// IT技能配置信息
		HashMap map = new HashMap();
		ComfManager itskillcomfDAO = ComfManager.getInstance();
		map = itskillcomfDAO.ITskillcomfList();
		return map;

	}

	public String getITskillcomf(int skilID) {// IT技能ID对应名称

		ComfManager certomf = ComfManager.getInstance();
		String name = ((ITskillcomfTO) certomf.findITskillByID(skilID))
				.getSkillame();
		return name;

	}

	public HashMap getSpecialitycomf() {// 专业配置信息
		HashMap map = new HashMap();
		ComfManager itskillcomfDAO = ComfManager.getInstance();
		map = itskillcomfDAO.specialitycomfList();
		return map;

	}

	public String getSpecialitycomf(String specialityIDs) {// 专业ID对应名称

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

	public HashMap getLanguage() {// 外语配置
		HashMap languages = new HashMap();

		languages.put(1, "英语");
		languages.put(2, "日语");
		languages.put(3, "法语");
		languages.put(4, "德语");
		languages.put(5, "俄语");
		languages.put(6, "西班牙");
		languages.put(7, "朝鲜语");
		languages.put(8, "阿拉伯");
		languages.put(9, "汉语");

		languages.put(10, "其他");
		languages.put(11, "无");
		return languages;
	}

	public String getDegree(int i) {// 学位配置
		HashMap languages = new HashMap();

		languages.put(1, "初中");
		languages.put(2, "中专");
		languages.put(3, "高中");
		languages.put(4, "大专");
		languages.put(5, "本科");
		languages.put(6, "硕士");
		languages.put(7, "博士");

		languages.put(0, "其他");

		return languages.get(i).toString();
	}

	public HashMap getWage() {// 预期薪水配置
		HashMap wages = new HashMap();
		wages.put(0, "面议");
		wages.put(1, "1000以下");
		wages.put(2, "1000～2000");
		wages.put(3, "2000～3000");
		wages.put(4, "3000～4000");
		wages.put(5, "4000～5000");
		wages.put(6, "5000～6000");
		wages.put(7, "6000～8000");
		wages.put(8, "8000～10000");
		wages.put(9, "12000~15000");

		wages.put(10, "15000~18000");
		wages.put(11, "18000~25000");
		wages.put(12, "25000以上");
		return wages;
	}

	public String getWage(int i) {
		HashMap wages = getWage();
		if(i<13){
		return wages.get(i).toString();}
		else
			return "面议";
	}

	public HashMap getMainCity() {// 主要城市配置
		HashMap city = new HashMap();

		city.put(1, "上海");
		city.put(2, "福州");
		city.put(3, "厦门");
		city.put(4, "深圳");
		city.put(5, "南京");
		city.put(6, "广东");
		city.put(7, "浙江");
		city.put(8, "泉州");
		city.put(9, "北京");

		return city;
	}

	public HashMap getProvince() {
		HashMap province = new HashMap();
		province.put("Beijing", "北京");
		province.put("Shanghai", "上海");
		province.put("Tianjin", "天津");
		province.put("Chongqing", "重庆");
		province.put("Anhui", "安徽");
		province.put("Fujian", "福建");
		province.put("Gansu", "甘肃");
		province.put("Hebei", "河北");
		province.put("Heilongjiang", "黑龙江");
		province.put("Guangdong", "广东");
		province.put("Guangxi", "广西");
		province.put("Guizhou", "贵州");
		province.put("Henan", "河南");
		province.put("Hubei", "湖北");
		province.put("Hunan", "湖南");
		province.put("Hainan", "海南");
		province.put("Jiangsu", "江苏");
		province.put("Jiangxi", "江西");
		province.put("Jilin", "吉林");
		province.put("Liaoning", "辽宁");
		province.put("Neimenggu", "内蒙古");
		province.put("Ningxia", "宁夏");
		province.put("Qinghai", "青海");
		province.put("Shandong", "山东");
		province.put("Shanxi", "山西");
		province.put("Shaanxi", "陕西");
		province.put("Sichuan", "四川");
		province.put("Xinjiang", "新疆");
		province.put("Xizang", "西藏");
		province.put("Yunnan", "云南");
		province.put("Zhejiang", "浙江");
		province.put("Hongkong", "香港");
		province.put("Macao", "澳门");
		province.put("Taiwan", "台湾");

		return province;

	}

	public String getProvince(String p) {
		HashMap province = new HashMap();
		province = getProvince();

		String buxiang = "不详";
		// String ps=province.get(p).toString();
		if (p == null || p == "")
			return buxiang;
		else
			return province.get(p).toString();

	}

	public HashMap getAllCtiy(){
		
		HashMap city = new HashMap();
		city.put(0, "北京市");
		city.put(1, "上海市");
		city.put(2, "天津市");
		city.put(3, "重庆市");
		city.put(4,"合肥市");
		city.put(5,"宿州市");
		city.put(6,"淮北市");
		city.put(7,"阜阳市");
		city.put(8,"蚌埠市");
		city.put(9,"淮南市");
		city.put(10,"滁州市");
		city.put(11,"马鞍山市");
		city.put(12,"芜湖市");
		city.put(13,"铜陵市");
		city.put(14,"安庆市");
		city.put(15,"黄山市");
		city.put(16,"六安市");
		city.put(17,"巢湖市");
		city.put(18,"池州市");
		city.put(19,"宣城市");
		city.put(20,"亳州市");
		city.put(21,"其它地区");

		city.put(22,"福州市");
		city.put(23,"南平市");
		city.put(24,"三明市");
		city.put(25,"莆田市");
		city.put(26,"泉州市");
		city.put(27,"厦门市");
		city.put(28,"漳州市");
		city.put(29,"龙岩市");
		city.put(30,"宁德市");
		city.put(31,"其它地区");
		
		city.put(32,"兰州市");
		city.put(33,"嘉峪关市");
		city.put(34,"金昌市");
		city.put(35,"白银市");
		city.put(36,"天水市");
		city.put(37,"酒泉市");
		city.put(38,"张掖市");
		city.put(39,"武威市");
		city.put(40,"庆阳市");
		city.put(41,"平凉市");
		city.put(42,"定西市");
		city.put(43,"陇南地区");
		city.put(44,"临夏回族自治州");
		city.put(45,"甘南藏族自治州");
		city.put(46,"玉门市");
		city.put(47,"敦煌市");
		city.put(48,"其它地区");

		city.put(49,"石家庄市");
		city.put(50,"张家口市");
		city.put(51,"承德市");
		city.put(52,"秦皇岛市");
		city.put(53,"唐山市");
		city.put(54,"廊坊市");
		city.put(55,"保定市");
		city.put(56,"沧州市");
		city.put(57,"衡水市");
		city.put(58,"邢台市");
		city.put(59,"邯郸市");
		city.put(60,"其它地区");
		
		city.put(61,"哈尔滨市");
		city.put(62,"齐齐哈尔市");
		city.put(63,"黑河市");
		city.put(64,"大庆市");
		city.put(65,"伊春市");
		city.put(66,"鹤岗市");
		city.put(67,"佳木斯市");
		city.put(68,"双鸭山市");
		city.put(69,"七台河市");
		city.put(70,"鸡西市");
		city.put(71,"牡丹江市");
		city.put(72,"绥化地区");
		city.put(73,"大兴安岭地区");
		city.put(74,"其它地区");

		city.put(75,"广州市");
		city.put(76,"清远市");
		city.put(77,"韶关市");
		city.put(78,"河源市");
		city.put(79,"梅州市");
		city.put(80,"潮州市");
		city.put(81,"汕头市");
		city.put(82,"揭阳市");
		city.put(83,"汕尾市");
		city.put(84,"惠州市");
		city.put(85,"东莞市");
		city.put(86,"深圳市");
		city.put(87,"珠海市");
		city.put(88,"中山市");
		city.put(89,"江门市");
		city.put(90,"佛山市");
		city.put(91,"肇庆市");
		city.put(92,"云浮市");
		city.put(93,"阳江市");
		city.put(94,"茂名市");
		city.put(95,"湛江市");
		city.put(96,"其它地区");

		city.put(97,"南宁市");
		city.put(98,"桂林市");
		city.put(99,"柳州市");
		city.put(100,"梧州市");
		city.put(101,"贵港市");
		city.put(102,"玉林市");
		city.put(103,"钦州市");
		city.put(104,"北海市");
		city.put(105,"防城港市");
		city.put(106,"百色市");
		city.put(107,"河池地区");
		city.put(108,"贺州地区");
		city.put(109,"崇左市");
		city.put(110,"凭祥市");
		city.put(111,"来宾市");
		city.put(112,"其它地区");

		city.put(113,"贵阳市");
		city.put(114,"六盘水市");
		city.put(115,"遵义市");
		city.put(116,"毕节地区");
		city.put(117,"铜仁地区");
		city.put(118,"安顺市");
		city.put(119,"黔东南苗族侗族自治州");
		city.put(120,"黔南布依族苗族自治州");
		city.put(121,"黔西南布依族苗族自治州");
		city.put(122,"其它地区");

		city.put(123,"郑州市");
		city.put(124,"三门峡市");
		city.put(125,"洛阳市");
		city.put(126,"焦作市");
		city.put(127,"新乡市");
		city.put(128,"鹤壁市");
		city.put(129,"安阳市");
		city.put(130,"濮阳市");
		city.put(131,"开封市");
		city.put(132,"商丘市");
		city.put(133,"许昌市");
		city.put(134,"漯河市");
		city.put(135,"平顶山市");
		city.put(136,"南阳市");
		city.put(137,"信阳市");
		city.put(138,"济源市");
		city.put(139,"周口市");
		city.put(140,"驻马店市");
		city.put(141,"其它地区");

		city.put(142,"武汉市");
		city.put(143,"十堰市");
		city.put(144,"襄樊市");
		city.put(145,"荆门市");
		city.put(146,"孝感市");
		city.put(147,"黄冈市");
		city.put(148,"鄂州市");
		city.put(149,"黄石市");
		city.put(150,"咸宁市");
		city.put(151,"荆州市");
		city.put(152,"宜昌市");
		city.put(153,"随州市");
		city.put(154,"仙桃市");
		city.put(155,"天门市");
		city.put(156,"潜江市");
		city.put(157,"神农架林区");
		city.put(158,"恩施土家族苗族自治州");
		city.put(159,"其它地区");

		city.put(160,"长沙市");
		city.put(161,"张家界市");
		city.put(162,"常德市");
		city.put(163,"益阳市");
		city.put(164,"岳阳市");
		city.put(165,"株洲市");
		city.put(166,"湘潭市");
		city.put(167,"衡阳市");
		city.put(168,"郴州市");
		city.put(169,"永州市");
		city.put(170,"邵阳市");
		city.put(171,"怀化市");
		city.put(172,"娄底市");
		city.put(173,"湘西土家族苗族自治州");
		city.put(174,"其它地区");

		city.put(175,"海口市");
		city.put(176,"三亚市");
		city.put(177,"琼山市");
		city.put(178,"文昌市");
		city.put(179,"琼海市");
		city.put(180,"万宁市");
		city.put(181,"东方市");
		city.put(182,"儋州市");
		city.put(183,"五指山市");
		city.put(184,"其它地区");

		city.put(185,"南京市");
		city.put(186,"徐州市");
		city.put(187,"连云港市");
		city.put(188,"宿迁市");
		city.put(189,"淮阴市");
		city.put(190,"盐城市");
		city.put(191,"扬州市");
		city.put(192,"泰州市");
		city.put(193,"南通市");
		city.put(194,"镇江市");
		city.put(195,"常州市");
		city.put(196,"无锡市");
		city.put(197,"苏州市");
		city.put(198,"淮安市");
		city.put(199,"其它地区");

		city.put(200,"南昌市");
		city.put(201,"九江市");
		city.put(202,"景德镇市");
		city.put(203,"鹰潭市");
		city.put(204,"新余市");
		city.put(205,"萍乡市");
		city.put(206,"赣州市");
		city.put(207,"上饶市");
		city.put(208,"抚州市");
		city.put(209,"宜春市");
		city.put(210,"吉安市");
		city.put(211,"其它地区");

		city.put(212,"长春市");
		city.put(213,"白城市");
		city.put(214,"松原市");
		city.put(215,"吉林市");
		city.put(216,"四平市");
		city.put(217,"辽源市");
		city.put(218,"通化市");
		city.put(219,"白山市");
		city.put(220,"延边朝鲜族自治州");
		city.put(221,"其它地区");

		city.put(222,"沈阳市");
		city.put(223,"朝阳市");
		city.put(224,"阜新市");
		city.put(225,"铁岭市");
		city.put(226,"抚顺市");
		city.put(227,"本溪市");
		city.put(228,"辽阳市");
		city.put(229,"鞍山市");
		city.put(230,"丹东市");
		city.put(231,"大连市");
		city.put(232,"营口市");
		city.put(233,"盘锦市");
		city.put(234,"锦州市");
		city.put(235,"葫芦岛市");
		city.put(236,"其它地区");

		city.put(237,"呼和浩特市");
		city.put(238,"包头市");
		city.put(239,"乌海市");
		city.put(240,"赤峰市");
		city.put(241,"呼伦贝尔");
		city.put(242,"兴安盟");
		city.put(243,"锡林郭勒盟");
		city.put(244,"乌兰察布市");
		city.put(245,"巴彦淖尔市");
		city.put(246,"阿拉善盟");
		city.put(247,"鄂尔多斯市");
		city.put(248,"通辽市");
		city.put(249,"其它地区");

		city.put(250,"银川市");
		city.put(251,"石嘴山市");
		city.put(252,"吴忠市");
		city.put(253,"固原市");
		city.put(254,"其它地区");

		city.put(255,"西宁市");
		city.put(256,"海东地区");
		city.put(257,"海北藏族自治州");
		city.put(258,"海南藏族自治州");
		city.put(259,"黄南藏族自治州");
		city.put(260,"果洛藏族自治州");
		city.put(261,"玉树藏族自治州");
		city.put(262,"海西蒙古族藏族自治州");
		city.put(263,"其它地区");

		city.put(264,"济南市");
		city.put(265,"聊城市");
		city.put(266,"德州市");
		city.put(267,"东营市");
		city.put(268,"淄博市");
		city.put(269,"潍坊市");
		city.put(270,"烟台市");
		city.put(271,"威海市");
		city.put(272,"青岛市");
		city.put(273,"日照市");
		city.put(274,"临沂市");
		city.put(275,"枣庄市");
		city.put(276,"济宁市");
		city.put(277,"泰安市");
		city.put(278,"莱芜市");
		city.put(279,"滨州市");
		city.put(280,"菏泽市");
		city.put(281,"其它地区");

		city.put(282,"太原市");
		city.put(283,"大同市");
		city.put(284,"朔州市");
		city.put(285,"阳泉市");
		city.put(286,"长治市");
		city.put(287,"晋城市");
		city.put(288,"忻州市");
		city.put(289,"吕梁市");
		city.put(290,"晋中市");
		city.put(291,"临汾市");
		city.put(292,"运城市");
		city.put(293,"其它地区");

		city.put(294,"西安市");
		city.put(295,"延安市");
		city.put(296,"铜川市");
		city.put(297,"渭南市");
		city.put(298,"咸阳市");
		city.put(299,"宝鸡市");
		city.put(300,"汉中市");
		city.put(301,"榆林市");
		city.put(302,"商洛市");
		city.put(303,"安康市");
		city.put(304,"其它地区");

		city.put(305,"成都市");
		city.put(306,"广元市");
		city.put(307,"绵阳市");
		city.put(308,"德阳市");
		city.put(309,"南充市");
		city.put(310,"广安市");
		city.put(311,"遂宁市");
		city.put(312,"内江市");
		city.put(313,"乐山市");
		city.put(314,"自贡市");
		city.put(315,"泸州市");
		city.put(316,"宜宾市");
		city.put(317,"攀枝花市");
		city.put(318,"巴中市");
		city.put(319,"达州市");
		city.put(320,"资阳市");
		city.put(321,"眉山市");
		city.put(322,"雅安市");
		city.put(323,"阿坝藏族羌族自治州");
		city.put(324,"甘孜藏族自治州");
		city.put(325,"凉山彝族自治州");
		city.put(326,"其它地区");

		city.put(327,"乌鲁木齐市");
		city.put(328,"克拉玛依市");
		city.put(329,"石河子市");
		city.put(330,"喀什地区");
		city.put(331,"阿克苏地区");
		city.put(332,"和田地区");
		city.put(333,"吐鲁番地区");
		city.put(334,"哈密地区");
		city.put(335,"克孜勒苏柯尔克孜自治州");
		city.put(336,"博尔塔拉蒙古自治州");
		city.put(337,"昌吉回族自治州");
		city.put(338,"巴音郭楞蒙古自治州");
		city.put(339,"伊犁哈萨克自治州");
		city.put(340,"其它地区");

		city.put(341,"拉萨市");
		city.put(342,"那曲地区");
		city.put(343,"昌都地区");
		city.put(344,"林芝地区");
		city.put(345,"山南地区");
		city.put(346,"日喀则地区");
		city.put(347,"阿里地区");
		city.put(348,"其它地区");

		city.put(349,"昆明市");
		city.put(350,"曲靖市");
		city.put(351,"玉溪市");
		city.put(352,"丽江市");
		city.put(353,"昭通市");
		city.put(354,"思茅市");
		city.put(355,"临沧地区");
		city.put(356,"保山市");
		city.put(357,"德宏傣族景颇族自治州");
		city.put(358,"怒江傈傈族自治州");
		city.put(359,"迪庆藏族自治州");
		city.put(360,"大理白族自治州");
		city.put(361,"楚雄彝族自治州");
		city.put(362,"红河哈尼族彝族自治州");
		city.put(363,"文山壮族苗族自治州");
		city.put(364,"西双版纳傣族自治州");
		city.put(365,"其它地区");

		city.put(366,"杭州市");
		city.put(367,"湖州市");
		city.put(368,"嘉兴市");
		city.put(369,"舟山市");
		city.put(370,"宁波市");
		city.put(371,"绍兴市");
		city.put(372,"金华市");
		city.put(373,"台州市");
		city.put(374,"温州市");
		city.put(375,"丽水市");
		city.put(376,"衢州市");
		city.put(377,"其它地区");

		city.put(378,"香港");
		city.put(379,"澳门");
		city.put(380,"台湾");
		
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
			return "无地址信息";
		
	}
	
	public HashMap getCity() {
		HashMap city = new HashMap();

		HashMap Beijing = new HashMap();
		Beijing.put(0, "北京市");
		city.put("Beijing", Beijing);

		HashMap Shanghai = new HashMap();
		Shanghai.put(1, "上海市");

		city.put("Shanghai", Shanghai);

		HashMap Tianjin = new HashMap();
		Tianjin.put(2, "天津市");

		city.put("Tianjin", Tianjin);

		HashMap Chongqing = new HashMap();
		Chongqing.put(3, "重庆市");

		city.put("Chongqing", Chongqing);

		HashMap Anhui = new HashMap();
		Anhui.put(4, "合肥市");
		Anhui.put(5, "宿州市");
		Anhui.put(6, "淮北市");
		Anhui.put(7, "阜阳市");
		Anhui.put(8, "蚌埠市");
		Anhui.put(9, "淮南市");
		Anhui.put(10, "滁州市");
		Anhui.put(11, "马鞍山市");
		Anhui.put(12, "芜湖市");
		Anhui.put(13, "铜陵市");
		Anhui.put(14, "安庆市");
		Anhui.put(15, "黄山市");
		Anhui.put(16, "六安市");
		Anhui.put(17, "巢湖市");
		Anhui.put(18, "池州市");
		Anhui.put(19, "宣城市");
		Anhui.put(20, "亳州市");
		Anhui.put(21, "其它地区");
		city.put("Anhui", Anhui);

		HashMap Fujian = new HashMap();
		Fujian.put(22, "福州市");
		Fujian.put(23, "南平市");
		Fujian.put(24, "三明市");
		Fujian.put(25, "莆田市");
		Fujian.put(26, "泉州市");
		Fujian.put(27, "厦门市");
		Fujian.put(28, "漳州市");
		Fujian.put(29, "龙岩市");
		Fujian.put(30, "宁德市");
		Fujian.put(31, "其它地区");
		;

		city.put("Fujian", Fujian);

		HashMap Gansu = new HashMap();
		Gansu.put(32, "兰州市");
		Gansu.put(33, "嘉峪关市");
		Gansu.put(34, "金昌市");
		Gansu.put(35, "白银市");
		Gansu.put(36, "天水市");
		Gansu.put(37, "酒泉市");
		Gansu.put(38, "张掖市");
		Gansu.put(39, "武威市");
		Gansu.put(40, "庆阳市");
		Gansu.put(41, "平凉市");
		Gansu.put(42, "定西市");
		Gansu.put(43, "陇南地区");
		Gansu.put(44, "临夏回族自治州");
		Gansu.put(45, "甘南藏族自治州");
		Gansu.put(46, "玉门市");
		Gansu.put(47, "敦煌市");
		Gansu.put(48, "其它地区");

		city.put("Gansu", Gansu);

		HashMap Hebei = new HashMap();
		Hebei.put(49, "石家庄市");
		Hebei.put(50, "张家口市");
		Hebei.put(51, "承德市");
		Hebei.put(52, "秦皇岛市");
		Hebei.put(53, "唐山市");
		Hebei.put(54, "廊坊市");
		Hebei.put(55, "保定市");
		Hebei.put(56, "沧州市");
		Hebei.put(57, "衡水市");
		Hebei.put(58, "邢台市");
		Hebei.put(59, "邯郸市");
		Hebei.put(60, "其它地区");

		city.put("Hebei", Hebei);

		HashMap Heilongjiang = new HashMap();
		Heilongjiang.put(61, "哈尔滨市");
		Heilongjiang.put(62, "齐齐哈尔市");
		Heilongjiang.put(63, "黑河市");
		Heilongjiang.put(64, "大庆市");
		Heilongjiang.put(65, "伊春市");
		Heilongjiang.put(66, "鹤岗市");
		Heilongjiang.put(67, "佳木斯市");
		Heilongjiang.put(68, "双鸭山市");
		Heilongjiang.put(69, "七台河市");
		Heilongjiang.put(70, "鸡西市");
		Heilongjiang.put(71, "牡丹江市");
		Heilongjiang.put(72, "绥化地区");
		Heilongjiang.put(73, "大兴安岭地区");
		Heilongjiang.put(74, "其它地区");

		city.put("Heilongjiang", Heilongjiang);

		HashMap Guangdong = new HashMap();
		Guangdong.put(75, "广州市");
		Guangdong.put(76, "清远市");
		Guangdong.put(77, "韶关市");
		Guangdong.put(78, "河源市");
		Guangdong.put(79, "梅州市");
		Guangdong.put(80, "潮州市");
		Guangdong.put(81, "汕头市");
		Guangdong.put(82, "揭阳市");
		Guangdong.put(83, "汕尾市");
		Guangdong.put(84, "惠州市");
		Guangdong.put(85, "东莞市");
		Guangdong.put(86, "深圳市");
		Guangdong.put(87, "珠海市");
		Guangdong.put(88, "中山市");
		Guangdong.put(89, "江门市");
		Guangdong.put(90, "佛山市");
		Guangdong.put(91, "肇庆市");
		Guangdong.put(92, "云浮市");
		Guangdong.put(93, "阳江市");
		Guangdong.put(94, "茂名市");
		Guangdong.put(95, "湛江市");
		Guangdong.put(96, "其它地区");

		city.put("Guangdong", Guangdong);

		HashMap Guangxi = new HashMap();
		Guangxi.put(97, "南宁市");
		Guangxi.put(98, "桂林市");
		Guangxi.put(99, "柳州市");
		Guangxi.put(100, "梧州市");
		Guangxi.put(101, "贵港市");
		Guangxi.put(102, "玉林市");
		Guangxi.put(103, "钦州市");
		Guangxi.put(104, "北海市");
		Guangxi.put(105, "防城港市");
		Guangxi.put(106, "百色市");
		Guangxi.put(107, "河池地区");
		Guangxi.put(108, "贺州地区");
		Guangxi.put(109, "崇左市");
		Guangxi.put(110, "凭祥市");
		Guangxi.put(111, "来宾市");
		Guangxi.put(112, "其它地区");

		city.put("Guangxi", Guangxi);

		HashMap Guizhou = new HashMap();

		Guizhou.put(113, "贵阳市");
		Guizhou.put(114, "六盘水市");
		Guizhou.put(115, "遵义市");
		Guizhou.put(116, "毕节地区");
		Guizhou.put(117, "铜仁地区");
		Guizhou.put(118, "安顺市");
		Guizhou.put(119, "黔东南苗族侗族自治州");
		Guizhou.put(120, "黔南布依族苗族自治州");
		Guizhou.put(121, "黔西南布依族苗族自治州");
		Guizhou.put(122, "其它地区");

		city.put("Guizhou", Guizhou);

		HashMap Henan = new HashMap();
		Henan.put(123, "郑州市");
		Henan.put(124, "三门峡市");
		Henan.put(125, "洛阳市");
		Henan.put(126, "焦作市");
		Henan.put(127, "新乡市");
		Henan.put(128, "鹤壁市");
		Henan.put(129, "安阳市");
		Henan.put(130, "濮阳市");
		Henan.put(131, "开封市");
		Henan.put(132, "商丘市");
		Henan.put(133, "许昌市");
		Henan.put(134, "漯河市");
		Henan.put(135, "平顶山市");
		Henan.put(136, "南阳市");
		Henan.put(137, "信阳市");
		Henan.put(138, "济源市");
		Henan.put(139, "周口市");
		Henan.put(140, "驻马店市");
		Henan.put(141, "其它地区");

		city.put("Henan", Henan);

		HashMap Hubei = new HashMap();
		Hubei.put(142, "武汉市");
		Hubei.put(143, "十堰市");
		Hubei.put(144, "襄樊市");
		Hubei.put(145, "荆门市");
		Hubei.put(146, "孝感市");
		Hubei.put(147, "黄冈市");
		Hubei.put(148, "鄂州市");
		Hubei.put(149, "黄石市");
		Hubei.put(150, "咸宁市");
		Hubei.put(151, "荆州市");
		Hubei.put(152, "宜昌市");
		Hubei.put(153, "随州市");
		Hubei.put(154, "仙桃市");
		Hubei.put(155, "天门市");
		Hubei.put(156, "潜江市");
		Hubei.put(157, "神农架林区");
		Hubei.put(158, "恩施土家族苗族自治州");
		Hubei.put(159, "其它地区");

		city.put("Hubei", Hubei);

		HashMap Hunan = new HashMap();
		Hunan.put(160, "长沙市");
		Hunan.put(161, "张家界市");
		Hunan.put(162, "常德市");
		Hunan.put(163, "益阳市");
		Hunan.put(164, "岳阳市");
		Hunan.put(165, "株洲市");
		Hunan.put(166, "湘潭市");
		Hunan.put(167, "衡阳市");
		Hunan.put(168, "郴州市");
		Hunan.put(169, "永州市");
		Hunan.put(170, "邵阳市");
		Hunan.put(171, "怀化市");
		Hunan.put(172, "娄底市");
		Hunan.put(173, "湘西土家族苗族自治州");
		Hunan.put(174, "其它地区");

		city.put("Hunan", Hunan);

		HashMap Hainan = new HashMap();
		Hainan.put(175, "海口市");
		Hainan.put(176, "三亚市");
		Hainan.put(177, "琼山市");
		Hainan.put(178, "文昌市");
		Hainan.put(179, "琼海市");
		Hainan.put(180, "万宁市");
		Hainan.put(181, "东方市");
		Hainan.put(182, "儋州市");
		Hainan.put(183, "五指山市");
		Hainan.put(184, "其它地区");

		city.put("Hainan", Hainan);

		HashMap Jiangsu = new HashMap();

		Jiangsu.put(185, "南京市");
		Jiangsu.put(186, "徐州市");
		Jiangsu.put(187, "连云港市");
		Jiangsu.put(188, "宿迁市");
		Jiangsu.put(189, "淮阴市");
		Jiangsu.put(190, "盐城市");
		Jiangsu.put(191, "扬州市");
		Jiangsu.put(192, "泰州市");
		Jiangsu.put(193, "南通市");
		Jiangsu.put(194, "镇江市");
		Jiangsu.put(195, "常州市");
		Jiangsu.put(196, "无锡市");
		Jiangsu.put(197, "苏州市");
		Jiangsu.put(198, "淮安市");
		Jiangsu.put(199, "其它地区");

		city.put("Jiangsu", Jiangsu);

		HashMap Jiangxi = new HashMap();
		Jiangxi.put(200, "南昌市");
		Jiangxi.put(201, "九江市");
		Jiangxi.put(202, "景德镇市");
		Jiangxi.put(203, "鹰潭市");
		Jiangxi.put(204, "新余市");
		Jiangxi.put(205, "萍乡市");
		Jiangxi.put(206, "赣州市");
		Jiangxi.put(207, "上饶市");
		Jiangxi.put(208, "抚州市");
		Jiangxi.put(209, "宜春市");
		Jiangxi.put(210, "吉安市");
		Jiangxi.put(211, "其它地区");

		city.put("Jiangxi", Jiangxi);

		HashMap Jilin = new HashMap();
		Jilin.put(212, "长春市");
		Jilin.put(213, "白城市");
		Jilin.put(214, "松原市");
		Jilin.put(215, "吉林市");
		Jilin.put(216, "四平市");
		Jilin.put(217, "辽源市");
		Jilin.put(218, "通化市");
		Jilin.put(219, "白山市");
		Jilin.put(220, "延边朝鲜族自治州");
		Jilin.put(221, "其它地区");

		city.put("Jilin", Jilin);

		HashMap Liaoning = new HashMap();

		Liaoning.put(222, "沈阳市");
		Liaoning.put(223, "朝阳市");
		Liaoning.put(224, "阜新市");
		Liaoning.put(225, "铁岭市");
		Liaoning.put(226, "抚顺市");
		Liaoning.put(227, "本溪市");
		Liaoning.put(228, "辽阳市");
		Liaoning.put(229, "鞍山市");
		Liaoning.put(230, "丹东市");
		Liaoning.put(231, "大连市");
		Liaoning.put(232, "营口市");
		Liaoning.put(233, "盘锦市");
		Liaoning.put(234, "锦州市");
		Liaoning.put(235, "葫芦岛市");
		Liaoning.put(236, "其它地区");

		city.put("Liaoning", Liaoning);

		HashMap Neimenggu = new HashMap();

		Neimenggu.put(237, "呼和浩特市");
		Neimenggu.put(238, "包头市");
		Neimenggu.put(239, "乌海市");
		Neimenggu.put(240, "赤峰市");
		Neimenggu.put(241, "呼伦贝尔");
		Neimenggu.put(242, "兴安盟");
		Neimenggu.put(243, "锡林郭勒盟");
		Neimenggu.put(244, "乌兰察布市");
		Neimenggu.put(245, "巴彦淖尔市");
		Neimenggu.put(246, "阿拉善盟");
		Neimenggu.put(247, "鄂尔多斯市");
		Neimenggu.put(248, "通辽市");
		Neimenggu.put(249, "其它地区");

		city.put("Neimenggu", Neimenggu);

		HashMap Ningxia = new HashMap();

		Ningxia.put(250, "银川市");
		Ningxia.put(251, "石嘴山市");
		Ningxia.put(252, "吴忠市");
		Ningxia.put(253, "固原市");
		Ningxia.put(254, "其它地区");

		city.put("Ningxia", Ningxia);

		HashMap Qinghai = new HashMap();

		Qinghai.put(255, "西宁市");
		Qinghai.put(256, "海东地区");
		Qinghai.put(257, "海北藏族自治州");
		Qinghai.put(258, "海南藏族自治州");
		Qinghai.put(259, "黄南藏族自治州");
		Qinghai.put(260, "果洛藏族自治州");
		Qinghai.put(261, "玉树藏族自治州");
		Qinghai.put(262, "海西蒙古族藏族自治州");
		Qinghai.put(263, "其它地区");

		city.put("Qinghai", Qinghai);

		HashMap Shandong = new HashMap();

		Shandong.put(264, "济南市");
		Shandong.put(265, "聊城市");
		Shandong.put(266, "德州市");
		Shandong.put(267, "东营市");
		Shandong.put(268, "淄博市");
		Shandong.put(269, "潍坊市");
		Shandong.put(270, "烟台市");
		Shandong.put(271, "威海市");
		Shandong.put(272, "青岛市");
		Shandong.put(273, "日照市");
		Shandong.put(274, "临沂市");
		Shandong.put(275, "枣庄市");
		Shandong.put(276, "济宁市");
		Shandong.put(277, "泰安市");
		Shandong.put(278, "莱芜市");
		Shandong.put(279, "滨州市");
		Shandong.put(280, "菏泽市");
		Shandong.put(281, "其它地区");

		city.put("Shandong", Shandong);

		HashMap Shanxi = new HashMap();

		Shanxi.put(282, "太原市");
		Shanxi.put(283, "大同市");
		Shanxi.put(284, "朔州市");
		Shanxi.put(285, "阳泉市");
		Shanxi.put(286, "长治市");
		Shanxi.put(287, "晋城市");
		Shanxi.put(288, "忻州市");
		Shanxi.put(289, "吕梁市");
		Shanxi.put(290, "晋中市");
		Shanxi.put(291, "临汾市");
		Shanxi.put(292, "运城市");
		Shanxi.put(293, "其它地区");

		city.put("Shanxi", Shanxi);

		HashMap Shaanxi = new HashMap();

		Shaanxi.put(294, "西安市");
		Shaanxi.put(295, "延安市");
		Shaanxi.put(296, "铜川市");
		Shaanxi.put(297, "渭南市");
		Shaanxi.put(298, "咸阳市");
		Shaanxi.put(299, "宝鸡市");
		Shaanxi.put(300, "汉中市");
		Shaanxi.put(301, "榆林市");
		Shaanxi.put(302, "商洛市");
		Shaanxi.put(303, "安康市");
		Shaanxi.put(304, "其它地区");

		city.put("Shaanxi", Shaanxi);

		HashMap Sichuan = new HashMap();

		Sichuan.put(305, "成都市");
		Sichuan.put(306, "广元市");
		Sichuan.put(307, "绵阳市");
		Sichuan.put(308, "德阳市");
		Sichuan.put(309, "南充市");
		Sichuan.put(310, "广安市");
		Sichuan.put(311, "遂宁市");
		Sichuan.put(312, "内江市");
		Sichuan.put(313, "乐山市");
		Sichuan.put(314, "自贡市");
		Sichuan.put(315, "泸州市");
		Sichuan.put(316, "宜宾市");
		Sichuan.put(317, "攀枝花市");
		Sichuan.put(318, "巴中市");
		Sichuan.put(319, "达州市");
		Sichuan.put(320, "资阳市");
		Sichuan.put(321, "眉山市");
		Sichuan.put(322, "雅安市");
		Sichuan.put(323, "阿坝藏族羌族自治州");
		Sichuan.put(324, "甘孜藏族自治州");
		Sichuan.put(325, "凉山彝族自治州");
		Sichuan.put(326, "其它地区");

		city.put("Sichuan", Sichuan);

		HashMap Xinjiang = new HashMap();

		Xinjiang.put(327, "乌鲁木齐市");
		Xinjiang.put(328, "克拉玛依市");
		Xinjiang.put(329, "石河子市");
		Xinjiang.put(330, "喀什地区");
		Xinjiang.put(331, "阿克苏地区");
		Xinjiang.put(332, "和田地区");
		Xinjiang.put(333, "吐鲁番地区");
		Xinjiang.put(334, "哈密地区");
		Xinjiang.put(335, "克孜勒苏柯尔克孜自治州");
		Xinjiang.put(336, "博尔塔拉蒙古自治州");
		Xinjiang.put(337, "昌吉回族自治州");
		Xinjiang.put(338, "巴音郭楞蒙古自治州");
		Xinjiang.put(339, "伊犁哈萨克自治州");
		Xinjiang.put(340, "其它地区");

		city.put("Xinjiang", Xinjiang);

		HashMap Xizang = new HashMap();

		Xizang.put(341, "拉萨市");
		Xizang.put(342, "那曲地区");
		Xizang.put(343, "昌都地区");
		Xizang.put(344, "林芝地区");
		Xizang.put(345, "山南地区");
		Xizang.put(346, "日喀则地区");
		Xizang.put(347, "阿里地区");
		Xizang.put(348, "其它地区");

		city.put("Xizang", Xizang);

		HashMap Yunnan = new HashMap();

		Yunnan.put(349, "昆明市");
		Yunnan.put(350, "曲靖市");
		Yunnan.put(351, "玉溪市");
		Yunnan.put(352, "丽江市");
		Yunnan.put(353, "昭通市");
		Yunnan.put(354, "思茅市");
		Yunnan.put(355, "临沧地区");
		Yunnan.put(356, "保山市");
		Yunnan.put(357, "德宏傣族景颇族自治州");
		Yunnan.put(358, "怒江傈傈族自治州");
		Yunnan.put(359, "迪庆藏族自治州");
		Yunnan.put(360, "大理白族自治州");
		Yunnan.put(361, "楚雄彝族自治州");
		Yunnan.put(362, "红河哈尼族彝族自治州");
		Yunnan.put(363, "文山壮族苗族自治州");
		Yunnan.put(364, "西双版纳傣族自治州");
		Yunnan.put(365, "其它地区");

		city.put("Yunnan", Yunnan);

		HashMap Zhejiang = new HashMap();

		Zhejiang.put(366, "杭州市");
		Zhejiang.put(367, "湖州市");
		Zhejiang.put(368, "嘉兴市");
		Zhejiang.put(369, "舟山市");
		Zhejiang.put(370, "宁波市");
		Zhejiang.put(371, "绍兴市");
		Zhejiang.put(372, "金华市");
		Zhejiang.put(373, "台州市");
		Zhejiang.put(374, "温州市");
		Zhejiang.put(375, "丽水市");
		Zhejiang.put(376, "衢州市");
		Zhejiang.put(377, "其它地区");

		city.put("Zhejiang", Zhejiang);

		HashMap Hongkong = new HashMap();
		Hongkong.put(378, "香港");

		city.put("Hongkong", Hongkong);

		HashMap Macao = new HashMap();
		Macao.put(379, "澳门");

		city.put("Macao", Macao);

		HashMap Taiwan = new HashMap();
		Taiwan.put(380, "台湾");
		city.put("Taiwan", Taiwan);
		return city;
	}

	public String getCity(String p, String cs) {

		HashMap city = new HashMap();

		city = getCity();

		String buxiang = "不详";
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

		// String[] Guizhou = new String[] { "0", "贵阳市", "1", "六盘水市", "2",
		// "遵义市",
		// "3", "毕节地区", "4", "铜仁地区", "5", "安顺市", "6", "黔东南苗族侗族自治州", "7",
		// "黔南布依族苗族自治州", "8", "黔西南布依族苗族自治州", "9", "其它地区" };
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
