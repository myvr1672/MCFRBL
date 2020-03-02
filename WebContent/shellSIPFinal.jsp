<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Calendar" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<%@page import="org.hibernate.Criteria" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="hibernateConnect.HibernateConfig" %>
<%@page import="model.SubStagesMaster" %>
<html>
<head>
<title></title>
<% String contextpath=request.getContextPath();
String stageID= request.getParameter("stageId");

 
%>

<script src="<%=contextpath %>/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<link href="<%=contextpath %>/css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="<%=contextpath %>/css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css" />


<script src="<%=contextpath %>/js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/jquery.jtable.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/moment.js" type="text/javascript"></script>

<link href="<%=contextpath %>/js/validationEngine/validationEngine.jquery.css" rel="stylesheet"type="text/css" />

<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine-en.js" type="text/javascript"></script>

<style>

.jtable-input-readonly {
	background-color: lightgray;
}

#overlay{
	/* margin:0px auto;							
	
  display:block; z-index:15;
  width:47px; height:48px;  */
        position: fixed; 
        width: 20%; /* Set your desired with */
        z-index: 2; /* Make sure its above other items. */
        top: 50%;
        left: 50%;
        margin-top: -10%; /* Changes with height. */
        margin-left: -10%; /* Your width divided by 2. */
        /* You will not need the below, its only
           for styling   purposes.*/
        padding: 10px;
        border: 2px solid #555555;
        background-color: #ccc; 
/*        background-color: #4C4CFF; */
}


.hide-calendar .ui-datepicker-calendar {
	display: none;
}
/* button.ui-datepicker-current { display: none; } */
.jtable-child-table-container {
	border: 2px solid blue;
	width: 650px;
}
</style>





<style>
.no-titlebar .ui-dialog-titlebar {
    display: none;
}

.ui-datepicker .ui-datepicker-title select {
    color: #000;
}

.jtable-input-readonly {
	background-color: lightgray;
}

div.jtable-column-header-container {
	height: auto !important;
}

.col1
{
float:left;
padding: 5px 10px 5px 5px;
width: 45%;
}
.col2
{
float:right;
padding: 5px 5px 5px 10px;
width: 45%;
}


#jtable-create-form {
	
	display: block;
	width: 650px;
	
}

#jtable-edit-form {
	display: block;
	width: 650px;
	
}
#error_msg {
  color: red;
  text-align: center;
  margin: 10px auto;
}

.form_success span {
  width: 80%;
  height: 35px;
  margin: 3px 10%;
  font-size: 1.1em;
  color: green;
}
.form_success input {
  border: 1px solid green;
}
.disable{
   cursor: not-allowed;
   pointer-events: none;
   background-color: #cccccc;
  color: #666666;
}
#shellSIPFinal{
		margin:10px;
	}
	table{
		width:1000px;
	}
	.t1 td{
		padding:10px;
	}
	.t3{
		text-align:center;
		width:1000px;
	}
	textarea{
		width:1000px;
		height:200px;
	}
	.t4 td{
		padding:10px;
	}
	.t5 td{
		padding:7px;
	}
	.t5 th{
		font-size:20px;
	}
</style>

