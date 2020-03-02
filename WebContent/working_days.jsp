 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  

  <%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Welcome</title>
</head>

<body>




<TABLE>
<tr><th colspan="13"> Working Days in the year of .....</th></tr>
<tr><th>MONTH</th><th>JANUARY</th><th>FEBRUARY</th><th>MARCH</th><th>APRIL</th>
<th>MAY</th><th>JUNE</th><th>JULY</th><th>AUGUST</th>
<th>SEPTEMBER</th><th>OCTOBER</th><th>NOVEMBER</th><th>DECEMBER</th>
<tr><th>Total Working Days</th><th><s:property value="totalWorkingDaysJan" /></th> 
	<th><s:property value="totalWorkingDaysFeb" /></th> 
	<th><s:property value="totalWorkingDaysMar" /></th> 
	<th><s:property value="totalWorkingDaysApr" /></th> 
	<th><s:property value="totalWorkingDaysMay" /></th> 
	<th><s:property value="totalWorkingDaysJun" /></th> 
	<th><s:property value="totalWorkingDaysJul" /></th> 
	<th><s:property value="totalWorkingDaysAug" /></th> 
	<th><s:property value="totalWorkingDaysSep" /></th> 
	<th><s:property value="totalWorkingDaysOct" /></th> 
	<th><s:property value="totalWorkingDaysNov" /></th> 
	<th><s:property value="totalWorkingDaysDec" /></th> 
	</tr>
	<tr><th>Current working Day</th><th colspan="12"><s:property value="currentWorkingDays" /></th> 
	
	</tr>
	<br>
	<h2>Current working Day: <s:property value="currentWorkingDays" /></h2>
	</TABLE> 
</body>
</html>