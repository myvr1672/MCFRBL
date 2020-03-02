<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix="s" uri="/struts-tags"%>    
<%@ page import="model.User" %>
<%@page import= "org.hibernate.Session" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import= "org.apache.struts2.ServletActionContext" %>
<%@page import= "org.apache.struts2.dispatcher.SessionMap" %>
<%@page import= "hibernateConnect.HibernateConfig" %>
<% String contextpath=request.getContextPath();%>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=contextpath %>/css/font-awesome.min.css" rel="stylesheet"  type="text/css" />

<link href="<%=contextpath %>/css/bootstrap.min.css" rel="stylesheet"  type="text/css" />
<script src="<%=contextpath %>/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/bootstrap.min.js" type="text/javascript"></script>

<style>
body {font-family: Arial, Helvetica, sans-serif;}

.navbar {
/*   width: 150%; */
  background-color: #5680e9;
  margin-bottom:1;
      min-height:1vh;
      height:4rem;
}

.navbar a {
  float: left;
/*   padding: 12px; */
  color: black;
  text-decoration: none;
  font-size: 17px;
   min-height:1vh;
      height:4rem;
 
}

.navbar a:hover {
color:#111177;
  background-color: #111177;
/*    height:5%; */
}

.active {
  background-color: #4CAF50;
}

@media screen and (max-width: 500px) {
  .navbar a {
    float: none;
    display: block;
  }
}
.dropdown-submenu{
position:relative;
}
.dropdown-submenu .dropdown-menu{
position:absolute;
top:0;
left:100%;
margin-top:-1px;

}
</style>
<script>
$(document).ready(function(){
  $('.dropdown-submenu a.test').on("click", function(e){
    $(this).next('ul').toggle();
    e.stopPropagation();
    e.preventDefault();
  });
});
</script>
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


<nav class="navbar ">
<div class="container-fluid">
 <ul class="nav navbar-nav">
<% if(usertype.equals("All")) 
{%>

 <li class="dropdown">
 	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Add
 	<span class="glyphicon glyphicon-plus"></span></a>
        <ul class="dropdown-menu" id="#">
        	<li><s:a href="abnormality-form">Abnormality</s:a></li>
  			<li><s:a href="annual-target">Annual Coach Target</s:a></li>
  			<li><s:a href="annual-target-shop">Annual Shop Target</s:a></li>
  			<li><s:a href="annual-target-RSP">Annual RSP Target</s:a></li>
   			<li><s:a href="add-coach-production">Coach Production</s:a></li>
 			<li><s:a href="add-shop-production">Shop Production</s:a></li>
  			<li><s:a href="add-Asset-gateout">Asset TurnOut/RSP</s:a></li>
   			<li><s:a href="update_workshop_holidays">Holiday</s:a></li>
        </ul>
</li>
<li class="dropdown">
 	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Dashboard
 	<span class="glyphicon glyphicon-dashboard"></span></a>
        <ul class="dropdown-menu" id="#">
        	<li><s:a href="dash_board_coach" target= "_blank">Coach</s:a></li>
        	<li><a href="dashboard-shop?shop=Wheel&stage=wheel03" target= "_blank">Wheel</a></li>
			<li><s:a href="dashboard-shop?shop=Bogie&stage=bogie08" target= "_blank">Bogie</s:a></li>
			<li><s:a href="dashboard-shop?shop=Shell&stage=shell10" target= "_blank">Shell</s:a></li>
			<li><s:a href="dashboard-shop?shop=Paint&stage=paint02" target= "_blank">Paint</s:a></li>
			<li><s:a href="dashboard-shop?shop=Furnishing&stage=furn10" target= "_blank">Furnishing</s:a></li>
			<li><s:a href="dashboard-shop?shop=Finishing&stage=fin07" target= "_blank">Finishing</s:a></li>
			<li><s:a href="layout-shop" target= "_self">Shop Progress</s:a></li>
			<li><s:a href="layout-shop-trial" target= "_self">Shop Progress New</s:a></li>
			<li><s:a href="layout-shop-all" target= "_self">Coach Progress Details</s:a></li>
			<li><a href="dashboard-component?bogie_prod_id=BOGIE01" target= "_blank">Bogie Component</a></li>
		</ul>
</li>
<li class="dropdown">
 	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Working Days
 	<span class="glyphicon glyphicon-calendar"></span></a>
        <ul class="dropdown-menu" id="#">
 			<li><s:a href="working_days_year">By Year</s:a></li>
    		<li><s:a href="working_days_financial_year">By Financial Year</s:a></li>
    	</ul>
</li>
 
 <li><s:a href="define_new_holidays">Define Holiday Type</s:a></li>
<%--  <li><s:a href="coach-master">Coach Master</s:a></li> --%>
<%--  <li><s:a href="asset-master">Asset Master</s:a></li> --%>

 
  <%}
