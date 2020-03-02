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
Session session1=HibernateConfig.getSession();
 Criteria cr1=session1.createCriteria(SubStagesMaster.class);
 cr1.add(Restrictions.eq("substageId", stageID));
 SubStagesMaster subStagesMaster =(SubStagesMaster)cr1.list().get(0);

String previousStage=subStagesMaster.getPreviousstageId();   //return either START or some value. Create option only applicable for where the value is START
String nextStages=subStagesMaster.getNextStageId();
 session1.close();
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
 #bogiePPEndMake,#bogiePPEndSerial,#bogiePPMfgDate,#bogieNPPEndMake,#bogieNPPEndSerial,#bogieNPPMfgDate,
 #fibaPPMake,#fibaPPSerial,#fibaPPMfgDate,#fibaNPPMake,#fibaNPPSerial,#fibaNPPMfgDate,#indicatorPPMake,#indicatorPPSerial,
#indicatorPPMfgDate,#indicatorNPPMake,#indicatorNPPSerial,#indicatorNPPMfgDate,
#initialChargingPPAirSpring1,#initialChargingPPAirSpring2,#initialChargingNPPAirSpring1,#initialChargingNPPAirSpring2,
#leakageDetectionPPAirSpring1,#leakageDetectionPPAirSpring2,#leakageDetectionNPPAirSpring1,#leakageDetectionNPPAirSpring2,
#functionTestFIBAPPAirSpring1,#functionTestFIBAPPAirSpring2,#functionTestFIBANPPAirSpring1,#functionTestFIBANPPAirSpring2,
#functionTestBrakePPAirSpring1,#functionTestBrakePPAirSpring2,#functionTestBrakeNPPAirSpring1,#functionTestBrakeNPPAirSpring2,
#functionTestIndicatorPPAirSpring1,#functionTestIndicatorPPAirSpring2,#functionTestIndicatorNPPAirSpring1,#functionTestIndicatorNPPAirSpring2,
#functionTestWrestingBlowPPAirSpring1,#functionTestWrestingBlowPPAirSpring2,#functionTestWrestingBlowNPPAirSpring1,#functionTestWrestingBlowNPPAirSpring2,
#brakePipeIsolationHissingSoundPPAirSpring1,#brakePipeIsolationHissingSoundPPAirSpring2,#brakePipeIsolationHissingSoundNPPAirSpring1,#brakePipeIsolationHissingSoundNPPAirSpring2,
#brakePipeIsolationBrakeReleasePPAirSpring1, #brakePipeIsolationBrakeReleasePPAirSpring2, #brakePipeIsolationBrakeReleaseNPPAirSpring1,#brakePipeIsolationBrakeReleaseNPPAirSpring2,
#brakePipeVariationPPAirSpring1,#brakePipeVariationPPAirSpring2,#brakePipeVariationNPPAirSpring1,#brakePipeVariationNPPAirSpring2,
#repetitionTestPPAirSpring1,#repetitionTestPPAirSpring2,#repetitionTestNPPAirSpring1,#repetitionTestNPPAirSpring2,
#suppressPipeVariationPPTest1,#suppressPipeVariationPPTest2,#suppressPipeVariationNPPTest1,#suppressPipeVariationNPPTest2
{
border-style:none;
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
</style>



<body>
<div id="FurnishingProductionTableContainer"></div>
<div id="PlumbingTestingSIPDialog" style="height:150%; width:200%; display:none;z-index: 9;" >
<!-- //<h3 align="center">SELF INSPECTION PROFARMA</h3> -->
<form name="PlumbingTestingForm">
<p>DOC NO &nbsp;<input type= text id="plumbingDocNo" name="plumbingDocNo" readonly /></p>
<p><b>Applicability:</b>(All fields are mandatory.Strike out which is not applicable)</p>
<table>
<tr>
	<td>Shell type and No
	<input type= text id="plumbingShellType" name="plumbingShellType" readonly /><input type=text id="plumbingShellNo" name="plumbingShellNo" readonly/></td>
	<td>Furnishing No <input type= text id="plumbingFurnishingNo" name="plumbingFurnishingNo" readonly /></td>
</tr>

<tr>
	<td>Date <input type=text id="plumbingDate" name="plumbingDate" /></td>
	<td>Shift &nbsp;
		<select name="plumbingShift" id="plumbingShift" >
		<option value="none">Select</option>
		<option value="general">General</option>
		<option value="shift-I">Shift-I</option>
		<option value="Shift-II">Shift-II</option>
		<option value="Shift-III">Shift-III</option>
		</select>
	</td>
</tr>
</table>
<br>
<label><b>Observations</b></label>
<table>
<tr>
	<td>1.0 Proper sealing of U/F pipe joints:</td>
	<td><input type=radio id="properSealpipe" value="OK" name="properSealpipe" />OK <input type= radio id="properSealpipe" value="NOT OK" name="properSealpipe" />NOT OK <input type= radio id="properSealpipe" value="NA" name="properSealpipe" />NA
	</td>
</tr>
<tr>
	<td>1.1 Proper sealing in Lavatory area:</td>
	<td><input type=radio id="properSealLavArea" value="OK" name="properSealLavArea" />OK <input type= radio id="properSealLavArea" value="NOT OK" name="properSealLavArea" />NOT OK <input type= radio id="properSealLavArea" value="NA" name="properSealLavArea" />NA
	</td>
</tr>
<tr>
	<td>1.2 Proper sealing in Door way/gang way area:</td>
	<td><input type=radio id="properSealDoorway" value="OK" name="properSealDoorway" />OK <input type= radio id="properSealDoorway" value="NOT OK" name="properSealDoorway" />NOT OK <input type= radio id="properSealDoorway" value="NA" name="properSealDoorway" />NA
	</td>
</tr>
<tr>
	<td>1.3 Water flow in lotach taps:</td>
	<td><input type=radio id="waterFlowLotachTaps" value="OK" name="waterFlowLotachTaps" />OK <input type= radio id="waterFlowLotachTaps" value="NOT OK" name="waterFlowLotachTaps" />NOT OK <input type= radio id="waterFlowLotachTaps" value="NA" name="waterFlowLotachTaps" />NA
	</td>
</tr>
<tr>
	<td>1.4 Water flow inside Wash Basin Taps:</td>
	<td><input type=radio id="waterFlowBasinTap" value="OK" name="waterFlowBasinTap" />OK <input type=radio id="waterFlowBasinTap" value="NOT OK" name="waterFlowBasinTap" />NOT OK <input type= radio id="waterFlowBasinTap" value="NA" name="waterFlowBasinTap" />NA
	</td>
</tr>
<tr>
	<td>1.5 Flushing Arrangement:</td>
	<td><input type=radio id="flushArrange" value="OK" name="flushArrange" />OK <input type=radio id="flushArrange" value="NOT OK" name="flushArrange" />NOT OK <input type=radio id="flushArrange" value="NA" name="flushArrange" />NA
	</td>
</tr>
<tr>
	<td>1.6 Water flow in Lavatory Pan:</td>
	<td><input type=radio id="waterflowLavPan" value="OK" name="waterflowLavPan" />OK <input type=radio id="waterflowLavPan" value="NOT OK" name="waterflowLavPan" />NOT OK <input type=radio id="waterflowLavPan" value="NA" name="waterflowLavPan" />NA
	</td>
</tr>
<tr>
	<td>1.7 Water flow in Commode:</td>
	<td><input type=radio id="waterFlowCommode" value="OK" name="waterFlowCommode" />OK <input type=radio id="waterFlowCommode" value="NOT OK" name="waterFlowCommode" />NOT OK <input type=radio id="waterFlowCommode" value="NA" name="waterFlowCommode" />NA
	</td>
</tr>
<tr>
	<td>1.8 Water flow in outside Wash Basin Tap:</td>
	<td><input type=radio id="waterOutWashBasinTap" value="OK" name="waterOutWashBasinTap" />OK <input  type=radio id="waterOutWashBasinTap" value="NOT OK" name="waterOutWashBasinTap" />NOT OK <input  type=radio id="waterOutWashBasinTap" value="NA" name="waterOutWashBasinTap" />NA
	</td>
</tr>
<tr>
	<td>1.9 proper sealing of s trap:</td>
	<td><input type=radio id="properSeaTrap" value="OK" name="properSeaTrap" />OK <input type=radio id="properSeaTrap" value="NOT OK" name="properSeaTrap" />NOT OK <input type=radio id="properSeaTrap" value="NA" name="properSeaTrap" />NA
	</td>
</tr>
<tr>
	<td>2.0 Water flow in flexible faucet:</td>
	<td><input type=radio id="waterFlowFlexFaucet" value="OK" name="waterFlowFlexFaucet" />OK <input type=radio id="waterFlowFlexFaucet" value="NOT OK" name="waterFlowFlexFaucet" />NOT OK <input type=radio id="waterFlowFlexFaucet" value="NA" name="waterFlowFlexFaucet" />NA
	</td>
</tr>
<tr>
	<td>Deatils of modification carried out(if any):</td>
	<td><textarea rows="4" cols="20" id="plumbingDtlOfmodf"></textarea></td>
</tr>
<tr>
	<td>Deatils of trial items fitted(if any):</td>
	<td><textarea rows="4" cols="20" id="plumbingDtlOfTrial"></textarea></td>
</tr>
<tr>
	<td>Remarks(if any):</td>
	<td><textarea rows="4" cols="20" id="plumbingRemarks"></textarea></td>
</tr>
</table>
<p align="center"><input type= radio id="plumbingConfroming" name="plumbingConfroming"  value="Conforming"/>Conforming
	<input type= radio id="plumbingNonConfroming" name="plumbingNonConfroming" value="Non-Conforming"/>Non-Conforming</p>
</form>
</div>
<div id="ShowerTestingSIPDialog" style="height:150%; width:200%; display:none;z-index: 9;">
<h3 align="center">SELF INSPECTION PROFARMA</h3>
<form name="ShowerTestingForm">
<p>DOC NO &nbsp;<input type= text id="showerTestingDocNo" name="showerTestingDocNo" readonly/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Date <input type=text id="showerTestingDate" name="showerTestingDate"/></p>
<p><b>Applicability:</b>(All fields are mandatory.Strike out which is not applicable)</p>
<table>
<tr>
	<td>Shell type and No
	<input type= text id="showerTestingShellType" name="showerTestingShellType" readonly/><input type=text id="showerShellNo" name="showerShellNo" readonly/></td>
	<td>Furnishing No <input type= text id="showerTestingFurnishingNo" name="showerTestingFurnishingNo"></td>
</tr>

<tr>
	<td>Coach No <input type=text id="showerTestingCoachNo" name="showerTestingCoachNo" readonly /></td>
	<td>Shift &nbsp;
		<select name="showerTestingShift" id="showerTestingShift" >
		<option value="none">Select</option>
		<option value="general">General</option>
		<option value="shift-I">Shift-I</option>
		<option value="Shift-II">Shift-II</option>
		<option value="Shift-III">Shift-III</option>
		</select>
	</td>
</tr>
</table>
<br>
<label><b>1.Observations</b></label>
<table>
<tr>
	<td>1.1 Shower Testing time of coach 15 min :</td>
	<td><input type=radio id="showerTestTimeCoach" value="YES" name="showerTestTimeCoach" />YES <input type= radio id="showerTestTimeCoach" value="NO" name="showerTestTimeCoach" />NO <input type= radio id="showerTestTimeCoach" value="NA" name="showerTestTimeCoach" />NA
	</td>
</tr>
<tr>
	<td>1.2 Leakage found from roof area:</td>
	<td><input type=radio id="leakageRoofArea" value="YES" name="leakageRoofArea" />YES <input type=radio id="leakageRoofArea" value="NO" name="leakageRoofArea" />NO <input type= radio id="leakageRoofArea" value="NA" name="leakageRoofArea" />NA
	</td>
</tr>
<tr>
	<td>1.3 Leakage found from joint between end wall and roof:</td>
	<td><input type=radio id="leakagejointEndwallRoof" value="YES" name="leakagejointEndwallRoof" />YES <input type=radio id="leakagejointEndwallRoof" value="NO" name="leakagejointEndwallRoof" />NO <input type= radio id="leakagejointEndwallRoof" value="NA" name="leakagejointEndwallRoof" />NA
	</td>
</tr>
<tr>
	<td>1.4 Leakage found from cant rail area:</td>
	<td><input type=radio id="leakageCantRailArea" value="YES" name="leakageCantRailArea" />YES <input type=radio id="leakageCantRailArea" value="NO" name="leakageCantRailArea" />NO <input type=radio id="leakageCantRailArea" value="NA" name="leakageCantRailArea" />NA
	</td>
</tr>
<tr>
	<td>1.5 Leakage found from ventilator area(for non-ac coach):</td>
	<td><input type=radio id="leakageVentArea" value="YES" name="leakageVentArea" />YES <input type=radio id="leakageVentArea" value="NO" name="leakageVentArea" />NO <input type= radio id="leakageVentArea" value="NA" name="leakageVentArea" />NA
	</td>
</tr>
<tr>
	<td>1.6 Leakage found from rolling shutter/sliding door:</td>
	<td><input type=radio id="leakageShutterDoor" value="YES" name="leakageShutterDoor" />YES <input type= radio id="leakageShutterDoor" value="NO" name="leakageShutterDoor" />NO <input type= radio id="leakageShutterDoor" value="NA" name="leakageShutterDoor" />NA
	</td>
</tr>
<tr>
	<td>1.7 Leakage found from AC trough:</td>
	<td><input type=radio id="leakageAcTrough" value="YES" name="leakageAcTrough" />YES <input type= radio id="leakageAcTrough" value="NO" name="leakageAcTrough" />NO <input type=radio id="leakageAcTrough" value="NA" name="leakageAcTrough" />NA
	</td>
</tr>
<tr>
	<td>1.8 Leakage found from Windows :</td>
	<td><input type=radio id="leakageWindows" value="YES" name="leakageWindows" />YES <input type= radio id="leakageWindows" value="NO" name="leakageWindows" />NO <input type= radio id="leakageWindows" value="NA" name="leakageWindows" />NA
	</td>
</tr>
<tr>
	<td>Remarks(if any):</td>
	<td><textarea rows="4" cols="20" id="showerTestingRemarks"></textarea></td>
</tr>
</table>
<p align="center"><input type= radio id="showerTestingConfroming" name="showerTestingConfroming"  value="Conforming"/>Conforming
	<input type= radio id="showerTestingConfroming" name="showerTestingConfroming" value="Non-Conforming"/>Non-Conforming</p>
</form>
</div>
<div id="BioTankTestingSIPDialog" style="height:150%; width:200%; display:none;z-index: 9;" >
 <h3 align="center">SELF INSPECTION PROFARMA</h3>  
<form name="bioTankTestingForm">
<p><b>DOC NO &nbsp;<input type= text id="bioTankTestingDocNo" name="bioTankTestingDocNo" readonly />&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
Date <input type=text id="bioTankTestingDate" name="bioTankTestingDate"/></b></p>Shift &nbsp;
		<select name="bioTankTestingShift" id="bioTankTestingShift" >
		<option value="none">Select</option>
		<option value="general">General</option>
		<option value="shift-I">Shift-I</option>
		<option value="Shift-II">Shift-II</option>
		<option value="Shift-III">Shift-III</option>
		</select>
<p><b>Fur No.&nbsp;&nbsp;&nbsp;</b>&nbsp;&nbsp;<input type=text id="bioTankTestingFurNo" name="bioTankTestingFurNo" readonly/></p>
<table>
<tr>
	<td><b>Bio tank make:</b></td>
	<td><b>Lav.1<input type=text id="bioTankTestingMakeLav1" name="bioTankTestingMakeLav1"/></b></td>
	<td><b>Lav.2<input type=text id="bioTankTestingMakeLav2" name="bioTankTestingMakeLav2"/></b></td>
	<td><b>Lav.3<input type=text id="bioTankTestingMakeLav3" name="bioTankTestingMakeLav3"/></b></td>
	<td><b>Lav.4<input type=text id="bioTankTestingMakeLav4" name="bioTankTestingMakeLav4"/></b></td>
</tr>
<tr>
	<td><b>Bacteria:</b></td>
	<td colspan=2><b>Type<input type=text id="bioTankTestingBacteriaType" name="bioTankTestingBacteriaType" size="50"/></b></td>
	<td><b>Make <input type=text id="bioTankTestingBacteriaMake" name="bioTankTestingBacteriaMake"/></b></td>
	<td><b>Feeding date<input type=text id="bioTankTestingBacteriaFeedDate" name=bioTankTestingBacteriaFeedDate/></b></td>
</tr>

</table>
<table border='1' width=100% height=100% cellpadding=0 cellspacing=0>
<tr>
	<td rowspan=2>S.No</td>
	<td rowspan=2 width=30% align="center">Check list</td>
	<td colspan=4 width=50% align="center">Obseravtion</td>
	<td rowspan=2 align="center">If Not Ok, then defect therein</td>
</tr>
<tr>
	<td>Lav-1</td>
	<td>Lav-2</td>
	<td>Lav-3</td>
	<td>Lav-4</td>
</tr>
<tr>
	<td>1</td>
	<td>Welding of mounting brackets, ribs and bend/breakage etc.(Must be free any weld defects and bend/breakage)</td>
	<td><input type=radio id="weldRibBendBrklav1" name="weldRibBendBrklav1" value="OK"/>OK <input type=radio id="weldRibBendBrklav1" name="weldRibBendBrklav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="weldRibBendBrklav2" name="weldRibBendBrklav2" value="OK"/>OK <input type=radio id="weldRibBendBrklav2" name="weldRibBendBrklav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="weldRibBendBrklav3" name="weldRibBendBrklav3" value="OK"/>OK <input type=radio id="weldRibBendBrklav3" name="weldRibBendBrklav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="weldRibBendBrklav4" name="weldRibBendBrklav4" value="OK"/>OK <input type=radio id="weldRibBendBrklav4" name="weldRibBendBrklav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="weldRibBendBrk" /></td>
</tr>
<tr>
	<td>2</td>
	<td>Proper mounting of bio-tanks and tightening of its nut and bolts</td>
	<td><input type=radio id="properBioTankTightlav1" name="properBioTankTightlav1" value="OK"/>OK <input type=radio id="properBioTankTightlav1" name="properBioTankTightlav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="properBioTankTightlav2" name="properBioTankTightlav2" value="OK"/>OK <input type=radio id="properBioTankTightlav2" name="properBioTankTightlav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="properBioTankTightlav3" name="properBioTankTightlav3" value="OK"/>OK <input type=radio id="properBioTankTightlav3" name="properBioTankTightlav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="properBioTankTightlav4" name="properBioTankTightlav4" value="OK"/>OK <input type=radio id="properBioTankTightlav4" name="properBioTankTightlav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="properBioTankTight" /></td>
</tr>
<tr>
	<td>3</td>
	<td>Pan outlet hole alignment with opening of ball valve of bio tank</td>
	<td><input type=radio id="panOutAlignBallValvelav1" name="panOutAlignBallValvelav1" value="OK"/>OK <input type=radio id="panOutAlignBallValvelav1" name="panOutAlignBallValvelav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="panOutAlignBallValvelav2" name="panOutAlignBallValvelav2" value="OK"/>OK <input type=radio id="panOutAlignBallValvelav2" name="panOutAlignBallValvelav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="panOutAlignBallValvelav3" name="panOutAlignBallValvelav3" value="OK"/>OK <input type=radio id="panOutAlignBallValvelav3" name="panOutAlignBallValvelav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="panOutAlignBallValvelav4" name="panOutAlignBallValvelav4" value="OK"/>OK <input type=radio id="panOutAlignBallValvelav4" name="panOutAlignBallValvelav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="panOutAlignBallValve" /></td>
</tr>
<tr>
	<td>4</td>
	<td>a) Welding condition of J-bracket</td>
	<td><input type=radio id="weldCondJbracketlav1" name="weldCondJbracketlav1" value="OK"/>OK <input type=radio id="weldCondJbracketlav1" name="weldCondJbracketlav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="weldCondJbracketlav2" name="weldCondJbracketlav2" value="OK"/>OK <input type=radio id="weldCondJbracketlav2" name="weldCondJbracketlav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="weldCondJbracketlav3" name="weldCondJbracketlav3" value="OK"/>OK <input type=radio id="weldCondJbracketlav3" name="weldCondJbracketlav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="weldCondJbracketlav4" name="weldCondJbracketlav4" value="OK"/>OK <input type=radio id="weldCondJbracketlav4" name="weldCondJbracketlav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="weldCondJbracket" /></td></tr>
<tr>
	<td></td>
	<td>b)fitting of Bio tank on J-bracket</td>
	<td><input type=radio id="fitBioJbracketlav1" name="fitBioJbracketlav1" value="OK"/>OK <input type=radio id="fitBioJbracketlav1" name="fitBioJbracketlav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="fitBioJbracketlav2" name="fitBioJbracketlav2" value="OK"/>OK <input type=radio id="fitBioJbracketlav2" name="fitBioJbracketlav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="fitBioJbracketlav3" name="fitBioJbracketlav3" value="OK"/>OK <input type=radio id="fitBioJbracketlav3" name="fitBioJbracketlav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="fitBioJbracketlav4" name="fitBioJbracketlav4" value="OK"/>OK <input type=radio id="fitBioJbracketlav4" name="fitBioJbracketlav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="fitBioJbracket" /></td>
</tr>
<tr>
	<td></td>
	<td>c) Rubber connecter and its clamp condition</td>
	<td><input type=radio id="rubberConnCondlav1" name="rubberConnCondlav1" value="OK"/>OK <input type=radio id="rubberConnCondlav1" name="rubberConnCondlav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="rubberConnCondlav2" name="rubberConnCondlav2" value="OK"/>OK <input type=radio id="rubberConnCondlav2" name="rubberConnCondlav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="rubberConnCondlav3" name="rubberConnCondlav3" value="OK"/>OK <input type=radio id="rubberConnCondlav3" name="rubberConnCondlav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="rubberConnCondlav4" name="rubberConnCondlav4" value="OK"/>OK <input type=radio id="rubberConnCondlav4" name="rubberConnCondlav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="rubberConnCond" /></td>
</tr>
<tr>
	<td></td>
	<td>d) Leakage from thread of chlorination unit</td>
	<td><input type=radio id="leakChloUnitlav1" name="leakChloUnitlav1" value="OK"/>OK <input type=radio id="leakChloUnitlav1" name="leakChloUnitlav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="leakChloUnitlav2" name="leakChloUnitlav2" value="OK"/>OK <input type=radio id="leakChloUnitlav2" name="leakChloUnitlav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="leakChloUnitlav3" name="leakChloUnitlav3" value="OK"/>OK <input type=radio id="leakChloUnitlav3" name="leakChloUnitlav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="leakChloUnitlav4" name="leakChloUnitlav4" value="OK"/>OK <input type=radio id="leakChloUnitlav4" name="leakChloUnitlav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="leakChloUnit" /></td>
</tr>
<tr>
	<td></td>
	<td>e) Condition of Chlorination</td>
	<td><input type=radio id="condOfChlolav1" name="condOfChlolav1" value="OK"/>OK <input type=radio id="condOfChlolav1" name="condOfChlolav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="condOfChlolav2" name="condOfChlolav2" value="OK"/>OK <input type=radio id="condOfChlolav2" name="condOfChlolav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="condOfChlolav3" name="condOfChlolav3" value="OK"/>OK <input type=radio id="condOfChlolav3" name="condOfChlolav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="condOfChlolav4" name="condOfChlolav4" value="OK"/>OK <input type=radio id="condOfChlolav4" name="condOfChlolav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="condOfChlol" /></td>
</tr>
<tr>
	<td></td>
	<td>f) Condition of safety strap(check any damage near edge of tank)</td>
	<td><input type=radio id="condOfSafeStraplav1" name="condOfSafeStraplav1" value="OK"/>OK <input type=radio id="condOfSafeStraplav1" name="condOfSafeStraplav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="condOfSafeStraplav2" name="condOfSafeStraplav2" value="OK"/>OK <input type=radio id="condOfSafeStraplav2" name="condOfSafeStraplav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="condOfSafeStraplav3" name="condOfSafeStraplav3" value="OK"/>OK <input type=radio id="condOfSafeStraplav3" name="condOfSafeStraplav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="condOfSafeStraplav4" name="condOfSafeStraplav4" value="OK"/>OK <input type=radio id="condOfSafeStraplav4" name="condOfSafeStraplav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="condOfSafeStrap" /></td>
</tr>
<tr>
	<td></td>
	<td>g) Leakage from rubber gasket/sealing due to blockage of inner pipe of chlorinator</td>
	<td><input type=radio id="leakRubberBlockChlorlav1" name="leakRubberBlockChlorlav1" value="OK"/>OK <input type=radio id="leakRubberBlockChlorlav1" name="leakRubberBlockChlorlav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="leakRubberBlockChlorlav2" name="leakRubberBlockChlorlav2" value="OK"/>OK <input type=radio id="leakRubberBlockChlorlav2" name="leakRubberBlockChlorlav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="leakRubberBlockChlorlav3" name="leakRubberBlockChlorlav3" value="OK"/>OK <input type=radio id="leakRubberBlockChlorlav3" name="leakRubberBlockChlorlav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="leakRubberBlockChlorlav4" name="leakRubberBlockChlorlav4" value="OK"/>OK <input type=radio id="leakRubberBlockChlorlav4" name="leakRubberBlockChlorlav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="leakRubberBlockChlor" /></td>
</tr>
<tr>
	<td>5</td>
	<td>Any leakage in joint/connection in complete system including Bio toilet tank/water pipe line etc </td>
	<td><input type=radio id="leakJointConnCompSyslav1" name="leakJointConnCompSyslav1" value="OK"/>OK <input type=radio id="leakJointConnCompSyslav1" name="leakJointConnCompSyslav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="leakJointConnCompSyslav2" name="leakJointConnCompSyslav2" value="OK"/>OK <input type=radio id="leakJointConnCompSyslav2" name="leakJointConnCompSyslav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="leakJointConnCompSyslav3" name="leakJointConnCompSyslav3" value="OK"/>OK <input type=radio id="leakJointConnCompSyslav3" name="leakJointConnCompSyslav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="leakJointConnCompSyslav4" name="leakJointConnCompSyslav4" value="OK"/>OK <input type=radio id="leakJointConnCompSyslav4" name="leakJointConnCompSyslav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="leakJointConnCompSys" /></td>
</tr>
<tr>
	<td>6</td>
	<td>Functionality of flush button/lever and water taps</td>
	<td><input type=radio id="funcOfFlushButtlav1" name="funcOfFlushButtlav1" value="OK"/>OK <input type=radio id="funcOfFlushButtlav1" name="funcOfFlushButtlav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="funcOfFlushButtlav2" name="funcOfFlushButtlav2" value="OK"/>OK <input type=radio id="funcOfFlushButtlav2" name="funcOfFlushButtlav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="funcOfFlushButtlav3" name="funcOfFlushButtlav3" value="OK"/>OK <input type=radio id="funcOfFlushButtlav3" name="funcOfFlushButtlav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="funcOfFlushButtlav4" name="funcOfFlushButtlav4" value="OK"/>OK <input type=radio id="funcOfFlushButtlav4" name="funcOfFlushButtlav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="funcOfFlushButt" /></td>
</tr>
<tr>
	<td>7</td>
	<td>Sufficient flushing of the pan(manually)</td>
	<td><input type=radio id="suffFlushPanlav1" name="suffFlushPanlav1" value="OK"/>OK <input type=radio id="suffFlushPanlav1" name="suffFlushPanlav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="suffFlushPanlav2" name="suffFlushPanlav2" value="OK"/>OK <input type=radio id="suffFlushPanlav2" name="suffFlushPanlav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="suffFlushPanlav3" name="suffFlushPanlav3" value="OK"/>OK <input type=radio id="suffFlushPanlav3" name="suffFlushPanlav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="suffFlushPanlav4" name="suffFlushPanlav4" value="OK"/>OK <input type=radio id="suffFlushPanlav4" name="suffFlushPanlav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="suffFlushPan" /></td>
</tr>
<tr>
	<td>8</td>
	<td>Any foul odour(if yes)specify whether light, medium or heavy</td>
	<td><input type=radio id="odourMedHeavylav1" name="odourMedHeavylav1" value="OK"/>OK <input type=radio id="odourMedHeavylav1" name="odourMedHeavylav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="odourMedHeavylav2" name="odourMedHeavylav2" value="OK"/>OK <input type=radio id="odourMedHeavylav2" name="odourMedHeavylav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="odourMedHeavylav3" name="odourMedHeavylav3" value="OK"/>OK <input type=radio id="odourMedHeavylav3" name="odourMedHeavylav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="odourMedHeavylav4" name="odourMedHeavylav4" value="OK"/>OK <input type=radio id="odourMedHeavylav4" name="odourMedHeavylav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="odourMedHeavy" /></td>
</tr>
<tr>
	<td>9</td>
	<td>Stickers for users in Hindi/English</td>
	<td><input type=radio id="stickUserlav1" name="stickUserlav1" value="OK"/>OK <input type=radio id="stickUserlav1" name="stickUserlav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="stickUserlav2" name="stickUserlav2" value="OK"/>OK <input type=radio id="stickUserlav2" name="stickUserlav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="stickUserlav3" name="stickUserlav3" value="OK"/>OK <input type=radio id="stickUserlav3" name="stickUserlav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="stickUserlav4" name="stickUserlav4" value="OK"/>OK <input type=radio id="stickUserlav4" name="stickUserlav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="stickUser" /></td>
</tr>
<tr>
	<td>10</td>
	<td>Chocking of S-Trap(YES/NO),if Yes give reasons</td>
	<td><input type=radio id="chockStraplav1" name="chockStraplav1" value="OK"/>OK <input type=radio id="chockStraplav1" name="chockStraplav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="chockStraplav2" name="chockStraplav2" value="OK"/>OK <input type=radio id="chockStraplav2" name="chockStraplav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="chockStraplav3" name="chockStraplav3" value="OK"/>OK <input type=radio id="chockStraplav3" name="chockStraplav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="chockStraplav4" name="chockStraplav4" value="OK"/>OK <input type=radio id="chockStraplav4" name="chockStraplav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="chockStrap" /></td>
</tr>
<tr>
	<td>11</td>
	<td>Consumption of water shall be about 0.5 liter/flush.(MDTS-49281 REV 04)</td>
	<td><input type=radio id="consumpFlushlav1" name="consumpFlushlav1" value="OK"/>OK <input type=radio id="consumpFlushlav1" name="consumpFlushlav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="consumpFlushlav2" name="consumpFlushlav2" value="OK"/>OK <input type=radio id="consumpFlushlav2" name="consumpFlushlav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="consumpFlushlav3" name="consumpFlushlav3" value="OK"/>OK <input type=radio id="consumpFlushlav3" name="consumpFlushlav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="consumpFlushlav4" name="consumpFlushlav4" value="OK"/>OK <input type=radio id="consumpFlushlav4" name="consumpFlushlav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="consumpFlush" /></td>
