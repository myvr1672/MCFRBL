<%@ page import="com.opensymphony.xwork2.ActionContext" %> 

  <%@ page import="ACTION.DashboardAction" %> 
  <%@ taglib uri="/birt.tld" prefix="birt"%> 

 <%
 String contextpath=request.getContextPath();
String shop= request.getParameter("shopName");
String machineType=request.getParameter("machineType");
 System.out.println("hi navin check machine type "+machineType);
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
<% 
if(shop.equals("All")) {%> 
<birt:viewer id="birtViewer" 
				reportDesign="reports/machine_master.rptdesign"
				pattern="frameset" 
				scrolling="yes" 
				
				showParameterPage="false">
<birt:param name="machine_type" value='<%=machineType%>' ></birt:param>
</birt:viewer>

<% }
 else
 {  %> 
 	<birt:viewer id="birtViewer"  
			reportDesign="reports/machine_master_shopwise.rptdesign" 
			pattern="frameset"  
 			scrolling="yes"  
			
 			showParameterPage="false"> 

 <birt:param name="machine_type" value='<%=machineType%>' ></birt:param> 
 <birt:param name="shop_type" value='<%=shop%>'></birt:param> 
 </birt:viewer>	 
 <% 
 }
 %> 
