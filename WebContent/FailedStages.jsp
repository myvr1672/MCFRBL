<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.util.*"%>
   <%@ page import="java.sql.*" %>
   <%@ page import="model.User" %>
   <%@page import="beans.TestingMobileClearance" %>
   <%@page import="hibernateConnect.HibernateConfig" %>
   <%@page import="org.hibernate.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Failed Stages</title>
<link href="css/furnishingStatus.css" rel="stylesheet"  type="text/css" />
</head>
<style>
.submitBtn{
	background-color:SlateBlue;
	color:white;
	
}
</style>
<script type="text/javascript">
function goBack()
{
	window.history.back();
}
</script>
<body>

<h1  style="font-size:25px;color:SlateBlue; margin-left:20px;"><b>All the shells in failed stage:</b></h1>
<div class="divfailedTable">


<table class="divTable" border="1" style="width:auto;margin-left:20px;">

<tr>
<th>Shell Number</th>
<th>Furnishing Number</th>
<th>Coach Type</th>
<th>Remark</th>
<th>Failure causing Stage</th>
<th>Current Stage</th>
</tr>


<%
Session session1=null;

List<Object[]> failedCoaches = null;
//HttpSession session_http = ServletActionContext.getRequest().getSession(true);
 session1 = HibernateConfig.getSession();


	String hql="SELECT  B.shell_no, C.furnishing_no, C.coach_type, K.remark, K.notification_stage,L.substage_description as notificationstage,J.substage_description "+
					"from furnishing_tran A,shell_tran B,paint_tran C,furnishing_stage_master J,testing_mobile_clearance K,furnishing_stage_master L "+
					"where A.shell_asset_id  = B.shell_asset_id and B.shell_asset_id= C.shell_asset_id and C.coach_type=J.coach_type and J.substage_id=K.substage_id and C.coach_type=L.coach_type and K.notification_stage=L.substage_id and A.furnishing_asset_id=K.furnishing_asset_id  and A.assembly_dispatch_date is null and (K.testing_status ='failed' or K.testing_status IS NULL)"+
					"order by A.furnishing_asset_id, K.substage_id";
	Query query = session1.createSQLQuery(hql);
	failedCoaches = query.list();

for(Object[] i: failedCoaches)
{
	String shellNo=i[0].toString();
	String furnishingNo=i[1].toString();
	String coachType=i[2].toString();
	String remark=i[3].toString();
	String notificationStageId=i[4].toString();
	String notificationStage=i[5].toString();
	String currentStage=i[6].toString();
	if(remark.equalsIgnoreCase("null")||remark.equalsIgnoreCase(""))
	{
		remark="no remarks given";
	}
%>

		
		
		<tr>
		<td width="10%"><label > <%=shellNo %></label></td>
		<td width="10%"><label > <%=furnishingNo %></label></td>
		<td width="10%"><label> <%=coachType %></label></td>
		<td width="20%"><label > <%=remark %></label></td>
		<td width="10%"><label > <%=notificationStage %></label></td>
		
		<td width="20%"><label> <%=currentStage %></label></td>
		
		</tr>

<% 
}
%>
</table></div>
<input type="submit" style="margin-left:20px;" value="Back" name="SUBMIT" id="SUBMIT" class="submitBtn" onclick="return goBack(this.form)">
</body>
</html>