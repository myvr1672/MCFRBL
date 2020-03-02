<%@ page import="com.opensymphony.xwork2.ActionContext" %> 

  <%@ page import="ACTION.DashboardAction" %> 
  <%@ taglib uri="/birt.tld" prefix="birt"%> 

 <%
 String contextpath=request.getContextPath();

DashboardAction dashBoard= new DashboardAction();
double workingDays[]=dashBoard.dash_board_FOR_BIRT();
//double totalWorkingDays= dashBoard.getTotalWorkingDays();
//double currentWorkingDays=dashBoard.getCurrentWorkingDays(); 
%>
<!-- Include jTable script file. -->
<script src="<%=contextpath %>/js/jquery-2.1.4.min.js" type="text/javascript"></script> 
<script src="<%=contextpath %>/js/jquery-ui-1.11.4.custom/jquery-ui.js" type="text/javascript"></script> 

<%-- <p><a href="<%= request.getContextPath( ) + "/frameset?__report=/layout/reports/bpc_report.rptdesign&sample=my+parameter" %>">View Example</a> --%>
<script>
$(document).ready(function() {
	//alert("resetting height");
	var width=$(window).width();
 	var height= $(window).height();
 	
    $('iframe').css('height', height * 1.0);
    $('iframe').css('width', width * 0.98);
    //alert("height:"+height+"  width:"+width);
    
});


</script>
<birt:viewer id="birtViewer" 
				reportDesign="reports/production_dashboard_coach.rptdesign" 
				pattern="frameset" 
				scrolling="yes" 
				
				showParameterPage="false">
 								
<birt:param name="totalWorkingDays" value='<%=workingDays[0]%>' ></birt:param>
<birt:param name="currentWorkingDays" value='<%=workingDays[1]%>' ></birt:param>





</birt:viewer>


<%--     <birt:param name="param1" value='<%=rakeId%>'></birt:param> --%>