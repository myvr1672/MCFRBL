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
.ui-autocomplete.ui-front {
            max-height: 200px;
             overflow-y: auto; 
            /* prevent horizontal scrollbar */
/*             overflow-x: hidden; */
            /* add padding to account for vertical scrollbar */
/*             padding-right: 20px; */
         }  
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

.disabled{
border: 1px solid #999999;
background-color: #cccccc;
color:#666666;
 }
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
.t2{
	width: 300px;
}
#fiatbogieDocNo{
	width: 300px;
}
</style>



<body>

<div id="filter">
<form>
<b>Set Bogie Assemble Date</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<i>From Date :</i><input type="text" id="datepickerfrom"/>&nbsp;&nbsp;&nbsp;
<i>To Date   :</i><input type="text" id="datepickerto"/>&nbsp;&nbsp;&nbsp;
<button type="submit" id="LoadRecordsButton">Load records</button>
</form>
</div>
<div id="BogiesetProductionTableContainer"></div>
<div id="bogiestatic" style="border:1px solid black;margin:5px;height:150%;width:200%;display:none;z-index:9;">
<form name="bogiestatictesting">
<h1 align="center"style="font-size:20px;">SELF INSPECTION PROFARMA</h1>
<h2 align="center" style="font-size:15px;">FIAT BOGIE /EOG WITH AIR SPRING</h2> 
<h3 align="center" style="font-size:12px;">SIP Bogie Static Testing</h3>
<table border="1" style="width:100%;">
<tr>
<th style="width:20%;text-align:center">Doc No</th><td><input type="text" name="docNo" id="fiatbogieDocNo" style="border:none;width:100%;" readonly></td>
<th style="width:20%;text-align:center">Date</th><td><input type="text" name="dateOfTesting" id="dateOfTesting" class='validate[required]' style="border:none;"></td>
</tr>
</table>
<br>

<table border="1" style="width:100%;">
<tr>
<th style="width:20%;text-align:center">BOGIE TYPE & NO.</th>
<th style="width:50%;text-align:center">AC-2T,AC-3T/EOG WITH (120kN AIR SPRING)</th>
<td><input type="text" placeholder="bogietype" name="bogieType" id="fiatbogieType" style="width:30%;border:none;">
<input type="text" placeholder="bogieno" name="bogieno" id="fiatbogieNumber" style="width:100%;border:none;"></td>
</tr>
</table>
<br>

<table style="width:150px;">
<tr>
<th>Shift: </th><td><select name="shiftOfTesting" id="fiatbogieSipShift" class='validate[required]'>
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

<table style="width:100%;border:none;"> 
<tr><th>1. Applicability:</th></tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;1.1 Applicable Drawing No.</td>
<td><input type="text" placeholder="Applicable Drawing No." name="drawingno" id="fiatbogiedrawingNo" class="validate[required]" style="width:300px;margin:2px;" readonly></td>
</tr>
<tr>
<td>&nbsp;&nbsp;&nbsp;1.2 Applicable W.I. No. (If Any)</td>
<td><input type="text" placeholder="Applicable W.I. No." name="wino" id="fiatbogiewino" class="validate[required]" style="width:300px;margin:2px;"></td>
</tr>
</table>

<br>

<table style="border:none;width:100%;"> 
<tr><th>2. Data of Traceability:</th></tr>
<tr>
<td style="width:30%;">&nbsp;&nbsp;&nbsp;2.1 FRAME NO & MAKE :</td>
<td colspan="2" style="width:35%;"><input type="text" placeholder="FRAME MAKE" name="frameMake" id="frameMake" style="width:100%;"></td>
<td colspan="2" style="width:35%;"><input type="text" placeholder="FRAME NO" name="frameno" id="frameno" style="width:100%;"></td>
</tr>
<tr>
<td style="width:30%;">&nbsp;&nbsp;&nbsp;2.2 Type of Wheel</td>
<td colspan="2" style="width:35%;"><input type="text" placeholder="Type of Wheel" name="typeofwheel" style="width:100%;" id="typeofwheel" readonly></td>
</tr>
<tr>
<td style="width:30%;">&nbsp;&nbsp;&nbsp;2.3 Wheel Axle No.(PA/NPA)</td>
<td colspan="2" style="width:35%;"><input type="text" placeholder="Wheel Axle No.(PA)" name="wheelaxlenopa" id="wheelaxlenopa" style="width:100%;"></td>
<td colspan="2" style="width:35%;"><input type="text" placeholder="Wheel Axle No.(NPA)" name="wheelaxlenonpa" id="wheelaxlenonpa" style="width:100%;"></td>
</tr>
<tr>
<td style="width:30%;">&nbsp;&nbsp;&nbsp;2.4 Brake Cylinder No & Make</td>
<td style="width:17.5%;"><input type="text" placeholder="Brake Cylinder 1" name="brakecylinderno1" id="brakecylinderno1" class="validate[required]" style="width:100%;"></td>
<td style="width:17.5%;"><input type="text" placeholder="Brake Cylinder 2" name="brakecylinderno2" id="brakecylinderno2" class="validate[required]" style="width:100%;"></td>
<td style="width:17.5%;"><input type="text" placeholder="Brake Cylinder 3" name="brakecylinderno3" id="brakecylinderno3" class="validate[required]" style="width:100%;"></td>
<td style="width:17.5%;"><input type="text" placeholder="Brake Cylinder 4" name="brakecylinderno4" id="brakecylinderno4" class="validate[required]" style="width:100%;"></td>
</tr>
<tr>
<td style="width:30%;">&nbsp;&nbsp;&nbsp;2.5 V.S.A(AT PRIMARY SUSP)No & Make</td>
<td colspan="2" style="width:35%;"><input type="text" placeholder="V.S.A(AT PRIMARY SUSP) Make" name="vsaprimemake" id="vsaprimemake" style="width:100%;"></td>
<td colspan="2" style="width:35%;"><input type="text" placeholder="V.S.A(AT PRIMARY SUSP) NO" name="vsaprimeno" id="vsaprimeno" style="width:100%;"></td>
</tr>
<tr>
<td style="width:30%;">&nbsp;&nbsp;&nbsp;2.6 V.S.A(AT SECONDARY SUP) No & Make</td>
<td colspan="2" style="width:35%;"><input type="text" placeholder="V.S.A(AT SECONDARY SUP) Make" name="vsasecmake" id="vsasecmake" style="width:100%;"></td>
<td colspan="2" style="width:35%;"><input type="text" placeholder="V.S.A(AT SECONDARY SUP) NO" name="vsasecno" id="vsasecno" style="width:100%;"></td>
</tr>
<tr>
<td style="width:30%;">&nbsp;&nbsp;&nbsp;2.7 LATERAL SHOCK ABSORBER No & Make</td>
<td colspan="2" style="width:35%;"><input type="text" placeholder="LATERAL SHOCK ABSORBER Make" name="lateralshockmake" id="lateralshockmake" style="width:100%;"></td>
<td colspan="2" style="width:35%;"><input type="text"placeholder="LATERAL SHOCK ABSORBER NO" name="lateralshockno" id="lateralshockno" style="width:100%;"></td>
</tr>
<tr>
<td style="width:30%;">&nbsp;&nbsp;&nbsp;2.8 Bolster No & Make</td>
<td colspan="2" style="width:35%;"><input type="text" placeholder="Bolster Make" name="bolstermake" id="bolstermake" style="width:100%;"></td>
<td colspan="2" style="width:35%;"><input type="text" placeholder="Bolster NO" name="bolsterno" id="bolsterno" style="width:100%;"></td>
</tr>
<tr>
<td style="width:30%;">&nbsp;&nbsp;&nbsp;2.9 Secondary air spring No & Make</td>
<td colspan="2" style="width:35%;"><input type="text" placeholder="Secondary air spring no1" name="airspringmakeno1" id="airspringmakeno1" style="width:100%;;"></td>
<td colspan="2" style="width:35%;"><input type="text" placeholder="Secondary air spring no2" name="airspringmakeno2" id="airspringmakeno2" style="width:100%;"></td></tr>
</table>

<br>
<br>

<table border=1 style="width:100%;">
<tr> 
<td style="text-align:center;" rowspan="3">TESTING LOAD IN TONNES</td>
<td style="width:50%;text-align:center;" colspan="5">UNDER TEST LOAD AT BOGIE SHOP</td>
<td style="width:25%;text-align:center;" colspan="2">FOR REFERENCE ONLY</td>
</tr>
<tr>
<td style="width:37.5%;text-align:center;" colspan="4">RAIL LEVEL TO THE CONTROL ARM BRACKET 430+-4 MM TARE  454+-4 MM  GROSS</td>
<td style="width:12.5%;text-align:center;">DIFFERENCE IN ALL FOUR SIDE<=3 MM</td>
<td style="width:25%;text-align:center;" colspan="2">AVERAGE HEIGHT FROM RAIL LEVEL TO PIN BRACKET TOP 930+6/-2 MM TARE  924+6/-2 MM GROSS</td>
</tr>
<tr>
<td style="width:12.5%;text-align:center;">Z11</td>
<td style="width:12.5%;text-align:center;">Z31</td>
<td style="width:12.5%;text-align:center;">Z41</td>
<td style="width:12.5%;text-align:center;">Z21</td>
<td style="width:12.5%;text-align:center;">X</td>
<td style="width:12.5%;text-align:center;">(Z12+Z22)/2</td>
<td style="width:12.5%;text-align:center;">(Z32+Z42)/2</td>
</tr>
<tr>
<td style="text-align:center;">TARE 16.02</td>
<td style="width:12.5%;"><input type="text" name="tarezoneone" id="tarezoneone" class='validate[custom[integer]]' style="width:100%;"></td>
<td style="width:12.5%;"><input type="text" name="tarezthreeone" id="tarezthreeone" class='validate[custom[integer]]' style="width:100%;"></td>
<td style="width:12.5%;"><input type="text" name="tarezfourone" id="tarezfourone" class='validate[custom[integer]]' style="width:100%;"></td>
<td style="width:12.5%;"><input type="text" name="tareztwoone" id="tareztwoone" class='validate[custom[integer]]' style="width:100%;"></td>
<td style="width:12.5%;"><input type="text" name="tarex" id="tarex" class='validate[custom[integer]]' style="width:100%;"></td>
<td style="width:12.5%;"><input type="text" name="tareavgheightone" id="tareavgheightone" class='validate[custom[number]]' style="width:100%;"></td>
<td style="width:12.5%;"><input type="text" name="tareavgheighttwo" id="tareavgheighttwo" class='validate[custom[number]]' style="width:100%;"></td>
</tr>
<tr>
<td style="text-align:center;">GROSS 19.90</td>
<td style="width:12.5%;"><input type="text" name="grosszoneone" id="grosszoneone" class='validate[custom[integer]]' style="width:100%;"></td>
<td style="width:12.5%;"><input type="text" name="grosszthreeone" id="grosszthreeone" class='validate[custom[integer]]' style="width:100%;"></td>
<td style="width:12.5%;"><input type="text" name="grosszfourone" id="grosszfourone" class='validate[custom[integer]]' style="width:100%;"></td>
<td style="width:12.5%;"><input type="text" name="grossztwoone" id="grossztwoone" class='validate[custom[integer]]' style="width:100%;"></td>
<td style="width:12.5%;"><input type="text" name="grossx" id="grossx" class='validate[custom[integer]]' style="width:100%;"></td>
<td style="width:12.5%;"><input type="text" name="grossavgheightone" id="grossavgheightone" class='validate[custom[number]]' style="width:100%;"></td>
<td style="width:12.5%;"><input type="text" name="grossavgheighttwo" id="grossavgheighttwo" class='validate[custom[number]]' style="width:100%;"></td>
</tr>
</table>

<br>
<br>

