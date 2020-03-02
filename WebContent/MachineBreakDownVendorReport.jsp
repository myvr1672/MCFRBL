<%@ page import="com.opensymphony.xwork2.ActionContext" %> 

  <%@ page import="ACTION.DashboardAction" %> 
  <%@ taglib uri="/birt.tld" prefix="birt"%> 

 <%
 String contextpath=request.getContextPath();
String vendorName= request.getParameter("vendorName");
System.out.println("Vendor id is :"+vendorName);
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
			reportDesign="reports/vendor_wise_breakdown.rptdesign" 
			pattern="frameset"  
 			scrolling="yes"  
			
 			showParameterPage="false"> 

 <birt:param name="Vendor" value='<%=vendorName%>' ></birt:param> 
 
 </birt:viewer>	 
 