<body>
<div id="ShellProductionTableContainer"></div>
 <div id="detailDialog" style="height: 200%; width:50%; display:none;z-index: 9;" ></div>
    <div id="shellSIPFinal" style="height:150%; width:200%; display:none;z-index: 9;">
 	<form name="form1">
		<table class="t1" border="1">
			<tr>
				<td class="t3"><b>Modern Coach Factory Raebareli <br>INSPECTION PROFORMA</b></td>
				<td>DOC NO: <input type="text" id="docNo" class="validate[required]"><br> REV NO: <input type="text" id="docNoRev" class="validate[required]"> <br>DATE:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="docNoDate" class="validate[required]"></td>
			</tr>
		</table>
		<br>
		<table border="1" class="t4">
			<tr>
				<td>Shell Type & No: </td>
				<td><input type="text" id="shellType"></td>
				<td>Shift: </td>
				<td><input type="text" id="shiftOfTesting" class="validate[required]"></td>
				<td>Date: </td>
				<td><input type="text" id="dateOfTesting" class="validate[required]"></td>
			</tr>
		</table>
		<br>
		<table border="1" class="t5">
			<tr>
				<th><b>S.No.</b></th>
				<th><b>Parameter</b></th>
				<th colspan="2"><b>Specified value/Condition</b></th>
				<th><b>Observed value/Condition</b></th>
			</tr>
			<tr>
				<td>1.</td>
				<td>Alignment of roof arch. carline arch. body pillar & U/F channel (L2T.L3T)</td>
				<td colspan="2">OK/Not Ok/NA</td>
				<td><input type="radio" id="alignmentRoofarchCarline" name="alignmentRoofarchCarline" value="Ok">Ok <input type="radio" id="alignmentRoofarchCarline" name="alignmentRoofarchCarline" value="Not Ok">Not Ok <input type="radio" id="alignmentRoofarchCarline" name="alignmentRoofarchCarline" value="N/A">N/A</td>
				
			</tr>
			<tr>
				<td>2.</td>
				<td>Welding & grinding of small RWG</td>
				<td colspan="2">OK/Not Ok/NA</td>
				<td><input type="radio" id="weldingGrindingRwg" name="weldingGrindingRwg" value="Ok">Ok <input type="radio" id="weldingGrindingRwg" name="weldingGrindingRwg" value="Not Ok">Not Ok <input type="radio" id="weldingGrindingRwg" name="weldingGrindingRwg" value="N/A">N/A</td>
				
			</tr>
			<tr>
				<td>3.</td>
				<td>Door cut out back pieces</td>
				<td colspan="2">Provided/Not Provided/NA</td>
				<td><input type="radio" id="doorCutBackPiece" name="doorCutBackPiece" value="Provided">Provided <input type="radio" id="doorCutBackPiece" name="doorCutBackPiece" value="Not Provided">Not Provided <input type="radio" id="doorCutBackPiece" name="doorCutBackPiece" value="N/A">N/A</td>
				
			</tr>
			<tr>
				<td>4.</td>
				<td>Car line and roof sheet joint leakage test</td>
				<td colspan="2">Done/Not Done/NA</td>
				<td><input type="radio" id="carlineRoofsheetLeakageTest" name="carlineRoofsheetLeakageTest" value="Done">Done <input type="radio" id="carlineRoofsheetLeakageTest" name="carlineRoofsheetLeakageTest" value="Not Done">Not Done <input type="radio" id="carlineRoofsheetLeakageTest" name="carlineRoofsheetLeakageTest" value="N/A">N/A</td>
				
			</tr>
			<tr>
				<td>5.</td>
				<td>Welding of attachment wall holding BKT(683,1527mm)</td>
				<td colspan="2">Done/Not Done/NA</td>
				<td><input type="radio" id="weldingAttachmentWallHolding" name="weldingAttachmentWallHolding" value="Done">Done <input type="radio" id="weldingAttachmentWallHolding" name="weldingAttachmentWallHolding" value="Not Done">Not Done <input type="radio" id="weldingAttachmentWallHolding" name="weldingAttachmentWallHolding" value="N/A">N/A</td>
				
			</tr>
			<tr>
				<td>6.</td>
				<td>Welding of auxiliary water tank BKT(620mm)</td>
				<td colspan="2">Done/Not Done/NA</td>
				<td><input type="radio" id="weldingAuxiliaryWatertankBkt" name="weldingAuxiliaryWatertankBkt" value="Done">Done <input type="radio" id="weldingAuxiliaryWatertankBkt" name="weldingAuxiliaryWatertankBkt" value="Not Done">Not Done <input type="radio" id="weldingAuxiliaryWatertankBkt" name="weldingAuxiliaryWatertankBkt" value="N/A">N/A</td>
				
			</tr>
			<tr>
				<td>7.</td>
				<td>Welding & grinding of side wall with sole bar</td>
				<td colspan="2">Done/Not Done/NA</td>
				<td><input type="radio" id="weldingGrindingSidewall" name="weldingGrindingSidewall" value="Done">Done <input type="radio" id="weldingGrindingSidewall" name="weldingGrindingSidewall" value="Not Done">Not Done <input type="radio" id="weldingGrindingSidewall" name="weldingGrindingSidewall" value="N/A">N/A</td>
				
			</tr>
			<tr>
				<td>8.</td>
				<td>Welding of stiffening plate(both side)</td>
				<td colspan="2">Done/Not Done/NA</td>
				<td><input type="radio" id="weldingStiffeningPlate" name="weldingStiffeningPlate" value="Done">Done <input type="radio" id="weldingStiffeningPlate" name="weldingStiffeningPlate" value="Not Done">Not Done <input type="radio" id="weldingStiffeningPlate" name="weldingStiffeningPlate" value="N/A">N/A</td>
				
			</tr>
			<tr>
				<td>9.</td>
				<td>Diagonal of RMPU mounting stud(Should be equal)</td>
				<td colspan="2">3160/2890<br>(at mounting stud)</td>
				<td><input type="text" id="diagonalRmpuMountingStud"></td>
			</tr>
			<tr>
				<td>10.</td>
				<td>Roof element with end wall joint level</td>
				<td colspan="2">Ok/Not Ok/NA</td>
				<td><input type="radio" id="roofelementEndwallJoint" name="roofelementEndwallJoint" value="Ok">Ok <input type="radio" id="roofelementEndwallJoint" name="roofelementEndwallJoint" value="Not Ok">Not Ok <input type="radio" id="roofelementEndwallJoint" name="roofelementEndwallJoint" value="N/A">N/A</td>
				
			</tr>
			<tr>
				<td>11.</td>
				<td>Dimension for AC Opening for RMPU(Lateral/Longitudinal)</td>
				<td colspan="2">2140/2230(outer).<br>2341</td>
				<td><input type="text" id="dimensionAcOpeningRmpu"></td>
			</tr>
			<tr>
				<td>12.</td>
				<td>Lav. Mounting bracket distance(L2T.L3T)</td>
				<td colspan="2">835</td>
				<td><input type="text" id="lavMountingBracketDistance"></td>
			</tr>
			<tr>
				<td>13.</td>
				<td>Car line and roof sheet welding both side</td>
				<td colspan="2">Done/Not Done/NA</td>
				<td><input type="radio" id="carlineRoofsheetWelding" name="carlineRoofsheetWelding" value="Done">Done <input type="radio" id="carlineRoofsheetWelding" name="carlineRoofsheetWelding" value="Not Done">Not Done <input type="radio" id="carlineRoofsheetWelding" name="carlineRoofsheetWelding" value="N/A">N/A</td>
				
			</tr>
			<tr>
				<td>14.</td>
				<td>Roof arch & carline sheet both side welding</td>
				<td colspan="2">Done/Not Done/NA</td>
				<td><input type="radio" id="roofarchCarlineWelding" name="roofarchCarlineWelding" value="Done">Done <input type="radio" id="roofarchCarlineWelding" name="roofarchCarlineWelding" value="Not Done">Not Done <input type="radio" id="roofarchCarlineWelding" name="roofarchCarlineWelding" value="N/A">N/A</td>
				
			</tr>
			<tr>
				<td>15.</td>
				<td>Both side Sidewall vertical pillar & U/F covering plate welding</td>
				<td colspan="2">Done/Not Done/NA</td>
				<td><input type="radio" id="sidewallVerticalpillarCoveringPlateWeld" name="sidewallVerticalpillarCoveringPlateWeld" value="Done">Done <input type="radio" id="sidewallVerticalpillarCoveringPlateWeld" name="sidewallVerticalpillarCoveringPlateWeld" value="Not Done">Not Done <input type="radio" id="sidewallVerticalpillarCoveringPlateWeld" name="sidewallVerticalpillarCoveringPlateWeld" value="N/A">N/A</td>
				
			</tr>
			<tr>
				<td>16.</td>
				<td>Door cut out welding bottom side with Under frame door profile</td>
				<td colspan="2">Done/Not Done/NA</td>
				<td><input type="radio" id="doorCutoutWelding" name="doorCutoutWelding" value="Done">Done <input type="radio" id="doorCutoutWelding" name="doorCutoutWelding" value="Not Done">Not Done <input type="radio" id="doorCutoutWelding" name="doorCutoutWelding" value="N/A">N/A</td>
				
			</tr>
			<tr>
				<td>17.</td>
				<td>Roof element & Lav. Sidewall welding inside & out side</td>
				<td colspan="2">Done/Not Done/NA</td>
				<td><input type="radio" id="roofelementLavsidewallWelding" name="roofelementLavsidewallWelding" value="Done">Done <input type="radio" id="roofelementLavsidewallWelding" name="roofelementLavsidewallWelding" value="Not Done">Not Done <input type="radio" id="roofelementLavsidewallWelding" name="roofelementLavsidewallWelding" value="N/A">N/A</td>
				
			</tr>
			<tr>
				<td>18.</td>
				<td>Lav. sidewall & sidewall both side welding with door cut out</td>
				<td colspan="2">Done/Not Done/NA</td>
				<td><input type="radio" id="lavsidewallSidewallWelding" name="lavsidewallSidewallWelding" value="Done">Done <input type="radio" id="lavsidewallSidewallWelding" name="lavsidewallSidewallWelding" value="Not Done">Not Done <input type="radio" id="lavsidewallSidewallWelding" name="lavsidewallSidewallWelding" value="N/A">N/A</td>
				
			</tr>
			<tr>
				<td>19.</td>
				<td>Both side end wall with Lav. Sidewall, roof element & U/F front part welding</td>
				<td colspan="2">Done/Not Done/NA</td>
				<td><input type="radio" id="endwallLavsidewallRoofUfWelding" name="endwallLavsidewallRoofUfWelding" value="Done">Done <input type="radio" id="endwallLavsidewallRoofUfWelding" name="endwallLavsidewallRoofUfWelding" value="Not Done">Not Done <input type="radio" id="endwallLavsidewallRoofUfWelding" name="endwallLavsidewallRoofUfWelding" value="N/A">N/A</td>
				
			</tr>
			<tr>
				<td>20.</td>
				<td>Complete shell assembly outside & inside grinding work</td>
				<td colspan="2">Done/Not Done/NA</td>
				<td><input type="radio" id="shellAssemblyGrinding" name="shellAssemblyGrinding" value="Done">Done <input type="radio" id="shellAssemblyGrinding" name="shellAssemblyGrinding" value="Not Done">Not Done <input type="radio" id="shellAssemblyGrinding" name="shellAssemblyGrinding" value="N/A">N/A</td>
				
			</tr>
			<tr>
				<td>21.</td>
				<td>Roof element RMPU socket hole die and alignment with end wall</td>
				<td colspan="2">37mm/Ok/Not Ok/NA</td>
				<td><input type="text" id="roofelementRmpuHoleDieAlignment"></td>
				
			</tr>
			<tr>
				<td>22.</td>
				<td>Roof bkt. Fitment in stage IV</td>
				<td colspan="2">Done/Not Done/NA</td>
				<td><input type="radio" id="roofBktFitmentStage4" name="roofBktFitmentStage4" value="Done">Done <input type="radio" id="roofBktFitmentStage4" name="roofBktFitmentStage4" value="Not Done">Not Done <input type="radio" id="roofBktFitmentStage4" name="roofBktFitmentStage4" value="N/A">N/A</td>
				
			</tr>
			<tr>
				<td>23.</td>
				<td>Body width(inside)</td>
				<td colspan="2">3236/-8,+0</td>
				<td><input type="text" id="bodyWidth"></td>
			</tr>
			<tr>
				<td>24.</td>
				<td>Insulating pins</td>
				<td colspan="2">Provided/Not Provided/NA</td>
				<td><input type="radio" id="insulatingPin" name="insulatingPin" value="Provided">Provided <input type="radio" id="insulatingPin" name="insulatingPin" value="Not Provided">Not Provided <input type="radio" id="insulatingPin" name="insulatingPin" value="N/A">N/A</td>
				
			</tr>	
			<tr>
				<td rowspan="2">25.</td>
				<td rowspan="2">Cross brace height</td>
				<td>L3T</td>
				<td>2545+-6</td>
				<td><input type="text" id="crossBraceHeightL3t"></td>
			</tr>
			<tr>
				<td>L2T</td>
				<td>2335+-6</td>
				<td><input type="text" id="crossBraceHeightL2t"></td>
			</tr>
			<tr>
				<td>26.</td>
				<td>Roof height from trough sheet to roof sheet(L3T/L2T)</td>
				<td colspan="2">2986.25+-4<br>2755.3+-3</td>
				<td><input type="text" id="roofHeightTroughSheet"></td>
			</tr>
			<tr>
				<td>27.</td>
				<td>D.B(1230mm) & C.N bkt</td>
				<td colspan="2">Provided/Not Provided</td>
				<td><input type="radio" id="dbCnBkt" name="dbCnBkt" value="Provided">Provided <input type="radio" id="dbCnBkt" name="dbCnBkt" value="Not Provided">Not Provided <input type="radio" id="dbCnBkt" name="dbCnBkt" value="N/A">N/A</td>
				
			</tr>
		</table>
		<br>
			<h3>Testing Observations</h3>
			<textarea id="finalTestingObservation"></textarea>
			
			</form>
		
	</div>

 </body>