</tr>
<tr>
	<td>12</td>
	<td>System becomes ready for next flush cycle after 18 sec approx.(MDTS-49281 REV 04)</td>
	<td><input type=radio id="sysFlushCyclelav1" name="sysFlushCyclelav1" value="OK"/>OK <input type=radio id="sysFlushCyclelav1" name="sysFlushCyclelav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="sysFlushCyclelav2" name="sysFlushCyclelav2" value="OK"/>OK <input type=radio id="sysFlushCyclelav2" name="sysFlushCyclelav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="sysFlushCyclelav3" name="sysFlushCyclelav3" value="OK"/>OK <input type=radio id="sysFlushCyclelav3" name="sysFlushCyclelav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="sysFlushCyclelav4" name="sysFlushCyclelav4" value="OK"/>OK <input type=radio id="sysFlushCyclelav4" name="sysFlushCyclelav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="sysFlushCycle" /></td>
</tr>
<tr>
	<td>13</td>
	<td> All parts of vaccum toilet evacuation installed under carriage shall be atleast 225mm of rail level.(MTDS-49281 REV 04)</td>
	<td><input type=radio id="allPrtVaccToiletlav1" name="allPrtVaccToiletlav1" value="OK"/>OK <input type=radio id="allPrtVaccToiletlav1" name="allPrtVaccToiletlav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="allPrtVaccToiletlav2" name="allPrtVaccToiletlav2" value="OK"/>OK <input type=radio id="allPrtVaccToiletlav2" name="allPrtVaccToiletlav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="allPrtVaccToiletlav3" name="allPrtVaccToiletlav3" value="OK"/>OK <input type=radio id="allPrtVaccToiletlav3" name="allPrtVaccToiletlav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="allPrtVaccToiletlav4" name="allPrtVaccToiletlav4" value="OK"/>OK <input type=radio id="allPrtVaccToiletlav4" name="allPrtVaccToiletlav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="allPrtVaccToilet" /></td>
</tr>
<tr>
	<td>14</td>
	<td>Air pressure supply 6kg/cm2 </td>
	<td><input type=radio id="airPressureSupplav1" name="airPressureSupplav1" value="OK"/>OK <input type=radio id="airPressureSupplav1" name="airPressureSupplav1" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="airPressureSupplav2" name="airPressureSupplav2" value="OK"/>OK <input type=radio id="airPressureSupplav2" name="airPressureSupplav2" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="airPressureSupplav3" name="airPressureSupplav3" value="OK"/>OK <input type=radio id="airPressureSupplav3" name="airPressureSupplav3" value="NOT OK"/>NOT OK</td>
	<td><input type=radio id="airPressureSupplav4" name="airPressureSupplav4" value="OK"/>OK <input type=radio id="airPressureSupplav4" name="airPressureSupplav4" value="NOT OK"/>NOT OK</td>
	<td><input type=text id="airPressureSupp" /></td>
</tr>
</table>
<p><b>Important:As water should sealed with rubber/Teflon seal, so application SIKA etc, on any joints to arrest leakage is not allowed.</b></p>
<p align="center"><input type=radio id="bioTankConforming" name="bioTankConforming" value="Conforming" />Conforming <input type=radio id="bioTankConforming" name="bioTankConforming" value="Non-Coforming" />Non-Conforming</p>
</form>
</div>

<div id="AirBrakeDialog" style="height:150%;width:200%;display:none;z-index:9;">

<form name="AirBrakeSip">
<table style="width:77%; cellspacing:0">
<tr>
<td width="25%">
SHELL TYPE & NO
</td>
<td>
<input type="text" id="shellTypeNo" name="shellTypeNo" size="20" readonly/>
</td>
<td>
FURNISHING
</td>
<td>
<input type="text" id="furnishing" name="furnishing" size="10" readonly/>
</td>
<td>
DATE/SHIFT
</td>
<td>
<input type="text" id="airBrakeDate" name="airBrakeDate" size="10"/>
</td>
<td width="10%">
<select name='airBrakeShift' id='airBrakeShift'>
		<option value="">Select</option>
		<option value="general">General</option>
		<option value="shift-I">Shift-I</option>
		<option value="Shift-II">Shift-II</option>
		<option value="Shift-III">Shift-III</option>
	</select>
</td>
</tr>
<tr>
<td width="25%">
DOC NO.:
</td>
<td>
<input type="text" id="docNo" name="docNo" size="20" readonly/>
</td>
<td>
</td>
<td>
</td>
<td>
</td>
<td>
</td>
<td>
</td>
</tr>
<tr height="20px">
<td colspan=7>
</td>
</tr>
<tr>
<td>
<b>1. REFERENCE:</b>
</td>
<td colspan=6>
1.1 Fiat document no. TA 18604_50_02en, Revision no. Nil, of 6 Pages & RCF/KXHSME/D's letter no. MD/46131 dated 08/04/2006
</td>
</tr>
<tr>
<td>
</td>
<td colspan=6>
1.2 Inspection Report/Furnishing Stage/ Air Brake Test of RCF/KXH Form No QMF 9757 Version 3.0
</td>
</tr>
<tr height="20px">
<td colspan=7>
</td>
</tr>
<tr>
<td colspan=2>
<b>PRESSURE LEVEL</b>
</td>
<td colspan=2 align="center">
<b>B.P.:</b>&nbsp;&nbsp;5.0+-0.2 Kg/cm<sup>2</sup>
</td>
<td colspan=2>
<b>F.P.:</b>&nbsp;&nbsp;>= 6.0 Kg/cm<sup>2</sup>
</td>
<td colspan=1>
</td>
</tr>
</table>
<br>
<p><b>DATA OF TRACEABILITY</b></p>
<table cellspacing="0" width="77%" border="1">
<tr>
<td width="5%" align="center">
<b>S.NO</b>
</td>
<td width="50%" align="center">
<b>ITEMS</b>
</td>
<td width="22%" align="center">
<b>MAKE</b>
</td>
<td width="22%" align="center">
<b>SERIAL NO</b>
</td>
</tr>
<tr>
<td align="center">
1
</td>
<td>
BOGIE PP END
</td>
<td>
<input type="text" id="bogiePPMake" name="bogiePPMake" style="border:none;" readonly/>
</td>
<td>
<input type="text" id="bogiePPSerialNo" name="bogiePPSerialNo" style="border:none;" readonly/>
</td>
</tr>
<tr>
<td align="center">
2
</td>
<td>
BOGIE NPP END
</td>
<td>
<input type="text" id="bogieNPPMake" name="bogieNPPMake" style="border:none;" readonly/>
</td>
<td>
<input type="text" id="bogieNPPSerialNo" name="bogieNPPSerialNo" style="border:none;" readonly/>
</td>
</tr>
<tr>
<td align="center">
3
</td>
<td>
CBC PP END
</td>
<td>
<input type="text" id="cbcPPMake" name="cbcPPMake" style="border:none;"/>
</td>
<td>
<input type="text" id="cbcPPSerialNo" name="cbcPPSerialNo" style="border:none;"/>
</td>
</tr>
<tr>
<td align="center">
4
</td>
<td>
CBC NPP END
</td>
<td>
<input type="text" id="cbcNPPMake" name="cbcNPPMake" style="border:none;"/>
</td>
<td>
<input type="text" id="cbcNPPSerialNo" name="cbcNPPSerialNo" style="border:none;"/>
</td>
</tr>
<tr>
<td align="center">
5
</td>
<td>
BUFFER(if applicable)
</td>
<td>
<input type="text" id="bufferMake" name="bufferMake" style="border:none;"/>
</td>
<td>
<input type="text" id="bufferSerialNo" name="bufferSerialNo" style="border:none;"/>
</td>
</tr>
<tr>
<td align="center">
6
</td>
<td>
BRAKE PANEL
</td>
<td>
<input type="text" id="brakePanelMake" name="brakePanelMake" style="border:none;"/>
</td>
<td>
<input type="text" id="brakePanelSerialNo" name="brakePanelSerialNo" style="border:none;"/>
</td>
</tr>
<tr>
<td align="center">
7
</td>
<td>
DISTRIBUTOR VALVE
</td>
<td>
<input type="text" id="distributorValveMake" name="distributorValveMake" style="border:none;"/>
</td>
<td>
<input type="text" id="distributorValveSerialNo" name="distributorValveSerialNo" style="border:none;"/>
</td>
</tr>
<tr>
<td align="center">
8
</td>
<td>
PULL BOX(If applicable)
</td>
<td>
<input type="text" id="pullBoxMake" name="pullBoxMake" style="border:none;"/>
</td>
<td>
<input type="text" id="pullBoxSerialNo" name="pullBoxSerialNo" style="border:none;"/>
</td>
</tr>
<tr>
<td align="center">
9
</td>
<td>
HAND BRAKE(If applicable)
</td>
<td>
<input type="text" id="handBrakeMake" name="handBrakeMake" style="border:none;"/>
</td>
<td>
<input type="text" id="handBrakeSerialNo" name="handBrakeSerialNo" style="border:none;"/>
</td>
</tr>
</table>
<p><b>3. OBSERVATIONS</b></p>
<table border="1" width="77%" cellspacing=0>
<tr>
<td width="4%">
<b>S.NO</b>
</td>
<td width="6%">
<b>ITEM/TEXT</b>
</td>
<td colspan=2 width="69%" align="center">
<b>DESCRIPTION</b>
</td>
<td width="7%">
<b>MEASURING POINTS</b>
</td>
<td width="10%">
<b>SPEC. VALUE</b>
</td>
<td width="4%">
<b>ACTUAL</b>
</td>
</tr>
<tr>
<td rowspan="11">
3.1
</td>
<td rowspan="11">
Pre Text
</td>
<td colspan=2>
3.1.1 Lock coach so it cannot roll
</td>
<td>
</td>
<td >
</td>
<td>
<input type="text" id="preTextLockCoach" name="preTextLockCoach" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.1.2 Comformity of the mounted brake devices with piping diagram
</td>
<td>
</td>
<td >
</td>
<td>
<input type="text" id="preTextConformity" name="preTextConformity" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.1.3 Verify all brake devices and pipes
</td>
<td>
</td>
<td >
</td>
<td>
<input type="text" id="preTextVerifyBrake" name="preTextVerifyBrake" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.1.4 Verify positions of cocks
</td>
<td>
</td>
<td >
</td>
<td>
<input type="text" id="preTextVerifyCock" name="preTextVerifyCock" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td width="50%" rowspan=3>
3.1.4.1 Opened cocks
</td>
<td width="50%">
B 10.3
</td>
<td>
</td>
<td >
</td>
<td>
<input type="text" id="preTextOpenedCock10_3" name="preTextOpenedCock10_3" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td width="50%">
B 10.4/1
</td>
<td>
</td>
<td >
</td>
<td>
<input type="text" id="preTextOpenedCock10_41" name="preTextOpenedCock10_41" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td width="50%">
B 10.4/2
</td>
<td>
</td>
<td >
</td>
<td>
<input type="text" id="preTextOpenedCock10_42" name="preTextOpenedCock10_42" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.1.4.2 Emergency Cock N 4 Closed for Power Car
</td>
<td>
</td>
<td >
</td>
<td>
<input type="text" id="preTextEmergencyCock" name="preTextEmergencyCock" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.1.4.3 Distributor Valve switched on
</td>
<td>
</td>
<td >
</td>
<td>
<input type="text" id="preTextDistributorValve" name="preTextDistributorValve" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.1.5 Brake Cylinder released
</td>
<td>
</td>
<td >
</td>
<td>
<input type="text" id="preTextBrakeCylinder" name="preTextBrakeCylinder" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.1.6 Fitment of 75LAuxiliary Reservoir
</td>
<td>
</td>
<td >
</td>
<td>
<input type="text" id="preTextAuxiliaryReservoir" name="preTextAuxiliaryReservoir" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td rowspan="4">
3.2
</td>
<td rowspan="4">
Reservoir Charging
</td>
<td colspan=2>
3.2.1 HL & HB pipe without pressure cock B10.3 and B10.8<br>
Cock B6, B10.3, B10.8, B10.4/1 and B10.4/2 closed<br>
All pipes are exhausted<br>
Connect Brake Pipe<br>
Cock B6(HL) opened<br>
Charge Auxiliary Reservoir B5(125 L)and B4<br>
Also B11(Power Car)by Distributor Valve
</td>
<td>
On generator coaches also B 11 test fitting B10/6 on generator in Sec.
</td>
<td >
</td>
<td>
<input type="text" id="reservoirChargingHL" name="reservoirChargingHL" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.2.2 Brake Pipe pressure
</td>
<td>
Test fitting 6/2
</td>
<td >
5.0+-0.5kg/cm<sup>2</sup>
</td>
<td>
<input type="text" id="reservoirChargingBrakePipe" name="reservoirChargingBrakePipe" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.2.3 Charging time of the Control Reservoir from 0.00 kg/cm<sup>2</sup> to 4.75 kg/cm<sup>2</sup>
</td>
<td>
Test fitting 6/3
</td>
<td >
Sec
</td>
<td>
<input type="text" id="reservoirChargingChargingTime" name="reservoirChargingChargingTime" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.2.4 Pressure of the Control Reservoir
</td>
<td>
Test fitting 6/3
</td>
<td >
5.0+-0.5kg/cm<sup>2</sup>
</td>
<td>
<input type="text" id="reservoirChargingControlReservoirPressure" name="reservoirChargingControlReservoirPressure" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td rowspan="2">
3.3
</td>
<td rowspan="2">
Sealing Test
</td>
<td colspan=2>
3.3.1 Interrupt charging of brake pipe(HL)(close cock B6) pressure reduction in brake pipe (HL) within 5 minutes
</td>
<td>
Test fitting 6/2
</td>
<td >
<=0.1 kg/cm<sup>2</sup>
</td>
<td>
<input type="text" id="sealingTestInterrupt" name="sealingTestInterrupt" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.3.2 Open cocks 4/1 and 4/2 reduce brake pipe pressure HL to 0 KF/cm<sup>2</sup> pressure reduction in brake cylinder C within 5 minutes.
</td>
<td>
Test fitting 6/4
</td>
<td>
<=0.1 kg/cm<sup>2</sup>
</td>
<td>
<input type="text" id="sealingTestOpenCock" name="sealingTestOpenCock" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td rowspan=4>
3.4
</td>
<td rowspan=4>
Full Brake Application
</td>
<td colspan=2>
3.4.1 Reduce pressure of brake pipe(HL) with test bracket from value 5.0 to 3.4kg/cm<sup>2</sup>
</td>
<td>
Test fitting 6/2
</td>
<td>
6-10 sec
</td>
<td>
<input type="text" id="fullBrakeReducePressure" name="fullBrakeReducePressure" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.4.2 Emergency application accelerator does not respond
</td>
<td>
B 15
</td>
<td>
OK
</td>
<td>
<input type="text" id="fullBrakeEmergency" name="fullBrakeEmergency" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.4.3 Max pressure in BC Passenger/Coach Generator coach
</td>
<td>
Test fitting 6/4
</td>
<td>
3.0+-0.15 kg/cm<sup>2</sup><br>
3.0+-0.15 kg/cm<sup>2</sup>
</td>
<td>
<input type="text" id="fullBrakeMaxPressure" name="fullBrakeMaxPressure" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.4.4 All brake cylinders are applied
</td>
<td>
Bogie
</td>
<td>
OK
</td>
<td>
<input type="text" id="fullBrakeAllCylinders" name="fullBrakeAllCylinders" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td rowspan="2">
3.5
</td>
<td rowspan="2">
Release Full Brake Pressure
</td>
<td colspan=2>
3.5.1 Fill BP(HL) to 5.0+-0.05kg/cm<sup>2</sup>
</td>
<td>
Test fitting 6/2
</td>
<td>
5.0+-0.05kg/cm<sup>2</sup>
</td>
<td>
<input type="text" id="releaseFullFillBP" name="releaseFullFillBP" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
All brake cylinders are released
</td>
<td>
Bogie
</td>
<td>
<1.0 kg/cm<sup>2</sup>
</td>
<td>
<input type="text" id="releaseFullBrakeCylinder" name="releaseFullBrakeCylinder" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td rowspan="7">
3.6
</td>
<td rowspan="7">
Emergency Application
</td>
<td colspan=2>
3.6.1 Reduce brake pipe pressure (HL) to brake application value
</td>
<td>
Test fitting 6/2
</td>
<td >
<1.0 kg/cm<sup>2</sup>
</td>
<td>
<input type="text" id="emergencyApplicationReducePressure" name="emergencyApplicationReducePressure" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.6.2 Emergency application accelerator does respond
</td>
<td>
B 15
</td>
<td >
OK
</td>
<td>
<input type="text" id="emergencyApplicationAccelerator" name="emergencyApplicationAccelerator" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td rowspan=3>
3.6.3 Charging time of BC pressure
</td>
<td>
Until 95% of max value
</td>
<td rowspan=3>
Test fitting6/4
</td>
<td rowspan=3>
3-5 sec
</td>
<td rowspan=3>
<input type="text" id="emergencyApplicationChargingTime" name="emergencyApplicationChargingTime" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td>
Until 2.85 kg/cm<sup>2</sup> pressure for passenger coach
</td>
</tr>
<tr>
<td>
Until 3.6 kg/cm<sup>2</sup> pressure for generator coach
</td>
</tr>
<tr>
<td colspan=2>
3.6.4 Max BC pressure passenger coaches Generator coach
</td>
<td>
3.0+-0.15kg/cm<sup>2</sup>
3.0+-0.15kg/cm<sup>2</sup>
</td>
<td>
</td>
<td>
<input type="text" id="emergencyApplicationMaxBC" name="emergencyApplicationMaxBC" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.6.5 All brake cylinders are applied
</td>
<td>
Bogie
</td>
<td>
OK
</td>
<td>
<input type="text" id="emergencyApplicationAllBrake" name="emergencyApplicationAllBrake" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td rowspan=3>
3.7
</td>
<td rowspan=3>
Release Emergency Brake Application
</td>
<td colspan=2>
3.7.1 Fill BP(HL) to 5.0+-0.05kg/cm<sup>2</sup>
</td>
<td>
Test fitting 6/4
</td>
<td>
5.0+-0.05kg/cm<sup>2</sup>
</td>
<td>
<input type="text" id="releaseBrakeFillBP" name="releaseBrakeFillBP" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.7.2 Pressure drop time in BC from 3.00 kg/cm<sup>2</sup> to 0.4 kg/cm<sup>2</sup>
</td>
<td>
</td>
<td>
15-20 sec
</td>
<td>
<input type="text" id="releaseBrakePressureDrop" name="releaseBrakePressureDrop" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.7.3 Brake cylinders are released
</td>
<td>
Bogie
</td>
<td>
OK
</td>
<td>
<input type="text" id="releaseBrakeBrakeCylinder" name="releaseBrakeBrakeCylinder" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td>
3.8
</td>
<td>
Graduated Brake Application & Release
</td>
<td colspan=2>
Graduated Brake application & graduate brake release Minimum 7 steps
</td>
<td>
Test fitting 10.6/4
</td>
<td>
OK
</td>
<td>
<input type="text" id="graduateBrakeApplication" name="graduateBrakeApplication" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td rowspan=3>
3.9
</td>
<td rowspan=3>
Pressure Governor For Anti-Skid Device
</td>
<td colspan=2>
Control with electric measuring device
</td>
<td>
</td>
<td>
</td>
<td>
<input type="text" id="antiSkidControl" name="antiSkidControl" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.9.1 Charge the feeding pipe HB switching level up
</td>
<td>
Test fitting 6/1
</td>
<td>
1.8+-0.2 kg/cm<sup>2</sup>
</td>
<td>
<input type="text" id="antiSkidCharge" name="antiSkidCharge" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.9.2 Exhaust the feeding pipe HB switching level up
</td>
<td>
Test fitting 6/1
</td>
<td>
1.3+-0.2 kg/cm<sup>2</sup>
</td>
<td>
<input type="text" id="AntiSkidExhaust" name="AntiSkidExhaust" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td>
3.10
</td>
<td>
Sealing Test Feed Pipe(HB)
</td>
<td colspan=2>
3.10.1 Open cock B6(HB)<br>
Interrupt charging of feed pipe(HB) with PDR drop of pressure in feed pipe (HB) within 5 minutes
</td>
<td>
Test fitting 6/1
</td>
<td>
<=0.1 kg/cm<sup>2</sup>
</td>
<td>
<input type="text" id="sealingTestFeedPipe" name="sealingTestFeedPipe" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td rowspan=2>
3.11
</td>
<td rowspan=2>
Normal Service With Feed Pipe(HB)
</td>
<td colspan=2>
3.11.1 Open cock B6(HB)<br>
Open cock 10.3
</td>
<td>
</td>
<td>
</td>
<td>
<input type="text" id="normalFeedPipeOpenCock" name="normalFeedPipeOpenCock" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.11.2 Max test fitting pressure
</td>
<td>
Test fitting 6/1
</td>
<td>
>6.0 kg/cm<sup>2</sup>
</td>
<td>
<input type="text" id="normalFeedPipeMaxPressure" name="normalFeedPipeMaxPressure" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td rowspan=4>
3.12
</td>
<td rowspan=4>
Control of Indicating Device
</td>
<td colspan=2>
3.12.1 Actual full brake application:<br>
Bogie DG1 & DG2 are actuated<br>
Indicators for Bogie 1 & Bogie 2 show:"Brake not released"
</td>
<td>
B9A/1TO<br>
B9A/4
</td>
<td>
RED
</td>
<td>
<input type="text" id="controlOfIndicatingDeviceActualBrake" name="controlOfIndicatingDeviceActualBrake" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.12.2 Close cock position 4/1<br>
Brake Cylinder of Bogie 1 is released<br>
Brake indicators for Bogie 1 show:"Brake released"
</td>
<td>
BOGIE 1<br>
B9A/1,<br>
B9A/3
</td>
<td>
GREEN
</td>
<td>
<input type="text" id="controlOfIndicatingDeviceCloseCock1" name="controlOfIndicatingDeviceCloseCock1" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.12.3 Close cock position 4/2<br>
Brake Cylinder of Bogie 2 is released<br>
Brake indicators for Bogie 1 show:"Brake released"
</td>
<td>
BOGIE 2<br>
B9A/2,<br>
B9A/3
</td>
<td>
OK<br>
GREEN
</td>
<td>
<input type="text" id="controlOfIndicatingDeviceCloseCock2" name="controlOfIndicatingDeviceCloseCock2" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.12.4 Close cock position 4/1 & 4/2<br>
Brake Cylinder of Bogie 1 & 2 is released<br>
Brake indicators for Bogie 1 & Bogie 2 show:"Brake released"
</td>
<td>
BOGIE 1+2<br>
B9A/2,<br>
B9A/4
</td>
<td>
OK<br>
RED
</td>
<td>
<input type="text" id="controlOfIndicatingDeviceCloseCock12" name="controlOfIndicatingDeviceCloseCock12" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td>
3.13
</td>
<td>
Control of Insensitivity
</td>
<td colspan=2>
3.13.1 Exhaust brake pipe by means of nozzle within 0.3 kg/cm<sup>2</sup>/min. The distributor valve must not apply<br>
3.13.2 No brake application
</td>
<td>
Test fitting 6/4
</td>
<td>
OK
</td>
<td>
<input type="text" id="controlOfInsensitivity" name="controlOfInsensitivity" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td rowspan=2>
3.14
</td>
<td rowspan=2>
Control of Sensitivity
</td>
<td colspan=2>
3.14.1 Brake pipe filled with 5.0kg/cm<sup>2</sup><br>
Exhaust brake pipe by means of nozzle within 0.6 kg/cm<sup>2</sup> in 6.0 sec.
</td>
<td>
</td>
<td>
</td>
<td rowspan=2>
<input type="text" id="controlOfSensitivityBrakePipe" name="controlOfSensitivityBrakePipe" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.14.2 After 2 sec brake must apply
</td>
<td>
Test fitting 6/4
</td>
<td>
OK
</td>

</tr>
<tr>
<td rowspan=2>
3.15
</td>
<td rowspan=2>
First Brake Step
</td>
<td colspan=2>
3.15.1 Brake pipe filled with 5.0kg/cm<sup>2</sup><br>
Drop the back pipe by 0.4 kg/cm<sup>2</sup> in 6.0 sec.
</td>
<td>
</td>
<td>
</td>
<td rowspan=2>
<input type="text" id="firstBrakeStepBrakePipe" name="firstBrakeStepBrakePipe" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.15.2 One brake step apply
</td>
<td>
Test fitting 6/4
</td>
<td>
OK
</td>

</tr>
<tr>
<td>
3.16
</td>
<td>
Reactivating Of Quick Service Failure
</td>
<td colspan=2>
Fill brake pipe slowly to 5.0 kg/cm<sup>2</sup> and control the brake pipe pressure if the BC is completely released.<br>
Value if brake is released.
</td>
<td>
Test fitting 6/4
</td>
<td>
Max 4.80 kg/cm<sup>2</sup>
</td>
<td>
<input type="text" id="reactivatingOfQuickServiceFailure" name="reactivatingOfQuickServiceFailure" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td rowspan=5>
3.17
</td>
<td rowspan=5>
Parking Brake (Generator car Only)
</td>
<td colspan=2>
Indicating device for handbrake shows the position released.
</td>
<td>
B9B/1, B9B/2
</td>
<td>
Green
</td>
<td rowspan=3>
<input type="text" id="parkingBrakeHandbrakeReleased" name="parkingBrakeHandbrakeReleased" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
Apply handbrake by means of the wheel of handbrake.
</td>
<td>
</td>
<td>
</td>
</tr>
<tr>
<td colspan=2>
Cylinders for handbrake are applied
</td>
<td>
</td>
<td>
</td>
</tr>
<tr>
<td colspan=2>
Indicating device for handbrake shows the position applied
</td>
<td>
B9B/1, B9B/2
</td>
<td>
Red
</td>
<td rowspan=2>
<input type="text" id="parkingBrakeHandbrakeApplied" name="parkingBrakeHandbrakeApplied" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
Release handbrake by means of the wheel of handbrake
</td>
<td>
</td>
<td>
</td>
</tr>
<tr>
<td rowspan=3>
3.18
</td>
<td rowspan=3>
Emergency brake for passenger
</td>
<td colspan=2>
3.18.1 Exhaust brake pipe HL by means of Emergency brake handle(NI)
</td>
<td>
Test fitting 6/1
</td>
<td>
2+-0.2 kg/cm<sup>2</sup>
</td>
<td>
<input type="text" id="passengerEmergencyBrakeExhaustBrake" name="passengerEmergencyBrakeExhaustBrake" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.18.2 Close the handle and the brake pipe HL raised to 5 kg/cm<sup>2</sup>
</td>
<td>
</td>
<td>
OK
</td>
<td>
<input type="text" id="passengerEmergencyBrakeCloseHandle" name="passengerEmergencyBrakeCloseHandle" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.18.3 Passenger Alarm Emergency Device test
</td>
<td>
Pull box
</td>
<td>
</td>
<td>
<input type="text" id="passengerEmergencyBrakeAlarm" name="passengerEmergencyBrakeAlarm" size="7" style="border:none;"/>
</td>
</tr>

<tr>
<td rowspan=2>
3.19
</td>
<td rowspan=2>
Emergency brake by guard(Generation Car Only)
</td>
<td colspan=2>
3.19.1 Drop BP pressure by means of Guard clock N4.<br>
Check brake pipe pressure HL
</td>
<td>
Test fitting 6/2
</td>
<td>
</td>
<td rowspan=2>
<input type="text" id="passengerEmergencyBrakeByGuard" name="passengerEmergencyBrakeByGuard" size="7" style="border:none;"/>
</td>
</tr>
<tr>
<td colspan=2>
3.19.2 Close cock N4. Raise brake pipe pressure to 5.0 kg/cm<sup>2</sup>
</td>
<td>
</td>
<td>
</td>

</tr>
<tr>
<td>
3.20
</td>
<td>
CBC
</td>
<td colspan=2>
Fitment of buffer coupler
</td>
<td colspan=2 align=center>
OK
</td>
<td>
<input type="text" id="cbc" name="cbc" size="7" style="border:none;"/>
</td>
</tr>
</table>
<br>
<table>
<tr>
<td>
<b>Remarks:</b>
</td>
<td>
<textarea rows="3" cols="30" id="remarks" name="remarks"></textarea>
</td>
</tr>
<tr>
<td>
<b>Testing Status:</b>
</td>
<td>
<input type=radio name="airbrakeTestingStatus" id="airbrakeTestingStatus" value="Conforming"/>Conforming
<input type=radio name="airbrakeTestingStatus" id="airbrakeTestingStatus" value="Non Conforming"/>Non Conforming
</td>
</tr>
</table>

</form> 
</div>
<div id="CcTvTestingSIPDialog" style="height:150%; width:200%; display:none;z-index: 9;" >
 <h3 align="center">SELF INSPECTION PROFARMA</h3>  
<form name="CcTvTestingForm">
<p align="right">DOC NO. <input type=text id="ccTvDocNo" name="ccTvDocNo" readonly/>&emsp;&emsp;Shift &nbsp;
		<select name="ccTvShift" id="ccTvShift" >
		<option value="none">Select</option>
		<option value="general">General</option>
		<option value="shift-I">Shift-I</option>
		<option value="Shift-II">Shift-II</option>
		<option value="Shift-III">Shift-III</option>
		</select></p>
Check list for(CCTV) closed circuit television surveillance system in coaches of India Railway ae per Spec. No. ICF/MD/SPEC-269, Issue status:01, Rev-05 Dt-12.08.16 
<p>Coach NO.<input type=text id="ccTvCoachNo" name="ccTvCoachNo"/>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Fur No.<input type=text id="ccTvFurNo" name="ccTvFurNo"/>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;Date<input type=text id="ccTvDateOfTesting" name="ccTvDateOfTesting"/></p>
<table>
<tr>
	<td>SNO.</td>
	<td>Check list</td>
	<td>Observation</td>
	<td>If Not OK then defects there in</td>
	
</tr>
<tr>
	<td>1</td>
	<td>Mounting of 1.3 MP cameras(6 no.)</td>
	<td><input type=radio id="ccTvMountCamera6" name="ccTvMountCamera6" value="OK"/>OK <input type=radio id="ccTvMountCamera6" name="ccTvMountCamera6"  value="NOT OK" />NOT OK</td>
	<td><input type=text id="ccTvMountCamera6Rmk" name="ccTvMountCamera6Rmk"/></td>
	
</tr>
<tr>
	<td>2</td>
	<td>Mounting NVR (Network Video) recorder with 8 ports </td>
	<td><input type=radio id="ccTvMountNvrRecord" name="ccTvMountNvrRecord" value="OK"/>OK <input type=radio id="ccTvMountNvrRecord" name="ccTvMountNvrRecord"  value="NOT OK" />NOT OK</td>
	<td><input type=text id="ccTvMountNvrRecordRmk" name="ccTvMountNvrRecordRmk"/></td>
	
