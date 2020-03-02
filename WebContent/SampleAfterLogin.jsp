<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix="s" uri="/struts-tags"%>    
<%@ page import="model.User" %>
<%@page import= "org.hibernate.Session" %>
<%@page import= "javax.servlet.http.HttpSession" %>
<%@page import= "org.apache.struts2.ServletActionContext" %>
<%@page import= "org.apache.struts2.dispatcher.SessionMap" %>
<%@page import= "hibernateConnect.HibernateConfig" %>

<style>
ul#menu-v, #menu-v ul
{
    width:160px; /* Main Menu width */
    border:1px solid #CCCCCC;
    list-style:none; margin:0; padding:0;
    text-align: center;
     z-index:9; 
}     

#menu-v li
{
    margin:0;padding:0;
    position:relative;    
    background-color:#ADAD84; /*fallback color*/
	background-color:rgba(153,153,102,0.8);
    transition:background 0.5s;
}
#menu-v li:hover
{
    background-color:rgba(153,0,204,0.5);
}

#menu-v a
{
    font:normal 12px Arial;
    border-top:1px solid #CCCCCC;
    display:block;
    color:#444444;
    text-decoration:none;
    line-height:25px;
    padding-left:22px; 
    position:relative;           
}

#menu-v li:first-child a
{
    border-top:0;
}

#menu-v a.arrow::after{
    content:'';
    position:absolute;
    display:inline;
    top:50%;
    margin-top:-4px;
    right:8px;
    border-width:4px;
    border-style:solid;
    border-color:transparent transparent transparent white;
    transition:border-color 0.5s;  
}
                
#menu-v li a.arrow:hover::after
{
    border-color:transparent transparent transparent red;
    
}
        
/*Sub level menu items
---------------------------------------*/
#menu-v li ul
{
    min-width:50px; /* Sub level menu min width */
    position:absolute;
    width:100px;
    display:none;
    left:100%;
    top:0;
}

#menu-v li:hover > ul
{
    display:block;
}
</style>
</head>
<body>
<%
User loginUser = null;
Session session1 = null; 
//private SessionMap<String, Object> sessionMap;
HttpSession session_http = ServletActionContext.getRequest().getSession(true);

String username = (String) session_http.getAttribute("userid");
session1 = HibernateConfig.getSession();
loginUser = (User)session1.get(User.class,username.trim());
String usertype=loginUser.getUserType();
String roles=loginUser.getRoles();

%>
<ul id="menu-v">
<% if(usertype.equals("All")) 
{%>
 <li><s:a href="user-form">Add User</s:a></li> 
 <li><s:a href="abnormality-form">Add Abnormality</s:a></li>
<%--   <li><s:a href="annual-target">Add Annual Coach Target</s:a></li> --%>
  <li><s:a href="annual-target-shop">Add Annual Shop Target</s:a></li>
  <li><s:a href="annual-target-RSP">Add Annual RSP Target</s:a></li>
  <li><s:a href="annual-target-monthly">Set Monthly Target</s:a></li>
   <li><s:a href="add-coach-production">Add Coach Production</s:a></li>
 <li><s:a href="add-shop-production">Add Shop Production</s:a></li>
  <li><s:a href="add-Asset-gateout">Add Asset TurnOut/RSP</s:a></li>
   <li><s:a href="update_workshop_holidays">Add Holiday</s:a></li>
   <li><s:a href="define_new_holidays">Define Holiday Type</s:a></li>
   <li>
 
<%-- <li><s:a href="working_days">Working Days</s:a></li>    --%>
<li><s:a href="dash_board_coach" target= "_blank">MCF DashBoard</s:a></li>
<li>
<a href="#" class="arrow">Shop DashBoard</a>
<ul>
<li><a href="dashboard-shop?shop=Wheel&stage=wheel03" target= "_blank">Wheel</a></li>
<li><s:a href="dashboard-shop?shop=Bogie&stage=bogie08" target= "_blank">Bogie</s:a></li>
<li><s:a href="dashboard-shop?shop=Shell&stage=shell10" target= "_blank">Shell</s:a></li>
<li><s:a href="dashboard-shop?shop=Paint&stage=paint02" target= "_blank">Paint</s:a></li>
<li><s:a href="dashboard-shop?shop=Furnishing&stage=furn10" target= "_blank">Furnishing</s:a></li>
<li><s:a href="dashboard-shop?shop=Finishing&stage=fin07" target= "_blank">Finishing</s:a></li>

</ul>
</li> 
    <li><s:a href="working_days_year">Working Days By Year</s:a></li>
    <li><s:a href="working_days_financial_year">Working Days By Financial Year</s:a></li>
    <li><s:a href="reset-password">Reset Password</s:a></li>
  <li><s:a href="change-password">Change Password</s:a></li>
  <li><s:a href="logout">Logout</s:a></li>
  
  
  <%}
