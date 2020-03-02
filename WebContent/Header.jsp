<!DOCTYPE style PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<% String contextpath=request.getContextPath();%>
<%@ page import="hibernateConnect.HibernateConfig" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="model.User" %>
<%@ page import="java.util.Map" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="com.opensymphony.xwork2.ActionSupport" %>
<%@ page import="org.apache.struts2.ServletActionContext" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="org.apache.struts2.interceptor.SessionAware" %>
<head>
<style>
.table_class
{
border: 0px solid black;
    padding: 0px;
    background: url(images/raebareli_building.jpg);
    background-repeat: no-repeat;
    background-size: 80% 120%;
    background-position: center; 
    width:100%;
    }
  .heading_h1  {
    text-shadow: 3px 2px green;
    text-align: center;
    text-decoration: blink;
}

.heading_h3  {
    text-shadow: 3px 2px #DA70D6;
    text-align: center;
    text-decoration: blink;
}
.alignment-center
{
text-align: center;
}

</style>
<script src="<%=contextpath %>/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script type="text/javascript"><%-- 
$(document).ready(function()
		{
		    $(window).bind("beforeunload", function(event) { 
		       var x= confirm("Do you really want to close?") ; 
		       if(x==true)
			       {
		    	   window.location="<%=request.getContextPath()%>"+"/logout";
		    	   return true;
		    	 
			       }
		       else{
		    	   event.preventDefault();
		    	   event.stopImmediatePropagation();
		    	   return false;
			       
		       }
		    });
	
		}); --%>
</script>
</head>
<body>
<%
User loginUser = null;
Session session_hibernate = null;
String username= null;
String roles= null;
String name=null;
HttpSession session_http = ServletActionContext.getRequest().getSession(true);
username = (String) session_http.getAttribute("userid");

if (username != null)
{
session_hibernate = HibernateConfig.getSession();
loginUser = (User)session_hibernate.get(User.class,username.trim());
name=loginUser.getUserName();
roles= loginUser.getRoles();
}
%>
<table class="table_class">
<tr>
<td width="10%"><img src="<%=contextpath %>/images/cris_logo.jpg?OpenImageResource" width="80%" height="80%"></td>
<td width="80%"><h1 class="heading_h1">Modern Coach Factory, Raebareli</h1><h3 class="heading_h3">Production Monitoring System</h3>
<p><span style="float:left">Welcome <b><%=name%>,</b> you are authorized for <%=roles%> Shop</span><span  style="float:right"><a href="home-page"><img src='images/home_icon.png' alt="home"/></a></span></p>
</td>

<td class="alignment-center" width="10%"><img src="<%=contextpath %>/images/mcf_logo.jpg?OpenImageResource" width="80%" height="80%"></td></tr>

</table>
</body>
</html>
