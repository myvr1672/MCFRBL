<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<style>
.errorMessage {
	background-color:#FFCCCC;
	border:1px solid #CC0000;
	width:500px;
	margin-bottom:8px;
}
</style>
<meta charset="ISO-8859-1">
<title>Change Password</title>
</head>
<body>
<s:actionerror/>
<s:form action="changePwd"  validate="true">
<pre>
<b>Old Password:             </b><input type="password" name="oldpwd"/><br>
<b>New Password:             </b><input type="password" name="newpwd" /><br>
<b>Repeat your new Password: </b><input type="password" name="newpwd_again"/><br>
<s:submit  key="label.changepassword" align="center" />
</pre>
</s:form>
</body>
</html>