if(usertype.equals("System Admin"))
{
%>
<li><s:a href="user-form">Add User</s:a></li>
<li><s:a href="update_workshop_holidays">Add Holiday</s:a></li>
<li><s:a href="annual-target-shop">Add Annual Shop Target</s:a></li>
<li><s:a href="annual-target-monthly">Set Monthly Target</s:a></li>
<li><s:a href="add-Asset-gateout">Add Asset TurnOut/RSP</s:a></li>
<li><s:a href="dash_board_coach" target= "_blank">MCF DashBoard</s:a></li>
<li>
<a href="#" class="arrow">Shop DashBoard</a>
<ul>
<li><a href="dashboard-shop?shop=Wheel&stage=wheel03" target= "_blank">Wheel</a></li>
<li><s:a href="dashboard-shop?shop=Bogie&stage=bogie08" target= "_blank">Bogie</s:a></li>
<li><s:a href="dashboard-shop?shop=Shell&stage=shell10" target= "_blank">Shell</s:a></li>
<li><s:a href="dashboard-shop?shop=Paint&stage=paint02" target= "_blank">Paint</s:a></li>
<li><s:a href="dashboard-shop?shop=Furnishing&stage=furn10" target= "_blank">Furnishing</s:a></li>
<li><s:a href="dashboard-shop?shop=Finishing&stage=fin07" target= "_blank">Finishing</s:a></li>

</ul>
</li>
 <li><s:a href="reset-password">Reset Password</s:a></li>
<li><s:a href="change-password">Change Password</s:a></li>
<li><s:a href="logout">Logout</s:a></li>
<%}
if(usertype.equals("DEO"))
{%>
<li><s:a href="abnormality-form">Add Abnormality</s:a></li>

<li><s:a href="dash_board_coach" target= "_blank">MCF DashBoard</s:a></li>
<li>
<a href="#" class="arrow">Shop DashBoard</a>
<ul>
<li><a href="dashboard-shop?shop=Wheel&stage=wheel03" target= "_blank">Wheel</a></li>
<li><s:a href="dashboard-shop?shop=Bogie&stage=bogie08" target= "_blank">Bogie</s:a></li>
<li><s:a href="dashboard-shop?shop=Shell&stage=shell10" target= "_blank">Shell</s:a></li>
<li><s:a href="dashboard-shop?shop=Paint&stage=paint02" target= "_blank">Paint</s:a></li>
<li><s:a href="dashboard-shop?shop=Furnishing&stage=furn10" target= "_blank">Furnishing</s:a></li>
<li><s:a href="dashboard-shop?shop=Finishing&stage=fin07" target= "_blank">Finishing</s:a></li>

</ul>
</li>
<li><s:a href="add-coach-production">Add Coach Production</s:a></li>
<li><s:a href="add-shop-production">Add Shop Production</s:a></li> 
<li><s:a href="working_days_year">Working Days By Year</s:a></li>
<li><s:a href="working_days_financial_year">Working Days By Financial Year</s:a></li>
	
<%if(roles.contains("Wheel")||roles.contains("All")) 

{
	
%>

<li>
<a href="#" class="arrow">Wheel Shop</a>
<ul>
<li><s:a href="wheel-shop-production?stageId=1">Wheel Shop</s:a></li>
<%  } %>
</ul>
</li>
<% 
if(roles.contains("Bogie")|| roles.contains("All")) 
{
	
%>
<li><a href="#" class="arrow">Bogie Shop</a>
	<ul>	
<li><s:a href="wheel-receipt-at-bogie">Receipt Wheel</s:a></li>     
<li><s:a href="wheel-available-at-bogie">Available Wheel at Bogie Shop</s:a></li>
<li><s:a href="bogie-shop-production?stageId=2">Bogie Shop Production</s:a></li>
<%} %>
</ul>
</li>

<!--  uncomment it -->

 <%  
 if(roles.contains("Shell")|| roles.contains("All")) 
{ 
 %>
 <li><a href="#" class="arrow">Shell Shop</a>
	<ul> 
<li><s:a href="shell-shop-production?stageId=3">Shell Shop</s:a></li> 
 </ul> 
 </li>  
<%}  
if(roles.contains("Paint")|| roles.contains("All")) 
 { 
 %> 
 <li><a href="#" class="arrow">Paint Shop</a> 
<ul>
<li><s:a href="shell-receipt-at-paint">Receipt Shell at Paint Shop</s:a></li>      
<li><s:a href="shell-available-at-paint">Available Shell at Paint Shop</s:a></li> 
<li><s:a href="paint-shop-production?stageId=4">Paint Shop</s:a></li> 
 </ul> 
 </li>
<% } 
 if(roles.contains("Furnishing")|| roles.contains("All"))  
{ 
%> 
<li><a href="#" class="arrow">Furnishing Shop</a> 
<ul> 
 <li><s:a href="bogie-receipt-at-furnishing">Receipt Bogie</s:a></li>  
 <li><s:a href="shell-receipt-at-furnishing">Receipt Shell</s:a></li> 
 <li><s:a href="bogie-available-at-furnishing">Available Bogie</s:a></li>
 <li><s:a href="shell-available-at-furnishing?stageId=5">Available Shell</s:a></li>
 <li><s:a href="furnishing-shop-production?stageId=5">Furnishing Shop Production</s:a></li>
</ul> 
 </li> 
<%  } 
if(roles.contains("Finishing")|| roles.contains("All"))  
{ 
%> 
<li><a href="#" class="arrow">Finishing Shop</a> 
<ul> 
 <li><s:a href="furnishing-receipt-at-finishing">Receipt Semi-finished Coach</s:a></li>  
 <li><s:a href="coach-available-at-finishing?stageId=6">Available Semi-finished Coach</s:a></li>
 <li><s:a href="finishing-shop-production?stageId=6">Finishing Shop Production</s:a></li>
</ul> 
 </li> 
<%  } 
if(roles.contains("CoachTurnout")|| roles.contains("All"))  
{ 
%> 
<li><a href="#" class="arrow">Coach Turn-out</a> 
<ul> 
 <li><s:a href="coach-receipt-for-turnout">Receipt Coach</s:a></li>  
 <li><s:a href="coach-available-for-turnout">Rack Formation</s:a></li>
 <li><s:a href="coach-dispatch-railway">Rack Dispatch</s:a></li>
  <li><s:a href="coach-sent-railway">Coach Sent by MCF</s:a></li>
</ul> 
 </li> 
<%  } %> 
<!--  uncomment it -->

<!-- not in use -->
<!-- <li><a href="sheet-cutting?stageId=3">Shell Shop</a></li> -->
<%-- <li><s:a href="sheet-cutting?stageId=1">Wheel Shop Sample</s:a></li> --%>
<%-- <li><s:a href="sheet-cutting?stageId=2">Bogie Shop</s:a></li> --%>
<%-- <li><s:a href="sheet-cutting?stageId=4">Paint Shop</s:a></li> --%>
<%-- <li><s:a href="Shell-Assembly-Mearging?stageId=5">Furnishing Shop</s:a></li> --%>
<%-- <li><s:a href="sheet-cutting?stageId=shell05">End Wall Fabrication</s:a></li> --%>
<%-- <li><s:a href="Shell-Assembly-Mearging?stageId=shell06">Manual Shell Assembly</s:a></li> --%>
<%-- <li><s:a href="">SIS Shell Assembly</s:a></li> --%>
<%-- <li><s:a href="">Skin Tensioning</s:a></li> --%>
<%-- <li><s:a href="">Final Stages</s:a></li> --%>

<!--end of not in use -->
 

<li><s:a href="change-password">Change Password</s:a></li>
 <li><s:a href="logout">Logout</s:a></li>

<% 
}  


