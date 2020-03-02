 
  <%@ taglib uri="/birt.tld" prefix="birt"%> 

<% String contextpath=request.getContextPath();
String shop= request.getParameter("shop");
String stage=request.getParameter("stage");
String productionBy="InHouse";
if(shop.equals("Shell"))
{
	productionBy="Manual";
}

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
				reportDesign="reports/production_dashboard_shop.rptdesign" 
				pattern="frameset" 
				scrolling="yes" 				
				showParameterPage="false">
<birt:param name="para_stage" value="<%=shop%>"></birt:param>
<birt:param name="para_stage_id" value="<%=stage%>"></birt:param>
<birt:param name="para_inhouse" value="<%=productionBy%>"></birt:param>
<birt:param name="para_fromtrade" value="FromTrade"></birt:param>
 								
</birt:viewer>