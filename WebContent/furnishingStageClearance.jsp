<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%@ page import="model.User" %>
<%@page import= "org.hibernate.Session" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import= "org.apache.struts2.ServletActionContext" %>
<%@page import= "org.apache.struts2.dispatcher.SessionMap" %>
<%@page import= "hibernateConnect.HibernateConfig" %>
 <%@ page import="javax.servlet.http.*,javax.servlet.*"%>
 <%@ page import ="java.util.*"%>
 <%@page import="beans.TestingMobileClearance" %>
 <%@page import="dao.DaoFurnishingShow" %>
<% String contextpath=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Furnishing</title>


<link rel="stylesheet" href="<%=contextpath%>/css/furnishingStatus.css" type="text/css"> 

<script src="<%=contextpath %>/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<link href="<%=contextpath %>/css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css" />
<script src="<%=contextpath %>/js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>

<!--    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>  -->
<!--  <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>  -->
<!--  <link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css" rel="stylesheet" type="text/css" />  -->
   <meta name="viewport" content="width=device-width, initial-scale=1">


<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script> -->
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script> -->
<!-- <link href="css/furnishingStatus.css" rel="stylesheet"  type="text/css" /> -->
</head>

<body>
<div id="selectStages" >
</div>
<div id="list">
<ul>
  <li><a class="active" href="ShowDetailsShell">Position of Coach</a></li>
  <li><a href="FailedStages">Failed Shells</a></li>
  <li><a href="stagesInterval">Completed stage in interval</a></li>
  
  <li><a href="ShellStages">Shells in a Stage</a></li>