if(usertype.equals("System Admin"))
{
%>

 <li class="dropdown">
 	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Add
 	<span class="glyphicon glyphicon-plus"></span></a>
        <ul class="dropdown-menu" id="#">
        <li><s:a href="abnormality-form">Abnormality</s:a></li>
  			<li><s:a href="annual-target">Annual Coach Target</s:a></li>
  			<li><s:a href="annual-target-shop">Annual Shop Target</s:a></li>
  			<li><s:a href="annual-target-RSP">Annual RSP Target</s:a></li>
   			<li><s:a href="add-coach-production">Coach Production</s:a></li>
 			<li><s:a href="add-shop-production">Shop Production</s:a></li>
  			<li><s:a href="add-Asset-gateout">Asset TurnOut/RSP</s:a></li>
   			<li><s:a href="update_workshop_holidays">Holiday</s:a></li>
   			<li><s:a href="asset-master">Asset Master</s:a></li>
   			<li><s:a href="asset-master-fin">Asset Master Finance</s:a></li>
   			<li><s:a href="annual-target-monthly">Set Monthly Target</s:a></li>
       	</ul>
 </li>
 <li class="dropdown">
 	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Dashboard
 	<span class="glyphicon glyphicon-dashboard"></span></a>
        <ul class="dropdown-menu" id="#">
        	<li><s:a href="dash_board_coach" target= "_blank">Coach</s:a></li>
        	<li><a href="dashboard-shop?shop=Wheel&stage=wheel03" target= "_blank">Wheel</a></li>
			<li><s:a href="dashboard-shop?shop=Bogie&stage=bogie08" target= "_blank">Bogie</s:a></li>
			<li><s:a href="dashboard-shop?shop=Shell&stage=shell10" target= "_blank">Shell</s:a></li>
			<li><s:a href="dashboard-shop?shop=Paint&stage=paint02" target= "_blank">Paint</s:a></li>
			<li><s:a href="dashboard-shop?shop=Furnishing&stage=furn10" target= "_blank">Furnishing</s:a></li>
			<li><s:a href="dashboard-shop?shop=Finishing&stage=fin07" target= "_blank">Finishing</s:a></li>
			<li><s:a href="layout-shop" target= "_self">Shop Progress</s:a></li>
			<li><s:a href="layout-shop-trial" target= "_self">Shop Progress New</s:a></li>
			<li><s:a href="layout-shop-all" target= "_self">Coach Progress Details</s:a></li>
			<li><a href="dashboard-component?bogie_prod_id=BOGIE01" target= "_blank">Bogie Component</a></li>
		</ul>
</li>
<li class="dropdown">
<a class="dropdown-toggle"   data-toggle="dropdown">Production Module<span class="glyphicon glyphicon-object-align-bottom" ></span></a>
 	 <ul class="dropdown-menu">
     
      <li class="dropdown-submenu">
        <a class="test" tabindex="-1" href="#">Wheel Shop <span class="glyphicon glyphicon-shopping-cart"></span></a>
        <ul class="dropdown-menu">
          <li><a href="wheel-shop-production?stageId=1">Wheel Shop Production</a></li>
          <li><a href="wheel-dispatch-production">Wheel Dispatch List</a></li>
          
        </ul>
      </li>

<li class="dropdown-submenu">
	<a class="test" tabindex="-1" href="#">Bogie Shop
	<span class="glyphicon glyphicon-shopping-cart"></span></a>
	<ul class="dropdown-menu">	
		<li><s:a href="wheel-receipt-at-bogie">Receipt Wheel</s:a></li>     
		<li><s:a href="wheel-available-at-bogie">Available Wheel at Bogie Shop</s:a></li>
		<li><s:a href="bogie-shop-production?stageId=2">Bogie Shop Production</s:a></li>
		<li><a href="bogie-dispatch-production">Bogie Dispatch List</a></li>
	</ul>
</li>

<li class="dropdown-submenu">
	<a class="test" tabindex="-1" href="#">Shell Shop
	<span class="glyphicon glyphicon-shopping-cart"></span></a>
		<ul class="dropdown-menu" >
			<li><s:a href="shell-shop-production?stageId=3">Shell Shop Production</s:a></li> 
			<li><a href="shell-dispatch-production">Shell Dispatch List</a></li>
		</ul>
</li>   

<li class="dropdown-submenu">
	<a class="test" tabindex="-1" href="#">Paint Shop
	<span class="glyphicon glyphicon-shopping-cart"></span></a>
	<ul class="dropdown-menu">
	<li><s:a href="shell-receipt-at-paint">Receipt Shell at Paint Shop</s:a></li>      
	<li><s:a href="shell-available-at-paint">Available Shell at Paint Shop</s:a></li> 
	<li><s:a href="paint-shop-production?stageId=4">Paint Shop Production</s:a></li> 
	<li><s:a href="paint-dispatch-production">Shell Dispatch From Pain Shop</s:a></li> 
	</ul> 
</li> 

<li class="dropdown-submenu">
	<a class="test" tabindex="-1" href="#">Furnishing Shop
	<span class="glyphicon glyphicon-shopping-cart"></span></a> 
	<ul class="dropdown-menu"> 
	<li><s:a href="shell-receipt-at-furnishing">Receipt Shell at Furnishing</s:a></li> 
	<li><s:a href="shell-available-at-furnishing?stageId=5">Shell Available at Furnishing</s:a></li> 
	<li><s:a href="bogie-receipt-at-furnishing">Receipt Bogie at Furnishing</s:a></li> 
	<li><s:a href="bogie-available-at-furnishing">Bogie Available at Furnishing</s:a></li> 
	<li><s:a href="furnishing-shop-production?stageId=5">Furnishing Shop Production</s:a></li>
	<li><s:a href="furnishing-dispatch-production">Coach Dispatch from Furnishing Shop</s:a></li>
	</ul> 
</li>

<li class="dropdown-submenu">
		<a class="test" tabindex="-1" href="#">Finishing Shop
	<span class="glyphicon glyphicon-shopping-cart"></span></a>
	<ul class="dropdown-menu">
	<li><s:a href="furnishing-receipt-at-finishing">Receipt Semi-finished Coach</s:a></li>  
 <li><s:a href="coach-available-at-finishing?stageId=6">Available Semi-finished Coach</s:a></li>
 <li><s:a href="finishing-shop-production?stageId=6">Finishing Shop Production</s:a></li>
	
	</ul>
</li>

<li class="dropdown-submenu">
	<a class="test" tabindex="-1" href="#">Coach Turn-out
	<span class="glyphicon glyphicon-shopping-cart"></span></a>
	<ul class="dropdown-menu">
	<li><s:a href="coach-receipt-for-turnout">Receipt Coach</s:a></li>  
 <li><s:a href="coach-available-for-turnout">Rack Formation</s:a></li>
 <li><s:a href="coach-dispatch-railway">Rack Dispatch</s:a></li>
  <li><s:a href="coach-sent-railway">Coach Sent by MCF</s:a></li>
	
	</ul>
</li>
</ul>
  </li>


<%}
if(usertype.equals("DEO"))
{%>

 <li class="dropdown">
 	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Add
 	<span class="glyphicon glyphicon-plus"></span></a>
        <ul class="dropdown-menu" id="#">
        	<li><s:a href="abnormality-form">Abnormality</s:a></li>
  			<li><s:a href="annual-target">Annual Coach Target</s:a></li>
  			<li><s:a href="annual-target-shop">Annual Shop Target</s:a></li>
  			<li><s:a href="annual-target-RSP">Annual RSP Target</s:a></li>
   			<li><s:a href="add-coach-production">Coach Production</s:a></li>
 			<li><s:a href="add-shop-production">Shop Production</s:a></li>
  			<li><s:a href="add-Asset-gateout">Asset TurnOut/RSP</s:a></li>
   			<li><s:a href="update_workshop_holidays">Holiday</s:a></li>
   			<li><s:a href="annual-target-monthly">Set Monthly Target</s:a></li>
 		</ul>
</li>
<li class="dropdown">
 	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Dashboard
 	<span class="glyphicon glyphicon-dashboard"></span></a>
        <ul class="dropdown-menu" id="#">
        	<li><s:a href="dash_board_coach" target= "_blank">Coach</s:a></li>
        	<li><a href="dashboard-shop?shop=Wheel&stage=wheel03" target= "_blank">Wheel</a></li>
			<li><s:a href="dashboard-shop?shop=Bogie&stage=bogie08" target= "_blank">Bogie</s:a></li>
			<li><s:a href="dashboard-shop?shop=Shell&stage=shell10" target= "_blank">Shell</s:a></li>
			<li><s:a href="dashboard-shop?shop=Paint&stage=paint02" target= "_blank">Paint</s:a></li>
			<li><s:a href="dashboard-shop?shop=Furnishing&stage=furn10" target= "_blank">Furnishing</s:a></li>
			<li><s:a href="dashboard-shop?shop=Finishing&stage=fin07" target= "_blank">Finishing</s:a></li>
			<li><s:a href="layout-shop" target= "_self">Shop Progress</s:a></li>
			<li><s:a href="layout-shop-trial" target= "_self">Shop Progress New</s:a></li>
			<li><s:a href="layout-shop-all" target= "_self">Coach Progress Details</s:a></li>
			<li><a href="dashboard-component?bogie_prod_id=BOGIE01" target= "_blank">Bogie Component</a></li>
		</ul>
</li>
<%if(roles.contains("Wheel")||roles.contains("All")) 
{
%>
<li class="dropdown">
<a class="dropdown-toggle"   data-toggle="dropdown">Production Module <span class="glyphicon glyphicon-object-align-bottom" ></span></a>
 	 <ul class="dropdown-menu">
     
      <li class="dropdown-submenu">
        <a class="test" tabindex="-1" href="#">Wheel Shop <span class="glyphicon glyphicon-shopping-cart"></span></a>
        <ul class="dropdown-menu">
          <li><a href="wheel-shop-production?stageId=1">Wheel Shop Production</a></li>
          <li><a href="wheel-dispatch-production">Wheel Dispatch List</a></li>
        </ul>
      </li>
<%}%>
<% 
if(roles.contains("Bogie")|| roles.contains("All")) 
{	
%>
<li class="dropdown-submenu">
	<a class="test" tabindex="-1" href="#">Bogie Shop
	<span class="glyphicon glyphicon-shopping-cart"></span></a>
	<ul class="dropdown-menu">	
		<li><s:a href="wheel-receipt-at-bogie">Receipt Wheel</s:a></li>     
		<li><s:a href="wheel-available-at-bogie">Available Wheel at Bogie Shop</s:a></li>
		<li><s:a href="bogie-shop-production?stageId=2">Bogie Shop Production</s:a></li>
		<li><a href="bogie-dispatch-production">Bogie Dispatch List</a></li>
	</ul>
</li>
<%} %>
<%  
 if(roles.contains("Shell")|| roles.contains("All"))  
 { 
%>
<li class="dropdown-submenu">
	<a class="test" tabindex="-1" href="#">Shell Shop
	<span class="glyphicon glyphicon-shopping-cart"></span></a>
		<ul class="dropdown-menu" >
			<li><s:a href="shell-shop-production?stageId=3">Shell Shop Production</s:a></li> 
			<li><a href="shell-dispatch-production">Shell Dispatch List</a></li>
		</ul>
</li>   
 <%} 
if(roles.contains("Paint")|| roles.contains("All"))  
{
%>
<li class="dropdown-submenu">
	<a class="test" tabindex="-1" href="#">Paint Shop
	<span class="glyphicon glyphicon-shopping-cart"></span></a>
	<ul class="dropdown-menu">
	<li><s:a href="shell-receipt-at-paint">Receipt Shell at Paint Shop</s:a></li>      
	<li><s:a href="shell-available-at-paint">Available Shell at Paint Shop</s:a></li> 
	<li><s:a href="paint-shop-production?stageId=4">Paint Shop Production</s:a></li> 
	<li><s:a href="paint-dispatch-production">Shell Dispatch From Pain Shop</s:a></li> 
	</ul> 
</li> 
<% } 
if(roles.contains("Furnishing")|| roles.contains("All"))  
{ 
%> 
<li class="dropdown-submenu">
	<a class="test" tabindex="-1" href="#">Furnishing Shop
	<span class="glyphicon glyphicon-shopping-cart"></span></a> 
	<ul class="dropdown-menu"> 
	<li><s:a href="shell-receipt-at-furnishing">Receipt Shell at Furnishing</s:a></li> 
	<li><s:a href="shell-available-at-furnishing?stageId=5">Shell Available at Furnishing</s:a></li> 
	<li><s:a href="bogie-receipt-at-furnishing">Receipt Bogie at Furnishing</s:a></li> 
	<li><s:a href="bogie-available-at-furnishing">Bogie Available at Furnishing</s:a></li> 
	<li><s:a href="furnishing-shop-production?stageId=5">Furnishing Shop Production</s:a></li>
	<li><s:a href="furnishing-dispatch-production">Coach Dispatch from Furnishing Shop</s:a></li>
	</ul> 
</li>
<%}
if(roles.contains("Finishing")|| roles.contains("All"))  
{ 
%>
<li class="dropdown-submenu">
		<a class="test" tabindex="-1" href="#">Finishing Shop
	<span class="glyphicon glyphicon-shopping-cart"></span></a>
	<ul class="dropdown-menu">
	<li><s:a href="furnishing-receipt-at-finishing">Receipt Semi-finished Coach</s:a></li>  
 <li><s:a href="coach-available-at-finishing?stageId=6">Available Semi-finished Coach</s:a></li>
 <li><s:a href="finishing-shop-production?stageId=6">Finishing Shop Production</s:a></li>
	
	</ul>
</li>
<%} if(roles.contains("CoachTurnout")|| roles.contains("All")) 
{%>
<li class="dropdown-submenu">
	<a class="test" tabindex="-1" href="#">Coach Turn-out
	<span class="glyphicon glyphicon-shopping-cart"></span></a>
	<ul class="dropdown-menu">
	<li><s:a href="coach-receipt-for-turnout">Receipt Coach</s:a></li>  
 <li><s:a href="coach-available-for-turnout">Rack Formation</s:a></li>
 <li><s:a href="coach-dispatch-railway">Rack Dispatch</s:a></li>
  <li><s:a href="coach-sent-railway">Coach Sent by MCF</s:a></li>
	
	</ul>
</li>
</ul>
  </li>
 <% } %>



 
<%} 
if(usertype.equals("Management"))
{
%>

<li class="dropdown">
 	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Dashboard
 	<span class="glyphicon glyphicon-dashboard"></span></a>
        <ul class="dropdown-menu" id="#">
        	<li><s:a href="dash_board_coach" target= "_blank">Coach</s:a></li>
        	<li><a href="dashboard-shop?shop=Wheel&stage=wheel03" target= "_blank">Wheel</a></li>
			<li><s:a href="dashboard-shop?shop=Bogie&stage=bogie08" target= "_blank">Bogie</s:a></li>
			<li><s:a href="dashboard-shop?shop=Shell&stage=shell10" target= "_blank">Shell</s:a></li>
			<li><s:a href="dashboard-shop?shop=Paint&stage=paint02" target= "_blank">Paint</s:a></li>
			<li><s:a href="dashboard-shop?shop=Furnishing&stage=furn10" target= "_blank">Furnishing</s:a></li>
			<li><s:a href="dashboard-shop?shop=Finishing&stage=fin07" target= "_blank">Finishing</s:a></li>
			<li><s:a href="layout-shop" target= "_self">Shop Progress</s:a></li>
			<li><s:a href="layout-shop-trial" target= "_self">Shop Progress New</s:a></li>
			<li><s:a href="layout-shop-all" target= "_self">Coach Progress Details</s:a></li>
			<li><a href="dashboard-component?bogie_prod_id=BOGIE01" target= "_blank">Bogie Component</a></li>
		</ul>
</li>


<%} %>
 <li class="dropdown">
	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Chat Box</a>
 		 <ul class="dropdown-menu" id="#"> 
 		 	<li><a href="chat-application">Send Message</a></li> 
 		 </ul> 
 </li> 
