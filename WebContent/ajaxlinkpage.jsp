<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<% String dd=request.getParameter("date");
System.out.println(dd);
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
var tdt=$( "#tdt" ).val();
//alert($( "#tdt" ).val());
</script>
</head>
<body>
<p> This is linked page</p>
<input type="text" value=<%=dd %>>
</body>
</html>

