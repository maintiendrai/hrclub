//**************************************************************** 
// You are free to copy this script as long as you  
// keep this copyright notice: 
// Author: Jiang Feng(jiangf@ffcs.fujitsu.co.jp)
// Date: 2002-09-06
// company: ffcs
//**************************************************************** 
function UserFormat(strInputType)
{
	var strUserType='';
	
	if(strInputType == "0") 
      strUserType = "ϵͳ����Ա"; 
    else if(strInputType == "1") 
      strUserType = "���Ź���Ա"; 
    else 
      strUserType = "*"+strInputType; 
    document.write(strUserType);
}
function SourceFormat(strInputType)
{
	var strSource='';
	if(strInputType == "0") 
      strSource = "�¹�"; 
    else if(strInputType == "1") 
      strSource = "�޷�"; 
    else if(strInputType == "2") 
     strSource = "���"; 
    else 
      strDepartType = "*"+strInputType; 
    document.write(strSource);
}

function StatusFormat(strInputType)
{
	var strStatus='';
	if(strInputType == "1") 
      strStatus = "�����δ��λ"; 
    else if(strInputType == "2") 
      strStatus = "����ⶨλ"; 
    else 
      strStatus = "*"+strInputType; 
    document.write(strStatus);
}
function CheckinStatusFormat(strInputType)
{
	var strStatus='';
	if(strInputType == "0") 
      strStatus = "�ѵǼ�δ���"; 
    else if(strInputType == "1") 
      strStatus = "����ȡδ���"; 
    else if(strInputType == "2") 
      strStatus = "�����"; 
    else 
      strStatus = "*"+strInputType; 
    document.write(strStatus);
}


function DepartFormat(strInputType)
{
	var strDepartType='';
	
	if(strInputType == "1") 
      strDepartType = "һ������"; 
    else if(strInputType == "2") 
      strDepartType = "��������"; 
    else if(strInputType == "3") 
     strDepartType = "��������"; 
    else 
      strDepartType = "*"+strInputType; 
    document.write(strDepartType);
}
function CategoryFormat(strInputType)
{
	var strDepartType='';
	
	if(strInputType == "1") 
      strCategoryType = "һ��"; 
    else if(strInputType == "2") 
      strCategoryType = "����"; 
    else if(strInputType == "3") 
     strCategoryType = "����"; 
    else 
      strCategoryType = "*"+strInputType; 
    document.write(strCategoryType);
}
function ResultFormat(strInputType)
{
	var strResultStatus='';
	
	if(strInputType == "0") 
      strResultStatus = "ʧ��"; 
    else if(strInputType == "1") 
      strResultStatus = "�ɹ�"; 
    else
      strResultStatus = "*"+strInputType; 
    document.write(strResultStatus);
}
function ApplyFormat(strInputType)
{
	var strApplyStatus='';
	
	if(strInputType == "0") 
      strApplyStatus = "����"; 
    else if(strInputType == "1") 
      strApplyStatus = "����"; 
    else if(strInputType == "2") 
      strApplyStatus = "ȱ��"; 
    else if(strInputType == "3") 
      strApplyStatus = "���"; 
    else if(strInputType == "4") 
      strApplyStatus = "������ͨ��"; 
    else
      strApplyStatus = "*"+strInputType; 
    document.write(strApplyStatus);
}

function ApplyTypeFormat(strInputType)
{
	var strApplyType='';
	
	if(strInputType == "0") 
      strApplyType = "����"; 
    else if(strInputType == "1") 
      strApplyType = "��ͨ"; 
    else
      strApplyType = "*"+strInputType; 
    document.write(strApplyType);
}


function MFTypeFormat(strInputType)
{
	var strMalfunctionType='';
	
	if(strInputType == "0") 
      strMalfunctionType = "����"; 
    else if(strInputType == "1") 
      strMalfunctionType = "����"; 
    else
      strMalfunctionType = "*"+strInputType; 
    document.write(strMalfunctionType);
}
function MFStatusFormat(strInputType)
{
	var strMalfunctionStatus='';
	
	if(strInputType == "0") 
      strMalfunctionStatus = "������"; 
    else if(strInputType == "1") 
      strMalfunctionStatus = "������"; 
	else if(strInputType == "2") 
      strMalfunctionStatus = "����δ���";
    else if(strInputType == "3") 
      strMalfunctionStatus = "�����"; 
	else if(strInputType == "4") 
      strMalfunctionStatus = "�µǼ�"; 
	else if(strInputType == "5") 
      strMalfunctionStatus = "�ѱ���"; 
	else if(strInputType == "6") 
      strMalfunctionStatus = "������"; 
    else
      strMalfunctionStatus = "*"+strInputType; 
    document.write(strMalfunctionStatus);
}