<table border=1 style="width:100%;">
<tr> 
<td style="text-align:center;" rowspan="3">TESTING LOAD IN TONNES</td>
<td style="text-align:center;width:85.8%;" colspan="6">THESE SHALL BE ENSURED AT FURNISHING SHOP AFTER GIVING AIR CONNECTION TO THE AIR SPRING AND CONTROL SYSTEM</td>
</tr>
<tr>
<td style="text-align:center;width:28.6%;" colspan="2">LONGITUDINAL BUMP STOP GAP 08+5/-2 TARE</td>
<td style="text-align:center;width:28.6%;" colspan="2">LATERAL BUMP STOP GAP 25+-5 TARE</td>
<td style="text-align:center;width:28.6%;" colspan="2">SECONDARY SPRING HEIGHT 292+0/-5</td>
</tr>
<tr>
<td style="text-align:center;width:14.3%;">X14</td>
<td style="text-align:center;width:14.3%;">X24</td>
<td style="text-align:center;width:14.3%;">Y13</td>
<td style="text-align:center;width:14.3%;">Y33</td>
<td style="text-align:center;width:14.3%;">A SIDE</td>
<td style="text-align:center;width:14.3%;">B SIDE</td>
</tr>
<tr>
<td style="text-align:center;">TARE 16.02</td>
<td style="width:14.3%;"><input type="text" name="tarelongxonefour" id="tarelongxonefour" class='validate[custom[integer]]' style="width:100%;"></td>
<td style="width:14.3%;"><input type="text" name="tarelongxtwofour" id="tarelongxtwofour" class='validate[custom[integer]]' style="width:100%;"></td>
<td style="width:14.3%;"><input type="text" name="tarelatyonethree" id="tarelatyonethree" class='validate[custom[integer]]' style="width:100%;"></td>
<td style="width:14.3%;"><input type="text" name="tarelatythreethree" id="tarelatythreethree" class='validate[custom[integer]]' style="width:100%;"></td>
<td rowspan="2" style="width:14.3%;"><input type="text" name="tareaside" id="tareaside" class='validate[custom[integer]]' style="width:100%;"></td>
<td rowspan="2" style="width:14.3%;"><input type="text" name="tarebside" id="tarebside" class='validate[custom[integer]]' style="width:100%;"></td>
</tr>
<tr>
<td style="text-align:center;">GROSS 19.90</td>
<td style="width:14.3%;"><input type="text" name="grosslongxonefour" id="grosslongxonefour" class='validate[custom[integer]]' style="width:100%;"></td>
<td style="width:14.3%;"><input type="text" name="grosslongxtwofour" id="grosslongxtwofour" class='validate[custom[integer]]' style="width:100%;"></td>
<td style="width:14.3%;"><input type="text" name="grosslatyonethree" id="grosslatyonethree" class='validate[custom[integer]]' style="width:100%;"></td>
<td style="width:14.3%;"><input type="text" name="grosslatythreethree" id="grosslatythreethree" class='validate[custom[integer]]' style="width:100%;"></td>
</tr>
</table>

<br>
<br>

<table>
<tr>
<th>Testing Status</th>
<td><input type="radio" name="checkingStatus"  id="checkingStatus" value="conforming"> Confirming
<input type="radio" name="checkingStatus" id="checkingStatus" value="nonconforming"> Non Conforming
</td>
</tr>
</table>
</form>
</div>




<div id="bogieFinal" style="height:150%;margin:5px;border:1px solid black;width:200%;display:none;z-index:9;">
<form name="bogieFinalSip">
<h4 style="text-align:center;">BOGIE STAGE</h4>
<table style="width:100%;">
<tr>
<td>
FORM NO.
</td>
<td style="width:30%;">
<input type=text style="width:100%;" name='bogieFinalFormNo' id='bogieFinalFormNo' placeholder="Form No">
</td>
</tr>
<tr>
<td>
DATE
</td>
<td style="width:30%;"><input type="text"  style="width:100%;" name='bogieFinalDate' id='bogieFinalDate' placeholder="Date">
</td>
</tr>
<tr>
<td>
SHIFT
</td>
<td style="width:30%;">
	<select name='bogieFinalShift' id='bogieFinalShift' class="validate[required]">
		<option value="">Select</option>
		<option value="general">General</option>
		<option value="shift-I">Shift-I</option>
		<option value="Shift-II">Shift-II</option>
		<option value="Shift-III">Shift-III</option>
	</select>
</td>
</tr>
<tr>
<td>
BOGIE TYPE
</td>
<td style="width:30%;"><select name='bogieFinalBogieType' id='bogieFinalBogieType'>
<option value="">Select</option>
<option value="air_spring">AIR SPRING</option>
<option value="coil_spring">COIL SPRING</option>
</select>
</td>
<td>Bogie No.</td>
<td style="width:30%;"><input type="text" style="width:100%;" name='bogieFinalBogieNo' id='bogieFinalBogieNo' placeholder="Bogie No">
</td>
</tr>
</table>
<br>
<b>1. Applicability and Observations</b>
<br>
<br>
<table>
<tr>
<td>
&nbsp;&nbsp;&nbsp;&nbsp;1.1  Drawing No:
</td>
<td>
<input type=text name='bogieFinalDrawingNo' id='bogieFinalDrawingNo' placeholder="Drawing No">
</td>
<td>
</td>
<td>
</td>
</tr>
<tr>
<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bogie Frame No:
</td>
<td>
<input type=text name='bogieFinalBogieFrameNo' id='bogieFinalBogieFrameNo' placeholder="Bogie Frame No">
</td>
<td>
</td>
<td>
</td>
</tr>
<tr>
<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bolster No:
</td>
<td>
<input type=text name='bogieFinalBolsterNo' id='bogieFinalBolsterNo' placeholder="Bolster No">
</td>
<td>
</td>
<td>
</td>
</tr>
<tr>
<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Axle Nos:&nbsp;&nbsp;&nbsp;PP
</td>
<td>
<input type=text name='bogieFinalPPAxleNo' id='bogieFinalPPAxleNo' readonly/>
</td>
<td>
NPP:
</td>
<td>
<input type=text name='bogieFinalNPPAxleNo' id='bogieFinalNPPAxleNo' readonly/>
</td>
</tr>
<tr>
<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Brake Cylinder No 1:
</td>
<td>
<input type=text name='bogieFinalBrakeCylinder1' id='bogieFinalBrakeCylinder1' placeholder="Brake Cylinder No 1">
</td>
<td>
Brake Cylinder No 2:
</td>
<td>
<input type=text name='bogieFinalBrakeCylinder2' id='bogieFinalBrakeCylinder2' placeholder="Brake Cylinder No 2">
</td>
</tr>
<tr>
<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Brake Caliper No 1:
</td>
<td>
<input type=text name='bogieFinalBrakeCaliper1' id='bogieFinalBrakeCaliper1' placeholder="Brake Caliper No 1">
</td>
<td>
Brake Caliper No 2:
</td>
<td>
<input type=text name='bogieFinalBrakeCaliper2' id='bogieFinalBrakeCaliper2' placeholder="Brake Caliper No 2">
</td>
</tr>
<tr>
<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Brake Cylinder No 3:
</td>
<td>
<input type=text name='bogieFinalBrakeCylinder3' id='bogieFinalBrakeCylinder3' placeholder="Brake Cylinder No 3">
</td>
<td>
Brake Cylinder No 4:
</td>
<td>
<input type=text name='bogieFinalBrakeCylinder4' id='bogieFinalBrakeCylinder4' placeholder="Brake Cylinder No 4">
</td>
</tr>
<tr>
<td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Brake Caliper No 3:
</td>
<td>
<input type=text name='bogieFinalBrakeCaliper3' id='bogieFinalBrakeCaliper3' placeholder="Brake Caliper No 3">
</td>
<td>
Brake Caliper No 4:
</td>
<td>
<input type=text name='bogieFinalBrakeCaliper4' id='bogieFinalBrakeCaliper4' placeholder="Brake Caliper No 4">
</td>
</tr>
</table>
<br>
<br>
&nbsp;1.2 Colour coding of primary springs
<br>
<br>
<table border=1 cellspacing=0>
<tr>
<td align=center>
<b>S.No</b>
</td>
<td colspan=2 align=center>
<b>Parameter</b>
</td>
<td align=center>
<b>Colour coding Specified</b>
</td>
<td align=center>
<b>Actual</b>
</td>
</tr>
<tr>
<td rowspan=2>
1.
</td>
<td rowspan=2>
Primary suspension spring color coding
</td>
<td>
Inner
</td>
<td>
<b>Green-</b>
<br>LWCBACA,LWSCZAC,LWFAC,LFCWAC
<br><b>Yellow-</b>L3T,L2T,LWLRRM(side 1 & side 2)
<br><b>Black-</b>LSCN(A),LGS,LS-5,LWSCZ,SLRD
</td>
<td>
<select name='bogieFinalColourInnerActual' id='bogieFinalColourInnerActual' style="width:97%;">
<option value="">Select</option>
<option value="BLACK">BLACK</option>
<option value="GREEN">GREEN</option>
<option value="YELLOW">YELLOW</option>
</select>
</td>
</tr>
<tr>
<td>
Outer
</td>
<td>
<b>Green-</b>
<br>LWCBACA,L2T,L3T,LWSCZAC,LWFAC,LFCWAC
<br><b>Yellow-</b>LGS,LS-5,LWSCZ,LSCN(A),SLRD
<br><b>Black-</b>LWLRRM(side 1 & side 2)
</td>
<td>
<select name='bogieFinalColourOuterActual' id='bogieFinalColourOuterActual'  style="width:97%;">
<option value="">Select</option>
<option value="BLACK">BLACK</option>
<option value="GREEN">GREEN</option>
<option value="YELLOW">YELLOW</option>
</select>
</td>
</tr>
</table>
<br>
&nbsp;1.3
<br>
<br>
<table border="1" cellspacing=0 width=100% >
<tr>
<td align=center>
<b>S.No.</b>
</td>
<td colspan=3 align=center>
<b>Parameter</b>
</td>
<td align=center>
<b>Drawing no.</b >
</td>
<td align=center width=10%>
<b>Torque value specified in Nm</b>
</td>
<td align=center width=20%>
<b>Status</b>
</td>
<td align=center>
<b>Actual</b>
</td>
<td align=center >
<b>Attended by(Technician)</b>
</td>
</tr>
<tr>
<td align=center>
1
</td>
<td colspan=3>
Fitment of Anti roll bar assembly with screws,spring washer & security plate  (Screw size - M 16 x 170)
</td>
<td align=center>
1267422
</td>
<td align=center>
170
</td>
<td width=20%>
<input type=radio name='fitmentAntiRollBarStatus' id='fitmentAntiRollBarStatus' value="OK">OK
<input type=radio name='fitmentAntiRollBarStatus' id='fitmentAntiRollBarStatus' value="NOT OK">NOT OK<br>
</td>
<td>
<input type="text" name='fitmentAntiRollBarActual' id='fitmentAntiRollBarActual' placeholder="Actual" class='validate[custom[integer]]'>
</td>
<td>
<input type="text" name='fitmentAntiRollBarAttendedBy' id='fitmentAntiRollBarAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
2
</td>
<td colspan=3>
 Fitment of Traction Lever joint with  Disc & nut (Screw size- M 24 x 150)
</td>
<td align=center>
 1267510
</td>
<td align=center>
590
</td>
<td width=20%>
<input type=radio name='fitmentTractionLeverJointStatus' id='fitmentTractionLeverJointStatus' value="OK">OK
<input type=radio name='fitmentTractionLeverJointStatus' id='fitmentTractionLeverJointStatus' value="NOT OK">NOT OK<br>
</td>
<td>
<input type="text" name='fitmentTractionLeverJointActual' id='fitmentTractionLeverJointActual' placeholder="Actual" class='validate[custom[integer]]'>
</td>
<td>
<input type="text" name='fitmentTractionLeverJointAttendedBy' id='fitmentTractionLeverJointAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
3
</td>
<td colspan=3>
 Fitment of Lateral damper bkt. on cross section with  Disc & screws (Screw size- M 16 x 100)
</td>
<td align=center>
        LW05116
</td>
<td align=center>
      170
</td>
<td width=20%>
<input type=radio name='fitmentLateralDamperBktStatus' id='fitmentLateralDamperBktStatus' value="OK">OK
<input type=radio name='fitmentLateralDamperBktStatus' id='fitmentLateralDamperBktStatus' value="NOT OK">NOT OK<br>
</td>
<td>
<input type="text" name='fitmentLateralDamperBktActual' id='fitmentLateralDamperBktActual' placeholder="Actual" class='validate[custom[integer]]'>
</td>
<td>
<input type="text" name='fitmentLateralDamperBktAttendedBy' id='fitmentLateralDamperBktAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
4
</td>
<td colspan=3>
 Fitment of Cross section with distance bush,   Disc & screws (Screw size- M 20 x 120)
