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
<html>

<link href="<%=contextpath %>/css/bootstrap.min.css" rel="stylesheet"  type="text/css" />
<link href="<%=contextpath %>/css/font-awesome.min.css" rel="stylesheet"  type="text/css" />
<!-- jQuery library -->

<script src="<%=contextpath %>/js/jquery.min.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/bootstrap.min.js" type="text/javascript"></script>
<style>
.navbar { 
   
   background-color: #D1CC74; 
  margin-bottom:1; 
   min-height:1vh; 
    height:4rem; 
    padding:0;
    border: 1px;
    cellspacing:1px;
    width:98%
 } 

.dropdown-submenu{
    position:relative;
background-color: #CFC688;
    padding:0;
    border: 1px;
    cellspacing:1px;
} 


 
.dropdown-submenu > .dropdown-menu
{
    top:0;
    left:98%;
    margin-top:0px;
    margin-left:-1px;
    -webkit-border-radius:0 6px 6px 6px;
    -moz-border-radius:0 6px 6px 6px;
border-radius:0 3px 3px 3px; 
    
     background-color: #E7DC96;
} 
.dropdown-submenu:hover > .dropdown-menu{
    display:block;
    padding:0;
}
 
.dropdown-submenu > a:after{
    display:block;
    float:right;
    width:0;
    height:0;
    border-color:transparent;
    border-style:solid;
    border-width:0px 0 0px 0px;
    border-left-color:#cccccc;
    margin-top:0px;
    margin-right:0px;
}
 
.dropdown-submenu:hover > a:after{
    border-left-color:#ffffff;
}
 
.dropdown-submenu .pull-left{
    float:none;
}
 
.dropdown-submenu.pull-left > .dropdown-menu{
    left:-100%;
    margin-left:10px;
    -webkit-border-radius:6px 0 6px 6px;
    -moz-border-radius:6px 0 6px 6px;
    border-radius:6px 0 6px 6px;
}

.root:hover > .dropdown-menu{
    display: block;
    background-color: #CFC688;
    padding:0; 
    text-align:left;
    cellspacing:1px;
    top:40px;
   
}
</style>
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
 <nav class="navbar navbar-default" role="navigation">
 	<ul class="nav navbar-nav">