</tr>
<tr>
	<td>3</td>
	<td>DC to DC converter 110V to 12V DC </td>
	<td><input type=radio id="ccTvDctoDcConvtr" name="ccTvDctoDcConvtr" value="OK"/>OK <input type=radio id="ccTvDctoDcConvtr" name="ccTvDctoDcConvtr"  value="NOT OK" />NOT OK</td>
	<td><input type=text id="ccTvDctoDcConvtrRmk" name="ccTvDctoDcConvtrRmk"/></td>
	
</tr>
<tr>
	<td>4</td>
	<td>One 2.5" HDD with minimum capacity of 2TB for recording videos for 30 days</td>
	<td><input type=radio id="ccTvMinCapREcrodVideos" name="ccTvMinCapREcrodVideos" value="OK"/>OK <input type=radio id="ccTvMinCapREcrodVideos" name="ccTvMinCapREcrodVideos"  value="NOT OK" />NOT OK</td>
	<td><input type=text id="ccTvMinCapREcrodVideosRmk" name="ccTvMinCapREcrodVideosRmk"/></td>
	
</tr>
<tr>
	<td>5</td>
	<td>One side card with 32 GB capacity</td>
	<td><input type=radio id="ccTvOneSideCardCap" name="ccTvOneSideCardCap" value="OK"/>OK <input type=radio id="ccTvOneSideCardCap" name="ccTvOneSideCardCap"  value="NOT OK" />NOT OK</td>
	<td><input type=text id="ccTvOneSideCardCapRmk" name="ccTvOneSideCardCapRmk"/></td>
	
</tr>
<tr>
	<td>6</td>
	<td>IP protection box with Dirak make lock</td>
	<td><input type=radio id="ccTvIpProtectDirakLock" name="ccTvIpProtectDirakLock" value="OK"/>OK <input type=radio id="ccTvIpProtectDirakLock" name="ccTvIpProtectDirakLock"  value="NOT OK" />NOT OK</td>
	<td><input type=text id="ccTvIpProtectDirakLockRmk" name="ccTvIpProtectDirakLockRmk"/></td>
	
</tr>
<tr>
	<td>7</td>
	<td>Cable with connectors </td>
	<td><input type=radio id="ccTvCableWidConn" name="ccTvCableWidConn" value="OK"/>OK <input type=radio id="ccTvCableWidConn" name="ccTvCableWidConn"  value="NOT OK" />NOT OK</td>
	<td><input type=text id="ccTvCableWidConnRmk" name="ccTvCableWidConnRmk"/></td>
	
</tr>
<tr>
	<td>8</td>
	<td>Working for all 6 cameras in day mode</td>
	<td><input type=radio id="ccTvWorkCamrDayMode" name="ccTvWorkCamrDayMode" value="OK"/>OK <input type=radio id="ccTvWorkCamrDayMode" name="ccTvWorkCamrDayMode"  value="NOT OK" />NOT OK</td>
	<td><input type=text id="ccTvWorkCamrDayModeRmk" name="ccTvWorkCamrDayModeRmk"/></td>
	
</tr>
<tr>
	<td>9</td>
	<td>Working fpr all 6 camera in night mode</td>
	<td><input type=radio id="ccTvWorkCamrNightMood" name="ccTvWorkCamrNightMood" value="OK"/>OK <input type=radio id="ccTvWorkCamrNightMood" name="ccTvWorkCamrNightMood"  value="NOT OK" />NOT OK</td>
	<td><input type=text id="ccTvWorkCamrNightMoodRmk" name="ccTvWorkCamrNightMoodRmk"/></td>
	
</tr>
<tr>
	<td>10</td>
	<td>Compatibility to support GPS for real time location and speed tagging of video stream</td>
	<td><input type=radio id="ccTvComptGpsRealTimeLoc" name="ccTvComptGpsRealTimeLoc" value="OK"/>OK <input type=radio id="ccTvComptGpsRealTimeLoc" name="ccTvComptGpsRealTimeLoc"  value="NOT OK" />NOT OK</td>
	<td><input type=text id="ccTvComptGpsRealTimeLocRmk" name="ccTvComptGpsRealTimeLocRmk"/></td>
	
</tr>
<tr>
	<td>11</td>
	<td>Recording features</td>
	<td><input type=radio id="ccTvRecordFeatures" name="ccTvRecordFeatures" value="OK"/>OK <input type=radio id="ccTvRecordFeatures" name="ccTvRecordFeatures"  value="NOT OK" />NOT OK</td>
	<td><input type=text id="ccTvRecordFeaturesRmk" name="ccTvRecordFeaturesRmk"/></td>
	
</tr>
</table>
<p align="center"><input type= radio id="ccTvTestingStatus" name="ccTvTestingStatus" value="Conforming"/>Conforming<input type= radio id="ccTvTestingStatus" name="ccTvTestingStatus" value="Non Conforming"/>Non Conforming</p>
</form>
</div>
<div id="furnishingproduction" style="border:1px solid black;margin:7px;height:150%;width:200%;display:none;z-index:9;">
<form name="furnishingprodform" >
<h1 align="center"style="font-size:20px;">SELF INSPECTION PROFARMA</h1>
<h2 align="center" style="font-size:15px;">BUFFER/CBC HEIGHT and MISC MEASUREMENT</h2> 
<h5><b>Applicability:</b>(All fields are mandatory . Strike out which is not applicable)</h5>
<table border=1 style="width:80%">
<tr>
<td style="width:10%"><b>Shell Type:</b></td>
<td style="width:10%"><input type="text" name="shelltype" id="shelltype" placeholder="shelltype"  style="border:none;" size="5" readonly></td>
<td style="width:10%"><b>Shell No:</b></td>
<td style="width:10%"><input type="text" name="shelltype" id="shellno" placeholder="shellno"  style="border:none;" size="5" readonly></td>
<td style="width:10%"><b>Doc No.:</b></td>
<td style="width:30%"><input type="text" name="docnobuffercbcheight" id="docnobuffercbcheight" style="border:none;" size="40" readonly></td>
</tr>
</table>
<br>
<table border=1 style="width:100%">
<tr>
<td><b>DATE</b></td>
<td ><input type="text" name="dateofbuffercbcheighttestingdateofsip" id="dateofbuffercbcheighttesting" style="border:none;" size="10" class='validate[required]' ></td>
<td><b>COACH TYPE</b></td>
<td><input type="text" name="coachtype" id="coachtype" placeholder="coachtype" style="border:none;" size="10"></td>
<td><b>COACH No.</b></td>
<td><input type="text" name="coachno" id="coachno" placeholder="coachno" style="border:none;" size="5"></td>
<td><b>Furnishing No.:</b></td>
<td><input type="text" name="furno" placeholder="furno" id="furno" style="border:none;" size="5" readonly></td>
</table>
<br>

<table  style="width:150px;">
<tr>
<td><b>SHIFT</b></td>
<td><select name="shiftbuffercbcheight" id="shiftbuffercbcheight" class='validate[required]' >
<option value="">Select</option>
<option value="general">General</option>
<option value="morning">Shift-I</option>
<option value="evening">Shift-II</option>
<option value="night">Shift-III</option>
<option value="">Select</option>
</select></td>
</tr>
</table>
<br>
<h4  style="font-size:15px;"><b>DATA OF TRACEABILITY:</b></h4>
<table border=1 style="width:70%" cellspacing=0>
<tr>
<td style="text-align:center">ITEM</td>
<td colspan="4" style="text-align:center" >Make and No.</td>
</tr>
<tr>
<td></td>
<td colspan="2" style="text-align:center">NPP side</td>
<td colspan="2" style="text-align:center">PP side</td>
</tr>
<tr>
<td rowspan="2">YAW DAMPER</td>
<td style="text-align:center">A1</td>
<td style="text-align:center">A2</td>
<td style="text-align:center">A1</td>
<td style="text-align:center">A2</td>
</tr>
<tr>
<td><input type="text" name="dampernppa1" id="dampernppa1"  placeholder="dampernppa1" /></td>
<td><input type="text" name="dampernppa2" id="dampernppa2"  placeholder="dampernppa2" ></td>
<td><input type="text" name="damperppa1" id="damperppa1"  placeholder="damperppa1" ></td>
<td><input type="text" name="damperppa2" id="damperppa2"  placeholder="damperppa2" ></td>
</tr>
</table>
<br>
<h8 style="font-size:15px;">Drawing No:LW 90010 Alt 'Nil' LACCN);1277672 & 1277673-(LACCZ/LACCW); 2 10113.0.00.040.010(LFACCZ/LACCB;
LS90001 Alt:'Nil'(LSCN,LSLR);90004 LG90004 Alt 'Nil' (LGS) Refrence:RCF/KXH Letter No. MD44121,Dated 17/09/2005, RCF/KXH QMF-9752 VER 4.0 For LDSLR Refrence:Letter NO-RBL-MD44131 Dated-29-12-18
 </h8>
 <br><br>
<h7 style="font-size:15px;"><b>Observations:</b></h7>
<table border=1 cellspacing=0 cellpadding=0 style="width:100%;">
<tr>
<td style="width:4%;"><b>SNo.</b></td>
<td style="width:26%;"><b>Description</b></td>
<td style="width:20%;"><b>Specified(MM)</b></td>
<td colspan="8" style="text-align:center;width:50%;"><b>Observations(MM)</b></td>
</tr>
<tr>
<td rowspan="3" style="width:4%;">1</td>
<td rowspan="3" style="width:26%;">CBC Height</td>
<td rowspan="3" style="width:20%;">1105+0/-10</td>
<td colspan="4" style="text-align:center;width:25%;" >H2(NPP)</td>
<td colspan="4" style="text-align:center;width:25%;">H1(PP)</td>
</tr>

<tr>
<td colspan="2" style="width:12.25%;">Bogie No.</td>
<td colspan="2" style="width:12.25%;"><input type="text" name="bogiepp" id="bogiepp"  placeholder="bogiepp"  style="border:none;" readonly></td>
<td colspan="2" style="width:12.25%;">Bogie No.</td>
<td colspan="2" style="width:12.25%;"><input type="text" name="bogienpp" id="bogienpp"  placeholder="bogienpp" style="border:none;"  readonly></td>
</tr>
<tr>
<td colspan="4" style="width:12.25%;"><span id="h2npp_output"></span><input type="text" name="h2npp" id="h2npp"  placeholder="cbcheight1" style="width:100%;" onkeypress="return isNumberKey(this, event)" maxlength="8"></td>
<td colspan="4" style="width:12.25%;"><span id="h1pp_output"></span><input type="text" name="h1pp" id="h1pp"  placeholder="cbcheight2" style="width:100%"  onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
</tr>
<tr>
<td rowspan="2" style="width:4%;">2</td>
<td rowspan="2" style="width:26%;">SIM Height</td>
<td rowspan="2" style="width:20%;">25 MAX.</td>
<td colspan="2" style="width:12.25%;"><span id="simheightnpp1_output"></span><input type="text" name="simheightnpp1" id="simheightnpp1"  placeholder="simheight1" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="simheightnpp1_output"></span><input type="text" name="simheightnpp2" id="simheightnpp2"  placeholder="simheight2" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="simheightpp1_output"></span><input type="text" name="simheightpp1" id="simheightpp1"  placeholder="simheight3" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="simheightpp2_output"></span><input type="text" name="simheightpp2" id="simheightpp2"  placeholder="simheight4" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
</tr>
 <tr>
<td colspan="2" style="width:12.25%;"><span id="simheightnpp3_output"></span><input type="text" name="simheightnpp3" id="simheightnpp3"  placeholder="simheight5" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="simheightnpp4_output"></span><input type="text" name="simheightnpp4" id="simheightnpp4"  placeholder="simheight6" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="simheightnpp3_output"></span><input type="text" name="simheightnpp3" id="simheightpp3"  placeholder="simheight7" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="simheightpp4_output"></span><input type="text" name="simheightnpp4" id="simheightpp4"  placeholder="simheight8" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
</tr>
<tr>
<td rowspan="2" style="width:4%;">3</td>
<td rowspan="2" style="width:26%;">Buffer Height(If Applicable)</td>
<td rowspan="2" style="width:20%;">1105+-5</td>
<td colspan="2" style="text-align:center;width:12.25%;">C</td>
<td colspan="2" style="text-align:center;width:12.25%;">D</td>
<td colspan="2" style="text-align:center;width:12.25%;">A</td>
<td colspan="2" style="text-align:center;width:12.25%;">B</td>
</tr>
<tr>
<td colspan="2" style="width:12.25%;"><span id="bufferheightnppc_output"></span><input type="text" name="bufferheightnppc" id="bufferheightnppc"  placeholder="bufferheight1" onkeypress="return isNumberKey(this, event)" maxlength="8"  ></td>
<td colspan="2" style="width:12.25%;"><span id="bufferheightnppd_output"></span><input type="text" name="bufferheightnppd" id="bufferheightnppd"  placeholder="bufferheight2" onkeypress="return isNumberKey(this, event)" maxlength="8"  ></td>
<td colspan="2" style="width:12.25%;"><span id="bufferheightppa_output"></span><input type="text" name="bufferheightppa" id="bufferheightppa"  placeholder="bufferheight3" onkeypress="return isNumberKey(this, event)" maxlength="8"  ></td>
<td colspan="2" style="width:12.25%;"><span id="bufferheightppb_output"></span><input type="text" name="bufferheightppb" id="bufferheightppb"  placeholder="bufferheight4" onkeypress="return isNumberKey(this, event)" maxlength="8"  ></td>
</tr>
 <tr>
<td rowspan="5" >4</td>
<td >Rail Level to the control arm bkt</td>
<td></td>
<td style="text-align:center;width:6.25%;">Z11</td>
<td style="text-align:center;width:6.25%;">Z21</td>
<td style="text-align:center;width:6.25%;">Z31</td>
<td style="text-align:center;width:6.25%;">Z41</td>
<td style="text-align:center;width:6.25%;">Z11</td>
<td style="text-align:center;width:6.25%;">Z21</td>
<td style="text-align:center;width:6.25%;">Z31</td>
<td style="text-align:center;width:6.25%;">Z41</td>
</tr>

 <tr>
<td >(LACCZ,LACCW,LFACCZ,LACCB)</td>
<td >462.5+-4</td>
<td style="text-align:center;width:6.25%" rowspan="4"><span id="raillevelnppz11_output"></span><input type="text" style="width:100%" name="raillevelnppz11" id="raillevelnppz11"  placeholder="z11" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td style="text-align:center;width:6.25%" rowspan="4"><span id="raillevelnppz21_output"></span><input type="text" style="width:100%" name="raillevelnppz21" id="raillevelnppz21"   placeholder="z21" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td style="text-align:center;width:6.25%" rowspan="4"><span id="raillevelnppz31_output"></span><input type="text" style="width:100%" name="raillevelnppz31" id="raillevelnppz31"   placeholder="z31" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td style="text-align:center;width:6.25%" rowspan="4"><span id="raillevelnppz41_output"></span><input type="text" style="width:100%" name="raillevelnppz41" id="raillevelnppz41"   placeholder="z41" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td style="text-align:center;width:6.25%" rowspan="4"><span id="raillevelppz11_output"></span><input type="text" style="width:100%"name="raillevelppz11" id="raillevelppz11"   placeholder="z11" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td style="text-align:center;width:6.25%" rowspan="4"><span id="raillevelppz21_output"></span><input type="text" style="width:100%"name="raillevelppz21" id="raillevelppz21"  placeholder="z21" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td style="text-align:center;width:6.25%" rowspan="4"><span id="raillevelppz31_output"></span><input type="text" style="width:100%" name="raillevelppz31" id="raillevelppz31"   placeholder="z31" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td style="text-align:center;width:6.25%" rowspan="4"><span id="raillevelppz41_output"></span><input type="text" style="width:100%" name="raillevelppz41" id="raillevelppz41"  placeholder="z41" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
</tr>

 <tr>
<td>(LWLRRM)(A TO D)/(E TO H)</td>
<td>464+-4/459+-4</td>
</tr>
<tr>
<td>(LACCN,LSLR,LSCN,LGS)</td>
<td>460+-4</td>
</tr>
<tr>
<td>LDSLR</td>
<td>453+-4</td>
</tr>

 <tr>
<td rowspan="2">5</td>
<td rowspan="2">Vertical Stop Clearance</td>
<td rowspan="2">95+0/-5</td>
<td colspan="2" style="text-align:center;width:12.25%;">Z1</td>
<td colspan="2" style="text-align:center;width:12.25%;">Z2</td>
<td colspan="2" style="text-align:center;width:12.25%;">Z1</td>
<td colspan="2" style="text-align:center;width:12.25%;">Z2</td>
</tr>
<tr>
<td colspan="2" style="width:12.25%;"><span id="verticalstopclearancenppz1_output"></span><input type="text" style="width:100%"  name="verticalstopclearancenppz1" id="verticalstopclearancenppz1"   placeholder="verticalstopclearance1" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="verticalstopclearancenppz2_output"></span><input type="text" style="width:100%"  name="verticalstopclearancenppz2" id="verticalstopclearancenppz2"   placeholder="verticalstopclearance2" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="verticalstopclearanceppz1_output"></span><input type="text" style="width:100%"  name="verticalstopclearanceppz1" id="verticalstopclearanceppz1"   placeholder="verticalstopclearance3" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="verticalstopclearanceppz2_output"></span><input type="text" style="width:100%"  name="verticalstopclearanceppz2" id="verticalstopclearanceppz2"   placeholder="verticalstopclearance4" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
</tr>
 
 <tr>
<td rowspan="2">6</td>
<td rowspan="2">Average height from top plate of side frame to upper race of spring seat</td>
<td rowspan="2">46+-3(FOR EOG COACH)</td>
<td colspan="2" style="text-align:center;width:12.25%;">(Z13+Z23)/2</td>
<td colspan="2" style="text-align:center;width:12.25%;">(Z33+Z43)/2</td>
<td colspan="2" style="text-align:center;width:12.25%;">(Z13+Z23)/2</td>
<td colspan="2" style="text-align:center;width:12.25%;">(Z33+Z43)/2</td>
</tr>
<tr>
<td colspan="2" style="width:12.25%;"><span id="averageheightnppz13z23_output"></span><input type="text"  style="width:100%" name="averageheightnppz13z23" id="averageheightnppz13z23"   placeholder="avgheight1" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="averageheightnppz33z43_output"></span><input type="text" style="width:100%" name="averageheightnppz33z43" id="averageheightnppz33z43"   placeholder="avgheight2" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="averageheightppz13z23_output"></span><input type="text" style="width:100%" name="averageheightppz13z23" id="averageheightppz13z23"   placeholder="avgheight3" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="averageheightppz33z43_output"></span><input type="text" style="width:100%"name="averageheightppz33z43" id="averageheightppz33z43"   placeholder="avgheight4" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
</tr>

<tr>
<td rowspan="2">7</td>
<td rowspan="2">longitudinal clearance between cross section and bump stop</td>
<td rowspan="2">08+5/-2</td>
<td colspan="2" style="text-align:center;width:12.25%;">X15</td>
<td colspan="2" style="text-align:center;width:12.25%;">X25</td>
<td colspan="2" style="text-align:center;width:12.25%;">X15</td>
<td colspan="2" style="text-align:center;width:12.25%;">X25</td>
</tr>
<tr>
<td colspan="2" style="width:12.25%;"><span id="logintudinalclearancenppx15_output"></span><input type="text" style="width:100%" name="logintudinalclearancenppx15" id="logintudinalclearancenppx15"   placeholder="logintudinalclearance1" onkeypress="return isNumberKey(this, event)" maxlength="8"></td>
<td colspan="2" style="width:12.25%;"><span id="logintudinalclearancenppx25_output"></span><input type="text" style="width:100%" name="logintudinalclearancenppx25" id="logintudinalclearancenppx25"   placeholder="logintudinalclearance2" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="logintudinalclearanceppx15_output"></span><input type="text" style="width:100%" name="logintudinalclearanceppx15" id="logintudinalclearanceppx15"   placeholder="logintudinalclearance3" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="logintudinalclearanceppx25_output"></span><input type="text" style="width:100%" name="logintudinalclearanceppx25" id="logintudinalclearanceppx25"   placeholder="logintudinalclearance4" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
</tr>
<tr>
<td rowspan="2">8</td>
<td rowspan="2">lateral clearance between bogie rotation stop and bump stop</td>
<td rowspan="2">25+-5</td>
<td colspan="2" style="text-align:center;width:12.25%;">Y14</td>
<td colspan="2" style="text-align:center;width:12.25%;">Y34</td>
<td colspan="2" style="text-align:center;width:12.25%">Y14</td>
<td colspan="2" style="text-align:center;width:12.25%;">Y34</td>
</tr>
<tr>
<td colspan="2" style="width:12.25%;"><span id="lateralclearancenppy14_output"></span><input type="text" style="width:100%"  name="lateralclearancenppy14" id="lateralclearancenppy14"   placeholder="y14" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="lateralclearancenppy34_output"></span><input type="text" style="width:100%" name="lateralclearancenppy34" id="lateralclearancenppy34"   placeholder="y34" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="lateralclearanceppy14_output"></span><input type="text" style="width:100%" name="lateralclearanceppy14" id="lateralclearanceppy14"   placeholder="y14" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="lateralclearanceppy34_output"></span><input type="text" style="width:100%" name="lateralclearanceppy34" id="lateralclearanceppy34"   placeholder="y34" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
</tr>
<tr>
<td rowspan="2">9</td>
<td rowspan="2">Torque force bogie body connection</td>
<td rowspan="2">250 NM</td>
<td style="text-align:center;width:6.25%;">1</td>
<td style="text-align:center;width:6.25%;">2</td>
<td style="text-align:center;width:6.25%;">3</td>
<td style="text-align:center;width:6.25%;">4</td>
<td style="text-align:center;width:6.25%;">1</td>
<td style="text-align:center;width:6.25%;">2</td>
<td style="text-align:center;width:6.25%;">3</td>
<td style="text-align:center;width:6.25%;">4</td>
</tr>
<tr>
<td style="width:6.25%;"><span id="lateralclearanceppy34_output"></span><input type="text" style="width:100%" name="torqueforcebogienpp1" id="torqueforcebogienpp1"   placeholder="npp1" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td style="width:6.25%;"><span id="lateralclearanceppy34_output"></span><input type="text" style="width:100%" name="torqueforcebogienpp2" id="torqueforcebogienpp2"   placeholder="npp2" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td style="width:6.25%;"><span id="lateralclearanceppy34_output"></span><input type="text" style="width:100%" name="torqueforcebogienpp3" id="torqueforcebogienpp3"   placeholder="npp3" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td style="width:6.25%;"><span id="lateralclearanceppy34_output"></span><input type="text" style="width:100%"name="torqueforcebogienpp4" id="torqueforcebogienpp4"   placeholder="npp4" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td style="width:6.25%;"><span id="lateralclearanceppy34_output"></span><input type="text" style="width:100%" name="torqueforcebogiepp1" id="torqueforcebogiepp1"   placeholder="pp1" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td style="width:6.25%;"><span id="lateralclearanceppy34_output"></span><input type="text" style="width:100%" name="torqueforcebogiepp2" id="torqueforcebogiepp2"   placeholder="pp2" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td style="width:6.25%;"><span id="lateralclearanceppy34_output"></span><input type="text" style="width:100%" name="torqueforcebogiepp3" id="torqueforcebogiepp3"   placeholder="pp3" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td style="width:6.25%;"><span id="lateralclearanceppy34_output"></span><input type="text" style="width:100%" name="torqueforcebogiepp4" id="torqueforcebogiepp4"   placeholder="pp4" onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
</tr>
<tr>
<td rowspan="3">10</td>
<td rowspan="3">Torque Force For YAW Damper</td>
<td rowspan="2">Bogie Side 170Nm</td>
<td colspan="2" style="text-align:center;width:12.25%">A1</td>
<td colspan="2" style="text-align:center;width:12.25%">A2</td>
<td colspan="2" style="text-align:center;width:12.25%">A1</td>
<td colspan="2" style="text-align:center;width:12.25%">A2</td>
</tr>
<tr>
<td colspan="2" style="width:12.25%;"><span id="torqueforceyawdamper170nppa1_output"></span><input type="text" style="width:100%"  name="torqueforceyawdamper170nppa1" id="torqueforceyawdamper170nppa1" placeholder="torqueforce170a1"   onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="torqueforceyawdamper170nppa2_output"></span><input type="text" style="width:100%" name="torqueforceyawdamper170nppa2" id="torqueforceyawdamper170nppa2" placeholder="torqueforce170a2"   onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="torqueforceyawdamper170ppa1_output"></span><input type="text" style="width:100%" name="torqueforceyawdamper170ppa1" id="torqueforceyawdamper170ppa1" placeholder="torqueforce170a1"   onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="torqueforceyawdamper170ppa2_output"></span><input type="text" style="width:100%" name="torqueforceyawdamper170ppa2" id="torqueforceyawdamper170ppa2" placeholder="torqueforce170a2"   onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
</tr>
<tr>
<td>Shell side 160Nm</td>
<td colspan="2" style="width:12.25%;"><span id="torqueforceyawdamper160nppa1_output"></span><input type="text" style="width:100%" name="torqueforceyawdamper160nppa1" id="torqueforceyawdamper160nppa1" placeholder="torqueforce160a1"   onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="torqueforceyawdamper160nppa2_output"></span><input type="text" style="width:100%" name="torqueforceyawdamper160nppa2" id="torqueforceyawdamper160nppa2" placeholder="torqueforce160a2"   onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="torqueforceyawdamper160ppa1_output"></span><input type="text" style="width:100%" name="torqueforceyawdamper160ppa1" id="torqueforceyawdamper160ppa1" placeholder="torqueforce160a1"    onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="torqueforceyawdamper160ppa2_output"></span><input type="text" style="width:100%" name="torqueforceyawdamper160ppa2" id="torqueforceyawdamper160ppa2" placeholder="torqueforce160a2"   onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
</tr>
<tr>
<td rowspan="2">11</td>
<td rowspan="2">secondary spring height</td>
<td rowspan="2">292+0/-5</td>
<td colspan="2" style="text-align:center;width:12.25%;">Z1</td>
<td colspan="2" style="text-align:center;width:12.25%;">Z2</td>
<td colspan="2" style="text-align:center;width:12.25%;">Z1</td>
<td colspan="2" style="text-align:center;width:12.25%;">Z2</td>
</tr>
<tr>
<td colspan="2" style="width:12.25%;"><span id="secspringheightnppz1_output"></span><input type="text" name="secspringheightnppz1" style="width:100%" id="secspringheightnppz1" placeholder="secspringheight1"   onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="secspringheightnppz2_output"></span><input type="text" name="secspringheightnppz2" style="width:100%"  id="secspringheightnppz2" placeholder="secspringheight2"  onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="secspringheightppz1_output"></span><input type="text" name="secspringheightppz1" style="width:100%" id="secspringheightppz1" placeholder="secspringheight3"   onkeypress="return isNumberKey(this, event)" maxlength="8" ></td>
<td colspan="2" style="width:12.25%;"><span id="secspringheightppz2_output"></span><input type="text" name="secspringheightppz2" style="width:100%" id="secspringheightppz2" placeholder="secspringheight4"   onkeypress="return isNumberKey(this, event)" maxlength="8"></td>

</tr>  
 </table>
<table style="float:center">
<tr>
<th>Testing Status</th>
<td><input type="radio" name="checkingStatus"  id="checkingStatus" value="conforming"> Confirming
<input type="radio" name="checkingStatus" id="checkingStatus" value="nonconforming"> Non Conforming
</td>
</tr>
</table> 
</form>
</div>
<div id="fibaDialog" style="height:150%; width:200%; display:none;z-index: 9;">
<form id="FIBATestingForm">
<h3 align="center">INSPECTION REPORT(FIBA TEST)</h3>
<h6 align="right">Shift<select  id="shiftFiba">
<option value="">Select</option>
<option value="general">General</option>
<option value="morning">Shift-I</option>
<option value="evening">Shift-II</option>
<option value="night">Shift-III</option>
</select></h6>
<table>
<tr><td>DOC NO<input type="text" id="docNoFiba"></td>
<td>REV NO:<input type="text" id="revnoFiba"></td>
<td>DATE:<input type="text" id="dateOfFibaTesting"></td>
</tr>
<tr>
<td>SHELL TYPE<input type="text" id="shellType" ></td>
<td>SHELL NO<input type="text" id="shellNo"></td>
<td>FURNISHING NO<input type="text" id="furnishingNo"></td>
</tr>
<tr>
<td>COACH TYPE<input type="text" id="coachType"></td>
<td>COACH NO<input type="text" id="coachNumber"></td>
</tr>
<tr>
<td>GENERAL INSTALLATION NO<input type="text" id="generalInstallationNo"></td>
<td>APPLICABLE WI NO<input type="text" id="wiNo"></td>
<td>PSL NO<input type="text" id="pslNo"></td>
</tr>
</table>
<h5><b>REFERENCE:</b>1.0 RDSO/2012/CG/TS-03</h5>
<h5><b>PRESSURE LEVEL:</b>B.P +0.2Kg/cm<sup>2</sup> F.P>6.0Kg/cm<sup>2</sup></h5>
<h5><b>DATA OF TRACEABILITY:</b></h5>
<table border="1">
<tr>
<th>S.No</th>
<th>ITEMS</th>
<th>MAKE</th>
<th>SERIAL NO</th>
<th>MFG DATE</th>
</tr>
<tr>
<th>1</th>
<th>BOGIE PP END</th>
<td><input size="15%" type="text" id="bogiePPEndMake" placeholder="Enter Text Here"></td>
<td><input size="15%" type="text" id="bogiePPEndSerial"  placeholder="Enter Text Here"></td>
<td><input size="15%" type="text" id="bogiePPMfgDate" placeholder="Enter Text Here"></td>
</tr>
<tr>
<th>2</th>
<th>BOGIE NPP END</th>
<td><input size="15%" type="text" id="bogieNPPEndMake" placeholder="Enter Text Here"></td>
<td><input size="15%" type="text" id="bogieNPPEndSerial"  placeholder="Enter Text Here"></td>
<td><input size="15%" type="text" id="bogieNPPMfgDate" placeholder="Enter Text Here"></td>
</tr>
<tr>
<th>3</th>
<th>FIBA DEVICE PP END</th>
<td><input size="15%" type="text" id="fibaPPMake" placeholder="Enter Text Here"></td>
<td><input size="15%" type="text" id="fibaPPSerial" placeholder="Enter Text Here"></td>
<td><input size="15%" type="text" id="fibaPPMfgDate" placeholder="Enter Text Here"></td>
</tr>
<tr>
<th>4</th>
<th>FIBA  DEVICE NPP END</th>
<td><input size="15%" type="text" id="fibaNPPMake" placeholder="Enter Text Here"></td>
<td><input size="15%" type="text" id="fibaNPPSerial" placeholder="Enter Text Here"></td>
<td><input size="15%" type="text" id="fibaNPPMfgDate" placeholder="Enter Text Here"></td>
</tr>
<tr>
<th>5</th>
<th>INDICATOR PP END</th>
<td><input size="15%" type="text" id="indicatorPPMake" placeholder="Enter Text Here"></td>
<td><input size="15%" type="text" id="indicatorPPSerial" placeholder="Enter Text Here"></td>
<td><input size="15%" type="text" id="indicatorPPMfgDate" placeholder="Enter Text Here"></td>
</tr>
<tr>
<th>6</th>
<th>INDICATOR NPP END</th>
<td><input size="15%" type="text" id="indicatorNPPMake" placeholder="Enter Text Here"></td>
<td><input size="15%" type="text" id="indicatorNPPSerial" placeholder="Enter Text Here"></td>
<td><input size="15%" type="text" id="indicatorNPPMfgDate" placeholder="Enter Text Here"></td>
</tr>
</table>
<h4>OBSERVATIONS</h4>
<table border="1" width="500px">
<tr>
<th rowspan="2">S.No</th>
<th rowspan="2">Test and testing procedure</th>
<th rowspan="2">Standard</th>
<th colspan="2">Bogie PP END</th>
<th colspan="2">BOGIE NPP END</th>
</tr>
<tr>
<th>Air Spring1</th>
<th>Air Spring3</th>
<th>Air Spring2</th>
<th>Air Spring4</th>
</tr>
<tr>
<th>1</th>
<td><p>Initial charging</br>
1.1 Charge the FP at 6.0 kg/cm<sup>2</sup> and BP at 5.0 kg/cm<sup>2</sup></br>
1.2 Ensure the charging of air springs with the help of levelling value lever position</p>
</td>
<td>B.P=5.0+0.1Kg/cm<sup>2</sup>
F.P=6.0+0.1Kg/cm<sup>2</sup>
Levelling value lever should be in horizontal postion</td>
<td><input type="text" size="15%" id="initialChargingPPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="initialChargingPPAirSpring2" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="initialChargingNPPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="initialChargingNPPAirSpring2" placeholder="Enter Text Here"></td>
</tr>
<tr>
<th>2</th>
<td>Visual Leakage detection
2.1 Check for any leakage in entire system.
Any leakage found in FIBA device or pipe lines should be attended
</td>
<td>
No leakage 
</td>
<td><input type="text" size="15%" id="leakageDetectionPPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="leakageDetectionPPAirSpring2" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="leakageDetectionNPPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="leakageDetectionNPPAirSpring2" placeholder="Enter Text Here"></td>
</tr>
<tr>
<th rowspan="4">3</th>
<td rowspan="4">Function Test
Charge the air springs on tare condition of the coach and BP at 5.0Kg/cm<sup>2</sup>.
Open the 1/2 drain cock of Air spring reservoir of one side air spring.
</td>
<td>i) FIBA device of relevant bogie should actuate</td>
<td><input type="text" size="15%" id="functionTestFIBAPPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="functionTestFIBAPPAirSpring2" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="functionTestFIBANPPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="functionTestFIBANPPAirSpring2" placeholder="Enter Text Here"></td>
</tr>
<tr>
<td>ii) Break should apply in entire coach</td>
<td><input type="text" size="15%" id="functionTestBrakePPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="functionTestBrakePPAirSpring2" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="functionTestBrakeNPPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="functionTestBrakeNPPAirSpring2" placeholder="Enter Text Here"></td>
</tr>
<tr>
<td>iii) Both indicators of same bogie 
should turn to red.Indicators of other
bogie should show green </td>
<td><input type="text" size="15%" id="functionTestIndicatorPPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="functionTestIndicatorPPAirSpring2" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="functionTestIndicatorNPPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="functionTestIndicatorNPPAirSpring2" placeholder="Enter Text Here"></td>
</tr>
<tr>
<td>iiv)Wrestling/Hissing sound blow</td>
<td><input type="text" size="15%" id="functionTestWrestingBlowPPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="functionTestWrestingBlowPPAirSpring2" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="functionTestWrestingBlowNPPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="functionTestWrestingBlowNPPAirSpring2" placeholder="Enter Text Here"></td>
</tr>
<tr>
<th rowspan="2">4</th>
<td rowspan="2">Brake pipe Isolation 
Close the isolating cocks with vent feature
and reset the restarting keys.
</td>
<td>
i)Hissing sound should stop
</td>
<td><input type="text" size="15%" id="brakePipeIsolationHissingSoundPPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="brakePipeIsolationHissingSoundPPAirSpring2" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="brakePipeIsolationHissingSoundNPPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="brakePipeIsolationHissingSoundNPPAirSpring2" placeholder="Enter Text Here"></td>
</tr>
<tr>
<td>ii)Brake should release in entire coach</td>
<td><input type="text" size="15%" id="brakePipeIsolationBrakeReleasePPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="brakePipeIsolationBrakeReleasePPAirSpring2" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="brakePipeIsolationBrakeReleaseNPPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="brakePipeIsolationBrakeReleaseNPPAirSpring2" placeholder="Enter Text Here"></td>
</tr>
<tr>
<th>5</th>
<td>Supression of isolaton 
close the isolation cocks with vent feature 
and rsestthe resting keys
</td>
<td>Both indicators of sae bogie should 
turn to green from red.Indicators of
other bogie should remain show green
</td>
<td><input type="text" size="15%" id="suppressPipeVariationPPTest1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="suppressPipeVariationPPTest2" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="suppressPipeVariationNPPTest1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="suppressPipeVariationNPPTest2" placeholder="Enter Text Here"></td>
</tr>
<tr>
<th>6.</th>
<td>Brake pipe variation Test 
Drop Brake pipe pressure from 5.0Kg/cm<sup>2</sup>
to zero
</td>
<td>
i)FIBA device should not actuate.
ii)Brake should apply.
iii)NO FIBA indicators should turn to
red.
iv)No wresting/Hissing sound.
</td>
<td><input type="text" size="15%" id="brakePipeVariationPPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="brakePipeVariationPPAirSpring2" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="brakePipeVariationNPPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="brakePipeVariationNPPAirSpring2" placeholder="Enter Text Here"></td>
</tr>

