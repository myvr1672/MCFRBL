<%@ page import="com.opensymphony.xwork2.ActionContext" %> 
<%@ page import= "java.text.SimpleDateFormat" %>
<%@ page import= "java.util.Date" %>
  <%@ page import="ACTION.DashboardAction" %> 
  <%@ taglib uri="/birt.tld" prefix="birt"%> 

 <%
 String contextpath=request.getContextPath();

String fromDate= request.getParameter("startDate");
String toDate= request.getParameter("endDate");
String shop= request.getParameter("shop");
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

Date from = sdf.parse(fromDate);
System.out.println("From Date of report:"+from);
Date to = sdf.parse(toDate);
System.out.println("To Date of report:"+to);
%>

<!-- Include jTable script file. -->
<script src="<%=contextpath %>/js/jquery-2.1.4.min.js" type="text/javascript"></script> 
<script src="<%=contextpath %>/js/jquery-ui-1.11.4.custom/jquery-ui.js" type="text/javascript"></script> 


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
				reportDesign="reports/shopProductionStatusReport.rptdesign"
				pattern="frameset" 
				scrolling="yes" 
				
				showParameterPage="false">
				<birt:param name="from_date" value='<%=from%>'></birt:param>
				<birt:param name="to_date" value='<%=to%>'></birt:param>
				<birt:param name="shop" value='<%=shop%>'></birt:param>


</birt:viewer>