</td>
<td align=center>
        1267405
</td>
<td align=center>
        340
</td>
<td width=20%>
<input type=radio name='fitmentCrossSectionStatus' id='fitmentCrossSectionStatus' value="OK">OK
<input type=radio name='fitmentCrossSectionStatus' id='fitmentCrossSectionStatus' value="NOT OK">NOT OK<br>
</td>
<td>
<input type="text" name='fitmentCrossSectionActual' id='fitmentCrossSectionActual' placeholder="Actual" class='validate[custom[integer]]'>
</td>
<td>
<input type="text" name='fitmentCrossSectionAttendedBy' id='fitmentCrossSectionAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
5
</td>
<td colspan=3>
  Fitment of Lateral bump with shim, punch washer, screw & nut (Screw size- M 16 x 65)
</td>
<td align=center>
        LW05104
</td>
<td align=center>
        170
</td>
<td width=20%>
<input type=radio name='fitmentLateralBumpStopStatus' id='fitmentLateralBumpStopStatus' value="OK">OK
<input type=radio name='fitmentLateralBumpStopStatus' id='fitmentLateralBumpStopStatus' value="NOT OK">NOT OK<br>
</td>
<td>
<input type="text" name='fitmentLateralBumpStopActual' id='fitmentLateralBumpStopActual' placeholder="Actual" class='validate[custom[integer]]'>
</td>
<td>
<input type="text" name='fitmentLateralBumpStopAttendedBy' id='fitmentLateralBumpStopAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
6
</td>
<td colspan=3>
  Fitment of Brake  cyliders/calliper with disc, screw & nut (Screw size- M 16 x 60)
</td>
<td align=center>
        C76300/A
</td>
<td align=center>
        170
</td>
<td width=20%>
<input type=radio name='fitmentBrakeCylinderStatus' id='fitmentBrakeCylinderStatus' value="OK">OK
<input type=radio name='fitmentBrakeCylinderStatus' id='fitmentBrakeCylinderStatus' value="NOT OK">NOT OK<br>
</td>
<td>
<input type="text" name='fitmentBrakeCylinderActual' id='fitmentBrakeCylinderActual' placeholder="Actual" class='validate[custom[integer]]'>
</td>
<td>
<input type="text" name='fitmentBrakeCylinderAttendedBy' id='fitmentBrakeCylinderAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
7
</td>
<td colspan=3>
  Fitment Longitudinal stop assembly (Screw size- M 12 x 45)
</td>
<td align=center>
        1267549
</td>
<td align=center>
        70
</td>
<td width=20%>
<input type=radio name='fitmentLongitudinalStopStatus' id='fitmentLongitudinalStopStatus' value="OK">OK
<input type=radio name='fitmentLongitudinalStopStatus' id='fitmentLongitudinalStopStatus' value="NOT OK">NOT OK<br>
</td>
<td>
<input type="text" name='fitmentLongitudinalStopActual' id='fitmentLongitudinalStopActual' placeholder="Actual" class='validate[custom[integer]]'>
</td>
<td>
<input type="text" name='fitmentLongitudinalStopAttendedBy' id='fitmentLongitudinalStopAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
8
</td>
<td colspan=3>
 Fitment of roll link bkt.(Screw size- M 24 x 100)
</td>
<td align=center>
        1267513
</td>
<td align=center>
        590
</td>
<td width=20%>
<input type=radio name='fitmentRollLinkBktStatus' id='fitmentRollLinkBktStatus' value="OK">OK
<input type=radio name='fitmentRollLinkBktStatus' id='fitmentRollLinkBktStatus' value="NOT OK">NOT OK<br>
</td>
<td>
<input type="text" name='fitmentRollLinkBktActual' id='fitmentRollLinkBktActual' placeholder="Actual" class='validate[custom[integer]]'>
</td>
<td>
<input type="text" name='fitmentRollLinkBktAttendedBy' id='fitmentRollLinkBktAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
9
</td>
<td colspan=3>
 Fitment on Control Arm top with bottom with disc,screw&nut(Screw size- M 16 x 60)
</td>
<td align=center>
        1277122/1267716
</td>
<td align=center>
        170
</td>
<td width=20%>
<input type=radio name='fitmentControlArmTopStatus' id='fitmentControlArmTopStatus' value="OK">OK
<input type=radio name='fitmentControlArmTopStatus' id='fitmentControlArmTopStatus' value="NOT OK">NOT OK<br>
</td>
<td>
<input type="text" name='fitmentControlArmTopActual' id='fitmentControlArmTopActual' placeholder="Actual" class='validate[custom[integer]]'>
</td>
<td>
<input type="text" name='fitmentControlArmTopAttendedBy' id='fitmentControlArmTopAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
10
</td>
<td colspan=3>
 Fitment of Axle end cover  with control arm with disc,screw &nut(Screw size- M 16 x 45)
</td>
<td align=center>
        1902713/1902714
</td>
<td align=center>
        170
</td>
<td width=20%>
<input type=radio name='fitmentAxleEndCoverStatus' id='fitmentAxleEndCoverStatus' value="OK">OK
<input type=radio name='fitmentAxleEndCoverStatus' id='fitmentAxleEndCoverStatus' value="NOT OK">NOT OK
</td>
<td>
<input type="text" name='fitmentAxleEndCoverActual' id='fitmentAxleEndCoverActual' placeholder="Actual" class='validate[custom[integer]]'>
</td>
<td>
<input type="text" name='fitmentAxleEndCoverAttendedBy' id='fitmentAxleEndCoverAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
11
</td>
<td colspan=3>
 Fitment of primary bump stop with centering disc & nut (nut size- M 12)
</td>
<td align=center>
        1227081
</td>
<td align=center>
        70
</td>
<td width=20%>
<input type=radio name='fitmentPrimaryBumpStopStatus' id='fitmentPrimaryBumpStopStatus' value="OK">OK
<input type=radio name='fitmentPrimaryBumpStopStatus' id='fitmentPrimaryBumpStopStatus' value="NOT OK">NOT OK<br>
</td>
<td>
<input type="text" name='fitmentPrimaryBumpStopActual' id='fitmentPrimaryBumpStopActual' placeholder="Actual" class='validate[custom[integer]]'>
</td>
<td>
<input type="text" name='fitmentPrimaryBumpStopAttendedBy' id='fitmentPrimaryBumpStopAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
12
</td>
<td colspan=3>
 Fitment of Control Arm  with control  arm Bkt.(Bogie frame)with sealing o-ring,locking plate,screw &nut (Screw size- M 20 x 100) 
</td>
<td align=center>
 LW. 03247/LW03246/<br>1227331
</td>
<td align=center>
        265
</td>
<td width=20%>
<input type=radio name='fitmentControlArmBktStatus' id='fitmentControlArmBktStatus' value="OK">OK
<input type=radio name='fitmentControlArmBktStatus' id='fitmentControlArmBktStatus' value="NOT OK">NOT OK<br>
</td>
<td>
<input type="text" name='fitmentControlArmBktActual' id='fitmentControlArmBktActual' placeholder="Actual" class='validate[custom[integer]]'>
</td>
<td>
<input type="text" name='fitmentControlArmBktAttendedBy' id='fitmentControlArmBktAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center rowspan=3>
13
</td>
<td rowspan=3 >
Fitment of Primary Shock absorbers
</td>
<td colspan=2>
 LWACCN(A),<br>LWSCZ,LS-5
</td>
<td align=center rowspan=3>
LW05105 Alt-a
</td>
<td align=center rowspan=3>
       100
</td>
<td rowspan=3 width=20%>
<input type=radio name='fitmentPrimaryShockAbsorberStatus' id='fitmentPrimaryShockAbsorberStatus' value="OK">OK
<input type=radio name='fitmentPrimaryShockAbsorberStatus' id='fitmentPrimaryShockAbsorberStatus' value="NOT OK">NOT OK<br>
</td>
<td rowspan=3 class="t1">
<input type="text" name='fitmentPrimaryShockAbsorberActual' id='fitmentPrimaryShockAbsorberActual' placeholder="Actual" class='validate[custom[integer]]'>
</td>
<td rowspan=3>
<input type="text" name='fitmentPrimaryShockAbsorberAttendedBy' id='fitmentPrimaryShockAbsorberAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td colspan=2>
LWACCW(A),<br>LWLRRM(side 1 & side 2),<br>LWSCZ,SLRD<br>,LWFAC
</td>
</tr>
<tr>
<td colspan=2>
LSCN(A),<br>LFCWAC,<br>LWCBAC(A)
</td>
</tr>
<tr>
<td align=center>
14
</td>
<td colspan=3>
  Fitment of  traction centre with pivot pin with silent block,disc,safety plate,screw &nut (Screw size- M 16 x 70) 
</td>
<td align=center>
        1267507
</td>
<td align=center>
        170
</td>
<td width=20%>
<input type=radio name='fitmentTractionCentreStatus' id='fitmentTractionCentreStatus' value="OK">OK
<input type=radio name='fitmentTractionCentreStatus' id='fitmentTractionCentreStatus' value="NOT OK">NOT OK<br>
</td>
<td class="t1">
<input type="text" name='fitmentTractionCentreActual' id='fitmentTractionCentreActual' placeholder="Actual" class='validate[custom[integer]]'>
</td>
<td >
<input type="text" name='fitmentTractionCentreAttendedBy' id='fitmentTractionCentreAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
15
</td>
<td colspan=3>
  Fitment of Lateral damper with Disc,nut & screws(Screw size-M 12x55)
</td>
<td align=center>
        LW05122
</td>
<td align=center>
        70
</td>
<td width=20%>
<input type=radio name='fitmentLateralDamperStatus' id='fitmentLateralDamperStatus' value="OK">OK
<input type=radio name='fitmentLateralDamperStatus' id='fitmentLateralDamperStatus' value="NOT OK">NOT OK<br>
</td>
<td>
<input type="text" name='fitmentLateralDamperActual' id='fitmentLateralDamperActual' placeholder="Actual" class='validate[custom[integer]]'>
</td>
<td>
<input type="text" name='fitmentLateralDamperAttendedBy' id='fitmentLateralDamperAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center rowspan=2>
16
</td>
<td colspan=2 rowspan=2>
 Fitment of secondary <br>vertical dampers with <br>Disc, screws&nut<br>(Screw size-M 12x 70)
</td>
<td align=center>
AC
</td>
<td align=center>
        LW05101 Alt-a
</td>
<td align=center>
        70
</td>
<td rowspan=2 width=20%>
<input type=radio name='fitmentSecondaryVerticalDamperACStatus' id='fitmentSecondaryVerticalDamperACStatus' value="OK">OK
<input type=radio name='fitmentSecondaryVerticalDamperACStatus' id='fitmentSecondaryVerticalDamperACStatus' value="NOT OK">NOT OK<br>
</td>
<td rowspan=2 class="t1">
<input type="text" name='fitmentSecondaryVerticalDamperACActual' id='fitmentSecondaryVerticalDamperACActual' placeholder="Actual" class='validate[custom[integer]]'>
</td>
<td rowspan=2>
<input type="text" name='fitmentSecondaryVerticalDamperACAttendedBy' id='fitmentSecondaryVerticalDamperACAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
NAC
</td>
<td align=center>
LG05102 Alt-a
</td>
<td align=center>
70
</td>

</tr>
<tr>
<td align=center>
17
</td>
<td colspan=3>
 Fitment of Locking Plate on Brake control arm assembly
</td>
<td align=center>
--
</td>
<td align=center colspan=2>
Fitted
</td>

<td>
<input type="text" name='fitmentLockingPlateActual' id='fitmentLockingPlateActual' placeholder="Actual">
</td>
<td>
<input type="text" name='fitmentLockingPlateAttendedBy' id='fitmentLockingPlateAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
18
</td>
<td colspan=3>
 No. Plate of Shock Absorber should be in front
</td>
<td align=center>
--
</td>
<td align=center colspan=2>
--
</td>

<td>
<input type="text" name='PlateShockAbsorberActual' id='PlateShockAbsorberActual' placeholder="Actual">
</td>
<td>
<input type="text" name='PlateShockAbsorberAttendedBy' id='PlateShockAbsorberAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
19
</td>
<td colspan=3>
Checking of pipes for any leakage(check visually)
</td>
<td align=center>
--
</td>
<td align=center colspan=2>
--
</td>

