<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
			<%@ page import="java.sql.*" %>
			<%@ page import="java.text.*" %>
			 <%@ page import="dao.*" %>
			  <%@page import="javax.servlet.http.HttpSession" %>
			<%@page import= "org.apache.struts2.ServletActionContext" %>
<%@page import= "org.apache.struts2.dispatcher.SessionMap" %>
			 <% String contextpath=request.getContextPath();%>
			
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <title>Chat Application</title>
    <link href="<%=contextpath %>/css/ChatStyle.css" rel="stylesheet">
 
 <script src="<%=contextpath %>/js/jquery-2.1.4.min.js" type="text/javascript"></script>
 <script src="<%=contextpath %>/js/ChatScript.js" type="text/javascript"></script>
</head>
<body>
<div id="chat-sidebar">
<%
HttpSession session_http = ServletActionContext.getRequest().getSession(true);

String Id = (String) session_http.getAttribute("userid");
DbConnection db=new DbConnection();
Connection con=db.getConnection();
String userId=""; String userName="";
try {
	Statement St=con.createStatement();
	String sql_query="select A.user_id, B.name from public.login_user A, public.user_master B where A.user_id = B.user_id";
	ResultSet rs=St.executeQuery(sql_query);
			
			while(rs.next())
			{
				int i=0;
				int cls=100+i;
				userId=rs.getString(1);
				userName=rs.getString(2);
				
				
				if(!userId.equals(Id))
				{
					
				%>
<div id="sidebar-user-box" class="<%=userId%>" >
<img src="<%=contextpath %>/images/user.png" />
<span id="slider-username"><%=userName%> </span>

</div> 
				
	<% 	}
			i++;
			
}
}

 catch(Exception e)
{
  out.println("Exception  "+e.toString());
}
%>
</div>

</body>
</html>