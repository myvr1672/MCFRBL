<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Page </title>
<% String contextpath=request.getContextPath();%> 
<style type="text/css">
html, body {
    height: auto;
}

html {
    display: table;
    margin: auto;
}

body {
    display: table-cell;
/*     vertical-align: middle; */
  text-align:left; 
    position: relative;
    left: 0px;
    top: 50px;
    border: 1px solid #f3AD21;
    
     
  background-color:#efefef;
  }
  table{
  background-color: #4de9e2;
  width: 100%;
  height:50%;
  top: 10px;
  border-collapse:separate;
  }
  
  th, td {
    height: 15px;
}  

</style>
</head>

<body>
<table>
<tr>
<td><img src="<%=contextpath %>/images/cris_logo.jpg?OpenImageResource" width="85" height="80"></td>
<td><h3>Modern Coach Factory, Raebareli</h3><h6 align="center">Production Monitoring System</h6></td>
<td><img src="<%=contextpath %>/images/mcf_logo.jpg?OpenImageResource" width="85" height="80"></td>
</tr>
</table>
<br>

<p><b>Enter your Credentials:</b></p>
<s:actionerror/>
<s:form action="login"  namespace="/">
<table>
   
	<tr><td> <s:textfield name="username" key="label.username" size="20" /></td></tr>
	
	<tr><td> <s:password name="password" key="label.password" size="20" /></td></tr>
	
	<tr><td> <s:submit method="execute" key="label.login" align="center" /></td></tr>
	
</table>
</s:form>
</body>
</html>