<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>
<% String contextpath=request.getContextPath();%>

<script src="<%=contextpath %>/js/jquery-1.8.2.js" type="text/javascript"></script>

<script>
$(document).ready(function() {
	
	$( "#tdt" ).change(function(){
		
		var tdt1=$( "#tdt" ).val();
		var url="<%=contextpath %>/ajaxlinkpage.jsp?date=";
		url= url+tdt1;
	 $( "#new-projects" ).load(url);
	});
	
});
</script>

</head>
<body>
<p> Enter value in number for each day</p>



   Select Date:&nbsp;&nbsp;  
        <input type="date" name="date"
               value="" id="tdt" />
   
<br><br>

<p>(Only number values are allowed)</p>
<div id="new-projects"></div>
</body>
</html>