<td>
<input type="text" name='CheckingOfPipeActual' id='CheckingOfPipeActual' placeholder="Actual">
</td>
<td>
<input type="text" name='CheckingOfPipeAttendedBy' id='CheckingOfPipeAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
20
</td>
<td colspan=3>
 All cotter should be splitted  properly
</td>
<td align=center>
--
</td>
<td align=center colspan=2>
--
</td>

<td>
<input type="text" name='CotterSplitedActual' id='CotterSplitedActual' placeholder="Actual">
</td>
<td>
<input type="text" name='CotterSplitedAttendedBy' id='CotterSplitedAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
21
</td>
<td colspan=3>
All Nut,Bolts & Screws should be properly tightened
</td>
<td align=center>
--
</td>
<td align=center colspan=2>
--
</td>

<td>
<input type="text" name='NutBoltScrewTightenedActual' id='NutBoltScrewTightenedActual' placeholder="Actual">
</td>
<td>
<input type="text" name='NutBoltScrewTightenedAttendedBy' id='NutBoltScrewTightenedAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
22
</td>
<td colspan=3>
Welding /fitment of Bogie No.,Plate
</td>
<td align=center>
--
</td>
<td align=center colspan=2>
--
</td>

<td>
<input type="text" name='WeldingBogieNoActual' id='WeldingBogieNoActual' placeholder="Actual">
</td>
<td>
<input type="text" name='WeldingBogieNoAttendedBy' id='WeldingBogieNoAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
23
</td>
<td colspan=3>
Painting of complete Bogie
</td>
<td align=center>
--
</td>
<td align=center colspan=2>
--
</td>

<td>
<input type="text" name='PaintingCompleteBogieActual' id='PaintingCompleteBogieActual' placeholder="Actual">
</td>
<td>
<input type="text" name='PaintingCompleteBogieAttendedBy' id='PaintingCompleteBogieAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
24
</td>
<td colspan=3>
 Fitment of phonic wheel with screw with applying thread sealant.(Screw size- M 8 x 35/22)
</td>
<td align=center>
        V 12014
</td>
<td align=center colspan=2>
--
</td>

<td>
<input type="text" name='FitmentPhonicWheelActual' id='FitmentPhonicWheelActual' placeholder="Actual" class='validate[custom[integer]]'>
</td>
<td>
<input type="text" name='FitmentPhonicWheelAttendedBy' id='FitmentPhonicWheelAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
25
</td>
<td colspan=3>
 Fitment of Air pipes of bolster with clamps and screws etc.
</td>
<td align=center>
        LW 36189
</td>
<td align=center colspan=2>
--
</td>

<td>
<input type="text" name='FitmentBolsterAirPipesActual' id='FitmentBolsterAirPipesActual' placeholder="Actual">
</td>
<td>
<input type="text" name='FitmentBolsterAirPipesAttendedBy' id='FitmentBolsterAirPipesAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
26
</td>
<td colspan=3>
 Fitment of Air pipes of brake cylinder with clamps and screws etc.
</td>
<td align=center>
        LW36004
</td>
<td align=center colspan=2>
--
</td>

<td>
<input type="text" name='FitmentBrakeCylinderAirPipesActual' id='FitmentBrakeCylinderAirPipesActual' placeholder="Actual">
</td>
<td>
<input type="text" name='FitmentBrakeCylinderAirPipesAttendedBy' id='FitmentBrakeCylinderAirPipesAttendedBy' placeholder="Attended By">
</td>
</tr>
<tr>
<td align=center>
27
</td>
<td colspan=3>
Movement of Brake rigging should be free
</td>
<td align=center>
--
</td>
<td align=center colspan=2>
--
</td>

<td>
<input type="text" name='BrakeRiggingMovementActual' id='BrakeRiggingMovementActual' placeholder="Actual">
</td>
<td>
<input type="text" name='BrakeRiggingMovementAttendedBy' id='BrakeRiggingMovementAttendedBy' placeholder="Attended By">
</td>
</tr> 
</table>
<br>
<br>
<table>
<tr>
<td>
&nbsp; 1.3 Items fitted as per Drawing
</td>
<td>
<input type=radio name='bogieFinalItemFitted' id='bogieFinalItemFitted' value="OK">OK
<input type=radio name='bogieFinalItemFitted' id='bogieFinalItemFitted' value="NOT OK">NOT OK
<input type=radio name='bogieFinalItemFitted' id='bogieFinalItemFitted' value="NA">NA
</td>
</tr>
<tr>
<td>
&nbsp; 1.4 Compliance of Applicable W.I
</td>
<td>
<input type=radio name='bogieFinalApplicableWI' id='bogieFinalApplicableWI' value="OK">OK
<input type=radio name='bogieFinalApplicableWI' id='bogieFinalApplicableWI' value="NOT OK">NOT OK
<input type=radio name='bogieFinalApplicableWI' id='bogieFinalApplicableWI' value="NA">NA
</td>
</tr>
<tr>
<td>
&nbsp; 1.5 Welding throat & length as per Drawing
</td>
<td>
<input type=radio name='bogieFinalWeldingThroat' id='bogieFinalWeldingThroat' value="OK">OK
<input type=radio name='bogieFinalWeldingThroat' id='bogieFinalWeldingThroat' value="NOT OK">NOT OK
<input type=radio name='bogieFinalWeldingThroat' id='bogieFinalWeldingThroat' value="NA">NA
</td>
</tr>
<tr>
<td>
&nbsp; 1.6 Wheel Base:(2560+-1mm)
</td>
<td>
<input type=text name='bogieFinalWheelBase' id='bogieFinalWheelBase' placeholder="Wheel Base" class='validate[custom[number]]'>
</td>
</tr>
<tr >
<td colspan=2>
</td>
</tr>
<tr>
<td>
<b>2.Details of modification carried out(if any)</b>
</td>
<td>
<input type=text name='bogieFinalModifications' id='bogieFinalModifications' placeholder="Modifications">
</td>
</tr>
<tr>
<td>
<b>3.Details of trials items fitted(if any)</b> 
</td>
<td>
<input type=text name='bogieFinalTrialItems' id='bogieFinalTrialItems' placeholder="Trials Items Fitted">
</td>
</tr>
<tr>
<td>
<b>4.Remarks(if any)</b>
</td>
<td>
<input type=text name='bogieFinalRemarks' id='bogieFinalRemarks' placeholder="Remarks">
</td>
</tr>
</table>
<br>
<br>
<table>
<tr>
<th>Testing Status</th> 
<td><input type=radio name='bogieFinalTestingStatus' id='bogieFinalTestingStatus' value="Conforming">Conforming
<input type=radio name='bogieFinalTestingStatus' id='bogieFinalTestingStatus' value="Non Conforming">Non Conforming
</td>
</tr>
</table>
</form>
</div>
    