<tr>
<th>7.</th>
<td>Repitition Test 
Repitition of test for testing of FIBA 
Devices for remaining 03 Air springs of the 
coach
</td>
<td>Repeat the above procedures for testing 
of remaining 03 Air springs accrdingly 
and note down the reading in relevant
coloumn </td>
<td><input type="text" size="15%" id="repetitionTestPPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="repetitionTestPPAirSpring2" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="repetitionTestNPPAirSpring1" placeholder="Enter Text Here"></td>
<td><input type="text" size="15%" id="repetitionTestNPPAirSpring2" placeholder="Enter Text Here"></td>
</tr>
</table>
</form>
</div>
</body>
<script>
var shellArray=[];
		$(document).ready(function() {
			
			 var first = new Option("select", null );
				
				$("#coachType").append(first);
				
				<c:forEach var="a" items="${coachType}">
				
				var o = new Option("${a}", "${a}");
			
				$(o).html("${a}");
				$("#coachType").append(o);
				
				
		    </c:forEach>
		    
		   
		    
		   // end of code for bogie type
				//start: retrieving axle number in dropdown option
			    var bogieNumbers=[]; 

				var j=1;
				bogieNumbers[0]={ Value:null, DisplayText: "Select" };
				<c:forEach var="b" items="${bogieNumberList}">
				bogieNumbers[j]={ Value: "${b.key}", DisplayText: "${b.value}" };
					j++;
				    </c:forEach>
				  //end: retrieving axle number in dropdown option
				  
				  //datepicker plumbing
				  $('#plumbingDate').datepicker({
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
				    
				//datepicker shower    
				    
				   $('#showerTestingDate').datepicker({
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
		    
				
				 //datepicker BioTank    
				 
		    
				   $('#bioTankTestingDate').datepicker({
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

						   
						   $('#bioTankTestingBacteriaFeedDate').datepicker({
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

						   $('#airBrakeDate').datepicker({
						       
						        dateFormat: 'dd-mm-yy',
						        changeMonth: true,
						        changeYear: true,
						        yearRange: '-2:+2',
						        maxDate: new Date(),
						        constrainInput: false,
						        duration: '',
						        gotoCurrent: true,
						        beforeShow: function() {
						            setTimeout(function(){
						                $('.ui-datepicker').css('z-index', 99999999999999);
						            }, 0);
						        }
						    }).datepicker("setDate", new Date());
						   $('#ccTvDateOfTesting').datepicker({
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
						   $('#dateofbuffercbcheighttesting').datepicker({
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
						   $('#dateOfFibaTesting').datepicker({
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
							
							$('#bogieNPPMfgDate').datepicker({
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
							
							$('#bogiePPMfgDate').datepicker({
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
							
							
							$('#fibaPPMfgDate').datepicker({
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
							
							
							$('#fibaNPPMfgDate').datepicker({
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
							
							
							$('#indicatorPPMfgDate').datepicker({
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
							
							
							$('#indicatorNPPMfgDate').datepicker({
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
	$('#FurnishingProductionTableContainer').jtable({
			
			title : 'Quality Shop Production',
			
			paging:true,
            sorting: true,
            defaultSorting: 'receiptDateAtQuality ASC',
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
            
            
            //toolbar
         toolbar: {
            items: [
            
              		 {
                    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'PlumbingTesting',
                        click: function () {
                        	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you want to Inspect");
                    	 	 else{
                    	 		var record;
                    	 		/* if(record.bogiePpSideAssetId==null)
                    	 		{
                    	 				alert("PpSideAssetId is empty");
                    	 				return false;
                    	 		}
                    	 		if(record.bogieNppSideAssetId==null)
                	 			{
                	 				alert("NppSideAssetId is empty");
                	 				return false;
                	 			} */
                	 		
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
                    	 		
                    	 		
                    	 		//show pre existing data;
                    	 		$.ajax({
    								url:"showExistingDataPlumbingTesting", //action-name as defined in struts.xml
    								dataType:'json',
    								type:'POST',
    								async:false,
    								data:{
    									furnishingAssetId:record.furnishingAssetId,
    								
    								},
    								success:function(data)
    								{
    									$('#plumbingDocNo').val(data.plumbingDocNo);
    									$('#plumbingShellType').val(data.plumbingShellType);
    									$('#plumbingShellNo').val(data.plumbingShellNo);
    									$('#plumbingFurnishingNo').val(data.plumbingFurnishingNo);
    									
    									
    								}
    									
    								});
                    	 		
                    	 		
                    	 		if(record.setPlumbingTestingFlag=1)
								{
								
								$.ajax({
									url:"showSaveDataPlumbingform", //action-name as defined in struts.xml
									dataType:'json',
									type:'POST',
									async:false,
									data:{
										furnishingAssetId:record.furnishingAssetId,	
									},
									success:function(data)
									{
										
										// $('#plumbingFurnishingNo').val(data.plumbingTestingTransaction.furnishingAssetId);
										var plumbingDatevar=(data.plumbingTestingTransaction.dateOfTesting).substring(0,10);
										var plumbingDateArray=plumbingDatevar.split("-");
										$('#plumbingDate').datepicker("setDate",new Date(plumbingDateArray[0],plumbingDateArray[1]-1,plumbingDateArray[2]));
										 $('#plumbingShift').val(data.plumbingTestingTransaction.shift);
										$('[id="properSealpipe"]').val([data.plumbingTestingTransaction.sealingPipeJointsFlag]);
										 $('[id="properSealLavArea"]').val([data.plumbingTestingTransaction.sealingLavatoryFlag]);
										$('[id="properSealDoorway"]').val([data.plumbingTestingTransaction.sealingDoorWayGangFlag]);
										$('[id="waterFlowLotachTaps"]').val([data.plumbingTestingTransaction.waterFlowLotahFlag]);
										$('[id="waterFlowBasinTap"]').val([data.plumbingTestingTransaction.waterFlowInsideWashbasinFlag]);
										$('[id="flushArrange"]').val([data.plumbingTestingTransaction.flushingArrangementFlag]);
										$('[id="waterflowLavPan"]').val([data.plumbingTestingTransaction.waterFlowLavatoryFlag]);
										$('[id="waterFlowCommode"]').val([data.plumbingTestingTransaction.waterFlowCommodeFlag]);
										$('[id="waterOutWashBasinTap"]').val([data.plumbingTestingTransaction.waterFlowOusideWashbasinFlag]);
										$('[id="properSeaTrap"]').val([data.plumbingTestingTransaction.sealingSTrapFlag]);
										$('[id="waterFlowFlexFaucet"]').val([data.plumbingTestingTransaction.waterFlowFlexibleFaucetFlag]);
										$('[id="plumbingConfroming"]').val([data.plumbingTestingTransaction.testingStatusPlumbing]);
										$('#plumbingDtlOfmodf').val(data.plumbingTestingTransaction.modificationDetails);
										$('#plumbingDtlOfTrial').val(data.plumbingTestingTransaction.trialItemsDetails);
										$('#plumbingRemarks').val(data.plumbingTestingTransaction.remarks);  
										System.out.println("done!!!");
										
										
									}
									
								});
							}//end of showSaveData
							
             
								
								$('#plumbingDate').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
								
            					
                    	 	 	$("#PlumbingTestingSIPDialog").dialog({
                    	 	 		title : 'PlumbingTest'+record.shellTransactionId + 'from Stage- <%=stageID%>', 
                    	 	 		width:'80%',
                    	 	 		close: function (e, u) {
              	 		             
                    	 	 			$('#PlumbingTestingSIPDialog').find('form[name="Stage4"]')[0].reset();
              	 		          	$("#PlumbingTestingSIPDialog").validationEngine('hideAll');
              	 		          },
                	 		 	 
 		 							buttons: {
	                                    Submit: {
	                                       text: "Submit",
	                                        id: "my-button-submit",
	                                        click:function () {	    	   
	         									//validations
	                                        	var c=confirm("Do you want submit the SIP Form");
		                                    	if(c==false){return false;}
	         
		                                    		    	   
		                                    	  $.ajax({
		                    						url : "saveDataFormPlumbing",  //action-name as defined in struts.xml
		                    						dataType: 'json', 
		                    						data : {
		                    							
		                    							furnishingAssetId: record.furnishingAssetId,
		                    							stageId: '<%=stageID%>',
		                    							plumbingDocNo:$('#plumbingDocNo').val(),
		                    							plumbingShift:$('#plumbingShift').val(),
		                    							plumbingDate:$('#plumbingDate').val(),
		                    							sealingPipeJointsFlag:$("input[id='properSealpipe']:checked").val(),
		                    							sealingLavatoryFlag:$("input[id='properSealLavArea']:checked").val(),
		                    							sealingDoorWayGangFlag:$("input[id='properSealDoorway']:checked").val(),
		                    							waterFlowLotahFlag:$("input[id='waterFlowLotachTaps']:checked").val(),
		                    							waterFlowInsideWashbasinFlag:$("input[id='waterFlowBasinTap']:checked").val(),
		                    							flushingArrangementFlag:$("input[id='flushArrange']:checked").val(),
		                    							waterFlowLavatoryFlag:$("input[id='waterflowLavPan']:checked").val(),
		                    							waterFlowCommodeFlag:$("input[id='waterFlowCommode']:checked").val(),
		                    							waterFlowOusideWashbasinFlag:$("input[id='waterOutWashBasinTap']:checked").val(),
		                    							sealingSTrapFlag:$("input[id='properSeaTrap']:checked").val(),
		                    							waterFlowFlexibleFaucetFlag:$("input[id='waterFlowFlexFaucet']:checked").val(),
		                    							modificationDetails:$('#plumbingDtlOfmodf').val(),
		                    							trialItemsDetails:$('#plumbingDtlOfTrial').val(),
		                    							remarks:$('#plumbingRemarks').val(),
		                    							testingStatusPlumbing:$("input[id='plumbingConfroming']:checked").val(),
		                    							entryBy:$('#entryBy').val(),
		                    							entryDate:$('#entryDate').val()

		                    							
		                    							
		                    						},
		                    						
		                    						type : 'POST',
		                    						async : false,
		                            	 		}) 
		                    						.done(function( msg ) {
		                    							
		                    							
		                    							$('#plumbingDocNo').val(''),  
		                    							$('#plumbingShift').val(''),   
		                    							$('#plumbingDate').val(''),
		                    							$('#properSealpipe').val(''),
		                    							$('#properSealLavArea').val(''),
		                    							$('#properSealDoorway').val(''),
		                    							$('#waterFlowLotachTaps').val(''),
		                    							$('#waterFlowBasinTap').val(''),
		                    							$('#flushArrange').val(''),
		                    							$('#waterflowLavPan').val(''),
		                    							$('#waterFlowCommode').val(''),
		                    							$('#waterOutWashBasinTap').val(''),
		                    							$('#properSeaTrap').val(''),
		                    							$('#waterFlowFlexFaucet').val(''),
		                    							$('#plumbingDtlOfmodf').val(''),
		                    							$('#plumbingDtlOfTrial').val(''),
		                    							$('#plumbingRemarks').val(''),
		                    							$('#plumbingConfroming').val(''),
		                    							$('#entryBy').val(''),
		                    							$('#entryDate').val(''),
		                    	
		                    							
		                    							$('#PlumbingTestingSIPDialog').dialog('close');
		                    							
		                    							$('#FurnishingProductionTableContainer').jtable('load');
		         								  }) 
		         								.error(function (msg){
		         									//$('#dialog').dialog('close');
		         									alert("Error Fetching Data");
		         								})
		         								  ;
		                 						  return true;
				                                    }
	                                    }, 
				                        Close: function () {
				                        	$('#PlumbingTestingSIPDialog').find('form[name="PlumbingTestingForm"]')[0].reset();
				                                        $(this).dialog('close');
				                                    }//end of clickFunction
	                                    },//end of buttons
	                    	        modal: true
    	    });
                    	 		
                    	 		
                    	 		
                    	 		
                    	 		
                    	 		    
            			    	   return true; 
            			    	   	
                    	 		    
                    	 			  
                    	 		  }//ending else               	  
                    	  // ajax call ends here
                    	  
                    	 			
    						 
                        }
                     },
                     
              		 //SHOWER_TESTING
              		  {
                    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'ShowerTesting',
                        click: function () {
                        	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you want to Inspect");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
                    	 		
                    	 		//showSaveData
          
                    	 		if(record.setShowerTestingFlag=1)
								{
								
								$.ajax({
									url:"showSaveDataShowerform", //action-name as defined in struts.xml
									dataType:'json',
									type:'POST',
									async:false,
									data:{
										furnishingAssetId:record.furnishingAssetId,	
									},
									success:function(data)
									{
										
										var showerDatevar=(data.showerTestingTransaction.dateOfTesting).substring(0,10);
										var showerDateArray=showerDatevar.split("-");
										$('#showerTestingDate').datepicker("setDate",new Date(showerDateArray[0],showerDateArray[1]-1,showerDateArray[2]));
										$('#showerTestingShift').val(data.showerTestingTransaction.shift);
										$('[id="showerTestTimeCoach"]').val([data.showerTestingTransaction.testingTimeFlag]);
										$('[id="leakageRoofArea"]').val([data.showerTestingTransaction.leakageRoofFlag]);
										$('[id="leakagejointEndwallRoof"]').val([data.showerTestingTransaction.leakageJoinEndRoofFlag]);
										$('[id="leakageCantRailArea"]').val([data.showerTestingTransaction.leakageCantRailAreaFlag]);
										$('[id="leakageVentArea"]').val([data.showerTestingTransaction.leakageVentilatorAreaFlag]);
										$('[id="leakageShutterDoor"]').val([data.showerTestingTransaction.leakageShutterSlidingFlag]);
										$('[id="leakageAcTrough"]').val([data.showerTestingTransaction.leakageAcThroughFlag]);
										$('[id="leakageWindows"]').val([data.showerTestingTransaction.leakageWindowsFlag]);
										$('[id="showerTestingConfroming"]').val([data.showerTestingTransaction.showerTestingStatus]);
										$('#showerTestingRemarks').val(data.showerTestingTransaction.remarks);  
										//System.out.println("done!!!");
										
										
									}
									
								});
							}//end of showSaveData
                    	 		
                    	 		
                    	 		//show pre existing data;
                    	 		$.ajax({
    								url:"showExistingDataShowerTesting", //action-name as defined in struts.xml
    								dataType:'json',
    								type:'POST',
    								async:false,
    								data:{
    									furnishingAssetId:record.furnishingAssetId,
    								
    								},
    								success:function(data)
    								{
    									$('#showerTestingDocNo').val(data.showerTestingDocNo);
    									$('#showerTestingShellType').val(data.showerTestingShellType);
    									$('#showerShellNo').val(data.showerShellNo);
    									$('#showerTestingFurnishingNo').val(data.furnishingNo);
    									$('#showerTestingCoachNo').val(data.showerTestingCoachNo);
    									
    								}
    									
    								});
                    	 		
                    	 		

								
								
								$('#showerTestingDate').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
								
            					
                    	 	 	$("#ShowerTestingSIPDialog").dialog({
                    	 	 		title : 'ShowerTest'+record.shellTransactionId + 'from Stage- <%=stageID%>', 
                    	 	 		width:'80%',
                    	 	 		close: function (e, u) {
              	 		             
                    	 	 			$('#ShowerTestingSIPDialog').find('form[name="ShowerTestingForm"]')[0].reset();
              	 		          	$("#ShowerTestingSIPDialog").validationEngine('hideAll');
              	 		          },
                	 		 	 
 		 							buttons: {
	                                    Submit: {
	                                       text: "Submit",
	                                        id: "my-button-submit",
	                                        click:function () {	
	                                           	var c=confirm("Do you want submit the SIP Form");
		                                    	if(c==false){return false;}
	         
		                                    		    	   
		                                    	  $.ajax({
		                    						url : "saveDataFormShower",  //action-name as defined in struts.xml
		                    						dataType: 'json', 
		                    						data : {
		                    							
		                    							furnishingAssetId: record.furnishingAssetId,
		                    							stageId: '<%=stageID%>',
		                    							showerTestingDocNo:$('#showerTestingDocNo').val(),
		                    							showerTestingShift:$('#showerTestingShift').val(),
		                    							showerTestingDate:$('#showerTestingDate').val(),
		                    							showerTestTimeCoach:$("input[id='showerTestTimeCoach']:checked").val(),
		                    							leakageRoofArea:$("input[id='leakageRoofArea']:checked").val(),
		                    							leakagejointEndwallRoof:$("input[id='leakagejointEndwallRoof']:checked").val(),
		                    							leakageCantRailArea:$("input[id='leakageCantRailArea']:checked").val(),
		                    							leakageVentArea:$("input[id='leakageVentArea']:checked").val(),
		                    							leakageShutterDoor:$("input[id='leakageShutterDoor']:checked").val(),
		                    							leakageAcTrough:$("input[id='leakageAcTrough']:checked").val(),
		                    							leakageWindows:$("input[id='leakageWindows']:checked").val(),
		                    							showerTestingConfroming:$("input[id='showerTestingConfroming']:checked").val(),
		                    							showerTestingRemarks:$('#showerTestingRemarks').val(),
		                    							entryBy:$('#entryBy').val(),
		                    							entryDate:$('#entryDate').val()

		                    							
		                    							
		                    						},
		                    						
		                    						type : 'POST',
		                    						async : false,
		                            	 		}) 
		                    						.done(function( msg ) {
		                    							
		                    							
		                    							$('#showerTestingDocNo').val(''),  
		                    							$('#showerTestingShift').val(''),   
		                    							$('#showerTestingDate').val(''),
		                    							$('#showerTestTimeCoach').val(''),
		                    							$('#leakageRoofArea').val(''),
		                    							$('#leakagejointEndwallRoof').val(''),
		                    							$('#leakageCantRailArea').val(''),
		                    							$('#leakageVentArea').val(''),
		                    							$('#leakageShutterDoor').val(''),
		                    							$('#leakageAcTrough').val(''),
		                    							$('#leakageWindows').val(''),
		                    							$('#showerTestingConfroming').val(''),
		                    							$('#showerTestingRemarks').val(''),
		                    							$('#entryBy').val(''),
		                    							$('#entryDate').val(''),
		                    							$('#ShowerTestingSIPDialog').dialog('close');
		                    							
		                    							$('#FurnishingProductionTableContainer').jtable('load');
		         								  }) 
		         								.error(function (msg){
		         									//$('#dialog').dialog('close');
		         									alert("Error Fetching Data");
		         								})
		         								  ;
	         
	                    					
					                 			    	   return true;
				                                    }
	                                    }, 
				                        Close: function () {
				                        	$('#ShowerTestingSIPDialog').find('form[name="ShowerTestingForm"]')[0].reset();
				                                        $(this).dialog('close');
				                                    }//end of clickFunction
	                                    },//end of buttons
	                    	        modal: true
    	    });
                    	 		
                    	 		
                    	 		
                    	 		
                    	 		
                    	 		    
            			    	   return true; 
            			    	   	
                    	 		    
                    	 			  
                    	 		  }//ending else               	  
                    	  // ajax call ends here
                    	  
                    	 			
    						 
                        }
                     },
                     
                     {
                      	icon: '<%=contextpath%>/images/rs_out.png',
                          text: 'BioTankTesting',
                          click: function () {
                          	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
                      	 	 if ($selectedRows.length<1)
                      		 alert("Please select a row for which you want to Inspect");
                      	 	 else{
                      	 		var record;
                      	 		$selectedRows.each(function () {
                                      record = $(this).data('record');
                                      });
                      	 		
                      	 		
                      	 		
                      	 		
                      	 	//showSaveData
                      	          
                     	 		if(record.biotankTestingFlag==1)
 								{
 								
 								$.ajax({
 									url:"showSaveDataBioTankform", //action-name as defined in struts.xml
 									dataType:'json',
 									type:'POST',
 									async:false,
 									data:{
 										furnishingAssetId:record.furnishingAssetId,	
 									},
 									success:function(data)
 									{
 										
 									
 										 var biotankDatevar=(data.biotankTestTrans.dateOfBiotankTesting).substring(0,10);
 										var biotankDateArray=biotankDatevar.split("-");
 										
 										$('#bioTankTestingDate').datepicker("setDate",new Date(biotankDateArray[0],biotankDateArray[1]-1,biotankDateArray[2])); 
 										
 										$('#bioTankTestingBacteriaMake').val(data.furnishingTran.biotankBacteriaMake);
 										
 										
 										$('#bioTankTestingBacteriaType').val(data.furnishingTran.biotankBacteriaType);
 										
 										$('#bioTankTestingMakeLav1').val(data.furnishingTran.biotankLavatoryMake_1);
 										$('#bioTankTestingMakeLav2').val(data.furnishingTran.biotankLavatoryMake_2);
 										$('#bioTankTestingMakeLav3').val(data.furnishingTran.biotankLavatoryMake_3);
 										$('#bioTankTestingMakeLav4').val(data.furnishingTran.biotankLavatoryMake_4);
 									
 										
 										
 										$('#bioTankTestingShift').val(data.biotankTestTrans.shiftBiotank);
 	
 										$('[id="weldRibBendBrklav1"]').val([data.biotankTestTrans.biotankWeldingLav1]);
 										
 										 $('[id="weldRibBendBrklav2"]').val([data.biotankTestTrans.biotankWeldingLav2]);
 										$('[id="weldRibBendBrklav3"]').val([data.biotankTestTrans.biotankWeldingLav3]);
 										$('[id="weldRibBendBrklav4"]').val([data.biotankTestTrans.biotankWeldingLav4]);
 										
 										$('[id="properBioTankTightlav1"]').val([data.biotankTestTrans.biotankMountingLav1]);
 										$('[id="properBioTankTightlav2"]').val([data.biotankTestTrans.biotankMountingLav2]);
 										$('[id="properBioTankTightlav3"]').val([data.biotankTestTrans.biotankMountingLav3]);
 										$('[id="properBioTankTightlav4"]').val([data.biotankTestTrans.biotankMountingLav4]);
 										$('[id="panOutAlignBallValvelav1"]').val([data.biotankTestTrans.biotankHoleAlignmentLav1]);
 										$('[id="panOutAlignBallValvelav2"]').val([data.biotankTestTrans.biotankHoleAlignmentLav2]);
 										$('[id="panOutAlignBallValvelav3"]').val([data.biotankTestTrans.biotankHoleAlignmentLav3]);
 										$('[id="panOutAlignBallValvelav4"]').val([data.biotankTestTrans.biotankHoleAlignmentLav4]);
 										$('[id="weldCondJbracketlav1"]').val([data.biotankTestTrans.biotankWeldingJbracketLav1]);
 										$('[id="weldCondJbracketlav2"]').val([data.biotankTestTrans.biotankWeldingJbracketLav2]);
 										$('[id="weldCondJbracketlav4"]').val([data.biotankTestTrans.biotankWeldingJbracketLav4]);
 										$('[id="fitBioJbracketlav1"]').val([data.biotankTestTrans.biotankFittingJbracketLav1]);
 										$('[id="fitBioJbracketlav2"]').val([data.biotankTestTrans.biotankFittingJbracketLav2]);
 										$('[id="fitBioJbracketlav3"]').val([data.biotankTestTrans.biotankFittingJbracketLav3]);
 										$('[id="fitBioJbracketlav4"]').val([data.biotankTestTrans.biotankFittingJbracketLav4]);
 										$('[id="rubberConnCondlav1"]').val([data.biotankTestTrans.biotankRubberConnectorLav1]);
 										$('[id="rubberConnCondlav2"]').val([data.biotankTestTrans.biotankRubberConnectorLav2]);
 										$('[id="rubberConnCondlav3"]').val([data.biotankTestTrans.biotankRubberConnectorLav3]);
 										$('[id="rubberConnCondlav4"]').val([data.biotankTestTrans.biotankRubberConnectorLav4]);
 										$('[id="leakChloUnitlav1"]').val([data.biotankTestTrans.biotankLeakageChlorinatorLav1]);
 										$('[id="leakChloUnitlav2"]').val([data.biotankTestTrans.biotankLeakageChlorinatorLav2]);
 										$('[id="leakChloUnitlav3"]').val([data.biotankTestTrans.biotankLeakageChlorinatorLav3]);
 										$('[id="leakChloUnitlav4"]').val([data.biotankTestTrans.biotankLeakageChlorinatorLav4]);
 										$('[id="condOfChlolav1"]').val([data.biotankTestTrans.biotankConditionChlorinatorLav1]);
 										$('[id="condOfChlolav2"]').val([data.biotankTestTrans.biotankConditionChlorinatorLav2]);
 										$('[id="condOfChlolav3"]').val([data.biotankTestTrans.biotankConditionChlorinatorLav3]);
 										$('[id="condOfChlolav4"]').val([data.biotankTestTrans.biotankConditionChlorinatorLav4]);
 										$('[id="condOfSafeStraplav1"]').val([data.biotankTestTrans.biotankConditionSafetystrapLav1]);
 										$('[id="condOfSafeStraplav2"]').val([data.biotankTestTrans.biotankConditionSafetystrapLav2]);
 										$('[id="condOfSafeStraplav3"]').val([data.biotankTestTrans.biotankConditionSafetystrapLav3]);
 										$('[id="condOfSafeStraplav4"]').val([data.biotankTestTrans.biotankConditionSafetystrapLav4]);
 										$('[id="leakRubberBlockChlorlav1"]').val([data.biotankTestTrans.biotankLeakageRubbergasketLav1]);
 										$('[id="leakRubberBlockChlorlav2"]').val([data.biotankTestTrans.biotankLeakageRubbergasketLav2]);
 										$('[id="leakRubberBlockChlorlav3"]').val([data.biotankTestTrans.biotankLeakageRubbergasketLav3]);
 										$('[id="leakRubberBlockChlorlav4"]').val([data.biotankTestTrans.biotankLeakageRubbergasketLav4]);
 										$('[id="leakJointConnCompSyslav1"]').val([data.biotankTestTrans.biotankLeakageJointconnectionLav1]);
 										$('[id="leakJointConnCompSyslav2"]').val([data.biotankTestTrans.biotankLeakageJointconnectionLav2]);
 										$('[id="leakJointConnCompSyslav3"]').val([data.biotankTestTrans.biotankLeakageJointconnectionLav3]);
 										$('[id="leakJointConnCompSyslav4"]').val([data.biotankTestTrans.biotankLeakageJointconnectionLav4]);
 										$('[id="funcOfFlushButtlav1"]').val([data.biotankTestTrans.biotankFlushbuttonLav1]);
 										$('[id="funcOfFlushButtlav2"]').val([data.biotankTestTrans.biotankFlushbuttonLav2]);
 										$('[id="funcOfFlushButtlav3"]').val([data.biotankTestTrans.biotankFlushbuttonLav3]);
 										$('[id="funcOfFlushButtlav4"]').val([data.biotankTestTrans.biotankFlushbuttonLav4]);
 										$('[id="suffFlushPanlav1"]').val([data.biotankTestTrans.biotankSufficientFlushingLav1]);
 										$('[id="suffFlushPanlav2"]').val([data.biotankTestTrans.biotankSufficientFlushingLav2]);
 										$('[id="suffFlushPanlav3"]').val([data.biotankTestTrans.biotankSufficientFlushingLav3]);
 										$('[id="suffFlushPanlav4"]').val([data.biotankTestTrans.biotankSufficientFlushingLav4]);
 										$('[id="odourMedHeavylav1"]').val([data.biotankTestTrans.biotankFoulOdourLav1]);
 										$('[id="odourMedHeavylav2"]').val([data.biotankTestTrans.biotankFoulOdourLav2]);
 										$('[id="odourMedHeavylav3"]').val([data.biotankTestTrans.biotankFoulOdourLav3]);
 										$('[id="odourMedHeavylav4"]').val([data.biotankTestTrans.biotankFoulOdourLav4]);
 										$('[id="stickUserlav1"]').val([data.biotankTestTrans.biotankStickerLav1]);
 										$('[id="stickUserlav2"]').val([data.biotankTestTrans.biotankStickerLav2]);
 										$('[id="stickUserlav3"]').val([data.biotankTestTrans.biotankStickerLav3]);
 										$('[id="stickUserlav4"]').val([data.biotankTestTrans.biotankStickerLav4]);
 										$('[id="chockStraplav1"]').val([data.biotankTestTrans.biotankChockingStrapLav1]);
 										$('[id="chockStraplav2"]').val([data.biotankTestTrans.biotankChockingStrapLav2]);
 										$('[id="chockStraplav3"]').val([data.biotankTestTrans.biotankChockingStrapLav3]);
 										$('[id="chockStraplav4"]').val([data.biotankTestTrans.biotankChockingStrapLav4]);
 										$('[id="consumpFlushlav1"]').val([data.biotankTestTrans.biotankConsumptionWaterLav1]);
 										$('[id="consumpFlushlav2"]').val([data.biotankTestTrans.biotankConsumptionWaterLav2]);
 										$('[id="consumpFlushlav3"]').val([data.biotankTestTrans.biotankConsumptionWaterLav3]);
 										$('[id="consumpFlushlav4"]').val([data.biotankTestTrans.biotankConsumptionWaterLav4]);
 										$('[id="sysFlushCyclelav1"]').val([data.biotankTestTrans.biotankReadyNextFlushLav1]);
 										$('[id="sysFlushCyclelav2"]').val([data.biotankTestTrans.biotankReadyNextFlushLav2]);
 										$('[id="sysFlushCyclelav3"]').val([data.biotankTestTrans.biotankReadyNextFlushLav3]);
 										$('[id="sysFlushCyclelav4"]').val([data.biotankTestTrans.biotankReadyNextFlushLav4]);
 										$('[id="allPrtVaccToiletlav1"]').val([data.biotankTestTrans.biotankVacuumEvacuationLav1]);
 										$('[id="allPrtVaccToiletlav2"]').val([data.biotankTestTrans.biotankVacuumEvacuationLav2]);
 										$('[id="allPrtVaccToiletlav3"]').val([data.biotankTestTrans.biotankVacuumEvacuationLav3]);
 										$('[id="allPrtVaccToiletlav4"]').val([data.biotankTestTrans.biotankVacuumEvacuationLav4]);
 										$('[id="airPressureSupplav1"]').val([data.biotankTestTrans.biotankAirPressureLav1]);
 										$('[id="airPressureSupplav2"]').val([data.biotankTestTrans.biotankAirPressureLav2]);
 										$('[id="airPressureSupplav3"]').val([data.biotankTestTrans.biotankAirPressureLav3]);
 										$('[id="airPressureSupplav4"]').val([data.biotankTestTrans.biotankAirPressureLav4]);
 										$('[id="bioTankConforming"]').val([data.biotankTestTrans.bioTankTestingStatus]);
 										
 										$('#weldRibBendBrk').val(data.biotankTestTrans.biotankWeldingRemark);
 										$('#properBioTankTight').val(data.biotankTestTrans.biotankMountingRemark);
 										$('#panOutAlignBallValve').val(data.biotankTestTrans.biotankHoleAlignmenRemark);
 										$('#weldCondJbracket').val(data.biotankTestTrans.biotankWeldingJbracketRemark);
 										$('#fitBioJbracket').val(data.biotankTestTrans.biotankFittingJbracketRemark);
 										$('#rubberConnCond').val(data.biotankTestTrans.biotankRubberConnectorRemark);
 										$('#leakChloUnit').val(data.biotankTestTrans.biotankLeakageChlorinatorRemark);
 										$('#condOfChlol').val(data.biotankTestTrans.biotankConditionChlorinatorRemark);
 										$('#condOfSafeStrap').val(data.biotankTestTrans.biotankConditionSafetystrapRemark);
 										$('#leakRubberBlockChlor').val(data.biotankTestTrans.biotankLeakageRubbergasketRemark);
 										$('#leakJointConnCompSys').val(data.biotankTestTrans.biotankLeakageJointconnectionRemark);
 										$('#funcOfFlushButt').val(data.biotankTestTrans.biotankFlushbuttonRemark);
 										$('#suffFlushPan').val(data.biotankTestTrans.biotankSufficientFlushingRemark);
 										$('#odourMedHeavy').val(data.biotankTestTrans.biotankFoulOdourRemark);
 										$('#stickUser').val(data.biotankTestTrans.biotankStickerRemark);
 										$('#chockStrap').val(data.biotankTestTrans.biotankChockingStrapRemark);
 										$('#consumpFlush').val(data.biotankTestTrans.biotankConsumptionWaterRemark);
 										$('#sysFlushCycle').val(data.biotankTestTrans.biotankReadyNextFlushRemark);
 										$('#allPrtVaccToilet').val(data.biotankTestTrans.biotankVacuumEvacuationRemark);
 										$('#airPressureSupp').val(data.biotankTestTrans.biotankAirPressureRemark);
 										
 										  
 										 
 									}
 									
 								});
 							}//end of showSaveData
                      	 		//show pre existing data;
                      	 		
                      	 		$.ajax({
     								url:"showExistingDataBioTankTesting", //action-name as defined in struts.xml
     								dataType:'json',
     								type:'POST',
     								async:false,
     								data:{
     									furnishingAssetId:record.furnishingAssetId,
     								
     								},
     								success:function(data)
     								{
     									$('#bioTankTestingDocNo').val(data.bioTankTestingDocNo);
     									$('#bioTankTestingFurNo').val(data.bioTankTestingFurNo);
     									$('#bioTankTestingMakeLav1').val(data.bioTankTestingMakeLav1);
     									$('#bioTankTestingMakeLav2').val(data.bioTankTestingMakeLav2);
     									$('#bioTankTestingMakeLav3').val(data.bioTankTestingMakeLav3);
     									$('#bioTankTestingMakeLav4').val(data.bioTankTestingMakeLav4);
     									$('#bioTankTestingBacteriaType').val(data.bioTankTestingBacteriaType);
     									$('#bioTankTestingBacteriaMake').val(data.bioTankTestingBacteriaMake);
     									
     									//$('#bioTankTestingBacteriaFeedDate').val(data.bioTankTestingBacteriaFeedDate);
     									if(data.bioTankTestingBacteriaFeedDate!=null)
     									{
     									var biotankDatevar=(data.bioTankTestingBacteriaFeedDate).substring(0,10);
 										var bioTankDateArray=biotankDatevar.split("-");
 										$('#bioTankTestingBacteriaFeedDate').datepicker("setDate",new Date(bioTankDateArray[0],bioTankDateArray[1]-1,bioTankDateArray[2]));
 										
     									}
     								}
     									
     								});

  								
  								
  								$('#bioTankTestingDate').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
  								
              					
                      	 	 	$("#BioTankTestingSIPDialog").dialog({
                      	 	 		title : 'BioTankTest'+record.shellTransactionId + 'from Stage- <%=stageID%>', 
                      	 	 		width:'80%',
                      	 	 		close: function (e, u) {
                	 		             
                      	 	 			$('#BioTankTestingSIPDialog').find('form[name="bioTankTestingForm"]')[0].reset();
                	 		          	$("#BioTankTestingSIPDialog").validationEngine('hideAll');
                	 		          },
                  	 		 	 
   		 							buttons: {
  	                                    Submit: {
  	                                       text: "Submit",
  	                                        id: "my-button-submit",
  	                                        click:function () {	  
  	                                        	
  	                                        	var c=confirm("Do you want submit the SIP Form");
 		                                    	if(c==false){return false;}
 	         
 		                                    		    	   
 		                                    	  $.ajax({
 		                    						url : "saveDataFormBioTank",  //action-name as defined in struts.xml
 		                    						dataType: 'json', 
 		                    						data : {
 		                    							
 		                    							furnishingAssetId: record.furnishingAssetId,
 		                    							stageId: '<%=stageID%>',
 		                    							bioTankTestingDocNo:$('#bioTankTestingDocNo').val(),
 		                    							bioTankTestingShift:$('#bioTankTestingShift').val(),
 		                    							bioTankTestingDate:$('#bioTankTestingDate').val(),
 		                    							bioTankTestingMakeLav1:$('#bioTankTestingMakeLav1').val(),
 		                    							bioTankTestingMakeLav2:$('#bioTankTestingMakeLav2').val(),
 		                    							bioTankTestingMakeLav3:$('#bioTankTestingMakeLav3').val(),
 		                    							bioTankTestingMakeLav4:$('#bioTankTestingMakeLav4').val(),
 		                    							bioTankTestingBacteriaType:$('#bioTankTestingBacteriaType').val(),
 		                    							bioTankTestingBacteriaMake:$('#bioTankTestingBacteriaMake').val(),
 		                    							bioTankTestingBacteriaFeedDate:$('#bioTankTestingBacteriaFeedDate').val(),
 		                    							weldRibBendBrklav1:$("input[id='weldRibBendBrklav1']:checked").val(),
 		                    							weldRibBendBrklav2:$("input[id='weldRibBendBrklav2']:checked").val(),
 		                    							weldRibBendBrklav3:$("input[id='weldRibBendBrklav3']:checked").val(),
 		                    							weldRibBendBrklav4:$("input[id='weldRibBendBrklav4']:checked").val(),
 		                    							properBioTankTightlav1:$("input[id='properBioTankTightlav1']:checked").val(),
 		                    							properBioTankTightlav2:$("input[id='properBioTankTightlav2']:checked").val(),
 		                    							properBioTankTightlav3:$("input[id='properBioTankTightlav3']:checked").val(),
 		                    							properBioTankTightlav4:$("input[id='properBioTankTightlav4']:checked").val(),
 		                    							panOutAlignBallValvelav1:$("input[id='panOutAlignBallValvelav1']:checked").val(),
 		                    							panOutAlignBallValvelav2:$("input[id='panOutAlignBallValvelav2']:checked").val(),
 		                    							panOutAlignBallValvelav3:$("input[id='panOutAlignBallValvelav3']:checked").val(),
 		                    							panOutAlignBallValvelav4:$("input[id='panOutAlignBallValvelav4']:checked").val(),
 		                    							weldCondJbracketlav1:$("input[id='weldCondJbracketlav1']:checked").val(),
 		                    							weldCondJbracketlav2:$("input[id='weldCondJbracketlav2']:checked").val(),
 		                    							weldCondJbracketlav3:$("input[id='weldCondJbracketlav3']:checked").val(),
 		                    							weldCondJbracketlav4:$("input[id='weldCondJbracketlav4']:checked").val(),
 		                    							fitBioJbracketlav1:$("input[id='fitBioJbracketlav1']:checked").val(),
 		                    							fitBioJbracketlav2:$("input[id='fitBioJbracketlav2']:checked").val(),
 		                    							fitBioJbracketlav3:$("input[id='fitBioJbracketlav3']:checked").val(),
 		                    							fitBioJbracketlav4:$("input[id='fitBioJbracketlav4']:checked").val(),
 		                    							rubberConnCondlav1:$("input[id='rubberConnCondlav1']:checked").val(),
 		                    							rubberConnCondlav2:$("input[id='rubberConnCondlav2']:checked").val(),
 		                    							rubberConnCondlav3:$("input[id='rubberConnCondlav3']:checked").val(),
 		                    							rubberConnCondlav4:$("input[id='rubberConnCondlav4']:checked").val(),
 		                    							leakChloUnitlav1:$("input[id='leakChloUnitlav1']:checked").val(),
 		                    							leakChloUnitlav2:$("input[id='leakChloUnitlav2']:checked").val(),
 		                    							leakChloUnitlav3:$("input[id='leakChloUnitlav3']:checked").val(),
 		                    							leakChloUnitlav4:$("input[id='leakChloUnitlav4']:checked").val(),
 		                    							condOfChlolav1:$("input[id='condOfChlolav1']:checked").val(),
 		                    							condOfChlolav2:$("input[id='condOfChlolav2']:checked").val(),
 		                    							condOfChlolav3:$("input[id='condOfChlolav3']:checked").val(),
 		                    							condOfChlolav4:$("input[id='condOfChlolav4']:checked").val(),
 		                    							condOfSafeStraplav1:$("input[id='condOfSafeStraplav1']:checked").val(),
 		                    							condOfSafeStraplav2:$("input[id='condOfSafeStraplav2']:checked").val(),
 		                    							condOfSafeStraplav3:$("input[id='condOfSafeStraplav3']:checked").val(),
 		                    							condOfSafeStraplav4:$("input[id='condOfSafeStraplav4']:checked").val(),
 		                    							leakRubberBlockChlorlav1:$("input[id='leakRubberBlockChlorlav1']:checked").val(),
 		                    							leakRubberBlockChlorlav2:$("input[id='leakRubberBlockChlorlav2']:checked").val(),
 		                    							leakRubberBlockChlorlav3:$("input[id='leakRubberBlockChlorlav3']:checked").val(),
 		                    							leakRubberBlockChlorlav4:$("input[id='leakRubberBlockChlorlav4']:checked").val(),
 		                    							leakJointConnCompSyslav1:$("input[id='leakJointConnCompSyslav1']:checked").val(),
 		                    							leakJointConnCompSyslav2:$("input[id='leakJointConnCompSyslav2']:checked").val(),
 		                    							leakJointConnCompSyslav3:$("input[id='leakJointConnCompSyslav3']:checked").val(),
 		                    							leakJointConnCompSyslav4:$("input[id='leakJointConnCompSyslav4']:checked").val(),
 		                    							funcOfFlushButtlav1:$("input[id='funcOfFlushButtlav1']:checked").val(),
 		                    							funcOfFlushButtlav2:$("input[id='funcOfFlushButtlav2']:checked").val(),
 		                    							funcOfFlushButtlav3:$("input[id='funcOfFlushButtlav3']:checked").val(),
 		                    							funcOfFlushButtlav4:$("input[id='funcOfFlushButtlav4']:checked").val(),
 		                    							suffFlushPanlav1:$("input[id='suffFlushPanlav1']:checked").val(),
 		                    							suffFlushPanlav2:$("input[id='suffFlushPanlav2']:checked").val(),
 		                    							suffFlushPanlav3:$("input[id='suffFlushPanlav3']:checked").val(),
 		                    							suffFlushPanlav4:$("input[id='suffFlushPanlav4']:checked").val(),
 		                    							odourMedHeavylav1:$("input[id='odourMedHeavylav1']:checked").val(),
 		                    							odourMedHeavylav2:$("input[id='odourMedHeavylav2']:checked").val(),
 		                    							odourMedHeavylav3:$("input[id='odourMedHeavylav3']:checked").val(),
 		                    							odourMedHeavylav4:$("input[id='odourMedHeavylav4']:checked").val(),
 		                    							stickUserlav1:$("input[id='stickUserlav1']:checked").val(),
 		                    							stickUserlav2:$("input[id='stickUserlav2']:checked").val(),
 		                    							stickUserlav3:$("input[id='stickUserlav3']:checked").val(),
 		                    							stickUserlav4:$("input[id='stickUserlav4']:checked").val(),
 		                    							chockStraplav1:$("input[id='chockStraplav1']:checked").val(),
 		                    							chockStraplav2:$("input[id='chockStraplav2']:checked").val(),
 		                    							chockStraplav3:$("input[id='chockStraplav3']:checked").val(),
 		                    							chockStraplav4:$("input[id='chockStraplav4']:checked").val(),
 		                    							consumpFlushlav1:$("input[id='consumpFlushlav1']:checked").val(),
 		                    							consumpFlushlav2:$("input[id='consumpFlushlav2']:checked").val(),
 		                    							consumpFlushlav3:$("input[id='consumpFlushlav3']:checked").val(),
 		                    							consumpFlushlav4:$("input[id='consumpFlushlav4']:checked").val(),
 		                    							sysFlushCyclelav1:$("input[id='sysFlushCyclelav1']:checked").val(),
 		                    							sysFlushCyclelav2:$("input[id='sysFlushCyclelav2']:checked").val(),
 		                    							sysFlushCyclelav3:$("input[id='sysFlushCyclelav3']:checked").val(),
 		                    							sysFlushCyclelav4:$("input[id='sysFlushCyclelav4']:checked").val(),
 		                    							allPrtVaccToiletlav1:$("input[id='allPrtVaccToiletlav1']:checked").val(),
 		                    							allPrtVaccToiletlav2:$("input[id='allPrtVaccToiletlav2']:checked").val(),
 		                    							allPrtVaccToiletlav3:$("input[id='allPrtVaccToiletlav3']:checked").val(),
 		                    							allPrtVaccToiletlav4:$("input[id='allPrtVaccToiletlav4']:checked").val(),
 		                    							airPressureSupplav1:$("input[id='airPressureSupplav1']:checked").val(),
 		                    							airPressureSupplav2:$("input[id='airPressureSupplav2']:checked").val(),
 		                    							airPressureSupplav3:$("input[id='airPressureSupplav3']:checked").val(),
 		                    							airPressureSupplav4:$("input[id='airPressureSupplav4']:checked").val(),
 		                    							bioTankConforming:$("input[id='bioTankConforming']:checked").val(),
 		                    				
 		                    							weldRibBendBrk:$('#weldRibBendBrk').val(),
 		                    							properBioTankTight:$('#properBioTankTight').val(),
 		                    							panOutAlignBallValve:$('#panOutAlignBallValve').val(),
 		                    							weldCondJbracket:$('#weldCondJbracket').val(),
 		                    							fitBioJbracket:$('#fitBioJbracket').val(),
 		                    							rubberConnCond:$('#rubberConnCond').val(),
 		                    							leakChloUnit:$('#leakChloUnit').val(),
 		                    							condOfChlol:$('#condOfChlol').val(),
 		                    							condOfSafeStrap:$('#condOfSafeStrap').val(),
 		                    							leakRubberBlockChlor:$('#leakRubberBlockChlor').val(),
 		                    							leakJointConnCompSys:$('#leakJointConnCompSys').val(),
 		                    							funcOfFlushButt:$('#funcOfFlushButt').val(),
 		                    							suffFlushPan:$('#suffFlushPan').val(),
 		                    							odourMedHeavy:$('#odourMedHeavy').val(),
 		                    							stickUser:$('#stickUser').val(),
 		                    							chockStrap:$('#chockStrap').val(),
 		                    							consumpFlush:$('#consumpFlush').val(),
 		                    							sysFlushCycle:$('#sysFlushCycle').val(),
 		                    							allPrtVaccToilet:$('#allPrtVaccToilet').val(),
 		                    							airPressureSupp:$('#airPressureSupp').val(),
 		                    							entryBy:$('#entryBy').val(),
 		                    							entryDate:$('#entryDate').val()

 		                    							
 		                    							
 		                    						},
 		                    						
 		                    						type : 'POST',
 		                    						async : false,
 		                            	 		}) 
 		                    						.done(function( msg ) {
 		                    							
 		                    							
 		                    							$('#bioTankTestingDocNo').val(''),  
 		                    							$('#bioTankTestingShift').val(''),   
 		                    							$('#bioTankTestingDate').val(''), 
 		                    							$('#bioTankTestingMakeLav1').val(''),  
 		                    							$('#bioTankTestingMakeLav2').val(''),  
 		                    							$('#bioTankTestingMakeLav3').val(''),  
 		                    							$('#bioTankTestingMakeLav4').val(''),  
 		                    							$('#bioTankTestingBacteriaType').val(''),  
 		                    							$('#bioTankTestingBacteriaMake').val(''),  
 		                    							$('#bioTankTestingBacteriaFeedDate').val(''),  
 		                    							$('#weldRibBendBrklav1').val(''),  
 		                    							$('#weldRibBendBrklav2').val(''),  
 		                    							$('#weldRibBendBrklav3').val(''),  
 		                    							$('#weldRibBendBrklav4').val(''),  
 		                    							$('#properBioTankTightlav1').val(''),  
 		                    							$('#properBioTankTightlav2').val(''),  
 		                    							$('#properBioTankTightlav3').val(''),  
 		                    							$('#properBioTankTightlav4').val(''),  
 		                    							$('#weldRibBendBrk').val(''),  
 		                    							$('#properBioTankTight').val(''),  
 		                    							$('#panOutAlignBallValvelav1').val(''),  
 		                    							$('#panOutAlignBallValvelav2').val(''),  
 		                    							$('#panOutAlignBallValvelav3').val(''),  
 		                    							$('#panOutAlignBallValvelav4').val(''),  
 		                    							$('#panOutAlignBallValve').val(''),  
 		                    							$('#weldCondJbracketlav1').val(''),  
 		                    							$('#weldCondJbracketlav2').val(''),  
 		                    							$('#weldCondJbracketlav3').val(''),  
 		                    							$('#weldCondJbracketlav4').val(''),  
 		                    							$('#weldCondJbracket').val(''),  
 		                    							$('#fitBioJbracketlav1').val(''),  
 		                    							$('#fitBioJbracketlav2').val(''),  
 		                    							$('#fitBioJbracketlav3').val(''),  
 		                    							$('#fitBioJbracketlav4').val(''),  
 		                    							$('#fitBioJbracket').val(''),  
 		                    							$('#rubberConnCondlav1').val(''),  
 		                    							$('#rubberConnCondlav2').val(''),  
 		                    							$('#rubberConnCondlav3').val(''),  
 		                    							$('#rubberConnCondlav4').val(''),  
 		                    							$('#rubberConnCond').val(''),  
 		                    							$('#leakChloUnitlav1').val(''),  
 		                    							$('#leakChloUnitlav2').val(''),  
 		                    							$('#leakChloUnitlav3').val(''),  
 		                    							$('#leakChloUnitlav4').val(''),  
 		                    							$('#leakChloUnit').val(''),  
 		                    							$('#condOfChlolav1').val(''),  
 		                    							$('#condOfChlolav2').val(''),  
 		                    							$('#condOfChlolav3').val(''),  
 		                    							$('#condOfChlolav4').val(''),  
 		                    							$('#condOfChlol').val(''),  
 		                    							$('#condOfSafeStraplav1').val(''),  
 		                    							$('#condOfSafeStraplav2').val(''),  
 		                    							$('#condOfSafeStraplav3').val(''),  
 		                    							$('#condOfSafeStraplav4').val(''),  
 		                    							$('#condOfSafeStrap').val(''),  
 		                    							$('#leakRubberBlockChlorlav1').val(''),  
 		                    							$('#leakRubberBlockChlorlav2').val(''),  
 		                    							$('#leakRubberBlockChlorlav3').val(''),  
 		                    							$('#leakRubberBlockChlorlav4').val(''),  
 		                    							$('#leakRubberBlockChlor').val(''),  
 		                    							$('#leakJointConnCompSyslav1').val(''),  
 		                    							$('#leakJointConnCompSyslav2').val(''),  
 		                    							$('#leakJointConnCompSyslav3').val(''),  
 		                    							$('#leakJointConnCompSyslav4').val(''),  
 		                    							$('#leakJointConnCompSys').val(''),  
 		                    							$('#funcOfFlushButtlav1').val(''),  
 		                    							$('#funcOfFlushButtlav2').val(''),  
 		                    							$('#funcOfFlushButtlav3').val(''),  
 		                    							$('#funcOfFlushButtlav4').val(''),  
 		                    							$('#funcOfFlushButt').val(''),  
 		                    							$('#suffFlushPanlav1').val(''),  
 		                    							$('#suffFlushPanlav2').val(''),  
 		                    							$('#suffFlushPanlav3').val(''),  
 		                    							$('#suffFlushPanlav4').val(''),  
 		                    							$('#suffFlushPan').val(''),  
 		                    							$('#odourMedHeavylav1').val(''),  
 		                    							$('#odourMedHeavylav2').val(''),  
 		                    							$('#odourMedHeavylav3').val(''),  
 		                    							$('#odourMedHeavylav4').val(''),  
 		                    							$('#odourMedHeavy').val(''),  
 		                    							$('#stickUserlav1').val(''),  
 		                    							$('#stickUserlav2').val(''),  
 		                    							$('#stickUserlav3').val(''),  
 		                    							$('#stickUserlav4').val(''),  
 		                    							$('#stickUser').val(''),  
 		                    							$('#chockStraplav1').val(''),  
 		                    							$('#chockStraplav2').val(''),  
 		                    							$('#chockStraplav3').val(''),  
 		                    							$('#chockStraplav4').val(''),  
 		                    							$('#chockStrap').val(''),  
 		                    							$('#consumpFlushlav1').val(''),  
 		                    							$('#consumpFlushlav2').val(''),  
 		                    							$('#consumpFlushlav3').val(''),  
 		                    							$('#consumpFlushlav4').val(''),  
 		                    							$('#consumpFlush').val(''),  
 		                    							$('#sysFlushCyclelav1').val(''),  
 		                    							$('#sysFlushCyclelav2').val(''),  
 		                    							$('#sysFlushCyclelav3').val(''),  
 		                    							$('#sysFlushCyclelav4').val(''),  
 		                    							$('#sysFlushCycle').val(''),  
 		                    							$('#allPrtVaccToiletlav1').val(''),  
 		                    							$('#allPrtVaccToiletlav2').val(''),  
 		                    							$('#allPrtVaccToiletlav3').val(''),  
 		                    							$('#allPrtVaccToiletlav4').val(''),  
 		                    							$('#airPressureSupplav1').val(''),  
 		                    							$('#airPressureSupplav2').val(''),  
 		                    							$('#airPressureSupplav3').val(''),  
 		                    							$('#airPressureSupplav4').val(''),  
 		                    							$('#airPressureSupp').val(''),  
 		                    							$('#bioTankConforming').val(''),  
 		                    							$('#entryBy').val(''),
 		                    							$('#entryDate').val(''),
 		                    							$('#BioTankTestingSIPDialog').dialog('close');
 		                    							
 		                    							$('#FurnishingProductionTableContainer').jtable('load');
 		         								  }) 
 		         								.error(function (msg){
 		         									//$('#dialog').dialog('close');
 		         									alert("Error Fetching Data");
 		         								})
 		         								  ;
 	         
 	                    					
  	         
  	                    					
  					                 			    	   return true;
  				                                    }
  	                                    }, 
  				                        Close: function () {
  				                        	$('#BioTankTestingSIPDialog').find('form[name="bioTankTestingForm"]')[0].reset();
  				                                        $(this).dialog('close');
  				                                    }//end of clickFunction
  	                                    },//end of buttons
  	                    	        modal: true
      	    });
                      	 		
                      	 		
                      	 		
                      	 		
                      	 		
                      	 		    
              			    	   return true; 
              			    	   	
                      	 		    
                      	 			  
                      	 		  }//ending else               	  
              		 
              		 
                          }
                     },
                     {
                        	icon: '<%=contextpath%>/images/rs_out.png',
                            text: 'AirBrakeTest',
                            click: function () {
                            	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
                        	 	 if ($selectedRows.length<1)
                        		 alert("Please select a row for which you want to Inspect");
                        	 	 else{
                        	 		var record;
                        	 		$selectedRows.each(function () {
                                        record = $(this).data('record');
                                        });
                        	 		
                        	 		
                        	 		//show pre existing data;

    								 	$.ajax({
 									url: "showExistingDataofAirBrake",
 									type:'POST',
 									async:false,
 									data:
 										{
 										furnishingAssetId:record.furnishingAssetId,
 										},
 								success:function(msg)
 								{
 									$('#furnishing').val(msg.furnishingNumber),
 									$('#shellTypeNo').val(msg.shellNumberType),
 									$('#bogiePPMake').val(msg.bogiePpEndMake)
 									$('#bogiePPSerialNo').val(msg.bogiePpEndSrno),
 									$('#bogieNPPMake').val(msg.bogieNppEndMake),
 									$('#bogieNPPSerialNo').val(msg.bogieNppEndSrno)
 									$('#cbcPPMake').val(msg.cbcPpEndMake)
 									$('#cbcPPSerialNo').val(msg.cbcPpEndSrno),
 									$('#cbcNPPMake').val(msg.cbcNppEndMake);
 									$('#cbcNPPSerialNo').val(msg.cbcNppEndSrno)
 									$('#bufferMake').val(msg.bufferMake),
 									$('#bufferSerialNo').val(msg.bufferSrno),
 									$('#brakePanelMake').val(msg.brakePanelMake)
 									$('#brakePanelSerialNo').val(msg.brakePanelSrno),
 									$('#distributorValveMake').val(msg.distributorValveMake),
 									$('#distributorValveSerialNo').val(msg.distributorValveSrno),
 									$('#pullBoxMake').val(msg.pullBoxMake),
 									$('#pullBoxSerialNo').val(msg.pullBoxNo),
 									$('#handBrakeMake').val(msg.handBrakeMake),
 									$('#handBrakeSerialNo').val(msg.handBrakeNo)
 									$('#docNo').val(msg.docNoAirbrake);
 									
 									
 								},
 								error:function(msg)
 								{
 									
 								},
 								});
    								 	
    								 if(record.airBrakeTestingFlag==1)
  								{
  								
  								$.ajax({
  									url:"showSaveDataAirBrake", //action-name as defined in struts.xml
  									dataType:'json',
  									type:'POST',
  									async:false,
  									data:{
  										furnishingAssetId:record.furnishingAssetId,	
  									},
  									success:function(data)
  									{
  										
  										
  						
  										 $('#airBrakeShift').val(data.airbrakeTestingTransaction.shiftAirbrake);
  										
  										$('#preTextLockCoach').val(data.airbrakeTestingTransaction.preTextLockCoach);
  										
  										$('#preTextConformity').val(data.airbrakeTestingTransaction.preTextConformityBrakeMount);
  										$('#preTextVerifyBrake').val(data.airbrakeTestingTransaction.preTextVerifyAllBrake);
  										$('#preTextVerifyCock').val(data.airbrakeTestingTransaction.preTextVerifyPositionCockes);
  										$('#preTextOpenedCock10_3').val(data.airbrakeTestingTransaction.preTextOpenedCockes103);
  										$('#preTextOpenedCock10_41').val(data.airbrakeTestingTransaction.preTextOpenedCockes104_1);
  										$('#preTextOpenedCock10_42').val(data.airbrakeTestingTransaction.preTextOpenedCockes104_2);
  										$('#preTextEmergencyCock').val(data.airbrakeTestingTransaction.preTextEmergencyCock);
  										$('#preTextDistributorValve').val(data.airbrakeTestingTransaction.preTextDistributorValve);
  										$('#preTextBrakeCylinder').val(data.airbrakeTestingTransaction.preTextBrakeCylinder);
  										$('#preTextAuxiliaryReservoir').val(data.airbrakeTestingTransaction.preTextFitmentAuxiliaryReservoir);
  										$('#reservoirChargingHL').val(data.airbrakeTestingTransaction.reservoirChargingGeneratorCoaches);
  										$('#reservoirChargingBrakePipe').val(data.airbrakeTestingTransaction.reservoirChargingBrakePipePressure);
  										$('#reservoirChargingChargingTime').val(data.airbrakeTestingTransaction.reservoirChargingChargingTime);
  										$('#reservoirChargingControlReservoirPressure').val(data.airbrakeTestingTransaction.reservoirChargingControlPressure);
  										$('#sealingTestInterrupt').val(data.airbrakeTestingTransaction.sealingTestInterruptCharging);
  										$('#sealingTestOpenCock').val(data.airbrakeTestingTransaction.sealingTestOpenCocks);
  										$('#fullBrakeReducePressure').val(data.airbrakeTestingTransaction.fullBrakeApplicationReducePressure);
  										$('#fullBrakeEmergency').val(data.airbrakeTestingTransaction.fullBrakeApplicationEmergencyApplication);
  										$('#fullBrakeMaxPressure').val(data.airbrakeTestingTransaction.fullBrakeApplicationMaxPressure);
  										$('#fullBrakeAllCylinders').val(data.airbrakeTestingTransaction.fullBrakeApplicationAllBrake);
  										$('#releaseFullFillBP').val(data.airbrakeTestingTransaction.releaseFullBrakeFillBP);
  										$('#releaseFullBrakeCylinder').val(data.airbrakeTestingTransaction.releaseFullBrakeAllBrake);
  										$('#emergencyApplicationReducePressure').val(data.airbrakeTestingTransaction.emergencyApplicationReduceBrakePressure);
  										$('#emergencyApplicationAccelerator').val(data.airbrakeTestingTransaction.emergencyApplicationAcceleratorRespond);
  										$('#emergencyApplicationChargingTime').val(data.airbrakeTestingTransaction.emergencyApplicationChargingTime);
  										$('#emergencyApplicationMaxBC').val(data.airbrakeTestingTransaction.emergencyApplicationMaxBCPressure);
  										$('#emergencyApplicationAllBrake').val(data.airbrakeTestingTransaction.emergencyApplicationAllBrake);
  										$('#releaseBrakeFillBP').val(data.airbrakeTestingTransaction.releaseEmergencyBrakeFillBP);
  										$('#releaseBrakePressureDrop').val(data.airbrakeTestingTransaction.releaseEmergencyBrakePressureDropTime);
  										$('#releaseBrakeBrakeCylinder').val(data.airbrakeTestingTransaction.releaseEmergencyBrakeBrakeCylinderRelease);
  										$('#graduateBrakeApplication').val(data.airbrakeTestingTransaction.graduatedBrakeApplication);
  										$('#antiSkidCharge').val(data.airbrakeTestingTransaction.pressureGovernorChargeFeedingPipe);
  										$('#AntiSkidExhaust').val(data.airbrakeTestingTransaction.pressureGovernorExhaustFeedingPipe);
  										$('#sealingTestFeedPipe').val(data.airbrakeTestingTransaction.sealingTestFeed);
  										$('#normalFeedPipeMaxPressure').val(data.airbrakeTestingTransaction.normalServiceFeedMaxPressure);
  										$('#controlOfIndicatingDeviceActualBrake').val(data.airbrakeTestingTransaction.controlIndicatingDeviceActualFullBrake);
  										$('#controlOfIndicatingDeviceCloseCock1').val(data.airbrakeTestingTransaction.controlIndicatingDeviceCockPosition4_1);
  										$('#controlOfIndicatingDeviceCloseCock2').val(data.airbrakeTestingTransaction.controlIndicatingDeviceCockPosition4_2);
  										
  										$('#controlOfIndicatingDeviceCloseCock12').val(data.airbrakeTestingTransaction.controlIndicatingDeviceCockPosition41_42);
  										$('#controlOfInsensitivity').val(data.airbrakeTestingTransaction.controlInsensitivityExhaustBrakePipe);
  										$('#controlOfSensitivityBrakePipe').val(data.airbrakeTestingTransaction.controlSensitivityBrakePipe);
  										$('#firstBrakeStepBrakePipe').val(data.airbrakeTestingTransaction.firstBrakeStep);
  										$('#reactivatingOfQuickServiceFailure').val(data.airbrakeTestingTransaction.reactivityQuickServiceFailure);
  										$('#parkingBrakeHandbrakeReleased').val(data.airbrakeTestingTransaction.parkingBrakeHandbrakeReleased);
  										$('#parkingBrakeHandbrakeApplied').val(data.airbrakeTestingTransaction.parkingBrakeHandbrakeApplied);
  										
  										
  										
  										$('#passengerEmergencyBrakeExhaustBrake').val(data.airbrakeTestingTransaction.emergencyBrakePassengerExhaustBrake);
  										$('#passengerEmergencyBrakeCloseHandle').val(data.airbrakeTestingTransaction.emergencyBrakePassengerCloseHandle);
  										$('#passengerEmergencyBrakeAlarm').val(data.airbrakeTestingTransaction.emergencyBrakePassengerPassengerAlarm);
  										$('#passengerEmergencyBrakeByGuard').val(data.airbrakeTestingTransaction.emergencyBrakeGuard);
  										$('#cbc').val(data.airbrakeTestingTransaction.cbcFitment);
  										$('#remarks').val(data.airbrakeTestingTransaction.remarks);
  										$("[id='airbrakeTestingStatus']").val([data.airbrakeTestingTransaction.airbrakeTestingStatus]);
  										var airBrakeDate=(data.airbrakeTestingTransaction.dateOfAirbrake).substring(0,10);
  										var airBrakeDateArray=airBrakeDate.split("-");
  										$('#airBrakeDate').datepicker("setDate",new Date(airBrakeDateArray[0],airBrakeDateArray[1]-1,airBrakeDateArray[2]));
  										
  										 
  																			
  									}
  										
  									});
  								}
    								  
    								$('#airBrakeDate').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
    								
                					
                        	 	 	$("#AirBrakeDialog").dialog({
                        	 	 		title : 'AirBrakeTest'+record.shellTransactionId + 'from Stage- <%=stageID%>', 
                        	 	 		width:'80%',
                        	 	 		close: function (e, u) {
                  	 		             
                        	 	 			$('#AirBrakeDialog').find('form[name="AirBrakeSip"]')[0].reset();
                  	 		          	$("#AirBrakeDialog").validationEngine('hideAll');
                  	 		          },
                    	 		 	 
     		 							buttons: {
    	                                    Submit: {
    	                                       text: "Submit",
    	                                        id: "my-button-submit",
    	                                        click:function () {	    	   
    	                                         var c=confirm("Do you want to submit data for Bogie Final Testing");
 	    	                                    if(c==false){return false;}
 	                                             		    	   
 	    	                                    	$.ajax({
 	    	                                    		url : "saveAirBrakeSIP",  //action-name as defined in struts.xml
 	    	                    						dataType: 'json', 
 	    	                    						type : 'POST',
 	    	                    						async : false,
 	    	                    						data :{
 	    	                    							
 	    	                    							furnishingAssetId:record.furnishingAssetId,
 	    	                    							docNoAirbrake:$("#docNo").val(),
 	    	       
 	    	                    							dateOfAirbrake:$("#airBrakeDate").val(),
 	    	                    							shiftAirbrake:$("#airBrakeShift").val(),
 	    	                                    			
 	    	                    							preTextLockCoach:$("#preTextLockCoach").val(),
 	    	                    							preTextConformityBrakeMount:$("#preTextConformity").val(),
 	    	                    							preTextVerifyAllBrake:$("#preTextVerifyBrake").val(),
 	    	                    							preTextVerifyPositionCockes:$("#preTextVerifyCock").val(),
 	    	                                    			
 	    	                    							preTextOpenedCockes103:$("#preTextOpenedCock10_3").val(),
 	    	                    							preTextOpenedCockes104_1:$("#preTextOpenedCock10_41").val(),
 	    	                    							preTextOpenedCockes104_2:$("#preTextOpenedCock10_42").val(),
 	    	                    							preTextEmergencyCock:$("#preTextEmergencyCock").val(),
 	    	                                    			
 	    	                    							preTextDistributorValve:$("#preTextDistributorValve").val(),
 	    	                    							preTextBrakeCylinder:$("#preTextBrakeCylinder").val(),
 	    	                    							preTextFitmentAuxiliaryReservoir:$("#preTextAuxiliaryReservoir").val(),
 	    	                    							reservoirChargingGeneratorCoaches:$("#reservoirChargingHL").val(),
 	    	                                    			
 	    	                    							reservoirChargingBrakePipePressure:$("#reservoirChargingBrakePipe").val(),
 	    	                    							reservoirChargingChargingTime:$("#reservoirChargingChargingTime").val(),
 	    	                    							reservoirChargingControlPressure:$("#reservoirChargingControlReservoirPressure").val(),
 	    	                    							sealingTestInterruptCharging:$("#sealingTestInterrupt").val(),
 	    	                                    			
 	    	                    							sealingTestOpenCocks:$("#sealingTestOpenCock").val(),
 	    	                    							fullBrakeApplicationReducePressure:$("#fullBrakeReducePressure").val(),
 	    	                    							fullBrakeApplicationEmergencyApplication:$("#fullBrakeEmergency").val(),
 	    	                    							fullBrakeApplicationMaxPressure:$("#fullBrakeMaxPressure").val(),
 	    	                                    			
 	    	                    							fullBrakeApplicationAllBrake:$("#fullBrakeAllCylinders").val(),
 	    	                    							releaseFullBrakeFillBP:$("#releaseFullFillBP").val(),
 	    	                    							releaseFullBrakeAllBrake:$("#releaseFullBrakeCylinder").val(),
 	    	                    							emergencyApplicationReduceBrakePressure:$("#emergencyApplicationReducePressure").val(),
 	    	                                    			
 	    	                    							emergencyApplicationAcceleratorRespond:$("#emergencyApplicationAccelerator").val(),
 	    	                    							emergencyApplicationChargingTime:$("#emergencyApplicationChargingTime").val(),
 	    	                    							emergencyApplicationMaxBCPressure:$("#emergencyApplicationMaxBC").val(),
 	    	                    							emergencyApplicationAllBrake:$("#emergencyApplicationAllBrake").val(),
 	    	                                    			
 	    	                    							releaseEmergencyBrakeFillBP:$("#releaseBrakeFillBP").val(),
 	    	                    							releaseEmergencyBrakePressureDropTime:$("#releaseBrakePressureDrop").val(),
 	    	                                    			  
 	    	                    							releaseEmergencyBrakeBrakeCylinderRelease:$("#releaseBrakeBrakeCylinder").val(),
 	    	                    							graduatedBrakeApplication:$("#graduateBrakeApplication").val(),
 	    	                                    			
 	    	                    							pressureGovernorChargeFeedingPipe:$("#antiSkidCharge").val(),
 	    	                    							pressureGovernorExhaustFeedingPipe:$("#AntiSkidExhaust").val(),
 	    	                    							sealingTestFeed:$("#sealingTestFeedPipe").val(),
 	    	                    							normalServiceFeedMaxPressure:$("#normalFeedPipeMaxPressure").val(),
 	    	                                    			
 	    	                    							controlIndicatingDeviceActualFullBrake:$("#controlOfIndicatingDeviceActualBrake").val(),
 	    	                    							controlIndicatingDeviceCockPosition4_1:$("#controlOfIndicatingDeviceCloseCock1").val(),
 	    	                    							controlIndicatingDeviceCockPosition4_2:$("#controlOfIndicatingDeviceCloseCock2").val(),
 	    	                    							controlIndicatingDeviceCockPosition41_42:$("#controlOfIndicatingDeviceCloseCock12").val(),
 	    	                                    			
 	    	                    							controlInsensitivityExhaustBrakePipe:$("#controlOfInsensitivity").val(),
 	    	                    							controlSensitivityBrakePipe:$("#controlOfSensitivityBrakePipe").val(),
 	    		          									
 	    	                    							firstBrakeStep:$("#firstBrakeStepBrakePipe").val(),
 	    	                    							reactivityQuickServiceFailure:$("#reactivatingOfQuickServiceFailure").val(),
 	    	                    							parkingBrakeHandbrakeReleased:$("#parkingBrakeHandbrakeReleased").val(),
 	    	                    							parkingBrakeHandbrakeApplied:$("#parkingBrakeHandbrakeApplied").val(),
 	    	                                    			
 	    	                    							emergencyBrakePassengerExhaustBrake:$("#passengerEmergencyBrakeExhaustBrake").val(),
 	    	                    							emergencyBrakePassengerCloseHandle:$("#passengerEmergencyBrakeCloseHandle").val(),
 	    		          									
 	    	                    							emergencyBrakePassengerPassengerAlarm:$("#passengerEmergencyBrakeAlarm").val(),
 	    	                    							emergencyBrakeGuard:$("#passengerEmergencyBrakeByGuard").val(),
 	    		          									
 	    	                    							cbcFitment:$("#cbc").val(),
 	    	                    							remarks:$("#remarks").val(),
 	    	                    							
 	    	                    							
 	    	                    							cbcPpEndMake:$("#cbcPPMake").val(),
 	    	                    							cbcPpEndSrno:$("#cbcPPSerialNo").val(),
 	    		          									
 	    	                    							cbcNppEndMake:$("#cbcNPPMake").val(),
 	    	                    							cbcNppEndSrno:$("#cbcNPPSerialNo").val(),
 	    	                    							bufferMake:$('#bufferMake').val(),
 	    	                    							bufferSrno:$('#bufferSerialNo').val(),
 	    	            									brakePanelMake:$('#brakePanelMake').val(),
 	    	            									brakePanelSrno:$('#brakePanelSerialNo').val(),
 	    	            									distributorValveMake:$('#distributorValveMake').val(),
 	    	            									distributorValveSrno:$('#distributorValveSerialNo').val(),
 	    	            									pullBoxMake:$('#pullBoxMake').val(),
 	    	            									pullBoxNo:$('#pullBoxSerialNo').val(),
 	    	            									handBrakeMake:$('#handBrakeMake').val(),
 	    	            									handBrakeNo:$('#handBrakeSerialNo').val(),  
 	    		                    						airbrakeTestingStatus:$("input[id='airbrakeTestingStatus']:checked").val(),
 	    		                    						entryBy:$('#entryBy').val(),
 	    		                    						entryDate:$('#entryDate').val()

 	    	                    								  },
 	    	                    						
 	    	                    						success:function (msg)
 	    	                    						{
 	    	                    							 $('#airBrakeDate').val(''),
 	    	                    							$('#airBrakeShift').val(''),
 	    	                    							$('#preTextLockCoach').val(''),  
 	      	                    							$('#preTextConformity').val(''),   
 	      	                    							$('#preTextVerifyBrake').val(''),
 	      	                    							$('#preTextVerifyCock').val(''),
 	      	                    							$('#preTextOpenedCock10_3').val(''),
 	      	                    							$('#preTextOpenedCock10_41').val(''),
 	      	                    							$('#preTextOpenedCock10_42').val(''),
 	      	                    							$('#preTextEmergencyCock').val(''),
 	      	                    							$('#preTextDistributorValve').val(''),
 	      	                    							$('#preTextBrakeCylinder').val(''),
 	      	                    							$('#preTextAuxiliaryReservoir').val(''),
 	      	                    							$('#reservoirChargingHL').val(''),
 	      	                    							$('#reservoirChargingBrakePipe').val(''),
 	      	                    							$('#reservoirChargingChargingTime').val(''),
 	      	                    							$('#reservoirChargingControlReservoirPressure').val(''),
 	      	                    							$('#sealingTestInterrupt').val(''),
 	      	                    							$('#sealingTestOpenCock').val(''),
 	      	                    							$('#fullBrakeReducePressure').val(''),
 	      	                    							$('#fullBrakeEmergency').val(''),
 	      	                    							$('#fullBrakeMaxPressure').val(''),
 	      	                    							$('#fullBrakeAllCylinders').val(''),
 	      	                    							$('#releaseFullFillBP').val(''),
 	      	                    							$('#releaseFullBrakeCylinder').val(''),
 	      	                    							$('#emergencyApplicationReducePressure').val(''),
 	      	                    							$('#emergencyApplicationAccelerator').val(''),
 	      	                    							$('#emergencyApplicationChargingTime').val(''),
 	      	                    							$('#emergencyApplicationMaxBC').val(''),
 	      	                    							$('#emergencyApplicationAllBrake').val(''),
 	      	                    							$('#releaseBrakeFillBP').val(''),
 	      	                    							$('#releaseBrakePressureDrop').val(''),
 	      	                    							$('#releaseBrakeBrakeCylinder').val(''),
 	      	                    							$('#graduateBrakeApplication').val(''),
 	      	                    							$('#antiSkidCharge').val(''),
 	      	                    							$('#AntiSkidExhaust').val(''),
 	      	                    							$('#sealingTestFeedPipe').val(''),
 	      	                    							$('#normalFeedPipeMaxPressure').val(''),
 	      	                    							$('#controlOfIndicatingDeviceActualBrake').val(''),
 	      	                    							$('#controlOfIndicatingDeviceCloseCock1').val(''),
 	      	                    							$('#controlOfIndicatingDeviceCloseCock2').val(''),
 	      	                    							$('#controlOfIndicatingDeviceCloseCock12').val(''),
 	      	                    							$('#controlOfInsensitivity').val(''),
 	      	                    							$('#controlOfSensitivityBrakePipe').val(''),
 	      	                    							$('#firstBrakeStepBrakePipe').val(''),
 	      	                    							$('#reactivatingOfQuickServiceFailure').val(''),
 	      	                    							$('#parkingBrakeHandbrakeReleased').val(''),
 	      	                    							$('#parkingBrakeHandbrakeApplied').val(''),
 	      	                    							$('#passengerEmergencyBrakeExhaustBrake').val(''),
 	      	                    							$('#passengerEmergencyBrakeCloseHandle').val(''),
 	      	                    							$('#passengerEmergencyBrakeAlarm').val(''),
 	      	                    							$('#passengerEmergencyBrakeByGuard').val(''),
 	      	                    							$('#cbc').val(''),
 	      	                    							$('#remarks').val(''),
 	      	                    							$('#airbrakeTestingStatus').val(''),
 	      	                    							
 	      	                    							 
 	                                                        $('#AirBrakeDialog').dialog('close');	
 	    	                    							$('#AirBrakeDialog').find('form[name="AirBrakeSip"]')[0].reset(); 
 	    	                    							$('#FurnishingProductionTableContainer').jtable('load');
 	    	                    						},
 	    	                    						error: function (msg)
 	    	                    						{
 	    	                    							alert("Error Fetching Data");
 	    	                    							$('#AirBrakeDialog').dialog('close');
 	    	                    							$('#AirBrakeDialog').find('form[name="AirBrakeSip"]')[0].reset(); 
 		    	         									
 	    	                    						},
 	    		                    		 		});
    	                    					
    					                 			    	   return true;
    				                                    }
    	                                    }, 
    				                        Close: function () {
    				                        	$('#AirBrakeDialog').find('form[name="AirBrakeSip"]')[0].reset();
    				                                        $(this).dialog('close');
    				                                    }//end of clickFunction
    	                                    },//end of buttons
    	                    	        modal: true
        	    });
                        	 		
                        	 		
                        	 		
                        	 		
                        	 		
                        	 		    
                			    	   return true; 
                			    	   	
                        	 		    
                        	 			  
                        	 		  }//ending else               	  
                        	  // ajax call ends here
                        	  
                        	 			
        						 
                            }
                         },	 
                        								  
                 	          {
                                       	icon: '<%=contextpath%>/images/rs_out.png',
                                           text: 'CCTVTesting',
                                           click: function () {
                                           	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
                                       	 	 if ($selectedRows.length<1)
                                       		 alert("Please select a row for which you want to Inspect");
                                       	 	 else{
                                       	 		var record;
                                       	 		$selectedRows.each(function () {
                                                       record = $(this).data('record');
                                                       });
                                       	 		
                                       	 		if(record.cctvTestingFlag==1)
                 								{
                 								
                 								$.ajax({
                 									url:"showSaveDataCctvform", //action-name as defined in struts.xml
                 									dataType:'json',
                 									type:'POST',
                 									async:false,
                 									data:{
                 										furnishingAssetId:record.furnishingAssetId,	
                 									},
                 									success:function(data)
                 									{
                 										
                 										//alert("yess");
                 										  var CctvDatevar=(data.cctvTestingTrans.dateOfCctvTesting.substring(0,10));
                 										var CctvDateArray=CctvDatevar.split("-");
                 										
                 										$('#ccTvDateOfTesting').datepicker("setDate",new Date(CctvDateArray[0],CctvDateArray[1]-1,CctvDateArray[2])); 
                 										
                 										$('[id="ccTvMountCamera6"]').val([data.cctvTestingTrans.mountingOfCameraFlag]);
                 										$('[id="ccTvMountNvrRecord"]').val([data.cctvTestingTrans.mountingOfNvrFlag]);
                 										$('[id="ccTvDctoDcConvtr"]').val([data.cctvTestingTrans.dcConverterFlag]);
                 										$('[id="ccTvMinCapREcrodVideos"]').val([data.cctvTestingTrans.hddFlag]);
                 										$('[id="ccTvOneSideCardCap"]').val([data.cctvTestingTrans.sdCardFlag]);
                 										$('[id="ccTvIpProtectDirakLock"]').val([data.cctvTestingTrans.ipProtectionBoxFlag]);
                 										$('[id="ccTvCableWidConn"]').val([data.cctvTestingTrans.cableConnectorFlag]);
                 										$('[id="ccTvWorkCamrDayMode"]').val([data.cctvTestingTrans.workingCameraInDayFlag]);
                 										$('[id="ccTvWorkCamrNightMood"]').val([data.cctvTestingTrans.workingCameraInNightFlag]);
                 										$('[id="ccTvComptGpsRealTimeLoc"]').val([data.cctvTestingTrans.gpsSupportFlag]);
                 										$('[id="ccTvRecordFeatures"]').val([data.cctvTestingTrans.recordingFeatureFlag]);
                 										$('[id="ccTvTestingStatus"]').val([data.cctvTestingTrans.statusOfObservation]);
                 										$('#ccTvShift').val(data.cctvTestingTrans.shiftCctv);
                 										$('#ccTvDocNo').val(data.cctvTestingTrans.docNoCctv);
                 										$('#ccTvMountCamera6Rmk').val(data.cctvTestingTrans.mountingOfCameraRemark);
                 										$('#ccTvMountNvrRecordRmk').val(data.cctvTestingTrans.mountingOfNvrRemark);
                 										$('#ccTvDctoDcConvtrRmk').val(data.cctvTestingTrans.dcConverterRemark);
                 										$('#ccTvMinCapREcrodVideosRmk').val(data.cctvTestingTrans.hddRemark);
                 										$('#ccTvOneSideCardCapRmk').val(data.cctvTestingTrans.sdCardRemark);
                 										$('#ccTvIpProtectDirakLockRmk').val(data.cctvTestingTrans.ipProtectionBoxRemark);
                 										$('#ccTvCableWidConnRmk').val(data.cctvTestingTrans.cableConnectorRemark);
                 										$('#ccTvWorkCamrDayModeRmk').val(data.cctvTestingTrans.workingCameraInDayRemark);
                 										$('#ccTvWorkCamrNightMoodRmk').val(data.cctvTestingTrans.workingCameraInNightRemark);
                 										$('#ccTvComptGpsRealTimeLocRmk').val(data.cctvTestingTrans.gpsSupportRemark);
                 										$('#ccTvRecordFeaturesRmk').val(data.cctvTestingTrans.recordingFeatureRemark)
                 										
                 									}
                 									
                 								});
                                       	 		}
                 							//end of showSaveData
                                       	 		//show pre existing data;
                 								$.ajax({
                     								url:"showExistingCctvTesting", //action-name as defined in struts.xml
                     								dataType:'json',
                     								type:'POST',
                     								async:false,
                     								data:{
                     									furnishingAssetId:record.furnishingAssetId,
                     								
                     								},
                     								success:function(data)
                     								{
                     									$('#ccTvDocNo').val(data.ccTvDocNo);
                     									$('#ccTvCoachNo').val(data.ccTvCoachNo);
                     									$('#ccTvFurNo').val(data.ccTvFurNo);
                    
                     								}
                     									
                     								});

                   								
                   								
                   								$('#ccTvDateOfTesting').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
                   								
                               					
                                       	 	 	$("#CcTvTestingSIPDialog").dialog({
                                       	 	 		title : 'PlumbingTest'+record.shellTransactionId + 'from Stage- <%=stageID%>', 
                                       	 	 		width:'80%',
                                       	 	 		close: function (e, u) {
                                 	 		             
                                       	 	 			$('#CcTvTestingSIPDialog').find('form[name="CcTvTestingForm"]')[0].reset();
                                 	 		          	$("#CcTvTestingSIPDialog").validationEngine('hideAll');
                                 	 		          },
                                   	 		 	 
                    		 							buttons: {
                   	                                    Submit: {
                   	                                       text: "Submit",
                   	                                        id: "my-button-submit",
                   	                                        click:function () {	
                   	                                        	
                   	                                        	var c=confirm("Do you want submit the SIP Form");
                 		                                    	if(c==false){return false;}
                 	         
                 		                                    		    	   
                 		                                    	  $.ajax({
                 		                    						url : "saveDataFormCctv",  //action-name as defined in struts.xml
                 		                    						dataType: 'json', 
                 		                    						data : {
                 		                    							
                 		                    							furnishingAssetId: record.furnishingAssetId,
                 		                    							stageId: '<%=stageID%>',
                 		                    							ccTvDocNo:$('#ccTvDocNo').val(),
                 		                    							ccTvShift:$('#ccTvShift').val(),
                 		                    							ccTvDateOfTesting:$('#ccTvDateOfTesting').val(),
                 		                    							ccTvMountCamera6:$("input[id='ccTvMountCamera6']:checked").val(),
                 		                    							ccTvMountNvrRecord:$("input[id='ccTvMountNvrRecord']:checked").val(),
                 		                    							ccTvDctoDcConvtr:$("input[id='ccTvDctoDcConvtr']:checked").val(),
                 		                    							ccTvMinCapREcrodVideos:$("input[id='ccTvMinCapREcrodVideos']:checked").val(),
                 		                    							ccTvOneSideCardCap:$("input[id='ccTvOneSideCardCap']:checked").val(),
                 		                    							ccTvIpProtectDirakLock:$("input[id='ccTvIpProtectDirakLock']:checked").val(),
                 		                    							ccTvCableWidConn:$("input[id='ccTvCableWidConn']:checked").val(),
                 		                    							ccTvWorkCamrDayMode:$("input[id='ccTvWorkCamrDayMode']:checked").val(),
                 		                    							ccTvWorkCamrNightMood:$("input[id='ccTvWorkCamrNightMood']:checked").val(),
                 		                    							ccTvComptGpsRealTimeLoc:$("input[id='ccTvComptGpsRealTimeLoc']:checked").val(),
                 		                    							ccTvRecordFeatures:$("input[id='ccTvRecordFeatures']:checked").val(),
                 		                    							ccTvTestingStatus:$("input[id='ccTvTestingStatus']:checked").val(),
                 		                    							ccTvMountCamera6Rmk:$('#ccTvMountCamera6Rmk').val(),
                 		                    							ccTvMountNvrRecordRmk:$('#ccTvMountNvrRecordRmk').val(),
                 		                    							ccTvDctoDcConvtrRmk:$('#ccTvDctoDcConvtrRmk').val(),
                 		                    							ccTvMinCapREcrodVideosRmk:$('#ccTvMinCapREcrodVideosRmk').val(),
                 		                    							ccTvOneSideCardCapRmk:$('#ccTvOneSideCardCapRmk').val(),
                 		                    							ccTvIpProtectDirakLockRmk:$('#ccTvIpProtectDirakLockRmk').val(),
                 		                    							ccTvCableWidConnRmk:$('#ccTvCableWidConnRmk').val(),
                 		                    							ccTvWorkCamrDayModeRmk:$('#ccTvWorkCamrDayModeRmk').val(),
                 		                    							ccTvWorkCamrNightMoodRmk:$('#ccTvWorkCamrNightMoodRmk').val(),
                 		                    							ccTvComptGpsRealTimeLocRmk:$('#ccTvComptGpsRealTimeLocRmk').val(),
                 		                    							ccTvRecordFeaturesRmk:$('#ccTvRecordFeaturesRmk').val(),
                 		                    							entryBy:$('#entryBy').val(),
                 		                    							entryDate:$('#entryDate').val()

                 		                    							
                 		                    							
                 		                    						},
                 		                    						
                 		                    						type : 'POST',
                 		                    						async : false,
                 		                            	 		}) 
                 		                    						.done(function( msg ) {
                 		                    							
                 		                    							
                 		                    							$('#ccTvDocNo').val(''),  
                 		                    							$('#ccTvShift').val(''), 
                 		                    							$('#ccTvDateOfTesting').val(''), 
                 		                    							$('#ccTvMountCamera6').val(''), 
                 		                    							$('#ccTvMountNvrRecord').val(''), 
                 		                    							$('#ccTvDctoDcConvtr').val(''), 
                 		                    							$('#ccTvMinCapREcrodVideos').val(''), 
                 		                    							$('#ccTvOneSideCardCap').val(''), 
                 		                    							$('#ccTvIpProtectDirakLock').val(''), 
                 		                    							$('#ccTvCableWidConn').val(''), 
                 		                    							$('#ccTvWorkCamrDayMode').val(''), 
                 		                    							$('#ccTvWorkCamrNightMood').val(''), 
                 		                    							$('#ccTvComptGpsRealTimeLoc').val(''), 
                 		                    							$('#ccTvRecordFeatures').val(''), 
                 		                    							$('#ccTvTestingStatus').val(''), 
                 		                    							$('#ccTvMountCamera6Rmk').val(''), 
                 		                    							$('#ccTvMountNvrRecordRmk').val(''), 
                 		                    							$('#ccTvDctoDcConvtrRmk').val(''), 
                 		                    							$('#ccTvMinCapREcrodVideosRmk').val(''), 
                 		                    							$('#ccTvOneSideCardCapRmk').val(''), 
                 		                    							$('#ccTvIpProtectDirakLockRmk').val(''), 
                 		                    							$('#ccTvCableWidConnRmk').val(''), 
                 		                    							$('#ccTvWorkCamrDayModeRmk').val(''), 
                 		                    							$('#ccTvWorkCamrNightMoodRmk').val(''), 
                 		                    							$('#ccTvComptGpsRealTimeLocRmk').val(''), 
                 		                    							$('#ccTvRecordFeaturesRmk').val(''),
                 		                    							$('#entryBy').val(''),
                 		                    							$('#entryDate').val(''),
                 		                    							$('#CcTvTestingSIPDialog').dialog('close');
                 		                    							
                 		                    							$('#FurnishingProductionTableContainer').jtable('load');
                 		         								  }) 
                 		         								.error(function (msg){
                 		         									//$('#dialog').dialog('close');
                 		         									alert("Error Fetching Data");
                 		         								})
                 		         								  ;
                   	         
                   	                    					
                   					                 			    	   return true;
                   				                                    }
                   	                                    }, 
                   				                        Close: function () {
                   				                        	$('#CcTvTestingSIPDialog').find('form[name="CcTvTestingForm"]')[0].reset();
                   				                                        $(this).dialog('close');
                   				                                    }//end of clickFunction
                   	                                    },//end of buttons
                   	                    	        modal: true
                       	    });
                                       	 		
                                       	 		
                                       	 		
                                       	 		
                                       	 		
                                       	 		    
                               			    	   return true; 
                               			    	   	
                                       	 		    
                                       	 			  
                                       	 		  }//ending else               	  
                                       	  // ajax call ends here
                                       	  
                                       	 			
                       						 
                                           }
                                        },
                               	
                                        
                                        {
                                        	icon: '<%=contextpath%>/images/rs_out.png',
                                            text: 'Buffer/cbc height & Misc Measurement',
                                            click: function () {
                                             var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
                                            if ($selectedRows.length<1)
                                           alert("Please select a row for which you want to Fill SIP Data");
                                            else{
                                            
                                        	 		var record;
                                        	 		$selectedRows.each(function () {
                                                        record = $(this).data('record');
                                                        });
                    								
                    							$.ajax({
                    									url: "showexistingdataofbuffercbcheight",  //fecth data code
                    									type:'POST',
                    									async:false,
                    									data:
                    										{
                    										furnishingAssetId:record.furnishingAssetId,
                    										//wheelsetAssetId:record.wheelsetAssetId,
                    										},
                    								success:function(msg)
                    								{
                    									$('#docnobuffercbcheight').val(msg.docnobuffercbcheight),
                    								    $('#shelltype').val(msg.shelltype),
                    								    $('#shellno').val(msg.shellno),
                    									$('#coachtype').val(msg.coachtype),
                    									$('#coachno').val(msg.coachno),
                    									$('#furno').val(msg.furno),
                    								
                    									$('#dampernppa1').val(msg.dampernppa1),
                    									$('#dampernppa2').val(msg.dampernppa2),
                    									$('#damperppa1').val(msg.damperppa1),
                    									$('#damperppa2').val(msg.damperppa2),
                    									$('#bogiepp').val(msg.bogiepp),
                    									$('#bogienpp').val(msg.bogienpp)
                    										},
                    								error:function(msg)
                    								{
                    									
                    								},
                    								});
                                					
                             if(record.cbcTestingFlag==1)
                            {                                                 
                            
                            $.ajax({
                             url:"showsavedataofbuffercbcheight", //action-name as defined in struts.xml
                             dataType:'json',
                             type:'POST',
                             async:false,
                             data:{
                            	 furnishingAssetId:record.furnishingAssetId, 
                             },
                             success:function(data)
                             {     //alert("HOOO");
                               $('#shiftbuffercbcheight').val(data.buffercbcheightTestingTransaction.shiftBuffercbcheight);
                              //$('#docnobuffercbcheight').val(data.buffercbcheightTestingTransaction.docNoBuffercbcheight);
                              $('#h2npp').val(data.buffercbcheightTestingTransaction.cbcHeightPP);
                              $('#h1pp').val(data.buffercbcheightTestingTransaction.cbcHeightNPP);
                              $('#h1pp').val(data.buffercbcheightTestingTransaction.cbcHeightNPP);
                              $('#simheightnpp1').val(data.buffercbcheightTestingTransaction.simHeightNPP1);
                              $('#simheightnpp2').val(data.buffercbcheightTestingTransaction.simHeightNPP2);
                              $('#simheightpp1').val(data.buffercbcheightTestingTransaction.simHeightPP1);
                              $('#simheightpp2').val(data.buffercbcheightTestingTransaction.simHeightPP2);
                              $('#simheightnpp3').val(data.buffercbcheightTestingTransaction.simHeightNPP3);
                              $('#simheightnpp4').val(data.buffercbcheightTestingTransaction.simHeightNPP4);
                              $('#simheightpp3').val(data.buffercbcheightTestingTransaction.simHeightPP3);
                              $('#simheightpp4').val(data.buffercbcheightTestingTransaction.simHeightPP4);
                              
                              
                              $('#bufferheightnppc').val(data.buffercbcheightTestingTransaction.bufferHeightNPP_C);
                              $('#bufferheightnppd').val(data.buffercbcheightTestingTransaction.bufferHeightNPP_D);
                              $('#bufferheightppa').val(data.buffercbcheightTestingTransaction.bufferHeightPP_A);
                              $('#bufferheightppb').val(data.buffercbcheightTestingTransaction.bufferHeightPP_B);
                              $('#raillevelnppz11').val(data.buffercbcheightTestingTransaction.railLevelPP_Z11);
                              $('#raillevelnppz21').val(data.buffercbcheightTestingTransaction.railLevelPP_Z21);
                              $('#raillevelnppz31').val(data.buffercbcheightTestingTransaction.railLevelPP_Z31);
                              $('#raillevelnppz41').val(data.buffercbcheightTestingTransaction.railLevelPP_Z41);
                              $('#raillevelppz11').val(data.buffercbcheightTestingTransaction.railLevelNPP_Z11);
                              $('#raillevelppz21').val(data.buffercbcheightTestingTransaction.railLevelNPP_Z21);
                              $('#raillevelppz31').val(data.buffercbcheightTestingTransaction.railLevelNPP_Z31);
                              $('#raillevelppz41').val(data.buffercbcheightTestingTransaction.railLevelNPP_Z41);
                              $('#verticalstopclearancenppz1').val(data.buffercbcheightTestingTransaction.verticalStopClearanceNPP_Z1);
                              $('#verticalstopclearancenppz2').val(data.buffercbcheightTestingTransaction.verticalStopClearanceNPP_Z2);
                              $('#verticalstopclearanceppz1').val(data.buffercbcheightTestingTransaction.verticalStopClearancePP_Z1);
                              $('#verticalstopclearanceppz2').val(data.buffercbcheightTestingTransaction.verticalStopClearancePP_Z2);
                              
                              
                              $('#averageheightnppz13z23').val(data.buffercbcheightTestingTransaction.averageHeightNPP_Z13_Z23);
                              $('#averageheightnppz33z43').val(data.buffercbcheightTestingTransaction.averageHeightNPP_Z33_Z43);
                              $('#averageheightppz13z23').val(data.buffercbcheightTestingTransaction.averageHeightPP_Z13_Z23);
                              $('#averageheightppz33z43').val(data.buffercbcheightTestingTransaction.averageHeightPP_Z33_Z43);
                              $('#logintudinalclearancenppx15').val(data.buffercbcheightTestingTransaction.logintudinalClearanceNPP_X15);
                              $('#logintudinalclearancenppx25').val(data.buffercbcheightTestingTransaction.logintudinalClearanceNPP_X25);
                              $('#logintudinalclearanceppx15').val(data.buffercbcheightTestingTransaction.logintudinalClearancePP_X15);
                              $('#logintudinalclearanceppx25').val(data.buffercbcheightTestingTransaction.logintudinalClearancePP_X25);
                              $('#lateralclearancenppy14').val(data.buffercbcheightTestingTransaction.lateralClearanceNPP_Y14);
                              $('#lateralclearancenppy34').val(data.buffercbcheightTestingTransaction.lateralClearanceNPP_Y34);
                              $('#lateralclearanceppy14').val(data.buffercbcheightTestingTransaction.lateralClearancePP_Y14);
                              $('#lateralclearanceppy34').val(data.buffercbcheightTestingTransaction.lateralClearancePP_Y34);
                              $('#torqueforcebogienpp1').val(data.buffercbcheightTestingTransaction.torqueForceBogiePP_1);
                              $('#torqueforcebogienpp2').val(data.buffercbcheightTestingTransaction.torqueForceBogiePP_2);
                              $('#torqueforcebogienpp3').val(data.buffercbcheightTestingTransaction.torqueForceBogiePP_3);
                              $('#torqueforcebogienpp4').val(data.buffercbcheightTestingTransaction.torqueForceBogiePP_4);
                              $('#torqueforcebogiepp1').val(data.buffercbcheightTestingTransaction.torqueForceBogieNPP_1);
                              $('#torqueforcebogiepp2').val(data.buffercbcheightTestingTransaction.torqueForceBogieNPP_2);
                              $('#torqueforcebogiepp3').val(data.buffercbcheightTestingTransaction.torqueForceBogieNPP_3);
                              $('#torqueforcebogiepp4').val(data.buffercbcheightTestingTransaction.torqueForceBogieNPP_4);
                              $('#torqueforceyawdamper170nppa1').val(data.buffercbcheightTestingTransaction.torqueForceYawDamper170NPP_A1);
                              $('#torqueforceyawdamper170nppa2').val(data.buffercbcheightTestingTransaction.torqueForceYawDamper170NPP_A2);
                              
                              $('#torqueforceyawdamper170ppa1').val(data.buffercbcheightTestingTransaction.torqueForceYawDamper170PP_A1);
                              $('#torqueforceyawdamper170ppa2').val(data.buffercbcheightTestingTransaction.torqueForceYawDamper170PP_A2);
                              $('#torqueforceyawdamper160nppa1').val(data.buffercbcheightTestingTransaction.torqueForceYawDamper160NPP_A1);
                              $('#torqueforceyawdamper160nppa2').val(data.buffercbcheightTestingTransaction.torqueForceYawDamper160NPP_A2);
                              $('#torqueforceyawdamper160ppa1').val(data.buffercbcheightTestingTransaction.torqueForceYawDamper160PP_A1);
                              $('#torqueforceyawdamper160ppa2').val(data.buffercbcheightTestingTransaction.torqueForceYawDamper160PP_A2);
                              $('#secspringheightnppz1').val(data.buffercbcheightTestingTransaction.secSpringHeightNPP_Z1);
                              $('#secspringheightnppz2').val(data.buffercbcheightTestingTransaction.secSpringHeightNPP_Z2);
                              $('#secspringheightppz1').val(data.buffercbcheightTestingTransaction.secSpringHeightPP_Z1);
                              $('#secspringheightppz2').val(data.buffercbcheightTestingTransaction.secSpringHeightPP_Z2);
                             // alert("hii");
                              $('[id="checkingStatus"]').val([data.buffercbcheightTestingTransaction.testingstatus]);
                             //alert("LKJ");
                              var furnishingDate=(data.buffercbcheightTestingTransaction.dateOfBuffercbcheight).substring(0,10);
                              
                              var furnishingDateArray=furnishingDate.split("-");
                              //var sideWallD= new Date(sideWallDateArray[0],sideWallDateArray[1]-1,sideWallDateArray[2]);
                              $('#dateofbuffercbcheighttesting').datepicker("setDate", new Date(furnishingDateArray[0],furnishingDateArray[1]-1,furnishingDateArray[2]));
                             // alert(data.buffercbcheightTestingTransaction.testingstatus);
                             
                              }
                               
                             });
                            
                            }
                            $('#dateofbuffercbcheighttesting').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
                             $("#furnishingproduction").dialog({
                                              title : 'Buffer/cbc height & misc measurement for  '+record.bogieNumber + 'from Stage- <%=stageID%>',
                                              width:'70%',
                                              close: function (e, u) {
                                                    //$(".formError").remove();
                                                 $("#furnishingproduction").validationEngine('hideAll');
                                               $('#furnishingproduction').find('form[name="furnishingprodform"]')[0].reset();
                                                },
                                                               
                                          buttons: {
                                                        Submit: {
                                                            text: "Submit",
                                                             id: "my-button-submit",
                                                             click:function () {
                                                                 
                                                                 //alert("error");
                                                           
                                                          //alert("$('#qtyDispatched').val()->"+$('#qtyDispatched').val());
                                                          //alert("record.balanceQtyToDispatch->"+record.balanceQtyToDispatch);
                                                     
                                                         //validation code will come here
                                                          	 if ($('#shiftbuffercbcheight').validationEngine('validate')) 
                                                          	      {
                    		                                        	
                    		                                            return false;
                    		                                        }
                                                        	 if ($('#bogiepp').validationEngine('validate')) 
                                                     	      {
                    	                                        	
                    	                                            return false;
                    	                                        }
                                                        	 if ($('#bogienpp').validationEngine('validate')) 
                                                     	      {
                    	                                        	
                    	                                            return false;
                    	                                        }

                                                          	if ($('#docnobuffercbcheight').validationEngine('validate')) 
                                                    	      {
                    	                                        	
                    	                                            return false;
                    	                                        }
                                                          	 if ($('#dateofbuffercbcheighttesting').validationEngine('validate')) 
                                                     	      {
                    	                                        	
                    	                                            return false;
                    	                                        }
                                                                     
                                                         	if ($('#shelltype').validationEngine('validate')) 
                                                  	      {
                    	                                        	
                    	                                            return false;
                    	                                        }
                                                         	if ($('#shellno').validationEngine('validate')) 
                                                  	      {
                    	                                        	
                    	                                            return false;
                    	                                        }

                                                         	if ($('#furno').validationEngine('validate')) 
                                                  	      {
                    	                                        	
                    	                                            return false;
                    	                                        }




                                                       
                                                         var c=confirm("Do you want to submit data for Buffer/cbc height Testing");
                                                          if(c==false){return false;}
                                                                  
                                                          $.ajax({
                                               url : "savedataofbuffercbcheight",  //action-name as defined in struts.xml
                                               dataType: 'json',
                                               data : {
                                            	   furnishingAssetId: record.furnishingAssetId,
                                            	   
                                            	   dateofbuffercbcheighttesting:$('#dateofbuffercbcheighttesting').val(),
                                            	 
                                            	   //:$('#shelltype').val(),
                                                   
                                            	   coachtype:$('#coachtype').val(),
                                               
                                            	   coachno:$('#coachno').val(),
                                                
                                            	   dampernppa1:$('#dampernppa1').val(),
                                                 
                                            	   dampernppa2:$('#dampernppa2').val(),
                                                
                                            	   damperppa1:$('#damperppa1').val(),
                                                 
                                            	   damperppa2:$('#damperppa2').val(),
                                                
                                            	   shiftbuffercbcheight:$('#shiftbuffercbcheight').val(),
                                            	   docnobuffercbcheight:$('#docnobuffercbcheight').val(),
                                                 
                                            	   
                                            	   h2npp:$('#h2npp').val(),
                                                
                                            	   h1pp:$('#h1pp').val(),
                                            	   simheightnpp1:$('#simheightnpp1').val(),
                                            	   simheightnpp2:$('#simheightnpp2').val(),
                                            	   simheightpp1:$('#simheightpp1').val(),
                                                
                                            	   simheightpp2:$('#simheightpp2').val(),
                                                 
                                            	   simheightnpp3:$('#simheightnpp3').val(),
                                            	   simheightnpp4:$('#simheightnpp4').val(),
                                            	   simheightpp3:$('#simheightpp3').val(),
                                            	   simheightpp4:$('#simheightpp4').val(),
                                            	   bufferheightnppc:$('#bufferheightnppc').val(),
                                            	   bufferheightnppd:$('#bufferheightnppd').val(),
                                            	   bufferheightppa:$('#bufferheightppa').val(),
                                            	   bufferheightppb:$('#bufferheightppb').val(),
                                            	   raillevelnppz11:$('#raillevelnppz11').val(),
                                            	   raillevelnppz21:$('#raillevelnppz21').val(),
                                            	   raillevelnppz31:$('#raillevelnppz31').val(),
                                            	   raillevelnppz41:$('#raillevelnppz41').val(),
                                            	   raillevelppz11:$('#raillevelppz11').val(),
                                            	   raillevelppz21:$('#raillevelppz21').val(),
                                            	   raillevelppz31:$('#raillevelppz31').val(),
                                            	   raillevelppz41:$('#raillevelppz41').val(),
                                            	   verticalstopclearancenppz1:$('#verticalstopclearancenppz1').val(),
                                            	   verticalstopclearancenppz2:$('#verticalstopclearancenppz2').val(),
                                            	   verticalstopclearanceppz1:$('#verticalstopclearanceppz1').val(),
                                            	   verticalstopclearanceppz2:$('#verticalstopclearanceppz2').val(),
                                            	   averageheightnppz13z23:$('#averageheightnppz13z23').val(),
                                            	   averageheightnppz33z43:$('#averageheightnppz33z43').val(),
                                                
                                            	   averageheightppz13z23:$('#averageheightppz13z23').val(),
                                            	   averageheightppz33z43:$('#averageheightppz33z43').val(),
                                            	   logintudinalclearancenppx15:$('#logintudinalclearancenppx15').val(),
                                            	   logintudinalclearancenppx25:$('#logintudinalclearancenppx25').val(),
                                            	   logintudinalclearanceppx15:$('#logintudinalclearanceppx15').val(),
                                            	   logintudinalclearanceppx25:$('#logintudinalclearanceppx25').val(),
                                            	   lateralclearancenppy14:$('#lateralclearancenppy14').val(),
                                            	   lateralclearancenppy34:$('#lateralclearancenppy34').val(),
                                            	   lateralclearanceppy14:$('#lateralclearanceppy14').val(),
                                            	   lateralclearanceppy34:$('#lateralclearanceppy34').val(),
                                            	   
                                            	   torqueforcebogienpp1:$('#torqueforcebogienpp1').val(),
                                            	   torqueforcebogienpp2:$('#torqueforcebogienpp2').val(),
                                            	   torqueforcebogienpp3:$('#torqueforcebogienpp3').val(),
                                            	   torqueforcebogienpp4:$('#torqueforcebogienpp4').val(),
                                            	   torqueforcebogiepp1:$('#torqueforcebogiepp1').val(),
                                            	   torqueforcebogiepp2:$('#torqueforcebogiepp2').val(),
                                            	   torqueforcebogiepp3:$('#torqueforcebogiepp3').val(),
                                            	   torqueforcebogiepp4:$('#torqueforcebogiepp4').val(),
                                            	   
                                            	   
                                            	   torqueforceyawdamper170nppa1:$('#torqueforceyawdamper170nppa1').val(),
                                            	   torqueforceyawdamper170nppa2:$('#torqueforceyawdamper170nppa2').val(),
                                            	   torqueforceyawdamper170ppa1:$('#torqueforceyawdamper170ppa1').val(),
                                            	   torqueforceyawdamper170ppa2:$('#torqueforceyawdamper170ppa2').val(),
                                            	   torqueforceyawdamper160nppa1:$('#torqueforceyawdamper160nppa1').val(),
                                            	   torqueforceyawdamper160nppa2:$('#torqueforceyawdamper160nppa2').val(),
                                            	   torqueforceyawdamper160ppa1:$('#torqueforceyawdamper160ppa1').val(),
                                            	   torqueforceyawdamper160ppa2:$('#torqueforceyawdamper160ppa2').val(),
                                            	   
                                            	   secspringheightnppz1:$('#secspringheightnppz1').val(),
                                            	   secspringheightnppz2:$('#secspringheightnppz2').val(),
                                            	   secspringheightppz1:$('#secspringheightppz1').val(),
                                            	   secspringheightppz2:$('#secspringheightppz2').val(),
                                            	   checkingStatus:$("Input[id='checkingStatus']:checked").val(),
                                               
                                                
                                                    
                                                  },
                                               
                                               type : 'POST',
                                               async : false,
                                                     })
                                               .done(function( msg ) {
                                            	   
                                            	   $('#furnishingAssetId').val(''),
                                            	   $('#dateofbuffercbcheighttesting').val(''),
                                            	   $('#docnobuffercbcheight').val(''),
                                            	   
                                            	   
                                            	 // $('#shelltype').val(''),
                                                   
                                            	   $('#coachtype').val(''),
                                               
                                            	  $('#coachno').val(''),
                                                
                                            	   $('#dampernppa1').val(''),
                                                 
                                            	   $('#dampernppa2').val(''),
                                                
                                            	   $('#damperppa1').val(''),
                                                 
                                            	   $('#damperppa2').val(''),
                                                
                                            	 $('#shiftbuffercbcheight').val(''),
                                                 
                                            	  $('#bogienoh2').val(''),
                                            	   $('#bogienoh1').val(''),
                                            	  $('#h2npp').val(''),
                                                
                                            	$('#h1pp').val(''),
                                            	  $('#simheightnpp1').val(''),
                                            	   $('#simheightnpp2').val(''),
                                            	   $('#simheightpp1').val(''),
                                                
                                            	   $('#simheightpp2').val(''),
                                                 
                                            	   $('#simheightnpp3').val(''),
                                            	   $('#simheightnpp4').val(''),
                                            	   $('#simheightpp3').val(''),
                                            	  $('#simheightpp4').val(''),
                                            	   $('#bufferheightnppc').val(''),
                                            	   $('#bufferheightnppd').val(''),
                                            	   $('#bufferheightppa').val(''),
                                            	   $('#bufferheightppb').val(''),
                                            	   $('#raillevelnppz11').val(''),
                                            	   $('#raillevelnppz21').val(''),
                                            	   $('#raillevelnppz31').val(''),
                                            	   $('#raillevelnppz41').val(''),
                                            	  $('#raillevelppz11').val(''),
                                            	   $('#raillevelppz21').val(''),
                                            	   $('#raillevelppz31').val(''),
                                            	  $('#raillevelppz41').val(''),
                                            	$('#verticalstopclearancenppz1').val(''),
                                            	 $('#verticalstopclearancenppz2').val(''),
                                            	   $('#verticalstopclearanceppz1').val(''),
                                            	   $('#verticalstopclearanceppz2').val(''),
                                            	   $('#averageheightnppz13z23').val(''),
                                            	  $('#averageheightnppz33z43').val(''),
                                                
                                            	   $('#averageheightppz13z23').val(''),
                                            	  $('#averageheightppz33z43').val(''),
                                            	   $('#logintudinalclearancenppx15').val(''),
                                            	  $('#logintudinalclearancenppx25').val(''),
                                            	   $('#logintudinalclearanceppx15').val(''),
                                            	   $('#logintudinalclearanceppx25').val(''),
                                            	   $('#lateralclearancenppy14').val(''),
                                            	   $('#lateralclearancenppy34').val(''),
                                            	   $('#lateralclearanceppy14').val(''),
                                            	 $('#lateralclearanceppy34').val(''),
                                            	   
                                            	   $('#torqueforcebogienpp1').val(''),
                                            	   $('#torqueforcebogienpp2').val(''),
                                            	   $('#torqueforcebogienpp3').val(''),
                                            	   $('#torqueforcebogienpp4').val(''),
                                            	  $('#torqueforcebogiepp1').val(''),
                                            	   $('#torqueforcebogiepp2').val(''),
                                            	   $('#torqueforcebogiepp3').val(''),
                                            	  $('#torqueforcebogiepp4').val(''),
                                            	   
                                            	   
                                            	   $('#torqueforceyawdamper170nppa1').val(''),
                                            	   $('#torqueforceyawdamper170nppa2').val(''),
                                            	   $('#torqueforceyawdamper170ppa1').val(''),
                                            	   $('#torqueforceyawdamper170ppa2').val(''),
                                            	  $('#torqueforceyawdamper160nppa1').val(''),
                                            	  $('#torqueforceyawdamper160nppa2').val(''),
                                            	   $('#torqueforceyawdamper160ppa1').val(''),
                                            	  $('#torqueforceyawdamper160ppa2').val(''),
                                            	   
                                            	 $('#secspringheightnppz1').val(''),
                                            	   $('#secspringheightnppz2').val(''),
                                            	   $('#secspringheightppz1').val(''),
                                            	 $('#secspringheightppz2').val(''),
                                            	  
                                                 $('#checkingStatus').val(''),
                                                $('#furnishingproduction').dialog('close');
                                                $('#furnishingproduction').jtable('load');
                                                    })
                                     
                                                            }
                                                         }, 
                                                Close: function () {
                                                 $('#furnishingproduction').find('form[name="furnishingprodform"]')[0].reset();
                                                                $(this).dialog('close');
                                                            }
                                                         },
                                                  modal: true
                             });
                                            
                                            
                                            
                                            
                                            
                                               
                                           return true;
                                               
                                              
                                              }//ending else                 
                                           // ajax call ends here    
                              
                                            }
                                        }, 
                             
                                        {
                                    		
                                        	//Second toolbar entry
                                            	icon: '<%=contextpath%>/images/rs_out.png',
                                                text: 'Fiba test',
                                                click: function () {
                                               	
                                                	 var $selectedRows = $('#FurnishingProductionTableContainer').jtable('selectedRows');
                                            	 	 if ($selectedRows.length<1)
                                            		 alert("Please select a row for FIBA Testing");
                                            	 	 else{
                                            	 		var record;
                                            	 		$selectedRows.each(function () {
                                                            record = $(this).data('record');
                                                            });
                                                	
                                        			var furnishingAssetId=record.furnishingAssetId;
                                        			
                                        			 $.ajax({
                           							  url:"showExistingFIBATestData",  //action-name as defined in struts.xml
                           								dataType:'json',
                           								type:'POST',
                           						        async:false,
                           								data:{
                           							       furnishingAssetId:record.furnishingAssetId,
                           								},
                           								success:function(data)
                           								{
                           									
                           									 $('#docNoFiba').val(data.fibaDocNo);
                           									 $('#revnoFiba').val(data.fibaRevno);
                           								     $('#shellType').val(data.shellType);
                           								     $('#shellNo').val(data.shellNo);
                           								     $('#furnishingNo').val(data.furnishingNo);
                           								     $('#coachNumber').val(data.coachNumber);
                           								     $('#coachType').val(data.coachType);
                           								     $('#bogiePPEndMake').val(data.bogiePPEndMake);
            	                           	                 $('#bogiePPEndSerial').val(data.bogiePPEndSerial);
            	                           	                 var bogiePPMfgDateTest=(data.bogiePPMfgDate).substring(0,10);
            												 var bogiePPMfgDateTestArray=bogiePPMfgDateTest.split("-");
            												 $('#bogiePPMfgDate').datepicker("setDate",new Date(bogiePPMfgDateTestArray[0],bogiePPMfgDateTestArray[1]-1,bogiePPMfgDateTestArray[2]));
            												 $('#bogieNPPEndMake').val(data.bogieNPPEndMake);
            	                           	                 $('#bogieNPPEndSerial').val(data.bogieNPPEndSerial);
            	                           	                 var bogieNPPMfgDateTest=(data.bogieNPPMfgDate).substring(0,10);
            												 var bogieNPPMfgDateTestArray=bogieNPPMfgDateTest.split("-");
            												 $('#bogieNPPMfgDate').datepicker("setDate",new Date(bogieNPPMfgDateTestArray[0],bogieNPPMfgDateTestArray[1]-1,bogieNPPMfgDateTestArray[2]));
            	                           	                 $('#fibaPPMake').val(data.fibaPPMake);
                           								     $('#fibaNPPMake').val(data.fibaNPPMake);
                           								     $('#fibaPPSerial').val(data.fibaPPSerial);
                           								     $('#fibaNPPSerial').val(data.fibaNPPSerial);
                           							         var fibaPPMfgDateTest=(data.fibaPPMfgDate).substring(0,10);
            												 var fibaPPMfgDateTestArray=fibaPPMfgDateTest.split("-");
            												 $('#fibaPPMfgDate').datepicker("setDate",new Date(fibaPPMfgDateTestArray[0],fibaPPMfgDateTestArray[1]-1,fibaPPMfgDateTestArray[2]));
            												 var fibaNPPMfgDateTest=(data.fibaNPPMfgDate).substring(0,10);
            												 var fibaNPPMfgDateTestArray=fibaNPPMfgDateTest.split("-");
            												 $('#fibaNPPMfgDate').datepicker("setDate",new Date(fibaNPPMfgDateTestArray[0],fibaNPPMfgDateTestArray[1]-1,fibaNPPMfgDateTestArray[2]));
            												 var indicatorPPMfgDateTest=(data.indicatorPPMfgDate).substring(0,10);
            												 var indicatorPPMfgDateTestArray=indicatorPPMfgDateTest.split("-");
            												 $('#indicatorPPMfgDate').datepicker("setDate",new Date(indicatorPPMfgDateTestArray[0],indicatorPPMfgDateTestArray[1]-1,indicatorPPMfgDateTestArray[2]));
            												 var indicatorNPPMfgDateTest=(data.indicatorNPPMfgDate).substring(0,10);
            												 var indicatorNPPMfgDateTestArray=indicatorNPPMfgDateTest.split("-");
            												 $('#indicatorNPPMfgDate').datepicker("setDate",new Date(indicatorNPPMfgDateTestArray[0],indicatorNPPMfgDateTestArray[1]-1,indicatorNPPMfgDateTestArray[2]));
            												 $('#indicatorPPMake').val(data.indicatorPPMake);
                        								     $('#indicatorNPPMake').val(data.indicatorNPPMake);
                        								     $('#indicatorPPSerial').val(data.indicatorPPSerial);
                        								     $('#indicatorNPPSerial').val(data.indicatorNPPSerial);
                        								    
                           								   
                           								}
                           									
                           								});
                                        			
                                        			
                                        		if(record.fibaTestingFlag==1)
                     								{
                     								
                     								$.ajax({
                     									url:"showFIBATest", //action-name as defined in struts.xml
                     									dataType:'json',
                     									type:'POST',
                     									async:false,
                     									data:{
                     										furnishingAssetId:record.furnishingAssetId,	
                     									},
                     									success:function(data)
                     									{
                     			
                     									     
            		                           	              $('#shiftFiba').val(data.fibaTestingTran.shiftFiba);
            		                           	              $('#generalInstallationNo').val(data.fibaTestingTran.generalInstallationNo);
            		                           	              $('#wiNo').val(data.fibaTestingTran.wiNo);
            		                           	              $('#pslNo').val(data.fibaTestingTran.pslNo);
            		                           	              var dateofFibaTest=(data.fibaTestingTran.dateOfFibaTesting).substring(0,10);
            												 var dateofFibaTestArray=dateofFibaTest.split("-");
            												 $('#dateOfFibaTesting').datepicker("setDate",new Date(dateofFibaTestArray[0],dateofFibaTestArray[1]-1,dateofFibaTestArray[2]));
            		                           	              $ ('#initialChargingPPAirSpring1').val(data.fibaTestingTran.initialChargingPPAirSpring1);
                                                              $ ('#initialChargingPPAirSpring2').val(data.fibaTestingTran.initialChargingPPAirSpring2);
                                                              $ ('#initialChargingNPPAirSpring1').val(data.fibaTestingTran.initialChargingNPPAirSpring1);
                                                              $ ('#initialChargingNPPAirSpring2').val(data.fibaTestingTran.initialChargingNPPAirSpring2);
                                                              $ ('#leakageDetectionPPAirSpring1').val(data.fibaTestingTran.leakageDetectionPPAirSpring1);
                                                              $ ('#leakageDetectionPPAirSpring2').val(data.fibaTestingTran.leakageDetectionPPAirSpring2);
                                                              $ ('#leakageDetectionNPPAirSpring1').val(data.fibaTestingTran.leakageDetectionNPPAirSpring1);
                                                                $ ('#leakageDetectionNPPAirSpring2').val(data.fibaTestingTran.leakageDetectionNPPAirSpring2);
                                                                $ ('#functionTestFIBAPPAirSpring1').val(data.fibaTestingTran.functionTestFIBAPPAirSpring1);
                                                                $ ('#functionTestFIBAPPAirSpring2').val(data.fibaTestingTran.functionTestFIBAPPAirSpring2);
                                                                $ ('#functionTestFIBANPPAirSpring1').val(data.fibaTestingTran.functionTestFIBANPPAirSpring1);
                                                                $ ('#functionTestFIBANPPAirSpring2').val(data.fibaTestingTran.functionTestFIBANPPAirSpring2);
                                                                $ ('#functionTestBrakePPAirSpring1').val(data.fibaTestingTran.functionTestBrakePPAirSpring1);
                                                                $ ('#functionTestBrakePPAirSpring2').val(data.fibaTestingTran.functionTestBrakePPAirSpring2);
                                                                $ ('#functionTestBrakeNPPAirSpring1').val(data.fibaTestingTran.functionTestBrakeNPPAirSpring1);
                                                                $ ('#functionTestBrakeNPPAirSpring2').val(data.fibaTestingTran.functionTestBrakeNPPAirSpring2);
                                                                $ ('#functionTestIndicatorPPAirSpring1').val(data.fibaTestingTran.functionTestIndicatorPPAirSpring1);
                                                                $ ('#functionTestIndicatorPPAirSpring2').val(data.fibaTestingTran.functionTestIndicatorPPAirSpring2);
                                                                $ ('#functionTestIndicatorNPPAirSpring1').val(data.fibaTestingTran.functionTestIndicatorNPPAirSpring1);
                                                                $ ('#functionTestIndicatorNPPAirSpring2').val(data.fibaTestingTran.functionTestIndicatorNPPAirSpring2);
                                                                $ ('#functionTestWrestingBlowPPAirSpring1').val(data.fibaTestingTran.functionTestWrestingBlowPPAirSpring1);
                                                                $ ('#functionTestWrestingBlowPPAirSpring2').val(data.fibaTestingTran.functionTestWrestingBlowPPAirSpring2);
                                                                $ ('#functionTestWrestingBlowNPPAirSpring1').val(data.fibaTestingTran.functionTestWrestingBlowNPPAirSpring1);
                                                                $ ('#functionTestWrestingBlowNPPAirSpring2').val(data.fibaTestingTran.functionTestWrestingBlowNPPAirSpring2);
                                                                $ ('#brakePipeIsolationHissingSoundPPAirSpring1').val(data.fibaTestingTran.brakePipeIsolationHissingSoundPPAirSpring1);
                                                                $ ('#brakePipeIsolationHissingSoundPPAirSpring2').val(data.fibaTestingTran.brakePipeIsolationHissingSoundPPAirSpring2);
                                                                $ ('#brakePipeIsolationHissingSoundNPPAirSpring1').val(data.fibaTestingTran.brakePipeIsolationHissingSoundNPPAirSpring1); 
                                                                $ ('#brakePipeIsolationHissingSoundNPPAirSpring2').val(data.fibaTestingTran.brakePipeIsolationHissingSoundNPPAirSpring2);
                                                                $ ('#brakePipeIsolationBrakeReleasePPAirSpring1').val(data.fibaTestingTran.brakePipeIsolationBrakeReleasePPAirSpring1);	
                                                                $ ('#brakePipeIsolationBrakeReleasePPAirSpring2').val(data.fibaTestingTran.brakePipeIsolationBrakeReleasePPAirSpring2);	
                                                                $ ('#brakePipeIsolationBrakeReleaseNPPAirSpring1').val(data.fibaTestingTran.brakePipeIsolationBrakeReleaseNPPAirSpring1);
                                                                $ ('#brakePipeIsolationBrakeReleaseNPPAirSpring2').val(data.fibaTestingTran.brakePipeIsolationBrakeReleaseNPPAirSpring2);
                                                                $ ('#brakePipeVariationPPAirSpring1').val(data.fibaTestingTran.brakePipeVariationPPAirSpring1);
                                                                $ ('#brakePipeVariationPPAirSpring2').val(data.fibaTestingTran.brakePipeVariationPPAirSpring2);
                                                                $ ('#brakePipeVariationNPPAirSpring1').val(data.fibaTestingTran.brakePipeVariationNPPAirSpring1);
                                                                $ ('#brakePipeVariationNPPAirSpring2').val(data.fibaTestingTran.brakePipeVariationNPPAirSpring2);
                                                                $('#suppressPipeVariationPPTest1').val(data.fibaTestingTran.suppressPipeVariationPPTest1),
               	 		                                        $('#suppressPipeVariationPPTest2').val(data.fibaTestingTran.suppressPipeVariationPPTest2),
               	 		                                        $('#suppressPipeVariationNPPTest1').val(data.fibaTestingTran.suppressPipeVariationNPPTest1),
               	 		                                        $('#suppressPipeVariationNPPTest2').val(data.fibaTestingTran.suppressPipeVariationNPPTest2),
                                                                $ ('#repetitionTestPPAirSpring1').val(data.fibaTestingTran.repetitionTestPPAirSpring1);
                                                                $ ('#repetitionTestPPAirSpring2').val(data.fibaTestingTran.repetitionTestPPAirSpring2);
                                                                $ ('#repetitionTestNPPAirSpring1').val(data.fibaTestingTran.repetitionTestNPPAirSpring1);
                                                                $ ('#repetitionTestNPPAirSpring2').val(data.fibaTestingTran.repetitionTestNPPAirSpring2);	
                                                            
                     									}
                     										
                     									});
                     								
                     							}
                                        		$('#dateOfFibaTesting').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
                                        					$( "#fibaDialog" ).load( URL ).dialog({
                       										title: 'Add Data For FIBA Testing ='+record.furnishingAssetId + 'from Stage- <%=stageID%>',
                       										modal:true,
                       										width:'70%',
                       										closeOnEscape:true,
                       										Close: function () {
                       											$('#fibaDialog').find('form[name="FIBATestingForm"]')[0].reset();
                       											 $('#FurnishingProductionTableContainer').jtable().jtable('load');
                       	                                    },
                                        					
                                        					buttons: {
                      	                                    Submit: {
                      	                                       text: "Submit",
                      	                                        id: "my-button-submit",
                      	                                        click:function () {
                      	                                               
                      	                                        
                      	                                            var c=confirm("Do you want to confirm FIBA Testing?");
                      	  	                                    	if(c==false){return false;}
                      	                                        
                      	 	                                    	$.ajax({
                      	 		                           	             url : "saveFIBATesting",  //action-name as defined in struts.xml
                      	 		                           	                dataType: 'json', 
                      	 		                           	                 data : {
                      	 		                           	                 furnishingAssetId: record.furnishingAssetId,
                      	 		                           	                 
                      	 		                           	           docNoFiba:$('#docNoFiba').val(),
                      	 		                           	           dateOfFibaTesting: $('#dateOfFibaTesting').val(),
                      	 		                           	           shiftFiba:$('#shiftFiba').val(),
                      	 		                           	           generalInstallationNo:$('#generalInstallationNo').val(),
                      	 		                           	           wiNo:$('#wiNo').val(),
                      	 		                           	           pslNo: $('#pslNo').val(),
                      	 		                           	           initialChargingPPAirSpring1:$ ('#initialChargingPPAirSpring1').val(),
                      	 		                           	           initialChargingPPAirSpring2:$ ('#initialChargingPPAirSpring2').val(),
                      	 		                           	           initialChargingNPPAirSpring1: $ ('#initialChargingNPPAirSpring1').val(),
                      	 		                           	           initialChargingNPPAirSpring2:$ ('#initialChargingNPPAirSpring2').val(),
                      	 		                           	           leakageDetectionPPAirSpring1: $ ('#leakageDetectionPPAirSpring1').val(),
                      	 		                                       leakageDetectionPPAirSpring2:$ ('#leakageDetectionPPAirSpring2').val(),
                      	 		                                       leakageDetectionNPPAirSpring1:$ ('#leakageDetectionNPPAirSpring1').val(),
                      	 		                                       leakageDetectionNPPAirSpring2:$ ('#leakageDetectionNPPAirSpring2').val(),
                      	 		                                       functionTestFIBAPPAirSpring1:$ ('#functionTestFIBAPPAirSpring1').val(),
                      	 		                                       functionTestFIBAPPAirSpring2:$ ('#functionTestFIBAPPAirSpring2').val(),
                      	 		                                       functionTestFIBANPPAirSpring1:$ ('#functionTestFIBANPPAirSpring1').val(),
                      	 		                                       functionTestFIBANPPAirSpring2:$ ('#functionTestFIBANPPAirSpring2').val(),
                      	 		                                       functionTestBrakePPAirSpring1:$ ('#functionTestBrakePPAirSpring1').val(),
                      	 		                                       functionTestBrakePPAirSpring2:$ ('#functionTestBrakePPAirSpring2').val(),
                      	 		                                       functionTestBrakeNPPAirSpring1:$ ('#functionTestBrakeNPPAirSpring1').val(),
                      	 		                                       functionTestBrakeNPPAirSpring2:$ ('#functionTestBrakeNPPAirSpring2').val(),
                      	 		                                       functionTestIndicatorPPAirSpring1:$ ('#functionTestIndicatorPPAirSpring1').val(),
                      	 		                                       functionTestIndicatorPPAirSpring2:$ ('#functionTestIndicatorPPAirSpring2').val(),
                      	 		                                       functionTestIndicatorNPPAirSpring1:$ ('#functionTestIndicatorNPPAirSpring1').val(),
                      	 		                                       functionTestIndicatorNPPAirSpring2:$ ('#functionTestIndicatorNPPAirSpring2').val(),
                      	 		                                       functionTestWrestingBlowPPAirSpring1:$ ('#functionTestWrestingBlowPPAirSpring1').val(),
                      	 		                                       functionTestWrestingBlowPPAirSpring2:$ ('#functionTestWrestingBlowPPAirSpring2').val(),
                      	 		                                       functionTestWrestingBlowNPPAirSpring1:$ ('#functionTestWrestingBlowNPPAirSpring1').val(),
                      	 		                                       functionTestWrestingBlowNPPAirSpring2:$ ('#functionTestWrestingBlowNPPAirSpring2').val(),
                      	 		                                       brakePipeIsolationHissingSoundPPAirSpring1: $ ('#brakePipeIsolationHissingSoundPPAirSpring1').val(),
                      	 		                                       brakePipeIsolationHissingSoundPPAirSpring2:$ ('#brakePipeIsolationHissingSoundPPAirSpring2').val(),
                      	 		                                       brakePipeIsolationHissingSoundNPPAirSpring1:$ ('#brakePipeIsolationHissingSoundNPPAirSpring1').val(), 
                      	 		                                       brakePipeIsolationHissingSoundNPPAirSpring2:$ ('#brakePipeIsolationHissingSoundNPPAirSpring2').val(),
                      	 		                                       brakePipeIsolationBrakeReleasePPAirSpring1:$ ('#brakePipeIsolationBrakeReleasePPAirSpring1').val(),	
                      	 		                                       brakePipeIsolationBrakeReleasePPAirSpring2: $ ('#brakePipeIsolationBrakeReleasePPAirSpring2').val(),	
                      	 		                                       brakePipeIsolationBrakeReleaseNPPAirSpring1:$ ('#brakePipeIsolationBrakeReleaseNPPAirSpring1').val(),
                      	 		                                       brakePipeIsolationBrakeReleaseNPPAirSpring2:$ ('#brakePipeIsolationBrakeReleaseNPPAirSpring2').val(),
                      	 		                                       suppressPipeVariationPPTest1:$('#suppressPipeVariationPPTest1').val(),
                      	 		                                       suppressPipeVariationPPTest2:$('#suppressPipeVariationPPTest2').val(),
                      	 		                                       suppressPipeVariationNPPTest1:$('#suppressPipeVariationNPPTest1').val(),
                      	 		                                       suppressPipeVariationNPPTest2:$('#suppressPipeVariationNPPTest2').val(),
                      	 		                                       brakePipeVariationPPAirSpring1:$ ('#brakePipeVariationPPAirSpring1').val(),
                      	 		                                       brakePipeVariationPPAirSpring2:$ ('#brakePipeVariationPPAirSpring2').val(),
                      	 		                                       brakePipeVariationNPPAirSpring1:$ ('#brakePipeVariationNPPAirSpring1').val(),
                      	 		                                       brakePipeVariationNPPAirSpring2:$ ('#brakePipeVariationNPPAirSpring2').val(),
                      	 		                                       repetitionTestPPAirSpring1:$ ('#repetitionTestPPAirSpring1').val(),
                      	 		                                       repetitionTestPPAirSpring2:$ ('#repetitionTestPPAirSpring2').val(),
                      	 		                                       repetitionTestNPPAirSpring1:$ ('#repetitionTestNPPAirSpring1').val(),
                      	 		                                       repetitionTestNPPAirSpring2: $ ('#repetitionTestNPPAirSpring2').val(),          	 		                           	                       


                      	 	                                                    },
                      	 		                           	                    						
                      	 		                           	                  type : 'POST',
                      	 		                           	                  async : false,
                      	 		                           	               })
                      	                                        
                      	                                        
                      	                                         .done(function( msg ) {
                   	                            	 	        	
                      	                                        	       
                      	                                                 $('#docNoFiba').val(''),
                  	 		                           	                 $('#dateOfFibaTesting').val(''),
                  	 		                           	                 $('#shiftFiba').val(''),
                  	 		                           	                 $('#generalInstallationNo').val(''),
                  	 		                           	                  $('#wiNo').val(''),
                  	 		                           	                  $('#pslNo').val(''),
                  	                     	                              $ ('#initialChargingPPAirSpring1').val(''),
                                                                           $ ('#initialChargingPPAirSpring2').val(''),
                                                                           $ ('#initialChargingNPPAirSpring1').val(''),
                                                                           $ ('#initialChargingNPPAirSpring2').val(''),
                                                                           $ ('#leakageDetectionPPAirSpring1').val(''),
                                                                           $ ('#leakageDetectionPPAirSpring2').val(''),
                                                                           $ ('#leakageDetectionNPPAirSpring1').val(''),
                                                                           $ ('#leakageDetectionNPPAirSpring2').val(''),
                                                                           $ ('#functionTestFIBAPPAirSpring1').val(''),
                                                                           $ ('#functionTestFIBAPPAirSpring2').val(''),
                                                                           $ ('#functionTestFIBANPPAirSpring1').val(''),
                                                                           $ ('#functionTestFIBANPPAirSpring2').val(''),
                                                                           $ ('#functionTestBrakePPAirSpring1').val(''),
                                                                           $ ('#functionTestBrakePPAirSpring2').val(''),
                                                                           $ ('#functionTestBrakeNPPAirSpring1').val(''),
                                                                           $ ('#functionTestBrakeNPPAirSpring2').val(''),
                                                                           $ ('#functionTestIndicatorPPAirSpring1').val(''),
                                                                           $ ('#functionTestIndicatorPPAirSpring2').val(''),
                                                                           $ ('#functionTestIndicatorNPPAirSpring1').val(''),
                                                                           $ ('#functionTestIndicatorNPPAirSpring2').val(''),
                                                                           $ ('#functionTestWrestingBlowPPAirSpring1').val(''),
                                                                           $ ('#functionTestWrestingBlowPPAirSpring2').val(''),
                                                                           $ ('#functionTestWrestingBlowNPPAirSpring1').val(''),
                                                                           $ ('#functionTestWrestingBlowNPPAirSpring2').val(''),
                                                                           $ ('#brakePipeIsolationHissingSoundPPAirSpring1').val(''),
                                                                           $ ('#brakePipeIsolationHissingSoundPPAirSpring2').val(''),
                                                                           $ ('#brakePipeIsolationHissingSoundNPPAirSpring1').val(''), 
                                                                           $ ('#brakePipeIsolationHissingSoundNPPAirSpring2').val(''),
                                                                           $ ('#brakePipeIsolationBrakeReleasePPAirSpring1').val(''),	
                                                                           $ ('#brakePipeIsolationBrakeReleasePPAirSpring2').val(''),	
                                                                           $ ('#brakePipeIsolationBrakeReleaseNPPAirSpring1').val(''),
                                                                           $ ('#brakePipeIsolationBrakeReleaseNPPAirSpring2').val(''),
                                                                           $ ('#brakePipeVariationPPAirSpring1').val(''),
                                                                           $ ('#brakePipeVariationPPAirSpring2').val(''),
                                                                           $ ('#brakePipeVariationNPPAirSpring1').val(''),
                                                                           $ ('#brakePipeVariationNPPAirSpring2').val(''),
                                                                           $('#suppressPipeVariationPPTest1').val(''),
                          	 		                                       $('#suppressPipeVariationPPTest2').val(''),
                          	 		                                       $('#suppressPipeVariationNPPTest1').val(''),
                          	 		                                       $('#suppressPipeVariationNPPTest2').val(''),
                                                                           $ ('#repetitionTestPPAirSpring1').val(''),
                                                                           $ ('#repetitionTestPPAirSpring2').val(''),
                                                                           $ ('#repetitionTestNPPAirSpring1').val(''),
                                                                           $ ('#repetitionTestNPPAirSpring2').val(''),

                  	                                                 $('#fibaDialog').dialog('close');
                  	                                                 $('#FurnishingProductionTableContainer').jtable('load');
                  	                                            })
                      	 		                           	               
                  	                                            .error(function (msg){
                  		         									//$('#dialog').dialog('close');
                  		         									alert("Error Fetching Data");
                  		         								})
                  		         								  ;          
                      	 		                           	 }
                      	                                   },
                      				                        Close: function () {
                      				                        	
                      				                                        $(this).dialog('close');
                      				                                    }
                      	                                    },
                      	                    	        
                          	                     }).prev(".ui-dialog-titlebar").css("background","blue").dialog("open");
                                          	 		
                                          	 		
                                          	 		
                                          	 		
                                          	 		
                                          	 		    
                                  			    	   return true;
                                          	 		    
                                          	 	
                                            	 	 }//ending else
                            						 
                                                }//ending click function
                                            }, 
              		 
                     ]
	
             },
         
            
     
			actions : {
	
 			listAction: 'availableQualityFurnishingAction?stageID=<%=stageID%>',
 			
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
				
				shellAssetId: {
					title: 'Shell No',
					width: '20%',
					display:function(data){
 						//var shellNo;
 						var shell={};
 						shell.assetId=data.record.shellAssetId;
 						$.ajax({                    
 							  //url: 'descByshellFromIdinPaintShop', 
 							   url: 'descByshellFromId', 
 							  type: 'post', // performing a POST request
 							  async: false,
							  
 							  dataType: 'json',
 								  data : {
									
 									 shellAssetId: data.record.shellAssetId
 								  	  }									                    
 						})
 								.done(function( msg ) {
 								//	shellNo=msg.shellNo;
 								shell.assetNo=msg.shellNo;
								shellArray.push(shell);
									
 									//return msg.stageName;																			    											
 								  })
 								.error(function (msg){
 									alert("Error Saving Data");
 								})
 								  ;
						
						
 						//return shellNo;
 						return shell.assetNo;
 						},
 						create: false,
 						width : '20%',
 						list: true,
 						edit : false
 					},
 					shellType: {
 						title :'Shell Type',
 						width: '8%',
 						list: true,
 						create: false,
 						edit: false		
 						},		
 						coachType:
						{
						title: 'Coach Type',
						 width : '10%',
						list: true,
						edit : false,
					     create: false 
						},
				furnishingAssetId : {
					title : 'furnishingAssetId',
					width: '8%',
					key: true,
					list : false,
					edit : false,
					create : false
									
					},
					
		
// 					assemblyStartDate: {
// 							title :'Assembly Start Date',
// 							width: '8%',
// 							inputClass: 'validate[required]',
// 							type: 'date',
//  							displayFormat: 'dd-mm-yy',
// 							display:function(data){
												 
// 								return ((data.record.assemblyStartDate!=null) && (data.record.assemblyStartDate!="") ) ? moment(data.record.assemblyStartDate).format('DD-MM-YYYY') : "";
// 													}, 
// 							list: true,
// 							create: false,
// 							edit: false
											
// 							},
							vendorAllotted:{
								title :'Alloted Vendor',
								width: '8%',
								
								list: true,
								create: false,
								edit: false
								},
								vendorAllottedDate:
									{
									title :'Alloted Date',
									width: '8%',
									//inputClass: 'validate[required]',
		 							type: 'date',
		 							displayFormat: 'dd-mm-yy',
									display:function(data){
										//alert(data.record.id.hodyCode)	;				 
										return ((data.record.vendorAllottedDate!=null) && (data.record.vendorAllottedDate!="") ) ? moment(data.record.vendorAllottedDate).format('DD-MM-YYYY') : "";
															}, 
														
													
									list: true,
									create: true,
									edit: true
									
									},
					//left bogie display purpose	
							
				bogiePpSideAssetId: {
							title :'PP side Bogie No.',
 					display:function(data){
	 						var bogieNo;
	 						if(data.record.bogiePpSideAssetId!=null)
							{
	 						$.ajax({                    
	 							  url: 'descByBogieId',     
	 							  type: 'post', // performing a POST request
	 							  async: false,
								  
	 							  dataType: 'json',
	 								  data : {
										
	 									 bogieAssetId: data.record.bogiePpSideAssetId
	 								  	  }									                    
	 						})
	 								.done(function( msg ) {
	 									bogieNo=msg.bogieNo;
										
	 									//return msg.stageName;																			    											
	 								  })
	 								.error(function (msg){
	 									alert("Error Saving Data");
	 								})
	 								  ;
							
							}
	 						return bogieNo;
	 						},
							
							
							list:true,
							create: false,
							edit: false
							},
							//left bogie update and create purpose		
					  bogiePpSideAssetId1: {
						title :'PP Side Bogie No.',
						width: '8%',

						options: bogieNumbers,
						list: false,
						create: true,
						edit: true		
						}, 
					//Non PP SIde Bogie display	
						bogieNppSideAssetId: {
							title :'N-PP side Bogie No.',
							list:true,
							display:function(data){
		 						var bogieNo;
		 						if(data.record.bogieNppSideAssetId!=null)
								{
		 						$.ajax({                    
		 							  url: 'descByBogieId',     
		 							  type: 'post', // performing a POST request
		 							  async: false,
									  
		 							  dataType: 'json',
		 								  data : {
											
		 									 bogieAssetId:data.record.bogieNppSideAssetId
		 								  	  }									                    
		 						})
		 								.done(function( msg ) {
		 									bogieNo=msg.bogieNo;
											
		 									//return msg.stageName;																			    											
		 								  })
		 								.error(function (msg){
		 									alert("Error Saving Data");
		 								})
		 								  ;
								}
								
		 						return bogieNo;
		 						},
							create: false,
							edit: false
							},
					//right wheel update and create purpose
 					bogieNppSideAssetId1: {
 					title :'N-PP Side Bogie No.',
						width: '8%',
 			          options: bogieNumbers,
 						list: false,
						create: true,
 						edit: true		
							},

				exitRemarkFurnishing: {
				   title: 'Remark given by Furnishing',
				   width : '10%',
					type : 'textarea',
					edit : false,
					create: false 
				},
								
				
					receiptDateAtQuality:
					{
					title: 'Coach Receipt Date',
					width: '5%',
					type:'date',
					display:function(data){
						 
						return ((data.record.receiptDateAtQuality!=null) && (data.record.receiptDateAtQuality!="") ) ? moment(data.record.receiptDateAtQuality).format('DD-MM-YYYY') : "";
											}, 
							
					},
					coachNumber: {
						   title: 'Coach No.',
						   width : '10%',
							
							edit : false,
							create: false 
						},
						showerTestingFlag:
							{
							title:'',
							list:false,
							edit:false,
							create:false
							},
							biotankTestingFlag:
								{
								title:'',
								list:false,
								edit:false,
								create:false
								},
							cbcTestingFlag:
								{
								title:'',
								list:false,
								edit:false,
								create:false
								}
                        
			},
			loadingRecords: function(event,data)
			{
				srno=0;
			},
			recordsLoaded: function(event, data) {
	
				 /*  if (prevStage!='START'){
					 
				     $('#FurnishingProductionTableContainer').find('.jtable-toolbar-item.jtable-toolbar-item-add-record').remove();
				  } */
				  
				},
				formCreated: function (event, data) {
					  
				var startDate=(data.record.dispatchDateInQuality).substring(0,10);
				
                    var num = startDate.match(/\d+/g); 
             		var date = new Date(num[0], num[1]-1, num[2]);
				//	 $('[name=expectedExitDate]').datepicker("option","minDate", date)	;	
				//	 $('[name=vendorAllottedDate]').datepicker("option","minDate", date)	;
 				
	
	               	            },
	            recordDeleted: function(event,data)
	    		{
	    			srno=0;
	    			$('#FurnishingProductionTableContainer').jtable('load');
	    		},
	    		
 
					//Validate form when it is being submitted
				formSubmitting: function (event, data) {
			   return data.form.validationEngine('validate');
			             
			            },
			    
				//Dispose validation logic when form is closed
				formClosed: function (event, data) {
			               data.form.validationEngine('hide');
			                data.form.validationEngine('detach');
				},
				recordUpdated:function(event,data)
				{
					srno=0;
					$('#FurnishingProductionTableContainer').jtable('load');
				},
	              
			});
	$('#FurnishingProductionTableContainer').jtable('load');
		});
	
	</script>
	
	<script>
	
	function search(id)
	{
		//alert("am called, id="+id +""+JSON.stringify(shellArray));
		for(var i=0;i<shellArray.length;i++){
			
			if(shellArray[i].assetId==id)
				{
				//alert( shellArray[i].assetNo);
					return shellArray[i].assetNo;
				}
				
			}
		}
	function setMinDate(){
	
		var from = $('#datepickerCompletion').val(); 
		var numbers = from.match(/\d+/g); 
		
		var date = new Date(numbers[2], numbers[1]-1, numbers[0]);
		
		$('#datepickerExit').datepicker('option', 'minDate', date);
	}
	function isNumberKey(el, evt) {
		var spanid=el.id+'_output';
		//alert(spanid);
		 var h = document.getElementById(el.id);
		    var charCode = (evt.which) ? evt.which : event.keyCode;
		    var number = el.value.split('.');
		    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
document.getElementById(spanid).innerHTML='<span style="background: #fee;width: 200px;height: 25px;margin: 15px 0;color: #a33;">Only number and point allowed</span>';
		     
		return false;
		    }
		else
		{
		document.getElementById(spanid).innerHTML="";
		}
		    //just one dot
		    if(number.length>1 && charCode == 46){

		document.getElementById(spanid).innerHTML='<span style="background:#fee;width:200px;height: 25px;margin: 15px 0;color: #a33;">Not a valid number</span>';

		         return false;
		    }
		    //get the carat position
		    var caratPos = getSelectionStart(el);
		    var dotPos = el.value.indexOf(".");
		    if( caratPos > dotPos && dotPos>-1 && (number[1].length > 1)){ //Change 1 to 2 for 3 places of decimal allowed
		        return false;
		    }
		    return true;
		}


		function getSelectionStart(o) {
		if (o.createTextRange) {
		var r = document.selection.createRange().duplicate();
		r.moveEnd('character', o.value.length);
		if (r.text == '') return o.value.length
		return o.value.lastIndexOf(r.text)
		} else return o.selectionStart
		}

	</script>