<%@ page import="com.opensymphony.xwork2.ActionContext" %> 
<%@ page import="common.DateUtil" %> 
  <%@ page import="java.util.Date" %> 
  <%@ taglib uri="/birt.tld" prefix="birt"%> 

 <%
 String contextpath=request.getContextPath();
Integer machineId= Integer.parseInt(request.getParameter("machineId"));
Integer scheduleId=Integer.parseInt(request.getParameter("scheduleId"));
String machineSrNo=request.getParameter("machineSrNo");
String scheduleType=request.getParameter("scheduleType");
Date scheduleDate=DateUtil.convertToDate(request.getParameter("scheduleDate"));

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
				reportDesign="reports/ScheduleForm.rptdesign"
				pattern="frameset" 
				scrolling="yes" 
				
				showParameterPage="false">
<%-- <birt:param name="machineId" value='<%=machineId%>' ></birt:param> --%>
<birt:param name="scheduleId" value='<%=scheduleId%>'></birt:param>
<%-- <birt:param name="machineSrNo" value='<%=machineSrNo%>' ></birt:param> --%>
<%-- <birt:param name="scheduleType" value='<%=scheduleType%>'></birt:param> --%>
<%-- <birt:param name="scheduleDate" value='<%=scheduleDate%>'></birt:param> --%>
</birt:viewer>


