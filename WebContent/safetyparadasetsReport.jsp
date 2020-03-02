<%@ page import="com.opensymphony.xwork2.ActionContext" %> 
<%@ page import= "java.text.SimpleDateFormat" %>
<%@ page import= "java.util.Date" %>
  <%@ page import="ACTION.DashboardAction" %> 
  <%@ taglib uri="/birt.tld" prefix="birt"%> 

 <%
 String contextpath=request.getContextPath();

int furnishing_asset_id= Integer.parseInt(request.getParameter("furnishing_asset_id"));
//String toDate= request.getParameter("endDate");
//SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

//Date from = sdf.parse(fromDate);
//System.out.println("From Date of report:"+from);
//Date to = sdf.parse(toDate);
//System.out.println("To Date of report:"+to);
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
				reportDesign="reports/safetyparadasetReport.rptdesign"
				pattern="frameset" 
				scrolling="yes" 
				
				showParameterPage="false">
				<birt:param name="furnishing_asset_id" value='<%=furnishing_asset_id%>'></birt:param>
		


</birt:viewer>


