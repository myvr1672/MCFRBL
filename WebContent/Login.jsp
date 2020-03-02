<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Login page</title>
		<% String contextpath=request.getContextPath();%> 
		<style>
			body{
				margin:0;
				padding:0;
				font-family:sans-serif;
				background:url(images/mcf.jpg);
				background-size:cover;
			}
			.loginbox{
				width:20%;
				height:35%;
				background:rgba(0,0,0,0.8);
				color:#fff;
				top:50%;
				left:80%;
				position:absolute;
				transform:translate(-50%,-50%);
				box-sizing:border-box;
				padding:70px 30px;
				border-radius:20px;
			}
			.mcflogo{
				width:150px;
				height:150px;
				border-radius:50%;
				position:absolute;
				top:-80px;
				left:calc(50% - 70px);
			}
			h1{
				margin-bottom:5px;
				text-align:center;
				font-size:20px;
			}
			.loginbox p{
				margin:0;
				margin-bottom:5px;
				padding:0;
				font-weight:bold;
			}
			.loginbox input{
				width:100%;
				margin-bottom:20px;
			}
			.loginbox input[type="text"], input[type="password"]{
				border:none;
				outline:none;
				border-bottom:1px solid #fff;
				background:transparent;
				color:white;
				height:20px;
			}
			.loginbox input[type="submit"]{
				border:none;
				outline:none;
				height:40px;
				background:#fb2525;
				color:#fff;
				font-size:18px;
				border-radius:20px;
			}
			.loginbox input[type="submit"]:hover{
				cursor:pointer;
				background:white;      /* #ffc107 */
				color:#000;
			}
			.errorMessage {
    border:1px solid white;
    width:95%;
    font-weight: bold;
    color:red;
    margin-bottom:1px;
}
		</style>
	</head>
	<body>
		<div class="loginbox">
			<img src="<%=contextpath %>/images/mcf_logo.jpg?OpenImageResource" class="mcflogo">
			<h1>Modern Coach Factory, Raebareli</h1>
			<h1>Login Here</h1>
			<p class="errorMessage"><s:actionerror/></p>
			<s:form action="login">
<!-- 				<p>Username</p> -->
				<s:textfield name="username" placeholder="Enter Username"  key="label.username"/>
<!-- 				<p>Password</p> -->
				<s:password name="password" placeholder="Enter Password" key="label.password"/>
				<s:submit method="execute" key="label.login" align="center" value="Login"/>
			</s:form>
			
		</div>
	</body>
</html>