/*******************************************************************************
*********** Copyright (C) TopSpeed Information and Technology Co., Ltd *****************
'***********					提供格式化Javasript脚本支持			******************'
'***********                                                                            ******************'
'***********                    Coded by Grand v3.00                    ******************'
'*******************************************************************************
*/
var MONTH_NAMES = new Array('January ','February ','March ','April ','May ',
                            'June ','July ','August ','September ','October ',
                            'November ','December ','Jan ','Feb ','Mar ',
                            'Apr ','May ','Jun ','Jul ','Aug ','Sep ','Oct ',
                            'Nov ','Dec');
var DAY_NAMES = new Array('Sunday ','Monday ','Tuesday ','Wednesday ','Thursday ','Friday ','Saturday ',
                          'Sun ','Mon ','Tue ','Wed ','Thu ','Fri ','Sat');


function LZ(x) 
{
  return (x < 0 || x > 9 ? "" : "0") + x
}

function isInteger(val) {
  var digits = "1234567890";
  for (var i = 0; i < val.length; i++) {
    if (digits.indexOf(val.charAt(i)) == -1) {
      return false;
    }
  }
  return true;
}

function _getInt(str, i, minlength, maxlength) {
  for (var x = maxlength; x >= minlength; x--) {
    var token = str.substring(i, i + x);
    if (token.length < minlength) {
      return null;
    }
    if (isInteger(token)) {
      return token;
    }
  }
  return null;
}