</ul>
<% 
if(usertype.equals("All"))
{%>
<ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">Account
      <span class="glyphicon glyphicon-user"></span></a>
       <ul class="dropdown-menu" id="#">
       <li><s:a href="user-form">Add User<span class="glyphicon glyphicon-plus"></span></s:a></li>
       <li><s:a href="reset-password">Reset Password<span class="glyphicon glyphicon-retweet"></span></s:a></li>
  		<li><s:a href="change-password">Change Password<span class="glyphicon glyphicon-transfer"></span></s:a></li>
  		<li><s:a href="logout">Logout<span class="glyphicon glyphicon-off"></span></s:a></li>	
  		</ul>
      </li>
</ul>
<%} %>
<% 
if(usertype.equals("System Admin"))
{%>
<ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">Account
      <span class="glyphicon glyphicon-user"></span></a>
       <ul class="dropdown-menu" id="#">
       <li><s:a href="user-form">Add User <span class="glyphicon glyphicon-plus"></span></s:a></li>
       <li><s:a href="reset-password">Reset Password <span class="glyphicon glyphicon-retweet"></span></s:a></li>
  		<li><s:a href="change-password">Change Password <span class="glyphicon glyphicon-transfer"></span></s:a></li>
  		<li><s:a href="logout">Logout <span class="glyphicon glyphicon-off"></span></s:a></li>	
  		</ul>
      </li>
</ul>
<%} %>
<% 
if(usertype.equals("DEO"))
{%>
<ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">Account
      <span class="glyphicon glyphicon-user"></span></a>
       <ul class="dropdown-menu" id="#">
	      	<li><s:a href="change-password">Change Password  <span class="glyphicon glyphicon-transfer"></span></s:a></li>
	  		<li><s:a href="logout">Logout   <span class="glyphicon glyphicon-off"></span></s:a></li>	
  		</ul>
      </li>
</ul> 
<%} %>
<% 
if(usertype.equals("Management"))
{%>
<ul class="nav navbar-nav navbar-right">
      <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">Account
      <span class="glyphicon glyphicon-user"></span></a>
       <ul class="dropdown-menu" id="#">
	       	<li><s:a href="change-password">Change Password<span class="glyphicon glyphicon-transfer"></span></s:a></li>
	  		<li><s:a href="logout">Logout<span class="glyphicon glyphicon-off"></span></s:a></li>	
	   </ul>
      </li>
</ul>
<%} %>
  </div>
</nav>


</body>
</html> 