if(usertype.equals("Management"))
{
%>
<%-- <li><s:a href="update_workshop_holidays">Add Holiday</s:a></li> --%>
<li><s:a href="dash_board_coach" target= "_blank">MCF DashBoard</s:a></li>
<li>
<a href="#" class="arrow">Shop DashBoard</a>
<ul>
<li><a href="dashboard-shop?shop=Wheel&stage=wheel03" target= "_blank">Wheel</a></li>
<li><s:a href="dashboard-shop?shop=Bogie&stage=bogie08" target= "_blank">Bogie</s:a></li>
<li><s:a href="dashboard-shop?shop=Shell&stage=shell10" target= "_blank">Shell</s:a></li>
<li><s:a href="dashboard-shop?shop=Paint&stage=paint02" target= "_blank">Paint</s:a></li>
<li><s:a href="dashboard-shop?shop=Furnishing&stage=furn10" target= "_blank">Furnishing</s:a></li>
<li><s:a href="dashboard-shop?shop=Finishing&stage=fin07" target= "_blank">Finishing</s:a></li>

</ul>
</li>
<li><s:a href="working_days_year">Working Days By Year</s:a></li>
<li><s:a href="working_days_financial_year">Working Days By Financial Year</s:a></li>
<li><s:a href="change-password">Change Password</s:a></li>
<li><s:a href="logout">Logout</s:a></li>
<%} %>
    </ul>