/*
	注意本函数只支持特定格式
	2005-10-1 21:03:18
*/
function parseDate(val) 
{
  var odate = new Array();
  var year;
  var month;
  var day=1;
  var hh=0;
  var mm=0;
  var ss=0;
  val = val + "";
  val = val.replace(/ /g , "-");
  val = val.replace(/T/g , "-");
  val = val.replace(/:/g , "-");
  val = val.replace(/\//g , "-");
  odate = val.split("-");
  switch(odate.length)
  {
	case 1:
		year = parseInt(odate[0],10);
		break;
	case 2:
		year = parseInt(odate[0],10);
		month = parseInt(odate[1],10);
		break;
	case 3:
		year = parseInt(odate[0],10);
		month = parseInt(odate[1],10);
		day = parseInt(odate[2],10);
		break;
	case 4:
		year = parseInt(odate[0],10);
		month = parseInt(odate[1],10);
		day = parseInt(odate[2],10);
		hh = parseInt(odate[3],10);
		break;
	case 5:
		year = parseInt(odate[0],10);
		month = parseInt(odate[1],10);
		day = parseInt(odate[2],10);
		hh = parseInt(odate[3],10);
		mm = parseInt(odate[4],10);
		break;
	case 6:
		year = parseInt(odate[0],10);
		month = parseInt(odate[1],10);
		day = parseInt(odate[2],10);
		hh = parseInt(odate[3],10);
		mm = parseInt(odate[4],10);
		ss = parseInt(odate[5],10);
		break;
	default:
		return now;
  }
  return new Date(year,month-1,day,hh,mm,ss);
}

function formatDate(sdate,format) 
{
  if (sdate=="") return "";
  if(vbIsDate(sdate)!=true)
  {throw new Error(0,"数据不为日期型")};
  var date = parseDate(sdate);
  format = format + "";
  var result = "";
  var i_format = 0;
  var c = "";
  var token = "";
  var y = date.getYear() + "";
  var M = date.getMonth() + 1;
  var d = date.getDate();
  var E = date.getDay();
  var H = date.getHours();
  var m = date.getMinutes();
  var s = date.getSeconds();
  var yyyy, yy, MMM, MM, dd, hh, h, mm, ss, ampm, HH, H, KK, K, kk, k;
  var value = new Object();
  
  if (y.length < 4) {
    y = "" + (y - 0 + 1900);
  }
  value["y"] = "" + y;
  value["yyyy"] = y;
  value["yy"] = y.substring(2, 4);
  value["M"] = M;
  value["MM"] = LZ(M);
  value["MMM"] = MONTH_NAMES[M - 1];
  value["NNN"] = MONTH_NAMES[M + 11];
  value["d"] = d;
  value["dd"] = LZ(d);
  value["E"] = DAY_NAMES[E + 7];
  value["EE"] = DAY_NAMES[E];
  value["H"] = H;
  value["HH"] = LZ(H);
  
  if (H == 0) {
    value["h"] = 12;
  }
  else if (H > 12) {
    value["h"] = H - 12;
  }
  else {
    value["h"] = H;
  }
  
  value["hh"] = LZ(value["h"]);
  if (H > 11) {
    value["K"] = H - 12;
  }
  else {
    value["K"] = H;
  }
  
  value["k"] = H + 1;
  value["KK"] = LZ(value["K"]);
  value["kk"] = LZ(value["k"]);
  if (H > 11) {
    value["a"] = "PM";
  }
  else {
    value["a"] = "AM";
  }
  
  value["m"] = m;
  value["mm"] = LZ(m);
  value["s"] = s;
  value["ss"] = LZ(s);
  
  while (i_format < format.length) {
    c = format.charAt(i_format);
    token = "";
    while ( (format.charAt(i_format) == c) && (i_format < format.length)) {
      token += format.charAt(i_format++);
    }
    if (value[token] != null) {
      result = result + value[token];
    }
    else {
      result = result + token;
    }
  }
  return result;
}
function formatNumber(iNum,iNumDigitsAfterDecimal,bGroupDigits)
{
	var i = 0;
	var j = 0;
	var sNum;
	var sIntParts;
	var sDecimalParts;
	
	if (iNum==null) return "";
	sNum = iNum.toString();
	if (isFloat(sNum)==false) return "";
	
	if (iNumDigitsAfterDecimal<=0)
	{
		sNum = Math.ceil(iNum).toString();
		iNumDigitsAfterDecimal = 0;
	}
	else
	{
		var iNumDigitsAfterDecimalStartIndex = sNum.indexOf(".");
		if (iNumDigitsAfterDecimalStartIndex<0)
		{
			sNum += ".";
			for (i=0;i<iNumDigitsAfterDecimal;i++)
			{
				sNum += "0";
			}
		}
		else
		{
			var iNumDigitsAfterDecimalLength = sNum.length - iNumDigitsAfterDecimalStartIndex - 1;
			var iMinus = iNumDigitsAfterDecimal - iNumDigitsAfterDecimalLength;
			if (iMinus>0)
			{
				for (i=0;i<iMinus;i++)
				{
					sNum += "0";
				}
			}
			else
			{
				sNum = sNum.substr(0,sNum.length+iMinus);
			}
		}
		
	}
	
	var sReturnValue = "";
	if (bGroupDigits==true)
	{
		if (iNumDigitsAfterDecimal<=0)
		{
			sIntParts = sNum;
			sDecimalParts = "";
		}
		else
		{
			sIntParts = sNum.substr(0,sNum.indexOf("."));
			sDecimalParts = sNum.substr(sNum.indexOf(".")+1);
		}
		for (i=sIntParts.length-1;i>=0;i--)
		{
			j++;
			if (j==3 && i!=0)
			{
				if (i==1)
				{
					if (sIntParts.charAt(0)!="-" && sIntParts.charAt(0)!="+")
					{
						sReturnValue = "," + sIntParts.charAt(i) + sReturnValue;
						j=0;
					}
					else
						sReturnValue = sNum.charAt(i) + sReturnValue;
				}
				else
				{
					sReturnValue = "," + sIntParts.charAt(i) + sReturnValue;
					j=0;
				}
			}
			else
			{
				sReturnValue = sNum.charAt(i) + sReturnValue;
			}
		}
		sReturnValue += "." + sDecimalParts;
	}
	else
	{
		sReturnValue = sNum;
	}
	return sReturnValue;
}

function formatSql(sSql)
{
	//对strSql中的" "进行整理
	//首先去除Sql语句中的多余空格
	var strSql = "";
	strSql = sSql.toUpperCase();
	while(strSql!=strSql.replace(/"  "/," "))
	{strSql = strSql.replace(/"  "/," ");}
	
	//把SELECT变为SELECT TOP 100 PERCENT
	//先把SELECT TOP和SELECT DISTINCT TOP保护起来
	strSql = strSql.replace(/SELECT TOP/, "#S_T#")
	strSql = strSql.replace(/SELECT DISTINCT TOP/, "#S_D_T#")

	strSql = strSql.replace(/SELECT DISTINCT/, "#S_D#")
	strSql = strSql.replace(/#S_D#/, "#S_D# TOP 1000000")
	strSql = strSql.replace(/SELECT /, "SELECT TOP 1000000 ")
	strSql = strSql.replace(/#S_D#/, "SELECT DISTINCT")

	//还原SELECT TOP和DISTINCT TOP
	strSql = strSql.replace(/#S_T#/, "SELECT TOP")
	strSql = strSql.replace(/#S_D_T#/, "SELECT DISTINCT TOP")
	return strSql
}
function formatHTMLCode(sCode)
{
	sCode = sCode.replace(/</ ,"&lt;");
	sCode = sCode.replace(/>/ ,"&gt;");
	sCode = sCode.replace(/&/ ,"&amp;");
	sCode = sCode.replace(/"/ ,"&quot;");
	sCode = sCode.replace(/©/ ,"&copy;");
	sCode = sCode.replace(/®/ ,"&reg;");
	sCode = sCode.replace(/™/ ,"™");
	sCode = sCode.replace(/×/ ,"&times;");
	sCode = sCode.replace(/÷/ ,"&divide;");
	return sCode
}