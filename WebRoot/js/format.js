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
      strUserType = "系统管理员"; 
    else if(strInputType == "1") 
      strUserType = "部门管理员"; 
    else 
      strUserType = "*"+strInputType; 
    document.write(strUserType);
}
function SourceFormat(strInputType)
{
	var strSource='';
	if(strInputType == "0") 
      strSource = "新购"; 
    else if(strInputType == "1") 
      strSource = "修返"; 
    else if(strInputType == "2") 
     strSource = "拆旧"; 
    else 
      strDepartType = "*"+strInputType; 
    document.write(strSource);
}

function StatusFormat(strInputType)
{
	var strStatus='';
	if(strInputType == "1") 
      strStatus = "已入库未定位"; 
    else if(strInputType == "2") 
      strStatus = "已入库定位"; 
    else 
      strStatus = "*"+strInputType; 
    document.write(strStatus);
}
function CheckinStatusFormat(strInputType)
{
	var strStatus='';
	if(strInputType == "0") 
      strStatus = "已登记未入库"; 
    else if(strInputType == "1") 
      strStatus = "已领取未入库"; 
    else if(strInputType == "2") 
      strStatus = "已入库"; 
    else 
      strStatus = "*"+strInputType; 
    document.write(strStatus);
}


function DepartFormat(strInputType)
{
	var strDepartType='';
	
	if(strInputType == "1") 
      strDepartType = "一级部门"; 
    else if(strInputType == "2") 
      strDepartType = "二级部门"; 
    else if(strInputType == "3") 
     strDepartType = "三级部门"; 
    else 
      strDepartType = "*"+strInputType; 
    document.write(strDepartType);
}
function CategoryFormat(strInputType)
{
	var strDepartType='';
	
	if(strInputType == "1") 
      strCategoryType = "一级"; 
    else if(strInputType == "2") 
      strCategoryType = "二级"; 
    else if(strInputType == "3") 
     strCategoryType = "三级"; 
    else 
      strCategoryType = "*"+strInputType; 
    document.write(strCategoryType);
}
function ResultFormat(strInputType)
{
	var strResultStatus='';
	
	if(strInputType == "0") 
      strResultStatus = "失败"; 
    else if(strInputType == "1") 
      strResultStatus = "成功"; 
    else
      strResultStatus = "*"+strInputType; 
    document.write(strResultStatus);
}
function ApplyFormat(strInputType)
{
	var strApplyStatus='';
	
	if(strInputType == "0") 
      strApplyStatus = "待批"; 
    else if(strInputType == "1") 
      strApplyStatus = "已批"; 
    else if(strInputType == "2") 
      strApplyStatus = "缺货"; 
    else if(strInputType == "3") 
      strApplyStatus = "完成"; 
    else if(strInputType == "4") 
      strApplyStatus = "审批不通过"; 
    else
      strApplyStatus = "*"+strInputType; 
    document.write(strApplyStatus);
}

function ApplyTypeFormat(strInputType)
{
	var strApplyType='';
	
	if(strInputType == "0") 
      strApplyType = "急需"; 
    else if(strInputType == "1") 
      strApplyType = "普通"; 
    else
      strApplyType = "*"+strInputType; 
    document.write(strApplyType);
}


function MFTypeFormat(strInputType)
{
	var strMalfunctionType='';
	
	if(strInputType == "0") 
      strMalfunctionType = "送修"; 
    else if(strInputType == "1") 
      strMalfunctionType = "报废"; 
    else
      strMalfunctionType = "*"+strInputType; 
    document.write(strMalfunctionType);
}
function MFStatusFormat(strInputType)
{
	var strMalfunctionStatus='';
	
	if(strInputType == "0") 
      strMalfunctionStatus = "待送修"; 
    else if(strInputType == "1") 
      strMalfunctionStatus = "已送修"; 
	else if(strInputType == "2") 
      strMalfunctionStatus = "已修未入库";
    else if(strInputType == "3") 
      strMalfunctionStatus = "已入库"; 
	else if(strInputType == "4") 
      strMalfunctionStatus = "新登记"; 
	else if(strInputType == "5") 
      strMalfunctionStatus = "已报废"; 
	else if(strInputType == "6") 
      strMalfunctionStatus = "侍审批"; 
    else
      strMalfunctionStatus = "*"+strInputType; 
    document.write(strMalfunctionStatus);
}


