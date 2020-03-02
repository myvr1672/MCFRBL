<html>
<%@ page import="java.util.Calendar" %>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<% String contextpath=request.getContextPath();%>
<script src="<%=contextpath %>/js/jquery-1.8.2.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
	
	$( "#fyr" ).change(function(){
		
		var financialYear=$("#fyr").val();
		var url="<%=contextpath %>/CreateAnnualTarget.jsp?financialYear=";
		url= url+financialYear;
		
	 $( "#new-pages" ).load(url);
	});
	
});
</script>
</head>
<body>
<p> Please select Financial Year to set Yearly Target...</p>
<select name="financialYear"  id="fyr">
<%
Calendar cal = Calendar.getInstance();
int year= cal.get(Calendar.YEAR);
%>
  <option value="" selected>Select</option>
  
  <option value="<%=year-3%>-<%=year-2%>"><%=year-3%>-<%=year-2%></option>
  <option value="<%=year-2%>-<%=year-1%>"><%=year-2%>-<%=year-1%></option>
  <option value="<%=year-1%>-<%=year%>"><%=year-1%>-<%=year%></option>
  <option value="<%=year%>-<%=year+1%>"><%=year%>-<%=year+1%></option>
  <option value="<%=year+1%>-<%=year+2%>"><%=year+1%>-<%=year+2%></option>
 
 
</select>
	<br><br>
<div id="new-pages"></div>
</body>
</html>