<% if(usertype.equals("System Admin")||usertype.equals("Production"))
 {%>
<li class="root">
 	 <a class="dropdown-toggle" data-toggle="dropdown" href="#">Add
 	 <span class="glyphicon glyphicon-plus"></span></a>
 	  <ul class="dropdown-menu">
 	        <li><s:a href="abnormality-form">Abnormality</s:a></li>
 	        <li><s:a href="material-shortage-form">Material Shortage</s:a></li>
 	  	<% if(roles.equals("All")) {%>
 	  	    <li><s:a href="annual-target">Annual Coach Target</s:a></li>
 	  	<%} %>
 	  		<li><s:a href="annual-target-shop">Annual Shop Target</s:a></li>
 	  	<% if(roles.contains("Wheel")||roles.contains("Bogie")||roles.contains("CoachTurnout")||roles.equals("All")){ %> 
 	  		<li><s:a href="annual-target-RSP">Annual RSP Target</s:a></li>
 	  		<li><s:a href="add-Asset-gateout">Asset TurnOut/RSP</s:a></li>
 	  	<%} %>
 	   		<li><s:a href="add-coach-production">Coach Production</s:a></li>
 	 		<li><s:a href="add-shop-production">Shop Production</s:a></li>
 	 	<%if(!usertype.equals("Production")) {%>
 	   		<li><s:a href="update_workshop_holidays">Holiday</s:a></li>
 	   		<li><s:a href="asset-master">Asset Master</s:a></li>
 	   		<li><s:a href="asset-master-fin">Asset Master Finance</s:a></li>
 	   	<%} %>
 	   		<li><s:a href="annual-target-monthly">Set Monthly Target</s:a></li>
 	   		<li><s:a href="coach_dispatch_list">Coach Dispatched</s:a></li>
 	   		<li><s:a href="coach_dispatch">Coach Dispatched Detail</s:a></li>
 	   		<li><s:a href="add-machine-production">Machine Utilization</s:a></li>
 	   </ul>
 	 </li>
 	   <%}
 if(usertype.equals("System Admin")||usertype.equals("Production")||usertype.equals("Management")) { %> 
      
 	 <li class="root">
 	 	<a class="dropdown-toggle" data-toggle="dropdown" href="#">Dash-Board
 	 	<span class="glyphicon glyphicon-dashboard"></span></a>
 	        <ul class="dropdown-menu">
 	        	<li><s:a href="dash_board_coach" target= "_blank">Coach</s:a></li>
 	        <% if(roles.contains("Wheel")||roles.equals("All"))  {%>
 	        	<li><a href="dashboard-shop?shop=Wheel&stage=wheel03" target= "_blank">Wheel</a></li>
 	        <%} %>
 	        <% if(roles.contains("Bogie")||roles.equals("All"))  {%>
 				<li><s:a href="dashboard-shop?shop=Bogie&stage=bogie08" target= "_blank">Bogie</s:a></li>
 			<%} %>
 			<% if(roles.contains("Shell")||roles.equals("All")) {%>
 				<li><s:a href="dashboard-shop?shop=Shell&stage=shell07" target= "_blank">Shell</s:a></li>
 			<%} %>
 			<% if(roles.contains("Paint")||roles.equals("All")){%>
 				<li><s:a href="dashboard-shop?shop=Paint&stage=paint02" target= "_blank">Paint</s:a></li>
 			<%} %>
 			<% if(roles.contains("Furnishing")||roles.equals("All")) {%>
 				<li><s:a href="dashboard-shop?shop=Furnishing&stage=furn10" target= "_blank">Furnishing</s:a></li>
 			<%} if(roles.contains("Finishing")||roles.equals("All")) {%>
 			
 			<%-- 	<li><s:a href="dashboard-shop?shop=Testing&stage=test06" target= "_blank">Testing</s:a></li> --%>
 			<%} %>
 				<%--  <li><s:a href="layout-shop" target= "_self">Shop Progress</s:a></li>  --%>
 				<li><s:a href="layout-shop-trial" target= "_self">Shop Progress</s:a></li>
 				<li><s:a href="layout-stage-count" target= "_self">Stage Wise Count - Progress</s:a></li>
 				<li><s:a href="layout-shop-all" target= "_self">Coach Progress Details</s:a></li>
 				<li><a href="dashboard-component?bogie_prod_id=BOGIE01" target= "_blank">Bogie Component</a></li>
                <%-- <li><s:a href="coach-outturn-detail">Coach OutTurn Position</s:a></li>  --%>
 			</ul>
 	</li>
 	
 	
 	<% } if(usertype.equals("System Admin")||usertype.equals("Production")) {%>
 <!-- Production Module Menu item -->
 	<li class="root">
 	   <a href="#" class="dropdown-toggle"   data-toggle="dropdown">Production Module<span class="glyphicon glyphicon-object-align-bottom" ></span></a>
 	   <ul class="dropdown-menu">
 	 <% if(roles.contains("Wheel")||roles.equals("All"))  {%>
 	    <li class="dropdown-submenu">
 	     <a tabindex="-1" href="#">Wheel Shop <span class="glyphicon glyphicon-shopping-cart"></span></a>
 	       <ul class="dropdown-menu">
 	          <li><a href="wheel-shop-production?stageId=1">Wheel Shop Production</a></li>
 	          <li><a href="wheel-sip-wheelaxle?stageId=1">SIP for Wheel &#38; Axle Assembly</a></li>
              <li><a href="wheel-quality-clearance-memo?stageId=1">Issue Quality Clearance</a></li>
              <li><a href="wheel-Quality-Clearance-Report?stageId=1">Wheel Quality Clearance Report</a></li>
 	          <li><a href="wheel-dispatch-production">Wheel Dispatch List</a></li>
 	     	<li class="dropdown-submenu">
		    <a  tabindex="-2" href="#">Reports
 		<span class="glyphicon glyphicon-arrow-right"></span></a>
 		    <ul class="dropdown-menu">	
 		    <li><a href="listofwheel?dispatch_to=bogie">List of Wheel set for Bogie</a></li>
		    <li><a href="listofwheel?dispatch_to=rsp">List of Wheel set for RSP</a></li> 
<%--  		     <li><s:a href="wheel-production-status">Wheel Production Status as On</s:a></li> --%>
<%--  			<li><s:a href="wheel-assembly-yearly-outturn">Wheel Assembly Yearly Outturn</s:a></li> --%>
<%--  			<li><s:a href="wheel-RSP-Status-Rly-Distribution">Wheel RSP Status Railway Distribution</s:a></li> --%>
				<li><a href="wheel-quality-clearance-para">Wheel Quality Control Clearance Memo</a></li>
				<li><a href="wheel-self-inspection-ctrb">Wheel Self Inspection Report</a></li>

				<li><s:a href="Inspection-Wheel-Axle-Report">SIP REPORT OF Wheel &#38;AXLE ASSEMBLY </s:a></li>
                <li><s:a href="Inspection-ctrb-Report">SIP REPORT OF CTRB</s:a></li>
 		     	<li><s:a href="gant-chart-example-display">Wheel shop Gantt Chart</s:a></li> 
 				<li><a href="daily-attendance-wheel">Daily staff position of Wheel shop</a></li>
 	          	<li><a href="list-of-bogie-wheel-prod">Monthly Production Position stage wise of Wheel Shop and Bogie Shop</a></li>
 	          	<li><a href="wheel-prod">Annual Production Status of Wheel Shop</a></li>
 		     
 		
 		    </ul>
		    
		    </li>     
 	        </ul>
 	      </li>
<%} if(roles.contains("Bogie")||roles.equals("All"))  {%>
 	<li class="dropdown-submenu">
 		<a  tabindex="-1" href="#">Bogie Shop
 		<span class="glyphicon glyphicon-shopping-cart"></span></a>
 		<ul class="dropdown-menu">	
 			<li><s:a href="wheel-receipt-at-bogie">Receipt Wheel</s:a></li>     
 			<li><s:a href="wheel-available-at-bogie">Available Wheel at Bogie Shop</s:a></li>
 			<li><s:a href="bogie-shop-production?stageId=2">Bogie Shop Production</s:a></li>
 			<li><a href="bogie-sip?stageId=2">SIP for Bogie </a></li>
 			<li><a href="bogie-quality-clearance-memo?stageId=2">Issue Quality Clearance</a></li>
 			<li><a href="bogie-Quality-Clearance-Report?stageId=2">Bogie Quality Clearance Report</a></li>
 			<li><a href="bogie-dispatch-production">Bogie Dispatch List</a></li>
 			<li><a href="listofbogieall">List of Bogie</a></li>
		     			<li class="dropdown-submenu">
		    <a  tabindex="-2" href="#">Reports
 		<span class="glyphicon glyphicon-arrow-right"></span></a>
 		    <ul class="dropdown-menu">	
 		    <li><a href="listofbogie?dispatch_to=furnishing">List of Bogie dispatched for Furnishing</a></li>
		    <li><a href="listofbogie?dispatch_to=rsp">List of Bogie dispatched for RSP</a></li>
 		     <li><s:a href="bogie-production-status">Bogie Production Status As on</s:a></li>
 			<li><s:a href="bogie-assembly-yearly-outturn">Bogie Assembly Yearly Outturn</s:a></li>
 			<li><s:a href="output-position-component-bogie">OUTTURN POSITION OF COMPONENT AND BOGIE ASSEMBLY SECTION</s:a></li>
 			<li><s:a href="Flat-Bogie-SIP-Report">SIP Report of Static Testing</s:a></li>
 			<li><s:a href="final-Bogie-SIP-Report">SIP Report of Final Testing</s:a></li>
 		    <li><s:a href="RSP-Status-Rly-Distribution">Monthly Position of RSP (Bogie AND Wheel) As on</s:a></li>
 		     <li><s:a href="bogie-Position-RSP">RSP Distribution Status As on</s:a></li>
<%--  		     <li><s:a href="bogie-report">Bogie  Report</s:a></li>   --%>
<%--  		     <li><s:a href="gant-chart-example-display">Get Gantt Chart</s:a></li> --%>
<%--   			 <li><s:a href="shop-production-status">Shop wise production status report</s:a></li>--%>
 			   <li><s:a href="daily-attendance-bogie">Daily staff position of Bogie shop</s:a></li>
 		         <li><s:a href="daily-report-bogie">DAILY OUTTURN POSITION OF COMPONENT AND BOGIE ASSEMBLY SECTION </s:a></li>
 		         <li><s:a href="GM-position-bogie">GM Position of Bogie Shop</s:a></li>
 		          <li><s:a href="Position-RSP">RSP MONTHLY POSITION OF BOGIE AND WHEEL AS ON </s:a></li>
 		          
 		          
 		           <li><s:a href="awaiting-to-dispatch-asondate">AWAITING TO DISPATCH BOGIES FROM BOGIE SHOP AS ON </s:a></li>
 		            <li><s:a href="dispatched-coaches-asondate">DISPATCHED BOGIES FORM BOGIE SHOP AS ON DATE</s:a></li>
 <%-- 		       
 		             <li><s:a href="coach-holding-asondate">Bogie Holding Position Periodical</s:a></li>
 		              <li><s:a href="awaiting-to-dispatch-monthly">MONTHLY AWAITING TO DISPATCH BOGIE FROM BOGIE SHOP</s:a></li>
 		               <li><s:a href="dispatched-coaches-monthly">DISPATCHED BOGIE  FROM BOGIE SHOP MONTH WISE</s:a></li>
 		                <li><s:a href="coach-holding-monthly">Monthly Coach Holding</s:a></li>
 --%>	             
 		                  <li><s:a href="dispatched-coaches-yearly">Bogie Dispatched year wise from Bogie shop</s:a></li>
 		                   <li><s:a href="coach-holding-yearly">Bogie holding Year wise from Bogie shop</s:a></li>
  			
 		    </ul>
		    
		    </li>
 			
 		</ul>
 	</li>
 	<%} if(roles.contains("SheetMetal")|| roles.contains("All")) {	%>
    <li class="dropdown-submenu">
 		<a tabindex="-1" href="#">Sheet Metal Shop
 		<span class="glyphicon glyphicon-shopping-cart"></span></a>
 			<ul class="dropdown-menu" >
 			    <li><s:a href="sheet-metal-master">Sheet Metal Master</s:a></li>
 			    <li><s:a href="sheet-metal-transaction">Sheet Metal Transaction</s:a></li>
 	<li class="dropdown-submenu">
		    <a  tabindex="-2" href="#">Reports
 		<span class="glyphicon glyphicon-arrow-right"></span></a>
 		    <ul class="dropdown-menu">	
<!--  		    <li><a href="listofsheet?dispatch_to=shell">List of sheet metal set for shell</a></li> -->
<%--  		     <li><s:a href="sheet-production-status">Sheet Metal Production Status as On</s:a></li> --%>
<%--  			<li><s:a href="sheet-assembly-yearly-outturn">Sheet Metal Assembly Yearly Outturn</s:a></li> --%>
<%--  		     <li><s:a href="gant-chart-sheet-display">Get Gantt Chart of Sheet Metal Shop</s:a></li> --%>
 		
 		    </ul>
	</li>     
 	    			
 			</ul>
 	</li>
 <%} if(roles.contains("Shell")|| roles.contains("All")) { %>
 	<li class="dropdown-submenu">
 		<a tabindex="-1" href="#">Shell Shop
 		<span class="glyphicon glyphicon-shopping-cart"></span></a>
 			<ul class="dropdown-menu" >
 		
 				<li><s:a href="shell-shop-production?stageId=3">Shell Shop Production</s:a></li> 
 				<li><s:a href="shell-defect-master">Shell Defect Master</s:a></li>
 				<li><a href="shell-sip-component?stageId=3">SIP for Shell Component</a></li>
 		<li><a href="shell-sip-stage?stageId=3">SIP for Shell Stages</a></li>
 		<li><a href="shell-sip-assembly?stageId=3">SIP for Shell Assembly</a></li>
 		<li><a href="shell-sip-final?stageId=3">Final Inspection Report</a></li>
 		<li><a href="shell-check-list?stageId=3">Check List</a></li>
 		<li><a href="shell-quality-clearance-memo?stageId=3">Issue Quality Clearance</a></li>
 		<li><a href="shell-Quality-Clearance-Report?stageId=3">Shell Quality Clearance Report</a></li>
 				<li><a href="shell-dispatch-production">Shell Dispatch List</a></li>
 				<li class="dropdown-submenu">
		    		<a  tabindex="-2" href="#">Reports
 					<span class="glyphicon glyphicon-arrow-right"></span></a>
 		    		<ul class="dropdown-menu">	
<!--  		    			<li><a href="listofshell?dispatch_to=bogie">List of Shell dispatch to Furnishing</a></li> -->
<%-- 		     			<li><s:a href="shell-production-status">Shell Production Status as On</s:a></li> --%>
<%--  						<li><s:a href="shell-assembly-yearly-outturn">Yearly Outturn of shell</s:a></li> --%>
<%--  		  				<li><s:a href="gant-chart-shell-display">Shell production Gant Chart</s:a></li> --%>
 		  				<li><s:a href="daily-attendance-shell">Staff position at Shell Shop as on </s:a></li>
 		    		</ul>
		    	</li>     
 	    
 				
 			</ul>
 	</li>   
<%} if(roles.contains("Paint")|| roles.contains("All")) { %>
 	<li class="dropdown-submenu">
 		<a tabindex="-1" href="#">Paint Shop
 		<span class="glyphicon glyphicon-shopping-cart"></span></a>
 		<ul class="dropdown-menu">
 		<li><s:a href="shell-receipt-at-paint">Receipt Shell at Paint Shop</s:a></li>      
 		<li><s:a href="shell-available-at-paint">Available Shell at Paint Shop</s:a></li> 
 		<li><s:a href="paint-shop-production?stageId=4">Paint Shop Production</s:a></li> 
 		
 		<li><s:a href="paint-shop-sip-tran?stageId=4">Interior and Exterior Inspection(SIP and Final) of Painted Shell</s:a></li> 
 		<li><s:a href="paint-shop-insp-clear-tran?stageId=4">Issue testing Clearance of Painted Shell</s:a></li>
 		
 		<li><s:a href="paint-dispatch-production">Shell Dispatch From Paint Shop</s:a></li> 
 		
 		<li class="dropdown-submenu">
		    <a  tabindex="-2" href="#">Reports
 		<span class="glyphicon glyphicon-arrow-right"></span></a>
 		    <ul class="dropdown-menu">	
 		   		<li><s:a href="withheld-coaches-as-on-date-paint">Shell holding at Paint shop as on</s:a></li>
 		        <li><s:a href="yearly-dispatched-coaches-paint">Shell dispatched from paint shop yearly</s:a></li>
 		        <li><s:a href="yearly-withheld-coaches-paint">Shell holding at paint shop yearly</s:a></li>
<!--  		        <li><s:a href="yearwise">Yearwise Report</s:a></li>  -->
 		        <li><s:a href="monthly-dispatch-coaches-paint">Shell dispatched from paint shop monthly</s:a></li>
 		        <li><s:a href="monthly-withheld-coaches-paint">Shell holding at paint shop monthly</s:a></li>
 		        <li><s:a href="awaiting-to-dispatch-as-on-date">Shell Awaiting to Dispatch from Paint Shop As on</s:a></li>
 		        <li><s:a href="dispatched-coaches-as-on-date-paint">Dispatched shell from Paint shop as on </s:a></li>
 		        <li><s:a href="daily-attendance-paint">Staff position at Paint Shop as on </s:a></li>
 		        <li><s:a href="intr-paint-sip">Self Inspection of Interior Painting of Shell</s:a></li>
 		        <li><s:a href="intr-paint-final-inspection">Final Inspection of Interior Painting of Shell </s:a></li>
 		    	<li><s:a href="extr-paint-sip">Self Inspection of Exterior Painting of Shell </s:a></li>
 		        <li><s:a href="extr-paint-final-inspection">Final Inspection of Exterior Painting of Shell </s:a></li>
 		        <li><s:a href="paint-memo-clearance">Despatch Certificate of Painted Shell </s:a></li>
 		        
 		        
 		      
 	
 		    </ul>
		    
 		</ul> 
 	</li> 
<%}if(roles.contains("Furnishing")|| roles.contains("All")) { %>
 	<li class="dropdown-submenu">
 		<a tabindex="-1" href="#">Furnishing Shop
 		<span class="glyphicon glyphicon-shopping-cart"></span></a> 
 		<ul class="dropdown-menu"> 
 		     <li><s:a href="shell-defect-log-entry">Shell Defect Log Entry</s:a></li>
 			<li><s:a href="shell-receipt-at-furnishing">Receipt Shell at Furnishing</s:a></li> 
 			<li><s:a href="shell-available-at-furnishing?stageId=5">Shell Available at Furnishing</s:a></li> 
 			<li><s:a href="bogie-receipt-at-furnishing">Receipt Bogie at Furnishing</s:a></li> 
 			<li><s:a href="bogie-available-at-furnishing">Bogie Available at Furnishing</s:a></li> 
 			<li><s:a href="furnishing-shop-production?stageId=5">Furnishing Shop Production</s:a></li>
 			<li><s:a href="furnishing-dispatch-production">Coach Dispatch from Furnishing Shop</s:a></li>
        	<li><a href="listoffurnish">List of Furnishing</a></li>
        	<li class="dropdown-submenu">
		    <a  tabindex="-2" href="#">Furnishing Stage Clearance
 		<span class="glyphicon glyphicon-arrow-right"></span></a>
 		    <ul class="dropdown-menu">	
 	  		 	 <li><a href="furnishingStageClearance">Furnishing Stage Clearance</a></li> 
 		    </ul>
		    
		  </li>
        	 	<li class="dropdown-submenu">
		    		<a  tabindex="-2" href="#">Reports
 					<span class="glyphicon glyphicon-arrow-right"></span></a>
 		    		<ul class="dropdown-menu">	
<%--  		    			<li><a href="listoffurnishing?dispatch_to=RSP">List of Shell dispatch from Furnishing</a></li>
		     			<li><s:a href="furnishing-production-status">Furnishing Production Status as On</s:a></li>
 						<li><s:a href="furnishing-assembly-yearly-outturn">Yearly Outturn of Furnishing</s:a></li>
 		  				<li><s:a href="gant-chart-furnishing-display">Furnishing shop production Gant Chart</s:a></li>
 --%> 		  		   	<li><s:a href="coach-prod-status">Coach Production Status Report</s:a></li>
 		  		    	<li><s:a href="Furnishing-Report2-RSP">List of Coach Dispatch to Railway</s:a></li>
 		  		    	<li><s:a href="daily-att-furn">Staff position at Furnishing shop as on</s:a></li>
 		  		    	<li><s:a href="dispatched-coaches-as-on">Coach dispatched as on</s:a></li>
 		  		    	<li><s:a href="monthly-awaiting-to-dispatch">Coach awaiting to despatch monthly</s:a></li>
 		  		    	<li><s:a href="monthly-dispatched-coaches">Coach despatched monthly</s:a></li>
 		  		    	<li><s:a href="monthly-withheld-coaches">Coach holding position monthly</s:a></li>
 		  		    	<li><s:a href="yearly-awaiting-to-dispatch">Coach awaiting to despatch yearly</s:a></li>
 		  		    	<li><s:a href="yearly-dispatch-coaches">Coach despatched yearly</s:a></li>
 		  		    	<li><s:a href="yearly-withheld-coaches">Coach holding position yearly</s:a></li>
 		  		    	<li><a href="cre-lhb-power-car">CRE LHB POWER CAR REPORT</a></li>
 				 		<li><a href="safety_para_da_sets">Safety Parameter DA sets REPORT</a></li>
 		    		</ul>
		    	</li>  
 		</ul> 
 	</li>
 	<%} if(roles.contains("Testing")|| roles.contains("All"))  { %>
 	<li class="dropdown-submenu">
 		<a tabindex="-1" href="#">Quality Shop
 		<span class="glyphicon glyphicon-shopping-cart"></span></a> 
 		<ul class="dropdown-menu"> 
 		
 		<li><s:a href="coach-receipt-at-quality">Receipt Coach for Testing</s:a></li> 
 		<li><s:a href="perform-testing-in-coach?stageId=5">Perform Testing</s:a></li>
 		<li><s:a href="coach-available-for-quality?stageId=5">Verify Furnishing Component</s:a></li>
 		</ul> 
 	</li>
 	<%} if(roles.contains("CoachTurnout_1")|| roles.contains("All")) 
 	{%>
 	<li class="dropdown-submenu">
 		<a tabindex="-1" href="#">Coach Turn-out
 		<span class="glyphicon glyphicon-shopping-cart"></span></a>
 		<ul class="dropdown-menu">
 		<li><s:a href="coach-receipt-for-turnout">Receipt Coach</s:a></li>  
 	 <li><s:a href="coach-available-for-turnout">Rack Formation</s:a></li>
 	 <li><s:a href="coach-dispatch-railway">Rack Dispatch</s:a></li>
 	  <li><s:a href="coach-sent-railway">Coach Sent by MCF</s:a></li>
 		
 		</ul>
 	</li>
 	 <% } %> 
 	<li class="dropdown-submenu">
 		<a tabindex="-1" href="#">Coach Production Report
 		<span class="glyphicon glyphicon-shopping-cart"></span></a> 
 		<ul class="dropdown-menu"> 
 		<li><s:a href="yearwise-RSP">Year wise RSP Report</s:a></li>
 		       <li><s:a href="monthly-yearwise">Monthly/Year-wise Report</s:a></li>
 		       <li><s:a href="coach-dispatch-details">Coach Dispatch Report</s:a></li>
 		       <li><s:a href="coach-prod-status">Coach Prod status report</s:a></li>
 		       <li><s:a href="despatch-summary">Despatch Report</s:a></li>
 		        <li><a href="daywise-total-despatch">Daywise total despatch</a></li>
 		      
 		         <li><a href="coach-position-typewise">Coach Position Typewise</a></li>
 		         <li><a href="coach-position-yearly-summ">Coach Position Yearly Summ</a></li>
 		         <li><a href="shopwise-monthly-staff-position">Shopwise Monthly Staff Position</a></li>   
 			</ul> 
 	</li>
 	</ul>
 	  </li>
<%} if(usertype.equals("System Admin")||usertype.equals("maintenance")) { %>
<!-- End of Production Module icon -->
<li class="root">
<a href="#" class="dropdown-toggle"   data-toggle="dropdown">Maintenance<span class="glyphicon glyphicon-object-align-bottom" ></span></a>
	 	 <ul class="dropdown-menu"> 
 	 	 <li class="dropdown-submenu">
 	 	 <a tabindex="-1" href="#">Create Master<span class="glyphicon glyphicon-shopping-cart"></span></a>
 	 	 <ul class="dropdown-menu">
 	 	  <li><s:a href="add-machine-master">Machine Master</s:a></li>
 	 	   <li><s:a href="machine-schedule-activity">Schedule Activity Master</s:a></li>
 	 	  <li><s:a href="add-amc-agency-master">AMC Agency Master</s:a></li>
 	 	   <li><s:a href="machine-FIR-master">Machine FIR Master</s:a></li>
 	 	   <li><s:a href="safety-instruction-master">Safety Instructions Master</s:a></li>
 	 	   <li><s:a href="spare-master">Spares Master</s:a></li>
 	 	    <%--  <li><s:a href="machine-spare-master">Add Machine Spares</s:a></li> --%>
 	 	   <li><s:a href="user-manual-machine-maintenance">User Manual</s:a></li> 
 	 	 </ul>
 	 	 </li>
 	 	 <li class="dropdown-submenu">
 	 	 <a tabindex="-1" href="#">Link Machine with Master<span class="glyphicon glyphicon-shopping-cart"></span></a>
 	 	 <ul class="dropdown-menu">
 	 	       <li><s:a href="machine-schedule-add">Create Schedule Plan</s:a></li>
 			 <li><s:a href="machine-schedule-activity-add">Link Schedule Activity with Machine</s:a></li>
 	 	   <li><s:a href="machine-list">Link Safety Instruction with Machine</s:a></li>
 	 	   <li><s:a href="link-spare-master-by-machine">Link Spare with Machine</s:a></li>
 	 	    <%--  <li><s:a href="machine-spare-master">Add Machine Spares</s:a></li> --%>
 	 	   <li><s:a href="user-manual-machine-maintenance">User Manual</s:a></li> 
 	 	 </ul>
 	 	 </li>
 	 	 <li class="dropdown-submenu">
 	 	 <a tabindex="-1" href="#">Operations on Machine<span class="glyphicon glyphicon-shopping-cart"></span></a>
 	 	 <ul class="dropdown-menu">
 	 	  <li><s:a href="report-machine-failure">Report Machine Failure</s:a></li>
      <li><s:a href="failed-machine-release">Release Failed Machine</s:a></li>
        <li><s:a href="machine-schedule-failed-action">Perform Action on Failed Machine</s:a></li>
 	 	    <li><s:a href="overdue-schedule">Release Overdue Machine for Schedule</s:a></li>
 	 	    <li><s:a href="overdue-perform-action">Perform Action on Overdue Machine</s:a></li>
 	 	    <li><s:a href="user-manual-machine-maintenance-2">User Manual</s:a></li>
 	 	   
 	 	 </ul>
 	 	 </li>
 	 	 <li class="dropdown-submenu">
 	 	 <a tabindex="-1" href="#">Reports<span class="glyphicon glyphicon-shopping-cart"></span></a>
 	 	 <ul class="dropdown-menu">
 	 	   <li><s:a href="machine-master-report">Machine Master Report</s:a></li>
<%--  	 	     <li><s:a href="machine-breakdown-report">Machine Breakdown Report</s:a></li> --%>
<%--  	 	   <li><s:a href="machine-breakdown-report-datewise">Breakdown Report Date Wise</s:a></li> --%>
<%--               <li><s:a href="machine-breakdown-report-vendorwise">Breakdown Report Vendor Wise</s:a></li> --%>
            <li><s:a href="machine-breakdown-history">Breakdown History</s:a></li>   
             <li><s:a href="schedule-due-date-report">Schedule Due Date Report</s:a></li>   
 			
 	 	    
 	 	   
 	 	 </ul>
 	 	 </li>
 </ul>	 	 
</li>
 <%}   if(usertype.equals("System Admin")||usertype.equals("Manpower")) { %>
<!-- Start of Manpower Utilization -->
<li class="root">
 	<a href="#" class="dropdown-toggle"   data-toggle="dropdown">Manpower Utilization<span class="glyphicon glyphicon-object-align-bottom" ></span></a>
 	 	 <ul class="dropdown-menu">
 	     
 	      <li class="dropdown-submenu">
 	        <a tabindex="-1" href="#">Employee Master<span class="glyphicon glyphicon-user"></span></a>
 	        <ul class="dropdown-menu">
 	          <li><s:a href="add-emp-master">Add Employee</s:a></li>
        <li><s:a href="transfer-emp-within-mcf">Department Transfer Within MCF</s:a></li>
          <li><s:a href="transfer-emp-out-mcf">Transfer/Retired Employee</s:a></li> 
 	      <li><s:a href="emp-master-help">User Manual</s:a></li>    
 	        </ul>
 	      </li>
 	<%if(roles.contains("JobCreation")||roles.contains("All")) { %>
 	
 <li class="dropdown-submenu">
	<a class="test" tabindex="-1" href="#">Job Creation
	<span class="glyphicon glyphicon-shopping-cart"></span></a>
	<ul class="dropdown-menu">	
		<li><s:a href="add-job-master">Add Job/ Activity</s:a></li>    
		<li><a href="pending-jobs-list">Pending Jobs Report</a></li> 
		<li><s:a href="job-creation-help">Job Creation Manual</s:a></li> 
	</ul>
</li>
<%} if(roles.contains("ShiftAllocation")||roles.contains("All")) {%>
 	 <li class="dropdown-submenu">
 		 <a  tabindex="-1" href="#">Shift Allotment<span class="glyphicon glyphicon-shopping-cart"></span></a>
 		<ul class="dropdown-menu">	
 			<li><s:a href="shift-allotment">Allot Shift</s:a></li>     
 			<li><s:a href="shift-allotment-help">Shift Allotment Manual</s:a></li>
 		</ul>
 	</li>
<%} if(roles.contains("Attendance")||roles.contains("All")) {%>
 	<li class="dropdown-submenu">
 		<a tabindex="-1" href="#">Attendance Marking
 		<span class="glyphicon glyphicon-shopping-cart"></span></a>
 			<ul class="dropdown-menu" >
 			    <li><s:a href="attendance-mark">Attendance Mark</s:a></li>
 			    <li><s:a href="attendence-marking-help">Attendance Marking Manual</s:a></li> 
 			    <li><a href="attendance-list-report?shop=bogie">Attendance List Report</a></li>
 			    <li><a href="attendance-list">Attendance List</a></li>
 				
 			</ul>
 	</li> 
 <%} if(roles.contains("JobAllocation")||roles.contains("All")) {%>  
 <li class="dropdown-submenu">
	<a class="test" tabindex="-1" href="#">Job Allocation
	<span class="glyphicon glyphicon-shopping-cart"></span></a>
		<ul class="dropdown-menu" >
			<li><s:a href="job-allocation">Job Allocation</s:a></li>    
			<li><s:a href="display-employee-job">ManPower Booking List</s:a></li> 
			<li><s:a href="job-allocation-help">Job Allocation Manual</s:a></li>
			<li><s:a href="dashboard-manpower-bogie" target= "_blank">Bogie Manpower Utilization</s:a></li>
		</ul>
</li>   
 <%} %>
 	</ul>
 	  </li>
<%	} if(usertype.equals("System Admin")||usertype.equals("testingClearance")) {%>
<li class="root">
 	<a href="#" class="dropdown-toggle"   data-toggle="dropdown">Furnishing Stage Clearance<span class="glyphicon glyphicon-object-align-bottom" ></span></a>
 		    <ul class="dropdown-menu">	
 	  		 	 <li><a href="furnishingStageClearance">Furnishing Stage Clearance</a></li> 
 		    </ul>	 
</li>

<%} %>
</ul>
<ul class="nav navbar-nav navbar-right">
      <li class="root">
<a class="dropdown-toggle" data-toggle="dropdown" href="#">Account<span class="glyphicon glyphicon-user"></span></a>
    <ul class="dropdown-menu" id="#">
        
     <%  if(usertype.equals("System Admin")) {%>
        <li><s:a href="user-form">Add User <span class="glyphicon glyphicon-plus"></span></s:a></li>
        <li><s:a href="reset-password">Reset Password <span class="glyphicon glyphicon-retweet"></span></s:a></li>
  		
  	<%} %>
  	    <li><s:a href="change-password">Change Password <span class="glyphicon glyphicon-transfer"></span></s:a></li>	
  		<li><s:a href="logout">Logout <span class="glyphicon glyphicon-off"></span></s:a></li>	
  	</ul>
      </li>
</ul>
<% 
session1.close();
%>


</nav>


</body>
</html>                    