<script type="text/javascript">
		$(document).ready(function() {
		
			var srno,i=1;
			var shelltypes=[];
			shelltypes[0]={ Value: "", DisplayText: "Select" };
			
			<c:forEach var="a" items="${shellType}">
			var o = new Option("${a}", "${a}");
			/// jquerify the DOM object 'o' so we can use the html method
			$(o).html("${a}");
			$("#shellType").append(o);
			shelltypes[i]={ Value: "${a}", DisplayText: "${a}" };
		i++;
	    </c:forEach>

  
// for date picker in dialog box
			$('#datepickerExit').datepicker({
		        //inline: true,
		        dateFormat: 'dd-mm-yy',
		        changeMonth: true,
		        changeYear: true,
		        yearRange: '-1:+1',
		        
		        constrainInput: true,
		        duration: '',
		        gotoCurrent: true,
		        beforeShow: function() {
		            setTimeout(function(){
		                $('.ui-datepicker').css('z-index', 99999999999999);
		            }, 0);
		        }

		    }).datepicker("setDate", new Date());
			
			//Date picker code end here
		//start code
			$('#datepickerCompletion').datepicker({
		        //inline: true,
		        dateFormat: 'dd-mm-yy',
		        changeMonth: true,
		        changeYear: true,
		        yearRange: '-1:+1',
		        
		        constrainInput: true,
		        duration: '',
		        gotoCurrent: true,
		        beforeShow: function() {
		            setTimeout(function(){
		                $('.ui-datepicker').css('z-index', 99999999999999);
		            }, 0);
		        }

		    }).datepicker("setDate", new Date());
			//end code
	$('#ShellProductionTableContainer').jtable({
			
			title : 'Shell Shop Production',
			
			paging:true,
            sorting: true,
            defaultSorting: 'shellAssetId ASC',
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
      //Create toolbat
            toolbar: {
                items: [
             
                    {
                    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'ShellSIPFinal',
                        click: function () {
                        	
                        	
                        	
                        	 var $selectedRows = $('#ShellProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a Shell for Final Inspection Report");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
								//setting min value
								// set already existing data
								 $.ajax({
	                    						url : "showExistingShellData",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						async:false,
	                    						data : {
	                    							shellAssetId: record.shellAssetId,
	                    						},
	                    						success:function(data)
	                    						{
	                    							$('#docNo').val(data.formDocNoFinalInspection),	
	                    							$('#docNoRev').val(data.revNoFinalInspection),
	                    							$('#shellType').val(data.shellNo)
	                    							$('#docNoDate').val(data.finalInspectionFormDate)
	                    							
	                    						}
								});  
								//end of code
								
								 if(record.finalSipFlag==1)
									{
										var cfm=confirm("Data for Final Inspection is already updated. Do you want to verify data?");
			                          	if(cfm==false){return false;}	
									$.ajax({
                						url : "showExistingDataOfShellSIPFinal",  //action-name as defined in struts.xml
                						dataType: 'json', 
                						async:false,
                						data : {
                							shellAssetId: record.shellAssetId,
                						},
                						success:function(data)
                						{
                							$('#docNo').val(data.shellFinalSipTran.docNo);	
                							$('#docNoRev').val(data.shellFinalSipTran.docNoRev);
                							$('#shiftOfTesting').val(data.shellFinalSipTran.shiftOfTesting);	
                							var date2=(data.shellFinalSipTran.dateOfTesting).substring(0,10);
                							var date2Array=date2.split("-");
                							$('#dateOfTesting').datepicker("setDate",new Date(date2Array[0],date2Array[1]-1,date2Array[2]));
                							
                							$('[id="alignmentRoofarchCarline"]').val([data.shellFinalSipTran.alignmentRoofarchCarline]);
                							$('[id="weldingGrindingRwg"]').val([data.shellFinalSipTran.weldingGrindingRwg]);
                							$('[id="doorCutBackPiece"]').val([data.shellFinalSipTran.doorCutBackPiece]);
                							$('[id="carlineRoofsheetLeakageTest"]').val([data.shellFinalSipTran.carlineRoofsheetLeakageTest]);
                							$('[id="weldingAttachmentWallHolding"]').val([data.shellFinalSipTran.weldingAttachmentWallHolding]);
                							$('[id="weldingAuxiliaryWatertankBkt"]').val([data.shellFinalSipTran.weldingAuxiliaryWatertankBkt]);
                							$('[id="weldingGrindingSidewall"]').val([data.shellFinalSipTran.weldingGrindingSidewall]);
                							$('[id="weldingStiffeningPlate"]').val([data.shellFinalSipTran.weldingStiffeningPlate]);
                							$('#diagonalRmpuMountingStud').val(data.shellFinalSipTran.diagonalRmpuMountingStud);
                							$('[id="roofelementEndwallJoint"]').val([data.shellFinalSipTran.roofelementEndwallJoint]);
                							$('#dimensionAcOpeningRmpu').val(data.shellFinalSipTran.dimensionAcOpeningRmpu);
                							$('#lavMountingBracketDistance').val(data.shellFinalSipTran.lavMountingBracketDistance);
                							$('[id="carlineRoofsheetWelding"]').val([data.shellFinalSipTran.carlineRoofsheetWelding]);
                							$('[id="roofarchCarlineWelding"]').val([data.shellFinalSipTran.roofarchCarlineWelding]);
                							$('[id="sidewallVerticalpillarCoveringPlateWeld"]').val([data.shellFinalSipTran.sidewallVerticalpillarCoveringPlateWeld]);
                							$('[id="doorCutoutWelding"]').val([data.shellFinalSipTran.doorCutoutWelding]);
                							$('[id="roofelementLavsidewallWelding"]').val([data.shellFinalSipTran.roofelementLavsidewallWelding]);
                							$('[id="lavsidewallSidewallWelding"]').val([data.shellFinalSipTran.lavsidewallSidewallWelding]);
                							$('[id="endwallLavsidewallRoofUfWelding"]').val([data.shellFinalSipTran.endwallLavsidewallRoofUfWelding]);
                							$('[id="shellAssemblyGrinding"]').val([data.shellFinalSipTran.shellAssemblyGrinding]);
                							$('#roofelementRmpuHoleDieAlignment').val(data.shellFinalSipTran.roofelementRmpuHoleDieAlignment);
                							$('[id="roofBktFitmentStage4"]').val([data.shellFinalSipTran.roofBktFitmentStage4]);
                							$('#bodyWidth').val(data.shellFinalSipTran.bodyWidth);
                							$('[id="insulatingPin"]').val([data.shellFinalSipTran.insulatingPin]);
                							$('#crossBraceHeightL3t').val(data.shellFinalSipTran.crossBraceHeightL3t);
                							$('#crossBraceHeightL2t').val(data.shellFinalSipTran.crossBraceHeightL2t);
                							$('#roofHeightTroughSheet').val(data.shellFinalSipTran.roofHeightTroughSheet);
                							$('[id="dbCnBkt"]').val([data.shellFinalSipTran.dbCnBkt]);
                							$('#finalTestingObservation').val(data.shellFinalSipTran.finalTestingObservation);
              
                							
                						}
						                });
									}  
								
								$('#docNoDate').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
								
            					
                    	 	 	$("#shellSIPFinal").dialog({
                    	 	 		title : 'Exit for  '+record.shellTransactionId + 'from Stage- <%=stageID%>',  
                    	 	 		width:'70%',
                    	 	 		close: function (e, u) {
                    	 	 		
                    	 	 			
              	 		          	$("#shellSIPFinal").validationEngine('hideAll');
              	 		         $('#shellSIPFinal').find('form[name="form1"]')[0].reset();
              	 		          },
                	 		 	
 		 							buttons: {
	                                    Submit: {
	                                       text: "Submit",
	                                        id: "my-button-submit",
	                                        click:function () {
	                                    	
	                            	 		
	                                    	if ($('#docNo').validationEngine('validate')) {
				                                        	
				                                return false;
				                            }
                                            if ($('#docNoRev').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
  	                                        
	                                    	if ($('#docNoDate').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
	                                    	if ($('#shiftOfTesting').validationEngine('validate')) {
	                                        	
				                                return false;
				                            }
                                            if ($('#dateOfTesting').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
  	                                        
	                                    	
	                                    	var c=confirm("Do you want to submit data!!");
	                                    	if(c==false){return false;}
                                         
	                                    		    	   
	                                    	$.ajax({
	                    						url : "saveShellSIPFinal",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						data : {
	                    							shellAssetId: record.shellAssetId,
	                    							docNo: $('#docNo').val(),
	                    							docNoRev: $('#docNoRev').val(),
	                    							docNoDate: $('#docNoDate').val(),
	                    							shiftOfTesting: $('#shiftOfTesting').val(),
	                    							dateOfTesting: $('#dateOfTesting').val(),
	                    							alignmentRoofarchCarline: $("input[id='alignmentRoofarchCarline']:checked").val(),
	                    							weldingGrindingRwg: $("input[id='weldingGrindingRwg']:checked").val(),
	                    							doorCutBackPiece: $("input[id='doorCutBackPiece']:checked").val(),
	                    							carlineRoofsheetLeakageTest: $("input[id='carlineRoofsheetLeakageTest']:checked").val(),
	                    							weldingAttachmentWallHolding: $("input[id='weldingAttachmentWallHolding']:checked").val(),
	                    							weldingAuxiliaryWatertankBkt: $("input[id='weldingAuxiliaryWatertankBkt']:checked").val(),
	                    							weldingGrindingSidewall: $("input[id='weldingGrindingSidewall']:checked").val(),
	                    							weldingStiffeningPlate: $("input[id='weldingStiffeningPlate']:checked").val(),
	                    							diagonalRmpuMountingStud: $('#diagonalRmpuMountingStud').val(),
	                    							roofelementEndwallJoint: $("input[id='roofelementEndwallJoint']:checked").val(),
	                    							dimensionAcOpeningRmpu: $('#dimensionAcOpeningRmpu').val(),
	                    							lavMountingBracketDistance: $('#lavMountingBracketDistance').val(),
	                    							carlineRoofsheetWelding: $("input[id='carlineRoofsheetWelding']:checked").val(),
	                    							roofarchCarlineWelding: $("input[id='roofarchCarlineWelding']:checked").val(),
	                    							sidewallVerticalpillarCoveringPlateWeld: $("input[id='sidewallVerticalpillarCoveringPlateWeld']:checked").val(),
	                    							doorCutoutWelding: $("input[id='doorCutoutWelding']:checked").val(),
	                    							roofelementLavsidewallWelding: $("input[id='roofelementLavsidewallWelding']:checked").val(),
	                    							lavsidewallSidewallWelding: $("input[id='lavsidewallSidewallWelding']:checked").val(),
	                    							endwallLavsidewallRoofUfWelding: $("input[id='endwallLavsidewallRoofUfWelding']:checked").val(),
	                    							shellAssemblyGrinding: $("input[id='shellAssemblyGrinding']:checked").val(),
	                    							roofelementRmpuHoleDieAlignment: $('#roofelementRmpuHoleDieAlignment').val(),
	                    							roofBktFitmentStage4: $("input[id='roofBktFitmentStage4']:checked").val(),
	                    							bodyWidth: $('#bodyWidth').val(),
	                    							insulatingPin: $("input[id='insulatingPin']:checked").val(),
	                    							crossBraceHeightL3t: $('#crossBraceHeightL3t').val(),
	                    							crossBraceHeightL2t: $('#crossBraceHeightL2t').val(),
	                    							roofHeightTroughSheet: $('#roofHeightTroughSheet').val(),
	                    							dbCnBkt: $("input[id='dbCnBkt']:checked").val(),
	                    							finalTestingObservation: $('#finalTestingObservation').val(),
	                    							
	                    						
	                    						},
	                    						
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							
	                    							$('#docNo').val(''),
	                    							$('#docNoRev').val('');
	                    							$('#docNoDate').val('');
	                    							$('#shiftOfTesting').val(''),
	                    							$('#dateOfTesting').val(''),
	                    							$("input[id='alignmentRoofarchCarline']:checked").val(''),
	                    							$("input[id='weldingGrindingRwg']:checked").val(''),
	                    							$("input[id='doorCutBackPiece']:checked").val(''),
	                    							$("input[id='carlineRoofsheetLeakageTest']:checked").val(''),
	                    							$("input[id='weldingAttachmentWallHolding']:checked").val(''),
	                    							$("input[id='weldingAuxiliaryWatertankBkt']:checked").val(''),
	                    							$("input[id='weldingGrindingSidewall']:checked").val(''),
	                    							$("input[id='weldingStiffeningPlate']:checked").val(''),
	                    							$('#diagonalRmpuMountingStud').val(''),
	                    							$("input[id='roofelementEndwallJoint']:checked").val(''),
	                    							$('#dimensionAcOpeningRmpu').val(''),
	                    							$("input[id='lavMountingBracketDistance']:checked").val(''),
	                    							$("input[id='carlineRoofsheetWelding']:checked").val(''),
	                    							$("input[id='roofarchCarlineWelding']:checked").val(''),
	                    							$("input[id='sidewallVerticalpillarCoveringPlateWeld']:checked").val(''),
	                    							$("input[id='doorCutoutWelding']:checked").val(''),
	                    							$("input[id='roofelementLavsidewallWelding']:checked").val(''),
	                    							$("input[id='lavsidewallSidewallWelding']:checked").val(''),
	                    							$("input[id='endwallLavsidewallRoofUfWelding']:checked").val(''),
	                    							$("input[id='shellAssemblyGrinding']:checked").val(''),
	                    							$('#roofelementRmpuHoleDieAlignment').val(''),
	                    							$("input[id='roofBktFitmentStage4']:checked").val(''),
	                    							$('#bodyWidth').val(''),
	                    							$("input[id='insulatingPin']:checked").val(''),
	                    							$('#crossBraceHeightL3t').val(''),
	                    							$('#crossBraceHeightL2t').val(''),
	                    							$('#roofHeightTroughSheet').val(''),
	                    							$("input[id='dbCnBkt']:checked").val(''),
	                    							$('#finalTestingObservation').val(''),
	                    							
	                    							$('#shellSIPFinal').dialog('close');
	                    						
	                    							$('#ShellProductionTableContainer').jtable('load');
	         								  })
	         								.error(function (msg){
	         									
	         									alert("Error Fetching Data");
	         								})
	         								  ;
					                 			    	   return true;
				                                    }
	                                    },
				                        Close: function () {
				                        	$('#shellSIPFinal').find('form[name="form1"]')[0].reset();
				                                        $(this).dialog('close');
				                                    }
	                                    },
	                    	        modal: true
    	    });
                    	 		
                    	 		
                    	 		
                    	 		
                    	 		
                    	 		    
            			    	   return true;
                    	 		    
                    	 			  
                    	 		  }//ending else               	  
                    	  // ajax call ends here				
    						 
                        }
                    }
            ]
            },
			actions : {
			
 	
 			listAction: 'listFinalInspectionShellAction?stageID=<%=stageID%>'
 			
 						},
			
			fields : {
				
				sno:{
					title : 'SNo',
					create: false,
					edit : false,
					width: '5%',
					display: function(data)
					{
						
						srno++;
						return srno;
					}
				},
				
				shellAssetId : {
					title : 'shellAssetId',
					width: '8%',
					key: true,
					list : false,
					edit : false,
					create : false
									
					},
					shellTransactionId : {
						title : 'Shell Production Id',
						width: '8%',
						
						list : true,
						edit : false,
						create : true,
						inputClass: 'validate[required]'				
						},
					
						assemblyStartDate: {
							title :'Jig Entry Date',
							width: '8%',
							inputClass: 'validate[required]',
							display:function(data){
										 
								return ((data.record.assemblyStartDate!=null) && (data.record.assemblyStartDate!="") ) ? moment(data.record.assemblyStartDate).format('DD-MM-YYYY') : "";
													}, 
												
											
	                     				     	
							list: true,
							create: true,
							edit: false
											
							},
						
							
				
				
							expectedExitDate : {
					title : 'Expected Dispatch Date',

					display:function(data){
					 
						return ((data.record.expectedExitDate!=null) && (data.record.expectedExitDate!="") ) ? moment(data.record.expectedExitDate).format('DD-MM-YYYY') : "";
											}, 

					inputClass: 'validate[required]',
					edit : false,
					create : true
					
				},
				shellType: {
					title: 'Shell Type',
					width: '10%',
					options: shelltypes,
					
					list: true,
					edit : true
				},
				remarks: {
				   title: 'Remarks',
				   width : '20%',
					type : 'textarea',
					edit : true,
					create: true 
				},
				
				stage1SipFlag:
				{
			title: 'Stage-1 Report',
            width: '3%',
            edit: false,
            create: false,	
            display: function (data) {
           var $img = $('<img src="<%=contextpath%>/images/schedule_form.png" title="Edit Schedule" />');	
           $img.click(function () {
        
        	var wWidth = $(window).width();
			var dWidth = wWidth * 0.9;
			var wheight = $(window).height();
			var dheight = wheight * 0.9;
			var shellAssetId=data.record.shellAssetId;
			
    //var URL="open-final-bogie-SIP-report?bogieAssetId="+bogieAssetId;
    var URL="open-stage1-shell-SIP-report?shellAssetId="+shellAssetId;			
var diagtitle="Stage-1 SIP Report";
					$( "#detailDialog" ).load( URL ).dialog({
															title: diagtitle,
															modal:true,
															height:dheight, 
															width: '40%', 
															}).prev(".ui-dialog-titlebar").css("background","blue");
		
        	
         });
            	
            	return $img;	
            }
				},
				
				stage2SipFlag:
				{
			title: 'Stage-2 Report',
            width: '3%',
            edit: false,
            create: false,	
            display: function (data) {
           var $img = $('<img src="<%=contextpath%>/images/schedule_form.png" title="Edit Schedule" />');	
           $img.click(function () {
        
        	var wWidth = $(window).width();
			var dWidth = wWidth * 0.9;
			var wheight = $(window).height();
			var dheight = wheight * 0.9;
			var shellAssetId=data.record.shellAssetId;
			
    //var URL="open-final-bogie-SIP-report?bogieAssetId="+bogieAssetId;
    var URL="open-stage2-shell-SIP-report?shellAssetId="+shellAssetId;			
var diagtitle="Stage-2 SIP Report";
					$( "#detailDialog" ).load( URL ).dialog({
															title: diagtitle,
															modal:true,
															height:dheight, 
															width: '40%', 
															}).prev(".ui-dialog-titlebar").css("background","blue");
		
        	
         });
            	
            	return $img;	
            }
				},
				
				stage3SipFlag:
				{
			title: 'Stage-3 Report',
            width: '3%',
            edit: false,
            create: false,	
            display: function (data) {
           var $img = $('<img src="<%=contextpath%>/images/schedule_form.png" title="Edit Schedule" />');	
           $img.click(function () {
        
        	var wWidth = $(window).width();
			var dWidth = wWidth * 0.9;
			var wheight = $(window).height();
			var dheight = wheight * 0.9;
			var shellAssetId=data.record.shellAssetId;
			
    //var URL="open-final-bogie-SIP-report?bogieAssetId="+bogieAssetId;
    var URL="open-stage3-shell-SIP-report?shellAssetId="+shellAssetId;			
var diagtitle="Stage-3 SIP Report";
					$( "#detailDialog" ).load( URL ).dialog({
															title: diagtitle,
															modal:true,
															height:dheight, 
															width: '40%', 
															}).prev(".ui-dialog-titlebar").css("background","blue");
		
        	
         });
            	
            	return $img;	
            }
				},
				stage4SipFlag:
				{
			title: 'Stage-4 Report',
            width: '3%',
            edit: false,
            create: false,	
            display: function (data) {
           var $img = $('<img src="<%=contextpath%>/images/schedule_form.png" title="Edit Schedule" />');	
           $img.click(function () {
        
        	var wWidth = $(window).width();
			var dWidth = wWidth * 0.9;
			var wheight = $(window).height();
			var dheight = wheight * 0.9;
			var shellAssetId=data.record.shellAssetId;
			
    //var URL="open-final-bogie-SIP-report?bogieAssetId="+bogieAssetId;
    var URL="open-stage4-shell-SIP-report?shellAssetId="+shellAssetId;			
var diagtitle="Stage-4 SIP Report";
					$( "#detailDialog" ).load( URL ).dialog({
															title: diagtitle,
															modal:true,
															height:dheight, 
															width: '40%', 
															}).prev(".ui-dialog-titlebar").css("background","blue");
		
        	
         });
            	
            	return $img;	
            }
				},
		
				
				assemblySipFlag:
				{
			title: 'Shell Assembly',
            width: '3%',
            edit: false,
            create: false,	
            display: function (data) {
           var $img = $('<img src="<%=contextpath%>/images/schedule_form.png" title="Edit Schedule" />');	
           $img.click(function () {
        
        	var wWidth = $(window).width();
			var dWidth = wWidth * 0.9;
			var wheight = $(window).height();
			var dheight = wheight * 0.9;
			var shellAssetId=data.record.shellAssetId;
			
    //var URL="open-final-bogie-SIP-report?bogieAssetId="+bogieAssetId;
    var URL="open-assembly-shell-SIP-report?shellAssetId="+shellAssetId;			
var diagtitle="Stage-4 SIP Report";
					$( "#detailDialog" ).load( URL ).dialog({
															title: diagtitle,
															modal:true,
															height:dheight, 
															width: '40%', 
															}).prev(".ui-dialog-titlebar").css("background","blue");
		
        	
         });
            	
            	return $img;	
            }
				},
		      
			},
			loadingRecords: function(event,data)
			{
				srno=0;
			},
			recordsLoaded: function(event, data) {
	
				  if (prevStage!='START'){
					 
				     $('#ShellProductionTableContainer').find('.jtable-toolbar-item.jtable-toolbar-item-add-record').remove();
				  }
				  
				},
				formCreated: function (event, data) {
					data.form.find('textarea[name="remarks"]').attr('placeholder','Enter Remarks');
					data.form.find('input[name="assemblyStartDate"]').attr('placeholder','Enter Jig Entry Date');
					data.form.find('input[name="expectedExitDate"]').attr('placeholder','Enter Expected dispatch Date');

						
					//alert(data.record.assemblyStartDate);
					/* $('[name=assemblyStartDate]').
					datepicker("option", "disabled", false ).
					val('').css('background-color' ,'').datepicker("option", "maxDate", new Date);
					$('[name=assemblyStartDate]').val(moment(data.record.assemblyStartDate).format('DD-MM-YYYY'));
					
					$('[name=assemblyStartDate]').datepicker({
					    onSelect: function(selected) {
					    	alert("hello");
					var d=data.assemblyStartDate;
					alert(d);
					    }
					}) */
					
					$('[name=assemblyStartDate]').datepicker({
						
						dateFormat: 'dd-mm-yy',
					    onSelect: function(selected) {
					      $('[name=expectedExitDate]').datepicker("option","minDate", selected)
     // $('[name=assemblyStartDate]').val(moment(selected).format('DD-MM-YYYY'));
					      //$('[name=assemblyStartDate]').datepicker('hide');
					    }
					}).datepicker("option", "maxDate", new Date);;

					$('[name=expectedExitDate]').datepicker({ 
						
						dateFormat: 'dd-mm-yy',
					    onSelect: function(selected) {
					        $('[name=assemblyStartDate]').datepicker("option","maxDate", selected)
  //	$('[name=expectedExitDate]').val(moment(selected).format('DD-MM-YYYY'));
					     //   $(this).datepicker('hide');
 					    }
 					}); 
			
					data.form.validationEngine();
	               	            },
	            recordDeleted: function(event,data)
	    		{
	    			srno=0;
	    			$('#ShellProductionTableContainer').jtable('load');
	    		},
	    		
 
					//Validate form when it is being submitted
				formSubmitting: function (event, data) {
			    return data.form.validationEngine('validate');
			             
			            },
			    
				//Dispose validation logic when form is closed
				formClosed: function (event, data) {
			               data.form.validationEngine('hide');
			               data.form.validationEngine('detach');
				}
	              
			});
	$('#ShellProductionTableContainer').jtable('load');
		});
		
		
	</script>
	 
	<script>
	function setMinDate(){
	
		var from = $('#datepickerCompletion').val(); 
		var numbers = from.match(/\d+/g); 
		
		var date = new Date(numbers[2], numbers[1]-1, numbers[0]);
		
		$('#datepickerExit').datepicker('option', 'minDate', date);
	}
	
	</script>