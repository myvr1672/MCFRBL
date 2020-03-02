 
  <%@ taglib uri="/birt.tld" prefix="birt"%> 

<% String contextpath=request.getContextPath(); %>
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
<% String coach_no=(String)session.getAttribute("coach_num"); %>
<birt:viewer id="birtViewer" 
				reportDesign="reports/listofshell.rptdesign"
				pattern="frameset" 
				scrolling="yes" 				
				showParameterPage="false">
<birt:param name="dispatch_to" value="bogie"></birt:param>


 								
</birt:viewer>