</body>
<script type="text/javascript">
		$(document).ready(function() {
			
// end of code
			
			var prevStage='<%=previousStage%>';
			var srno,i=1;

			  $('#datepickerto').datepicker({
			       
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


				$('#datepickerfrom').datepicker({
				       
			        dateFormat: 'dd-mm-yy',
			        changeMonth: true,
			        changeYear: true,
			        yearRange: '-2:+2',
			        constrainInput: false,
			        duration: '',
			        gotoCurrent: true,
			        beforeShow: function() {
			            setTimeout(function(){
			                $('.ui-datepicker').css('z-index', 99999999999999);
			            }, 0);
			        }
			    }).datepicker("setDate", "-30");
			    
			$('#frameReceiptDate').datepicker({
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

			    $('#bogieFinalDate').datepicker({
				       
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

			    $('#dateOfTesting').datepicker({
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


			
			    
	$('#BogiesetProductionTableContainer').jtable({
			
			title : 'Bogie Shop Production',
			
			paging:true,
            sorting: true,
            defaultSorting: 'bogieAssetId ASC',
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
    //toolbar
     toolbar: {
                items: [
             
                	{
                        icon: '<%=contextpath%>/images/rs_out.png',
                           text: 'Static Testing',
                           click: function () {
                            var $selectedRows = $('#BogiesetProductionTableContainer').jtable('selectedRows');
                           if ($selectedRows.length<1)
                          alert("Please select a row for which you want to Fill SIP Data");
                           else{
                           
                       	 		var record;
                       	 		$selectedRows.each(function () {
                                       record = $(this).data('record');
                                       });
   								
   								$.ajax({
   									url: "showexistingdataofbogieSIP",
   									type:'POST',
   									async:false,
   									data:
   										{
   										bogieAssetId:record.bogieAssetId,
   										//wheelsetAssetId:record.wheelsetAssetId,
   										},
   								success:function(msg)
   								{
   									$('#fiatbogieDocNo').val(msg.fiatbogieDocNo),
   									$('#fiatbogiedrawingNo').val(msg.fiatbogiedrawingNo),
   									$('#fiatbogieType').val(msg.bogieType),
   									$('#fiatbogieNumber').val(msg.bogieNo),
   									$('#frameMake').val(msg.frameMake),
   									$('#frameno').val(msg.frameno),
   									$('#brakecylinderno1').val(msg.brakeCylinderNo1),
   									$('#brakecylinderno2').val(msg.brakeCylinderNo2),
   									$('#brakecylinderno3').val(msg.brakeCylinderNo3),
   									$('#brakecylinderno4').val(msg.brakeCylinderNo4),
   									//$('#brakecylinderno').val(msg.brakecylinderno),   //change it and add 4 text box
   								//	$('#brakecylindermake').val(msg.brakecylindermake), //remove field
   									$('#vsaprimemake').val(msg.vsaprimemake),
   									$('#vsaprimeno').val(msg.vsaprimeno),
   									$('#vsasecmake').val(msg.vsasecmake),
   									$('#vsasecno').val(msg.vsasecno),
   									$('#lateralshockmake').val(msg.lateralshockmake),
   									$('#lateralshockno').val(msg.lateralshockno),
   									$('#bolstermake').val(msg.bolstermake),
   									$('#bolsterno').val(msg.bolsNo),
   									$('#typeofwheel').val(msg.typeofwheel),
   									$('#airspringmakeno1').val(msg.airspringmakeno1),
   									$('#airspringmakeno2').val(msg.airspringmakeno2),
   									$('#wheelaxlenonpa').val(msg.axleNoLeft),
   									$('#wheelaxlenopa').val(msg.axleNoRight)
   									
   								},
   								error:function(msg)
   								{
   									
   								},
   								});
               					
           if(record.staticSipBogieFlag==1)
           {
           
           $.ajax({
            url:"showsavedataofbogieSIP", //action-name as defined in struts.xml
            dataType:'json',
            type:'POST',
            async:false,
            data:{
           	 bogieAssetId:record.bogieAssetId, 
            },
            success:function(data)
            {     //alert("HOOO");
              $('#fiatbogieSipShift').val(data.bogieStaticSipTran.shiftOfTesting);
             $('#fiatbogieDocNo').val(data.bogieStaticSipTran.docNo);
             var bogieDate=(data.bogieStaticSipTran.dateOfTesting).substring(0,10);
             var bogieDateArray=bogieDate.split("-");
             //var sideWallD= new Date(sideWallDateArray[0],sideWallDateArray[1]-1,sideWallDateArray[2]);
             $('#dateOfTesting').datepicker("setDate", new Date(bogieDateArray[0],bogieDateArray[1]-1,bogieDateArray[2]));
             $('#fiatbogiedrawingNo').val([data.bogieStaticSipTran.drawingNo]);
             $('#fiatbogiewino').val([data.bogieStaticSipTran.wiNo]);
             $('#tarezoneone').val([data.bogieStaticSipTran.loadTareZ11]);
             $('#tarezthreeone').val([data.bogieStaticSipTran.loadTareZ31]);
             $('#tarezfourone').val([data.bogieStaticSipTran.loadTareZ41]);
             $('#tareztwoone').val([data.bogieStaticSipTran.loadTareZ21]);
             $('#tarex').val([data.bogieStaticSipTran.loadTareX]);
             $('#tareavgheightone').val([data.bogieStaticSipTran.loadTareZ12Z22]);
             $('#tareavgheighttwo').val([data.bogieStaticSipTran.loadTareZ32Z42]);
             $('#grosszoneone').val([data.bogieStaticSipTran.loadGrossZ11]);
             $('#grosszthreeone').val(data.bogieStaticSipTran.loadGrossZ31);
             $('#grosszfourone').val(data.bogieStaticSipTran.loadGrossZ41);
             $('#grossztwoone').val(data.bogieStaticSipTran.loadGrossZ21);
             $('#grossx').val(data.bogieStaticSipTran.loadGrossX);
             $('#grossavgheightone').val(data.bogieStaticSipTran.loadGrossZ12Z22);
             $('#grossavgheighttwo').val(data.bogieStaticSipTran.loadGrossZ32Z42);
             $('#tarelongxonefour').val(data.bogieStaticSipTran.loadTareX14);
             $('#tarelongxtwofour').val(data.bogieStaticSipTran.loadTareX24);
             $('#tarelatyonethree').val(data.bogieStaticSipTran.loadTareY13);
             $('#tarelatythreethree').val(data.bogieStaticSipTran.loadTareY33);
             $('#tareaside').val(data.bogieStaticSipTran.loadTareASide);
             $('#tarebside').val(data.bogieStaticSipTran.loadTareBSide);
             $('#grosslongxonefour').val(data.bogieStaticSipTran.loadGrossX14);
             $('#grosslongxtwofour').val(data.bogieStaticSipTran.loadGrossX24);
             $('#grosslatyonethree').val(data.bogieStaticSipTran.loadGrossY13);
             $('#grosslatythreethree').val(data.bogieStaticSipTran.loadGrossY33);
             $('[name="checkingStatus"]').val([data.bogieStaticSipTran.bogieStaticSipStatus]);
              
             }
              
            });
           
           }
           $('#dateOfTesting').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
            $("#bogiestatic").dialog({
                             title : 'Bogie Static Testing Inspection for  '+record.bogieNumber + 'from Stage- <%=stageID%>',
                             width:'65%',
                             close: function (e, u) {
                                   //$(".formError").remove();
                                $("#bogiestatic").validationEngine('hideAll');
                              $('#bogiestatic').find('form[name="bogiestatictesting"]')[0].reset();
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
                                         	 if ($('#fiatbogieDocNo').validationEngine('validate')) 
                                         	      {
   		                                        	
   		                                            return false;
   		                                        }
                                         	 if ($('#dateOfTesting').validationEngine('validate')) 
                                    	      {
   	                                        	
   	                                            return false;
   	                                        }
                                         	if ($('#fiatbogieSipShift').validationEngine('validate')) 
                                  	      {
   	                                        	
   	                                            return false;
   	                                        }

                                         	if ($('#fiatbogiedrawingNo').validationEngine('validate')) 
                                  	      {
   	                                        	
   	                                            return false;
   	                                        }
                                         	if ($('#fiatbogiewino').validationEngine('validate')) 
                                  	      {
   	                                        	
   	                                            return false;
   	                                        }
                                         	 if ($('#tarezoneone').validationEngine('validate')) 
                                    	      {
   	                                        	
   	                                            return false;
   	                                        }
                                         	 if ($('#tarezthreeone').validationEngine('validate')) 
                                    	      {
   	                                        	
   	                                            return false;
   	                                        }
                                         	 if ($('#tarezfourone').validationEngine('validate')) 
                                    	      {
   	                                        	
   	                                            return false;
   	                                        }
                                         	 if ($('#tareztwoone').validationEngine('validate')) 
                                    	      {
   	                                        	
   	                                            return false;
   	                                        }
                                         	 if ($('#tarex').validationEngine('validate')) 
                                   	      {
   	                                        	
   	                                            return false;
   	                                        }
                                         	 if ($('#tareavgheightone').validationEngine('validate')) 
                                   	      {
   	                                        	
   	                                            return false;
   	                                        }
                                         	 if ($('#tareavgheighttwo').validationEngine('validate')) 
                                   	      {
   	                                        	
   	                                            return false;
   	                                        }
                                         	 if ($('#grosszoneone').validationEngine('validate')) 
                                   	      {
   	                                        	
   	                                            return false;
   	                                        }
                                         	 if ($('#grosszthreeone').validationEngine('validate')) 
                                  	      {
   	                                        	
   	                                            return false;
   	                                        }
                                         	 if ($('#grosszfourone').validationEngine('validate')) 
                                  	      {
   	                                        	
   	                                            return false;
   	                                        }
                                         	 if ($('#grossztwoone').validationEngine('validate')) 
                                  	      {
   	                                        	
   	                                            return false;
   	                                        }
                                         	 if ($('#grossx').validationEngine('validate')) 
                                     	      {
      	                                        	
      	                                            return false;
      	                                        }
                                         	 if ($('#grossavgheightone').validationEngine('validate')) 
                                     	      {
      	                                        	
      	                                            return false;
      	                                        }
                                         	 if ($('#grossavgheighttwo').validationEngine('validate')) 
                                     	      {
      	                                        	
      	                                            return false;
      	                                        }
                                         	if ($('#tarelongxonefour').validationEngine('validate')) 
                                   	      {
                                         		
    	                                        	
    	                                            return false;
    	                                        }
                                         	if ($('#tarelongxtwofour').validationEngine('validate')) 
                                   	      {
    	                                        	
    	                                            return false;
    	                                        }
                                         	if ($('#tarelatyonethree').validationEngine('validate')) 
                                 	      {
   	                                        	
   	                                            return false;
   	                                        }
                                         	if ($('#tarelatythreethree').validationEngine('validate')) 
                                 	      {
   	                                        	
   	                                            return false;
   	                                        }
                                         	if ($('#tareaside').validationEngine('validate')) 
                                   	      {
     	                                        	
     	                                            return false;
     	                                        }
                                         	if ($('#tarebside').validationEngine('validate')) 
                                   	      {
     	                                        	
     	                                            return false;
     	                                        }
                                         	if ($('#grosslongxonefour').validationEngine('validate')) 
                                 	      {
   	                                        	
   	                                            return false;
   	                                        }
                                         	if ($('#grosslongxtwofour').validationEngine('validate')) 
                                 	      {
   	                                        	
   	                                            return false;
   	                                        }
                                         	if ($('#grosslatyonethree').validationEngine('validate')) 
                                   	      {
     	                                        	
     	                                            return false;
     	                                        }
                                         	if ($('#grosslatythreethree').validationEngine('validate')) 
                                 	      {
   	                                        	
   	                                            return false;
   	                                        }
                                      

                                        




                                                
                                        var c=confirm("Do you want to submit data for Bogie Static Testing");
                                         if(c==false){return false;}
                                                 
                                         $.ajax({
                              url : "saveBogieStaticSIP",  //action-name as defined in struts.xml
                              dataType: 'json',
                              data : {
                           	   bogieAssetId: record.bogieAssetId,
                           	   
                           	  dateOfTesting:$('#dateOfTesting').val(),
                           	 
                                   fiatbogieSipShift:$('#fiatbogieSipShift').val(),
                                  
                                fiatbogiedrawingNo:$('#fiatbogiedrawingNo').val(),
                              
                                fiatbogiewino:$('#fiatbogiewino').val(),
                               
                                tarezoneone:$('#tarezoneone').val(),
                                
                                 tarezthreeone:$('#tarezthreeone').val(),
                               
                                tarezfourone:$('#tarezfourone').val(),
                                
                                tareztwoone:$('#tareztwoone').val(),
                               
                                tarex:$('#tarex').val(),
                                
                                tareavgheighton:$('#tareavgheightone').val(),
                                tareavgheighttwo:$('#tareavgheighttwo').val(),
                                grosszoneone:$('#grosszoneone').val(),
                               
                                grosszthreeone:$('#grosszthreeone').val(),
                                grosszfourone:$('#grosszfourone').val(),
                                grossztwoone:$('#grossztwoone').val(),
                                grossx:$('#grossx').val(),
                               
                                grossavgheightone:$('#grossavgheightone').val(),
                                
                                grossavgheighttwo:$('#grossavgheighttwo').val(),
                                tarelongxonefour:$('#tarelongxonefour').val(),
                                tarelongxtwofour:$('#tarelongxtwofour').val(),
                                tarelatyonethree:$('#tarelatyonethree').val(),
                                tarelatythreethree:$('#tarelatythreethree').val(),
                                tareaside:$('#tareaside').val(),
                                tarebside:$('#tarebside').val(),
                               grosslongxonefour:$('#grosslongxonefour').val(),
                               grosslongxtwofour:$('#grosslongxtwofour').val(),
                               grosslatyonethree:$('#grosslatyonethree').val(),
                               grosslatythreethree:$('#grosslatythreethree').val(),
                               fiatbogieDocNo:$('#fiatbogieDocNo').val(),
                               fiatbogieNumber:$('#fiatbogieNumber').val(),
                               fiatbogieType:$('#fiatbogieType').val(),
                               airspringmakeno1:$('#airspringmakeno1').val(),
                               airspringmakeno2:$('#airspringmakeno2').val(),
                               bolsterno:$('#bolsterno').val(),
                               bolstermake:$('#bolstermake').val(),
                               brakecylinderno1:$('#brakecylinderno1').val(),
                               brakecylinderno2:$('#brakecylinderno2').val(),
                               brakecylinderno3:$('#brakecylinderno3').val(),
                               brakecylinderno4:$('#brakecylinderno4').val(),
                               
                               vsaprimemake:$('#vsaprimemake').val(),
                               vsaprimeno:$('#vsaprimeno').val(),
                               vsasecmake:$('#vsasecmake').val(),
                               vsasecno:$('#vsasecno').val(),
                               lateralshockmake:$('#lateralshockmake').val(),
                               lateralshockno:$('#lateralshockno').val(),
                               frameMake:$('#frameMake').val(),
                               frameno:$('#frameno').val(),
                               checkingStatus:$("Input[id='checkingStatus']:checked").val(),
                              
                               
                                   
                                 },
                              
                              type : 'POST',
                              async : false,
                                    })
                              .done(function( msg ) {
                           	   $('#bogieAssetId').val(''), 
                              $('#dateOfTesting').val(''),
                               
                               $('#fiatbogieSipShift').val(''),
                               
                                 $('#fiatbogiedrawingNo').val(''),
                                $('#fiatbogiewino').val(''),
                              
                                $('#tarezoneone').val(''),
                                $('#tarezthreeone').val(''),
                                $('#tarezfourone').val(''),
                                $('#tareztwoone').val(''),
                                $('#tarex').val(''),
                                $('#tareavgheightone').val(''),
                                $('#tareavgheighttwo').val(''),
                                $('#grosszoneone').val(''),
                                $('#grosszthreeone').val(''),
                                $('#grosszfourone').val(''),
                                $('#grossztwoone').val(''),
                                $('#grossx').val(''),
                                $('#grossavgheightone').val(''),     
                                $('#grossavgheighttwo').val(''),
                                $('#tarelongxonefour').val(''),
                                $('#tarelongxtwofour').val(''),
                                $('#tarelatyonethree').val(''),
                                $('#tarelatythreethree').val(''),
                                $('#tareaside').val(''),
                                $('#tarebside').val(''),
                                $('#grosslongxonefour').val(''),
                                $('#grosslongxtwofour').val(''),
                                $('#grosslatyonethree').val(''),
                                $('#grosslatythreethree').val(''),
                                $('#fiatbogieDocNo').val(''),
                                $('#fiatbogieNumber').val(''),
                                $('#fiatbogieType').val(''),
                                $('#airspringmakeno1').val(''),
                                $('#airspringmakeno2').val(''),
                                $('#bolsterno').val(''),
                                $('#bolstermake').val(''),
                                $('#brakecylinderno1').val(''),
                                $('#brakecylinderno2').val(''),
                                $('#brakecylinderno3').val(''),
                                $('#brakecylinderno4').val(''),
                                $('#vsaprimemake').val(''),
                                $('#vsasecmake').val(''),
                                $('#vsasecno').val(''),
                                $('#lateralshockmake').val(''),
                                $('#lateralshockno').val(''),
                                $('#frameMake').val(''),
                                $('#frameno').val(''),
                                $('#checkingStatus').val(''),
                               $('#bogiestatic').dialog('close');
                               $('#BogiesetProductionTableContainer').jtable('load');
                       })
                    
                                           }
                                        }, 
                               Close: function () {
                                $('#bogiestatic').find('form[name="bogiestatictesting"]')[0].reset();
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
                    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'Final SIP',
                        click: function () {
                        	var $selectedRows = $('#BogiesetProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you want to Fill SIP Data");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
								$('#bogieFinalDate').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
								$.ajax({
									url: "showExistingDataofBogie",
									type:'POST',
									async:false,
									data:
										{
										bogieAssetId:record.bogieAssetId,
										},
								success:function(msg)
								{
									$('#bogieFinalFormNo').val(msg.formNoFinalSip),
									$('#bogieFinalBogieType').val(msg.bogieType),
									$('#bogieFinalBogieNo').val(msg.bogieNo),
									$('#bogieFinalDrawingNo').val(msg.drawingNoFinalSip),
									$('#bogieFinalBogieFrameNo').val(msg.frameNo),
									$('#bogieFinalBolsterNo').val(msg.bolsNo),
									$('#bogieFinalBrakeCylinder1').val(msg.brakeCylinderNo1),
									$('#bogieFinalBrakeCylinder2').val(msg.brakeCylinderNo2),
									$('#bogieFinalBrakeCylinder3').val(msg.brakeCylinderNo3),
									$('#bogieFinalBrakeCylinder4').val(msg.brakeCylinderNo4),
									$('#bogieFinalBrakeCaliper1').val(msg.brakeCaliperNo1),
									$('#bogieFinalBrakeCaliper2').val(msg.brakeCaliperNo2),
									$('#bogieFinalBrakeCaliper3').val(msg.brakeCaliperNo3),
									$('#bogieFinalBrakeCaliper4').val(msg.brakeCaliperNo4),
									$('#bogieFinalPPAxleNo').val(msg.axleNoLeft),
									$('#bogieFinalNPPAxleNo').val(msg.axleNoRight);
									
								},
								error:function(msg)
								{
									
								},
								});
								if(record.sipFinalFlag==1)
								{
								
								$.ajax({
									url:"showSaveDataBogieFinal", //action-name as defined in struts.xml
									dataType:'json',
									type:'POST',
									async:false,
									data:{
									bogieAssetId:record.bogieAssetId,	
									},
									success:function(data)
									{
										
										
										$('#bogieFinalShift').val(data.bogieFinalSipTran.shiftOfTesting);
										
										$('#bogieFinalColourInnerActual').val(data.bogieFinalSipTran.primarySpringColorInner);
										
										$('#bogieFinalColourOuterActual').val(data.bogieFinalSipTran.primarySpringColorOuter);
										$("[id='fitmentAntiRollBarStatus']").val([data.bogieFinalSipTran.fitmentAntiRollBarStatus]);
										
										$('#fitmentAntiRollBarActual').val(data.bogieFinalSipTran.fitmentAntiRollBarActual);
										$('#fitmentAntiRollBarAttendedBy').val(data.bogieFinalSipTran.fitmentAntiRollBarAttendant);
										$("[id='fitmentTractionLeverJointStatus']").val([data.bogieFinalSipTran.fitmentTractionLeverJointStatus]);
										$('#fitmentTractionLeverJointActual').val(data.bogieFinalSipTran.fitmentTractionLeverJointActual);
										$('#fitmentTractionLeverJointAttendedBy').val(data.bogieFinalSipTran.fitmentTractionLeverJointAttendant);
										$("[id='fitmentLateralDamperBktStatus']").val([data.bogieFinalSipTran.fitmentLateralDamperBktStatus]);
										$('#fitmentLateralDamperBktActual').val(data.bogieFinalSipTran.fitmentLateralDamperBktActual);
										$('#fitmentLateralDamperBktAttendedBy').val(data.bogieFinalSipTran.fitmentLateralDamperBktAttendant);
										$("[id='fitmentCrossSectionStatus']").val([data.bogieFinalSipTran.fitmentCrossSectionStatus]);
										$('#fitmentCrossSectionActual').val(data.bogieFinalSipTran.fitmentCrossSectionActual);
										$('#fitmentCrossSectionAttendedBy').val(data.bogieFinalSipTran.fitmentCrossSectionAttendant);
										$("[id='fitmentLateralBumpStopStatus']").val([data.bogieFinalSipTran.fitmentLateralBumpStopStatus]);
										$('#fitmentLateralBumpStopActual').val(data.bogieFinalSipTran.fitmentLateralBumpStopActual);
										$('#fitmentLateralBumpStopAttendedBy').val(data.bogieFinalSipTran.fitmentLateralBumpStopAttendant);
										
										$("[id='fitmentBrakeCylinderStatus']").val([data.bogieFinalSipTran.fitmentBrakeCylinderStatus]);
										
										$('#fitmentBrakeCylinderActual').val(data.bogieFinalSipTran.fitmentBrakeCylinderActual);
										$('#fitmentBrakeCylinderAttendedBy').val(data.bogieFinalSipTran.fitmentBrakeCylinderAttendant);
										
										$("[id='fitmentLongitudinalStopStatus']").val([data.bogieFinalSipTran.fitmentLongitudinalStopStatus]);
										
										$('#fitmentLongitudinalStopActual').val(data.bogieFinalSipTran.fitmentLongitudinalStopActual);
										$('#fitmentLongitudinalStopAttendedBy').val(data.bogieFinalSipTran.fitmentLongitudinalStopAttendant);
										
										$("[id='fitmentRollLinkBktStatus']").val([data.bogieFinalSipTran.fitmentRollLinkStatus]);
										
										$('#fitmentRollLinkBktActual').val(data.bogieFinalSipTran.fitmentRollLinkActual);
										$('#fitmentRollLinkBktAttendedBy').val(data.bogieFinalSipTran.fitmentRollLinkAttendant);
										$("[id='fitmentControlArmTopStatus']").val([data.bogieFinalSipTran.fitmentControlArmTopBottomStatus]);
										$('#fitmentControlArmTopActual').val(data.bogieFinalSipTran.fitmentControlArmTopBottomActual);
										$('#fitmentControlArmTopAttendedBy').val(data.bogieFinalSipTran.fitmentControlArmTopBottomAttendant);
										$("[id='fitmentAxleEndCoverStatus']").val([data.bogieFinalSipTran.fitmentAxleEndCoverStatus]);
										$('#fitmentAxleEndCoverActual').val(data.bogieFinalSipTran.fitmentAxleEndCoverActual);
										$('#fitmentAxleEndCoverAttendedBy').val(data.bogieFinalSipTran.fitmentAxleEndCoverAttendant);
										$("[id='fitmentPrimaryBumpStopStatus']").val([data.bogieFinalSipTran.fitmentPrimaryBumpStatus]);
										$('#fitmentPrimaryBumpStopActual').val(data.bogieFinalSipTran.fitmentPrimaryBumpActual);
										$('#fitmentPrimaryBumpStopAttendedBy').val(data.bogieFinalSipTran.fitmentPrimaryBumpAttendant);
										$("[id='fitmentControlArmBktStatus']").val([data.bogieFinalSipTran.fitmentControlArmTopArmbktStatus]);
										$('#fitmentControlArmBktActual').val(data.bogieFinalSipTran.fitmentControlArmTopArmbktActual);
										$('#fitmentControlArmBktAttendedBy').val(data.bogieFinalSipTran.fitmentControlArmTopArmbktAttendant);
										$("[id='fitmentPrimaryShockAbsorberStatus']").val([data.bogieFinalSipTran.fitmentPrimaryShockAbsorberStatus]);
										$('#fitmentPrimaryShockAbsorberActual').val(data.bogieFinalSipTran.fitmentPrimaryShockAbsorberActual);
										$('#fitmentPrimaryShockAbsorberAttendedBy').val(data.bogieFinalSipTran.fitmentPrimaryShockAbsorberAttendant);
										$("[id='fitmentTractionCentreStatus']").val([data.bogieFinalSipTran.fitmentTractionCentreStatus]);
										$('#fitmentTractionCentreActual').val(data.bogieFinalSipTran.fitmentTractionCentreActual);
										$('#fitmentTractionCentreAttendedBy').val(data.bogieFinalSipTran.fitmentTractionCentreAttendant);
										$("[id='fitmentLateralDamperStatus']").val([data.bogieFinalSipTran.fitmentLateralDamperDiscStatus]);
										$('#fitmentLateralDamperActual').val(data.bogieFinalSipTran.fitmentLateralDamperDiscActual);
										$('#fitmentLateralDamperAttendedBy').val(data.bogieFinalSipTran.fitmentLateralDamperDiscAttendant);
										$("[id='fitmentSecondaryVerticalDamperACStatus']").val([data.bogieFinalSipTran.fitmentSecVerticalDamperStatus]);
										$('#fitmentSecondaryVerticalDamperACActual').val(data.bogieFinalSipTran.fitmentSecVerticalDamperActual);
										$('#fitmentSecondaryVerticalDamperACAttendedBy').val(data.bogieFinalSipTran.fitmentSecVerticalDamperAttendant);
										$('#fitmentLockingPlateActual').val(data.bogieFinalSipTran.fitmentLockingPlateActual);
										$('#fitmentLockingPlateAttendedBy').val(data.bogieFinalSipTran.fitmentLockingPlateAttendant);
										$('#PlateShockAbsorberActual').val(data.bogieFinalSipTran.noPlateOfShockAbsorber);
										$('#PlateShockAbsorberAttendedBy').val(data.bogieFinalSipTran.noPlateOfShockAbsorberAttendant);
										//$('#PlateShockAbsorberAttendedBy').val(data.bogieFinalSipTran.detailsTrialItem);
										$('#CheckingOfPipeActual').val(data.bogieFinalSipTran.pipesLeakageActual);
										$('#CheckingOfPipeAttendedBy').val(data.bogieFinalSipTran.pipesLeakageAttendant);
										$('#CotterSplitedActual').val(data.bogieFinalSipTran.cotterSplitActual);
										$('#CotterSplitedAttendedBy').val(data.bogieFinalSipTran.cotterSplitAttendant);
										$('#NutBoltScrewTightenedActual').val(data.bogieFinalSipTran.nutBoltTightActual);
										$('#NutBoltScrewTightenedAttendedBy').val(data.bogieFinalSipTran.nutBoltTightAttendant);
										$('#WeldingBogieNoActual').val(data.bogieFinalSipTran.weldingOfBogieplateActual);
										
										
										
										$('#WeldingBogieNoAttendedBy').val(data.bogieFinalSipTran.weldingOfBogieplateAttendant);
										$('#PaintingCompleteBogieActual').val(data.bogieFinalSipTran.paintingOfBogieActual);
										$('#PaintingCompleteBogieAttendedBy').val(data.bogieFinalSipTran.paintingOfBogieAttendant);
										$('#FitmentPhonicWheelActual').val(data.bogieFinalSipTran.fitmentPhonicWheelActual);
										$('#FitmentPhonicWheelAttendedBy').val(data.bogieFinalSipTran.fitmentPhonicWheelAttendant);
										$('#FitmentBolsterAirPipesActual').val(data.bogieFinalSipTran.fitmentAirpipeBolsterActual);
										$('#FitmentBolsterAirPipesAttendedBy').val(data.bogieFinalSipTran.fitmentAirpipeBolsterAttendant);
										$('#FitmentBrakeCylinderAirPipesActual').val(data.bogieFinalSipTran.fitmentAirpipeBrakecylinderActual);
										$('#FitmentBrakeCylinderAirPipesAttendedBy').val(data.bogieFinalSipTran.fitmentAirpipeBrakecylinderAttendant); 
										$('#BrakeRiggingMovementActual').val(data.bogieFinalSipTran.movementBrakeRiggingActual);
										$('#BrakeRiggingMovementAttendedBy').val(data.bogieFinalSipTran.movementBrakeRiggingAttendant);
										$("[id='bogieFinalItemFitted']").val([data.bogieFinalSipTran.itemFittedAsDrawingFlag]);
										
										
										
										$("[id='bogieFinalApplicableWI']").val([data.bogieFinalSipTran.complianceWiFlag]);
										$("[id='bogieFinalWeldingThroat']").val([data.bogieFinalSipTran.weldingThroatLengthFlag]);
										$('#bogieFinalWheelBase').val(data.bogieFinalSipTran.wheelBase);
										$('#bogieFinalModifications').val(data.bogieFinalSipTran.detailsModification);
										$('#bogieFinalTrialItems').val(data.bogieFinalSipTran.detailsTrialItems);
										$('#bogieFinalRemarks').val(data.bogieFinalSipTran.remarks);
										$("[id='bogieFinalTestingStatus']").val([data.bogieFinalSipTran.testingStatus]);
										var bogieFinalDate=(data.bogieFinalSipTran.dateOfTesting).substring(0,10);
										var BogieFinalDateArray=bogieFinalDate.split("-");
										$('#bogieFinalDate').datepicker("setDate",new Date(BogieFinalDateArray[0],BogieFinalDateArray[1]-1,BogieFinalDateArray[2]));
										
										
																			
									}
										
									});
								}
            					
                    	 	 	$("#bogieFinal").dialog({
                    	 	 		title : 'Bogie Final Inspection for  '+record.bogieNumber + 'from Stage- <%=stageID%>',
                    	 	 		width:'60%',
                    	 	 		close: function (e, u) {
              	 		              //$(".formError").remove();
              	 		          	$("#bogieFinal").validationEngine('hideAll');
              	 		            $('#bogieFinal').find('form[name="bogieFinalSip"]')[0].reset();
              	 		          },
                	 		 	
 		 							buttons: {
	                                    Submit: {
	                                       text: "Submit",
	                                        id: "my-button-submit",
	                                        click:function () {
	                                       	 if ($('#fitmentAntiRollBarActual').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
	                                    	 if ($('#fitmentTractionLeverJointActual').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
	                                    	 if ($('#fitmentLateralDamperBktActual').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
	                                    	 if ($('#fitmentCrossSectionActual').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
	                                    	 if ($('#fitmentLateralBumpStopActual').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
	                                    	 if ($('#fitmentBrakeCylinderActual').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
	                                    	 if ($('#fitmentLongitudinalStopActual').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
	                                    	 if ($('#fitmentRollLinkBktActual').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
	                                    	 if ($('#fitmentControlArmTopActual').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
	                                    	 if ($('#fitmentAxleEndCoverActual').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
	                                    	 if ($('#fitmentPrimaryBumpStopActual').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
	                                    	 if ($('#fitmentControlArmBktActual').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
	                                    	 if ($('#fitmentPrimaryShockAbsorberActual').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
	                                    	 if ($('#fitmentTractionCentreActual').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
	                                    	 if ($('#fitmentLateralDamperActual').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
	                                    	 if ($('#fitmentSecondaryVerticalDamperACActual').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
	                                    	 if ($('#FitmentPhonicWheelActual').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
	                                    	 if ($('#bogieFinalWheelBase').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
	                                    	 
	                                    	 
	  									 var c=confirm("Do you want to submit data for Bogie Final Testing");
	    	                                    if(c==false){return false;}
	                                             		    	   
	    	                                    	$.ajax({
	    	                                    		url : "saveBogieSIP",  //action-name as defined in struts.xml
	    	                    						dataType: 'json', 
	    	                    						type : 'POST',
	    	                    						async : false,
	    	                    						data :{
	    	                    							
	    	                    							 bogieAssetId: record.bogieAssetId,
	    	                    							  dateOfTesting:$("#bogieFinalDate").val(),
	    	                    							  shiftOfTesting:$("#bogieFinalShift").val(),
	    	                                    			
	    	                    							  primarySpringColorInner:$("#bogieFinalColourInnerActual").val(),
	    	                                    			  primarySpringColorOuter:$("#bogieFinalColourOuterActual").val(),
	    	                                    			  fitmentAntiRollBarStatus:$("input[id='fitmentAntiRollBarStatus']:checked").val(),
	    	                                    			  fitmentAntiRollBarActual:$("#fitmentAntiRollBarActual").val(),
	    	                                    			  fitmentAntiRollBarAttendant:$("#fitmentAntiRollBarAttendedBy").val(),
	    	                                    			  fitmentTractionLeverJointStatus:$("input[id='fitmentTractionLeverJointStatus']:checked").val(),
	    	          	                    				
	    	                                    			  fitmentTractionLeverJointActual:$("#fitmentTractionLeverJointActual").val(),
	    		                    						  fitmentTractionLeverJointAttendant:$("#fitmentTractionLeverJointAttendedBy").val(),
	    		                    						  fitmentLateralDamperBktStatus:$("input[id='fitmentLateralDamperBktStatus']:checked").val(),
	    		                    						  fitmentLateralDamperBktActual:$("#fitmentLateralDamperBktActual").val(),
	    		                    						  fitmentLateralDamperBktAttendant:$("#fitmentLateralDamperBktAttendedBy").val(),
	    		                    						  fitmentCrossSectionStatus:$("input[id='fitmentCrossSectionStatus']:checked").val(),
	    		                    						  fitmentCrossSectionActual:$("#fitmentCrossSectionActual").val(),
	    		                    						  fitmentCrossSectionAttendant:$("#fitmentCrossSectionAttendedBy").val(),
	    		                    						  fitmentLateralBumpStopStatus:$("input[id='fitmentLateralBumpStopStatus']:checked").val(),
	    		                    						  fitmentLateralBumpStopActual:$("#fitmentLateralBumpStopActual").val(),
	    		                    						  fitmentLateralBumpStopAttendant:$("#fitmentLateralBumpStopAttendedBy").val(),
	    		                    						  fitmentBrakeCylinderStatus:$("input[id='fitmentBrakeCylinderStatus']:checked").val(),
	    		                    						  fitmentBrakeCylinderActual:$("#fitmentBrakeCylinderActual").val(),
	    		                    						  fitmentBrakeCylinderAttendant:$("#fitmentBrakeCylinderAttendedBy").val(),

	    		                    						  fitmentLongitudinalStopStatus:$("input[id='fitmentLongitudinalStopStatus']:checked").val(),
	    		                    						  fitmentLongitudinalStopActual:$("#fitmentLongitudinalStopActual").val(),
	    		                    						  fitmentLongitudinalStopAttendant:$("#fitmentLongitudinalStopAttendedBy").val(),
	    		                    						  fitmentRollLinkStatus:$("input[id='fitmentRollLinkBktStatus']:checked").val(),
	    		                    						  fitmentRollLinkActual:$("#fitmentRollLinkBktActual").val(),
	    		                    						  fitmentRollLinkAttendant:$("#fitmentRollLinkBktAttendedBy").val(),
	    		                    						  fitmentControlArmTopBottomStatus:$("input[id='fitmentControlArmTopStatus']:checked").val(),
	    		                    						  fitmentControlArmTopBottomActual:$("#fitmentControlArmTopActual").val(),
	    		                    						  fitmentControlArmTopBottomAttendant:$("#fitmentControlArmTopAttendedBy").val(),
	    		                    						  fitmentAxleEndCoverStatus:$("input[id='fitmentAxleEndCoverStatus']:checked").val(),
	    		                    						  fitmentAxleEndCoverActual:$("#fitmentAxleEndCoverActual").val(),
	    		                    						  fitmentAxleEndCoverAttendant:$("#fitmentAxleEndCoverAttendedBy").val(),
	    		                    						  fitmentPrimaryBumpStatus:$("input[id='fitmentPrimaryBumpStopStatus']:checked").val(),
	    		                    						  fitmentPrimaryBumpActual:$("#fitmentPrimaryBumpStopActual").val(),
	    		                    						  fitmentPrimaryBumpAttendant:$("#fitmentPrimaryBumpStopAttendedBy").val(),
	    		                    						  fitmentControlArmTopArmbktStatus:$("input[id='fitmentControlArmBktStatus']:checked").val(),
	    		                    						  fitmentControlArmTopArmbktActual:$("#fitmentControlArmBktActual").val(),
	    		                    						  fitmentControlArmTopArmbktAttendant:$("#fitmentControlArmBktAttendedBy").val(),
	    		                    						  fitmentPrimaryShockAbsorberStatus:$("input[id='fitmentPrimaryShockAbsorberStatus']:checked").val(),
	    		                    						  fitmentPrimaryShockAbsorberActual:$("#fitmentPrimaryShockAbsorberActual").val(),
	    		                    						  fitmentPrimaryShockAbsorberAttendant:$("#fitmentPrimaryShockAbsorberAttendedBy").val(),
	    		                    						  fitmentTractionCentreStatus:$("input[id='fitmentTractionCentreStatus']:checked").val(),
	    		                    						  fitmentTractionCentreActual:$("#fitmentTractionCentreActual").val(),
	    		                    						  fitmentTractionCentreAttendant:$("#fitmentTractionCentreAttendedBy").val(),
	    		                    						  fitmentLateralDamperDiscStatus:$("input[id='fitmentLateralDamperStatus']:checked").val(),
	    		                    						  fitmentLateralDamperDiscActual:$("#fitmentLateralDamperActual").val(),
	    		                    						  fitmentLateralDamperDiscAttendant:$("#fitmentLateralDamperAttendedBy").val(),
	    		                    						  fitmentSecVerticalDamperStatus:$("input[id='fitmentSecondaryVerticalDamperACStatus']:checked").val(),
	    		                    						  fitmentSecVerticalDamperActual:$("#fitmentSecondaryVerticalDamperACActual").val(),
	    		                    						  fitmentSecVerticalDamperAttendant:$("#fitmentSecondaryVerticalDamperACAttendedBy").val(),
	    		                    						  fitmentLockingPlateActual:$("#fitmentLockingPlateActual").val(),
	    		                    						  fitmentLockingPlateAttendant:$("#fitmentLockingPlateAttendedBy").val(),
	    		                    						  
	    		                    						  noPlateOfShockAbsorber:$("#PlateShockAbsorberActual").val(),
	    		                    						  noPlateOfShockAbsorberAttendant:$("#PlateShockAbsorberAttendedBy").val(),
	    		                    						  
	    		                    						  pipesLeakageActual:$("#CheckingOfPipeActual").val(),
	    		                    						  pipesLeakageAttendant:$("#CheckingOfPipeAttendedBy").val(),
	    		                    						  
	    		                    						  cotterSplitActual:$("#CotterSplitedActual").val(),
	    		                    						  cotterSplitAttendant:$("#CotterSplitedAttendedBy").val(),
	    		                    						  
	    		                    						  nutBoltTightActual:$("#NutBoltScrewTightenedActual").val(),
	    		                    						  
	    		                    						  nutBoltTightAttendant:$('#NutBoltScrewTightenedAttendedBy').val(),
	    		                    						  
	    		                    						  weldingOfBogieplateActual:$("#WeldingBogieNoActual").val(),
	    		                    						  weldingOfBogieplateAttendant:$("#WeldingBogieNoAttendedBy").val(),
	    		                    						   
	    		                    						  paintingOfBogieActual:$("#PaintingCompleteBogieActual").val(),
	    		                    						  paintingOfBogieAttendant:$("#PaintingCompleteBogieAttendedBy").val(),
	    		                    						  
	    		                    						  fitmentPhonicWheelActual:$("#FitmentPhonicWheelActual").val(),
	    		                    						  fitmentPhonicWheelAttendant:$("#FitmentPhonicWheelAttendedBy").val(),
	    		                    						  
	    		                    						  fitmentAirpipeBolsterActual:$("#FitmentBolsterAirPipesActual").val(),
	    		                    						  fitmentAirpipeBolsterAttendant:$("#FitmentBolsterAirPipesAttendedBy").val(),
	    		                    						  
	    		                    						  fitmentAirpipeBrakecylinderActual:$("#FitmentBrakeCylinderAirPipesActual").val(),
	    		                    						  fitmentAirpipeBrakecylinderAttendant:$("#FitmentBrakeCylinderAirPipesAttendedBy").val(),
	    		                    						 
	    		                    						  movementBrakeRiggingActual:$("#BrakeRiggingMovementActual").val(),
	    		                    						  movementBrakeRiggingAttendant:$("#BrakeRiggingMovementAttendedBy").val(),
	    		                    						  itemFittedAsDrawingFlag:$("input[id='bogieFinalItemFitted']:checked").val(),
	    		                    						  complianceWiFlag:$("input[id='bogieFinalApplicableWI']:checked").val(),
	    		                    						  weldingThroatLengthFlag:$("input[id='bogieFinalWeldingThroat']:checked").val(),
	    		                    						  wheelBase:$("#bogieFinalWheelBase").val(),
	    		                    						  detailsModification:$("#bogieFinalModifications").val(),
	    		                    						  detailsTrialItems:$("#bogieFinalTrialItems").val(),
	    		                    						  remarks:$("#bogieFinalRemarks").val(),
	    		                    						  formNoFinalSip:$("#bogieFinalFormNo").val(),
	    		                    						  bogieType:$("#bogieFinalBogieType").val(),
	    		                    						  bogieNumber:$("#bogieFinalBogieNo").val(),
	    		                    						  drawingNoFinalSip:$('#bogieFinalDrawingNo').val(),
	    		                    						  frameNo:$("#bogieFinalBogieFrameNo").val(),
	    		                    						  bolsNo:$("#bogieFinalBolsterNo").val(),
	    		                    						  brakeCylinderNo1:$("#bogieFinalBrakeCylinder1").val(),
	    		                    						  brakeCylinderNo2:$("#bogieFinalBrakeCylinder2").val(),
	    		                    						  brakeCylinderNo3:$("#bogieFinalBrakeCylinder3").val(),
	    		                    						  brakeCylinderNo4:$("#bogieFinalBrakeCylinder4").val(),
	    		                    						  brakeCaliperNo1:$("#bogieFinalBrakeCaliper1").val(),
	    		                    						  brakeCaliperNo2:$("#bogieFinalBrakeCaliper2").val(),
	    		                    						  brakeCaliperNo3:$("#bogieFinalBrakeCaliper3").val(),
	    		                    						  brakeCaliperNo4:$("#bogieFinalBrakeCaliper4").val(),
	    		          									
	    		                    						  testingStatus:$("input[id='bogieFinalTestingStatus']:checked").val()
 
	    	                    								  },
	    	                    								 
	    	      	                    							
	    	      	                    							
	    	      	                    							
	    	      	                 
	    	      	                    							
	    	      	                    							 
	    	      	                    							
	    	      	                    							
	    	      	                    							
	    	      	                    						
	    	      	         								
	    	                    						success:function (msg)
	    	                    						{
	    	                    							$('#bogieFinalDate').val(''),
	    	                    							$('#bogieFinalFormNo').val(''),
	    	                    							$('#bogieFinalDate').val(''),  
	      	                    							$('#bogieFinalShift').val(''),   
	      	                    							$('#bogieFinalColourInnerActual').val(''),
	      	                    							$('#bogieFinalColourOuterActual').val(''),
	      	                    							$('#fitmentAntiRollBarStatus').val(''),
	      	                    							$('#fitmentAntiRollBarActual').val(''),
	      	                    							$('#fitmentAntiRollBarAttendedBy').val(''),
	      	                    							$('#fitmentTractionLeverJointStatus').val(''),
	      	                    							$('#fitmentTractionLeverJointActual').val(''),
	      	                    							$('#fitmentTractionLeverJointAttendedBy').val(''),
	      	                    							$('#fitmentTractionLeverJointStatus').val(''),
	      	                    							$('#fitmentLateralDamperBktStatus').val(''),
	      	                    							$('#fitmentLateralDamperBktActual').val(''),
	      	                    							$('#fitmentLateralDamperBktAttendedBy').val(''),
	      	                    							$('#fitmentCrossSectionStatus').val(''),
	      	                    							$('#fitmentCrossSectionActual').val(''),
	      	                    							$('#fitmentCrossSectionAttendedBy').val(''),
	      	                    							$('#fitmentLateralBumpStopStatus').val(''),
	      	                    							$('#fitmentLateralBumpStopActual').val(''),
	      	                    							$('#fitmentLateralBumpStopAttendedBy').val(''),
	      	                    							$('#fitmentBrakeCylinderStatus').val(''),
	      	                    							$('#fitmentBrakeCylinderActual').val(''),
	      	                    							$('#fitmentBrakeCylinderAttendedBy').val(''),
	      	                    							$('#fitmentLongitudinalStopStatus').val(''),
	      	                    							$('#fitmentLongitudinalStopActual').val(''),
	      	                    							$('#fitmentLongitudinalStopAttendedBy').val(''),
	      	                    							$('#fitmentRollLinkBktStatus').val(''),
	      	                    							$('#fitmentRollLinkBktActual').val(''),
	      	                    							$('#fitmentControlArmTopStatus').val(''),
	      	                    							$('#fitmentControlArmTopActual').val(''),
	      	                    							$('#fitmentControlArmTopAttendedBy').val(''),
	      	                    							$('#fitmentAxleEndCoverStatus').val(''),
	      	                    							$('#fitmentAxleEndCoverActual').val(''),
	      	                    							$('#fitmentAxleEndCoverAttendedBy').val(''),
	      	                    							$('#fitmentPrimaryBumpStopStatus').val(''),
	      	                    							$('#fitmentPrimaryBumpStopActual').val(''),
	      	                    							$('#fitmentPrimaryBumpStopAttendedBy').val(''),
	      	                    							$('#fitmentControlArmBktStatus').val(''),
	      	                    							$('#fitmentControlArmBktActual').val(''),
	      	                    							$('#fitmentControlArmBktAttendedBy').val(''),
	      	                    							$('#fitmentPrimaryShockAbsorberStatus').val(''),
	      	                    							$('#fitmentPrimaryShockAbsorberActual').val(''),
	      	                    							$('#fitmentPrimaryShockAbsorberAttendedBy').val(''),
	      	                    							$('#fitmentTractionCentreStatus').val(''),
	      	                    							$('#fitmentTractionCentreActual').val(''),
	      	                    							$('#fitmentTractionCentreAttendedBy').val(''),
	      	                    							$('#fitmentLateralDamperStatus').val(''),
	      	                    							$('#fitmentLateralDamperActual').val(''),
	      	                    							$('#fitmentLateralDamperAttendedBy').val(''),
	      	                    							$('#fitmentSecondaryVerticalDamperACStatus').val(''),
	      	                    							$('#fitmentSecondaryVerticalDamperACActual').val(''),
	      	                    							$('#fitmentSecondaryVerticalDamperACAttendedBy').val(''),
	      	                    							$('#fitmentLockingPlateActual').val(''),
	      	                    							$('#fitmentLockingPlateAttendedBy').val(''),
	      	                    							$('#PlateShockAbsorberActual').val(''),
	      	                    							$('#PlateShockAbsorberAttendedBy').val(''),
	      	                    							$('#CheckingOfPipeActual').val(''),
	      	                    							$('#CheckingOfPipeAttendedBy').val(''),
	      	                    							$('#CotterSplitedActual').val(''),
	      	                    							$('#CotterSplitedAttendedBy').val(''),
	      	                    							$('#NutBoltScrewTightenedActual').val(''),
	      	                    							$('#NutBoltScrewTightenedAttendedBy').val(''),
	      	                    							$('#WeldingBogieNoActual').val(''),
	      	                    							$('#WeldingBogieNoAttendedBy').val(''),
	      	                    							$('#PaintingCompleteBogieActual').val(''),
	      	                    							$('#PaintingCompleteBogieAttendedBy').val(''),
	      	                    							$('#FitmentPhonicWheelActual').val(''),
	      	                    							$('#FitmentPhonicWheelAttendedBy').val(''),
	      	                    							$('#FitmentBolsterAirPipesActual').val(''),
	      	                    							$('#FitmentBolsterAirPipesAttendedBy').val(''),
	      	                    							$('#FitmentBrakeCylinderAirPipesActual').val(''),
	      	                    							$('#FitmentBrakeCylinderAirPipesAttendedBy').val(''),
	      	                    							$('#BrakeRiggingMovementActual').val(''),
	      	                    							$('#BrakeRiggingMovementAttendedBy').val(''),
	      	                    							$('#bogieFinalItemFitted').val(''),
	      	                    							$('#bogieFinalApplicableWI').val(''),
	      	                    							$('#bogieFinalWeldingThroat').val(''),
	      	                    							$('#bogieFinalWheelBase').val(''),
	      	                    							$('#bogieFinalModifications').val(''),
	      	                    							$('#bogieFinalTrialItems').val(''),
	      	                    							$('#bogieFinalRemarks').val(''),
	      	                    							$('#bogieFinalTestingStatus').val(''),
	      	                    							
	                                                        $('#bogieFinal').dialog('close');	
	    	                    							$('#bogieFinal').find('form[name="bogieFinalSip"]')[0].reset(); 
	    	                    							$('#BogiesetProductionTableContainer').jtable('load');
	    	                    						},
	    	                    						error: function (msg)
	    	                    						{
	    	                    							alert("Error Fetching Data");
	    	                    							$('#bogieFinal').dialog('close');
	    	                    							$('#bogieFinal').find('form[name="bogieFinalSip"]')[0].reset(); 
		    	         									
	    	                    						},
	    		                    		 		});
	    	                                    	
	    	                    						    	   return true;
	    				                                    }
	    	                                    },
	    				                        Close: function () {
	    				                        	$('#bogieFinal').find('form[name="bogieFinalSip"]')[0].reset(); 
	    				                                        $(this).dialog('close');
	    				                                    }
	    	                                    },
	    	                    	        modal: true
	        	                                   });
	                        	 		
	                			    	   return true;
						}
			}
                    	
                    },
				]
	               	},
			actions : {
				
 		 
 		listAction: 'listSIPBogieAction?stageID=<%=stageID%>'
 			
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
				
				bogieAssetId : {
					title : 'bogieAssetId',
					width: '8%',
					key: true,
					list : false,
					edit : false,
					create : false
									
					},
					bogiesetTrxId : {
						title : 'Bogie Production Id',
						width: '8%',
						
						list : true,
						edit : false,
						create : true
										
						},
						
					//left wheel display purpose	
							leftWheelAssetId: {
							title :'First Wheelset Axle No.',
 					display:function(data){
	 						var axleNo;
	 						if(data.record.leftWheelAssetId!=null)
							{
	 						$.ajax({                    
	 							  url: 'descByWheelAxleId',     
	 							  type: 'post', // performing a POST request
	 							  async: false,
								  
	 							  dataType: 'json',
	 								  data : {
										
										  wheelAxleId: data.record.leftWheelAssetId
	 								  	  }									                    
	 						})
	 								.done(function( msg ) {
	 									axleNo=msg.axleNo;
										
	 									//return msg.stageName;																			    											
	 								  })
	 								.error(function (msg){
	 									alert("Error Saving Data");
	 								})
	 								  ;
							
							}
	 						return axleNo;
	 						},
							
							
							list:true,
							create: false,
							edit: false
							},
						
					  
						 
					//right wheel display	
						rightWheelAssetId: {
							title :'Second Wheelset Axle No.',
							list:true,
							display:function(data){
		 						var axleNo;
		 						if(data.record.rightWheelAssetId!=null)
								{
		 						$.ajax({                    
		 							  url: 'descByWheelAxleId',     
		 							  type: 'post', // performing a POST request
		 							  async: false,
									  
		 							  dataType: 'json',
		 								  data : {
											
											  wheelAxleId: data.record.rightWheelAssetId
		 								  	  }									                    
		 						})
		 								.done(function( msg ) {
		 									axleNo=msg.axleNo;
											
		 									//return msg.stageName;																			    											
		 								  })
		 								.error(function (msg){
		 									alert("Error Saving Data");
		 								})
		 								  ;
								}
								
		 						return axleNo;
		 						},
							create: false,
							edit: false
							},
					
							
								productionBy: {
									   title: 'Production By',
									   width : '10%',
										options : { 'InHouse': 'In House', 'FromTrade': 'From Trade' },
										edit : true,
										create: true 
									},			
													
							
				
				
				remarks: {
				   title: 'Remarks',
				   width : '10%',
					type : 'textarea',
					edit : true,
					create: true 
				},
      
			},
			loadingRecords: function(event,data)
			{
				srno=0;
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
					$('#BogiesetProductionTableContainer').jtable('load');
				},
	              
			});
	 $('#LoadRecordsButton').click(function (e) {
         e.preventDefault();
		
$('#BogiesetProductionTableContainer').jtable('load', {datefrom: $('#datepickerfrom').val(),dateto: $('#datepickerto').val()});

	    });
	       $('#LoadRecordsButton').click();
	});
		
		
	</script>
	
