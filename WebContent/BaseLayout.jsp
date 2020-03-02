<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
 table { 
  width: 100%; 
/*   height:100%; */
 } 
 #page-container
 {
 position: relative;
 min-height: 100vh;
 }
 #content-wrap
 {
 padding-bottom: 2.5rem;
 }
 footer
 {
 position: absolute;
 bottom: 0;
 width:100%;
 height: 2.5rem;
 }
select 
 {
 color:black  !important;
 }
 #main-body
 {
 width:90%;
 position: relative;
 top:5%;
 }
 #chat-body
 {
 width:10%;
 position: relative;
 top:5%;
 }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
</head>
<body>

<!-- <table> -->
<!-- 	<tr> -->
<%-- 		<td height="20%" colspan="2" align="center"><tiles:insertAttribute name="header" /> --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- 	<tr> -->
<%-- 		<td valign="middle" height="75%" width="10%"><tiles:insertAttribute name="menu" /></td> --%>
<%-- 		<td valign="top" height="75%" width="90%" ><tiles:insertAttribute name="body"/></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<%-- 		<td height="5%" width="100%" colspan="2" valign="bottom"><tiles:insertAttribute name="footer" /></td> --%>
<!-- 	</tr> -->
<!-- </table> -->
<div id="page-container">
<div id="content-wrap">
<div><tiles:insertAttribute name="header" /></div>
<div><tiles:insertAttribute name="menu" /></div>

<div id="main-body"><tiles:insertAttribute name="body"/></div>
</div>

<footer><tiles:insertAttribute name="footer" /> </footer>
</div>
</body>
</html>