</ul>
</div>
  <div>
  <table>
  <tr>
		<th width="10%">Coach</th>
		<th width="20%">Furnishing Number</th>
		<th width="25%">Stages</th>
		<th width="30%">Remark</th>
		<th width="20%">Status</th>
	</tr></table>
  </div>

	<% 
	String fai=null;
	DaoFurnishingShow obj=new DaoFurnishingShow();
	List<Object[]> result=obj.getCoaches();
	int i = 0;
	String remark="";
	for (Object[] s: result)
	{
		String testingStatus=null;
		i++;
		Integer furnishingAssetId=Integer.parseInt(s[0].toString());
		String shellNo=s[1].toString();
		String furnishingNo=s[2].toString();
		String coachType=s[3].toString();
		String substageId=s[4].toString();
		String substageDescription=s[5].toString();
		String previousId=s[6].toString();
		String nextId=s[7].toString();
		String stage_sequence=s[8].toString();
		testingStatus=s[9].toString();
		if(testingStatus==null)
			testingStatus="";
		System.out.println("Testing Status: "+testingStatus);
		Object remarks=s[10];   if(remarks!=null) { remark=remarks.toString();}
		
		%>
		
		<div class="divTable">
		<table>
		
		<tr>
		<td width="10%"><label class="Coach" > <%=coachType %></label></td>
		<td width="10%"><label id="furnishingNo" > <%=furnishingNo %></label></td>
		<td width="20%"><label class="substageDesc" > <%=substageDescription %></label></td>
		<td width="20%"><input type="text" id="remark" placeholder="enter remark" name="remark" maxlength="100" value="<%=remark%>" > </td>
		
		<% 
		remark="";
		if(testingStatus.equals("ok"))
		{ %>
		<td width="20%"><input type="radio" id="status" name="status<%=i%>"  value="ok" checked>Completed
		<input type="radio" id="status" name="status<%=i%>" value="running">Running
		<input type="radio" id="status" name="status<%=i%>" value="failed">Failed</td>
		<%} 
		else if(testingStatus.equals("running"))
		{ %>
		<td width="20%"><input type="radio" id="status" name="status<%=i%>"  value="ok" >Completed
		<input type="radio" id="status" name="status<%=i%>" value="running" checked>Running
		<input type="radio" id="status" name="status<%=i%>" value="failed">Failed</td>
		<%} 
		 else if(testingStatus.equals("failed"))
		{ %>
		<td width="20%"><input type="radio" id="status" name="status<%=i%>"  value="ok">Completed
		<input type="radio" id="status" name="status<%=i%>" value="running">Running
		<input type="radio" id="status" name="status<%=i%>" value="failed" checked>Failed</td>
		<%} 
		 else 
		{ %>
		<td width="20%"><input type="radio" id="status" name="status<%=i%>"  value="ok" >Completed
		<input type="radio" id="status" name="status<%=i%>" value="running">Running
		<input type="radio" id="status" name="status<%=i%>" value="failed">Failed</td>
		<%} %>
		</tr>
	
		<tr><td>
		<input type="hidden" id="furnishingAssetId" name="furnishingAssetId" value="<%=furnishingAssetId%>">
		<input type="hidden" id="stageId" name="stageId" value= "<%=substageId %>">
		<input type="hidden" id="testingStatus" name="testingStatus" value="<%=testingStatus %>">
		<input type="hidden" id="previousId" name="previousId" value="<%=previousId %>">
		<input type="hidden" id="nextId" name="nextId" value="<%=nextId%>">
		<input type="hidden" id="coachType" name="coachType" value="<%=coachType%>">
		<input type="hidden" id="substageDescription" name="substageDescription" value="<%=substageDescription%>">
		<input type="hidden" id="stage_sequence" name="stage_sequence" value="<%=stage_sequence%>">
		<input type="button"  value="SUBMIT" name="SUBMIT" id="SUBMIT" class="submitBtn" onClick="return sendValues(this)">
	
		</td></tr>
		</table>
		<script>

		function sendValues(clickedElem)
{
	
	
	var nearestDiv=$(clickedElem).closest('.divTable');
	var coachType=nearestDiv.find('.Coach').text();
	var furnishingAssetId=nearestDiv.find('input[id=furnishingAssetId]').val();
	var stageSequence=nearestDiv.find('input[id=stage_sequence]').val();
	var remark=nearestDiv.find('input[name=remark]').val();
	var substageDescription=nearestDiv.find('.substageDesc').text();
	var testingStatus=nearestDiv.find('input[name=testingStatus]').val();
	var nextId=nearestDiv.find('input[name=nextId]').val();
	var previousId=nearestDiv.find('input[name=previousId]').val();
	var stageId=nearestDiv.find('input[name=stageId]').val();
	//var status=$('input[name=status]').val();
	var status=nearestDiv.find("input[type=radio]:checked").val();
	var saveTestingForm = {coachType :coachType,furnishingAssetId: furnishingAssetId,remark :remark,substageDescription: substageDescription,testingStatus: testingStatus,nextId :nextId,previousId :previousId,stageId: stageId,status: status};
	
	var showStagedata = {coachType: coachType,stageSequence: stageSequence};
	// create dialog box for failed status
	$("#selectStages").dialog({
        autoOpen: false,
        modal: true,
        title: "please select the failed stage",
        buttons: {
            Close: function () {
            	$(this).dialog('close');	
            },
           
        	    Submit: {
	             text: "Click Me",
	              id: "my-button-submit",
	             click:function () {
            	//var notificationStage=$( "#dropdown option:selected" ).text();   retireve display text of dropdown
               var notificationStage=$( "#dropdown option:selected" ).val();
            	var datashowListStages={notificationStageId :notificationStage,furnishingAssetId :furnishingAssetId,stageId :stageId,remark :remark,status: status,coachType: coachType };
            	 $.ajax({
        			url: "SaveTestingClearance", //action defined in struts .xmlm ' 
        			dataType: "json",
        			type: 'POST',
        			data: datashowListStages,
        			success: function(data) {
        				location.reload();
        				//alert("hi navin");
        				 $(this).dialog('close');
        			    	 },
            	 error: function(data) {
		    		 alert("error occured while submitting");
		    		 $(this).dialog('close');	 
		    	 }
        			      }); 
               
            }
        	    }
        }
    });
	
// end of dialog box code
	if ( $("input[type=radio]:checked").length == 0 ) {
	    alert('Please select status');
	    return false;
	   
	}
	else if( status=="ok" || status=="running" )
		{
		$.ajax({
			url: "SaveTestingClearance", //action defined in struts .xmlm ' 
			type: 'POST',
			dataType: "json",
			data: saveTestingForm,
			success: function(data) {
				location.reload();
			},
		error: function(data)
		{
			alert("error in saving");
	    }
		 });
		}
	
	else if( status=="failed" )
		{
		
		
		//var $apdstage=$('select');
		//var stages;
			var $markup=$('<select id="dropdown"></select>');
			$.ajax({
				url: "ShowListStages", //action defined in struts .xmlm ' 
				type: 'POST',
				data: showStagedata,
				

				success: function(data) {
					
					for(var i in data.stageDescList){
						
						if(stageId==data.stageIdList[i]){
							continue;
						}
						//var $option=$('<option> </option>');
						
						var $option="<option value="+data.stageIdList[i]+">"+data.stageDescList[i]+"</option>";
							
						//$option.append(data.stageDescList[i]);
					
						$markup.append($option);
						
						
					}
					
					$("#selectStages").html($markup);
					
	                $("#selectStages").dialog("open");
					
	                
	               // document.getElementById("SUBMIT").blur();
				    	 }
				      });
			
		}
	 
}
					
					
	

</script>
		</div>
		
		
	<%
	}
    %>


</body>


</html>