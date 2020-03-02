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
</style>

<body>
<div id="ShellProductionTableContainer"></div>
    <div id="sidewallSIPDialog" style="height:150%; width:600px; display:none;z-index: 9;" >
    <form name="sidewallSip">
<h3 align="center">SELF INSPECTION PROFARMA</h3>
<h6 align="center">SIDE WALL</h6> 
<table>
<tr>
<th>Doc No</th><td colspan="3"><input type="text" name="sidewallSipDocNo" id="sidewallSipDocNo" class='validate[required]'></td><td></td><td></td>
</tr>
<tr>
<th>Shift</th><td><select name="" id="sidewallSipShift" class='validate[required]'>
<option value="">Select</option>
<option value="general">General</option>
<option value="morning">Shift-I</option>
<option value="evening">Shift-II</option>
<option value="night">Shift-III</option>
</select></td>
<th colspan="2">Date of Testing</th><td><input type="text" name="sidewallSipDate" id="sidewallSipDate" class='validate[required]'></td><td></td>
</tr>
<tr>
<th>Side Wall Type (LH/RH/Both)</th><td><select id="sidewallType">
<option value="">Select</option>
<option value="LH">LH</option>
<option value="RH">RH</option>
<option value="Both">Both</option>
</select></td>
<th>Shell No</th><td><input type="text" name="sidewallShellNo" id="sidewallShellNo" readonly/></td>
<th>Shell Type</th><td><input type="text" name="sidewallShellType" id="sidewallShellType" readonly/></td>

</tr>
</table>

<table border="1">
<tr height="">
<th>Activity</th>
<th>Done by MCF/contractor/robotic machine/manual welding/B.O.</th>
<th>Jig no./robotic station(LH/RH)/B.O.</th>
</tr>
<tr>
<th>Frame done</th>
<td><input class="txt" type="text" name="frameworkby" id="frameWorkBy"></td>
<td><input class="txt" type="text" name="framejigroboticsbo" id="frameJigRoboticsBo"></td>
</tr>
<tr>
<th>Spot welding done</th>
<td><input class="txt" type="text" name="spotweldingby" id="spotWeldingBy"></td>
<td><input class="txt" type="text" name="spotweldingjigroboticsbo" id="spotWeldingJigRoboticsBo"></td>
</tr>
<tr>
<th>Interlocking joint welding done</th>
<td><input class="txt" type="text" name="interlockjointby" id="interlockJointBy"></td>
<td><input class="txt" type="text" name="interlockjointjigroboticsbo" id="interlockJointJigRoboticsBo"></td>
</tr>
</table>

<p>1.Applicability:</p>
<table>
<tr>
<td>1</td><td>Applicable Drawing No.</td><td><input type="text" name="ApplicableDrawingNo" id="drawingNo"></td></tr>
<tr><td>2</td><td>Applicable W.I No.(If Any)</td><td><input type="text" name="ApplicableWINo" id="wiNo"></td>
</tr>
</table>


<p>2.Data of Traceability:</p>
<table>
<tr>
<td>1</td>
<td>Side Wall Car line make</td>
<td>(LHside):<input type="text" name="LHside" id="sidewallCarlineMakeLh"></td>
<td>(RHside):<input type="text" name="RHside" id="sidewallCarlineMakeRh"></td>
</tr>
<tr style="margin:5%;">
<td>2</td>
<td>Side Wall complete make and no</td>
<td>(LHside):<input type="text" name="swcmlhside" id="sidewallMakeNoLh"></td>
<td>(RHside):<input type="text" name="ihrhside" id="sidewallMakeNoRh"> </td>
</tr>
</table>


<p>3.Observation:</p>
<table>
<tr>
<td>1</td>
<td>
Items fitted as per Drawing</td><td>
<input type="radio" name="option1" value="ok" id="observationItemAsPerDrawingFlag">OK
<input type="radio" name="option1" value="notok"id="observationItemAsPerDrawingFlag">NOT OK
<input type="radio" name="option1" value="na" id="observationItemAsPerDrawingFlag">NA</td>
</tr>
<tr>
<td>2</td>
<td>
Compliance of applicable W.I</td>
<td>
<input type="radio" name="option3" value="ok" id="observationComplianceWiFlag">OK
<input type="radio" name="option3" value="notok" id="observationComplianceWiFlag">NOT OK
<input type="radio" name="option3" value="na" id="observationComplianceWiFlag">NA</td>
</tr>
<tr>
<td>3</td>
<td>
Welding throat and length as per drawing</td>
<td>
<input type="radio" name="option4" value="ok" id="observationWeldingThoatLengthFlag">OK
<input type="radio" name="option4" value="notok" id="observationWeldingThoatLengthFlag">NOT OK
<input type="radio" name="option4" value="na" id="observationWeldingThoatLengthFlag">NA</td>
</tr>
<tr>
<td>4</td>
<td>
Sheet joint laser welding(visually)</td>
<td>
<input type="radio" name="option5" value="ok" id="observationSheetJointLaserFlag">OK
<input type="radio" name="option5" value="notok" id="observationSheetJointLaserFlag">NOT OK
<input type="radio" name="option5" value="na" id="observationSheetJointLaserFlag">NA</td>
</tr>
<tr>
<td>5</td>
<td>
Side wall sheet torquing before framing work specified-80NM,</td>
<td><input type="text" name="option6" id="observationSidewallSheetTorque" class='validate[custom[integer]]'>
</tr>
<tr>
<td>6</td>
<td>
 side wall frame work as per drg.</td>
<td>
<input type="radio" name="option7" value="ok" id="observationSidewallFrameWorkFlag">OK
<input type="radio" name="option7" value="notok" id="observationSidewallFrameWorkFlag">NOT OK
<input type="radio" name="option7" value="na" id="observationSidewallFrameWorkFlag">NA</td>
</tr>
<tr>



<td>7</td>
<td>
 condition of spot Welding/Manual butt welding of side wall sheet with member</td>
<td>
<input type="radio" name="option8" value="ok" id="observationSidewallConditionSpotWeldingFlag">OK
<input type="radio" name="option8" value="notok" id="observationSidewallConditionSpotWeldingFlag">NOT OK
<input type="radio" name="option8" value="na" id="observationSidewallConditionSpotWeldingFlag">NA</td>
</tr>
<tr>
<td>8</td>
<td>
Horizontal and vertical member joint welding(Robotics/Manual)</td>
<td>
<input type="radio" name="option9" value="ok" id="observationHorizontalVerticalJointWeldingFlag">OK
<input type="radio" name="option9" value="notok" id="observationHorizontalVerticalJointWeldingFlag">NOT OK
<input type="radio" name="option9" value="na" id="observationHorizontalVerticalJointWeldingFlag">NA</td>
</tr>
<tr>
<td>9</td>
<td>
Roof flange joint level</td>
<td>
<input type="radio" name="option10" value="ok" id="observationRoofFlangeJointFlag">OK
<input type="radio" name="option10" value="notok" id="observationRoofFlangeJointFlag">NOT OK
<input type="radio" name="option10" value="na" id="observationRoofFlangeJointFlag">NA</td>
</tr>
</table>


<p>10.side wall complete sheet lenght.</p>
<table border="1">
<tr>
<th>S.No</th>
<th>Type</th>
<th>Specified value</th>
<th colspan="2">observed value</th>
</tr>
<tr>
<td>1</td>
<th>LWACCN/LWACCW/LWSCN/LWFAC</th>
<th>18128#+22</th>
<th>LH side</th>
<th>RH side</th>
</tr>
<tr>
<th>2</th>
<th>LGS</th>
<th>8496#+13</th>
<td rowspan="6"><input class="txt" type="text" name="lhside" id="sidewallSheetLengthLh" class='validate[custom[integer]]' placeholder="ObservationLH"> </td>
<td rowspan="6"><input class="txt" type="text" name="rhside" id="sidewallSheetLengthRh" class='validate[custom[integer]]' placeholder="ObservationRH"></td>
</tr>
<tr>
<th>3</th>
<th>LWLRRM</th>
<th>17471#+20.8</th>
</tr>
<tr>
<th>4</th>
<th>TRC/TRS</th>
<th>17373#+20.8</th>
</tr>
<tr>
<th>5</th>
<th>LDSLR</th>
<th>9511#+6,3495#+4,2260#+12</th>
</tr>
<tr>
<th>6</th>
<th>LBC</th>
<th>18128#+26</th>
</tr>
<tr>
<th>7</th>
<th>LWSCZ(Non AC)</th>
<th>18128#+22.2</th>
</tr>
</table>


<table>
<tr>
<td>11</td>
<td>
Side wall sheet width(specified-1995(+2#))</td>
<td>observed:<input type="text" name="swsw" id="sidewallSheetWidth" class='validate[custom[integer]]'></td>
</tr>
<tr>
<td>12</td>
<td>side wall height from vertical to roof flange top.(specified-1963+2#)</td>
<td>observed:<input type="text" name="swhfvmtrft" id="sidewallHeightVerticalmemberRoofflange" class='validate[custom[integer]]'></td>
</tr>
<tr>
<td>13</td>
<td>Condition of spot welding/manual butt welding of Car line sheet with Car line arch.</td>
<td>
<input type="radio" name="option11" value="ok" id="spotWeldingCarlinearchFlag">OK
<input type="radio" name="option11" value="notok" id="spotWeldingCarlinearchFlag">NOT OK
<input type="radio" name="option11" value="na" id="spotWeldingCarlinearchFlag">NA</td>
</tr>
<tr>
<td>14</td>
<td>Brazing work done Carline with side wall sheet from(outside/Manipulator).</td>
<td>
<input type="radio" name="option12" value="ok" id="brazingCarlineSidewallFlag">OK
<input type="radio" name="option12" value="notok" id="brazingCarlineSidewallFlag">NOT OK
<input type="radio" name="option12" value="na" id="brazingCarlineSidewallFlag">NA</td>
</tr>
<tr>
<td>15</td>
<td>condition of window profile</td>
<td>
<input type="radio" name="option13" value="ok" id="windowProfileFlag">OK
<input type="radio" name="option13" value="notok" id="windowProfileFlag">NOT OK
<input type="radio" name="option13" value="na" id="windowProfileFlag">NA</td>
</tr>
</table>

<p>16.Pull Box distance</p>
<table border="1">
<tr>
<th>S.NO.</th>
<th>Type</th>
<th colspan="2">Specified Value</th>
<th>Observerd Value</th>
</tr>
<tr>
<th rowspan="2">1</th>
<th rowspan="2">LWACCW</th>
<th>PPside</th>
<th>From centre-348,1900x3.1725</th>
<td rowspan="5"><input class="txt" type="text" name="observed4" id="pullBoxDistance"  placeholder="Pull Box" ></td>
</tr>
<tr>
<th>NPP to PP side</th>
<th>From center 1552,1900x3</th>
</tr>
<tr>
<th>2</th>
<th>LWACCN</th>
<th>NPP to PP side</th>
<th>1172.1830x8</th>
</tr>
<tr>
<th rowspan="2">3</th>
<th rowspan="2">LBC</th>
<th>PP side</th>
<th>From centre-348,7672</th>
</tr>
<tr>
<th>NPP side</th>
<th>From centre-4547,8108</th>
</tr>
</table>

<table>
<tr>
<td>17</td>
<td>Window seal joint leakage test (LGS/LSCN)</td>
<td>
<input type="radio" name="option14" value="done" id="windowSealLeakageFlag">DONE
<input type="radio" name="option14" value="nodone" id="windowSealLeakageFlag">NOT DONE</td>
</tr>
<tr>
<td>18</td>
<td>Window sealing angle elevation as per drg.(LSCN/LGS)</td>
<td>
<input type="radio" name="option15" value="ok" id="windowSealAngleFlag">OK
<input type="radio" name="option15" value="notok"id="windowSealAngleFlag">NOT OK
<input type="radio" name="option15" value="na" id="windowSealAngleFlag">NA</td>
</tr>
<tr>
<td>19</td>
<td>Distance between Car line top to vertical member bottom(specified-2383+2#)</td>
<td>observed<input type="text"name="distance" id="distanceCarlinetopVerticalmember" class='validate[custom[integer]]'></td>
</tr>
</table>

<p>20.complete length of side wall car line</p>
<table border="1">
<tr>
<th>S.NO.</th>
<th>type</th>
<th>Specified value</th>
<th colspan="2">observed value</th>
</tr>
<tr>
<th>1</th>
<th>LWACCN</th>
<th>17160#+14</th>
<th>LH side</th>
<th>RH side</th>
</tr>
<tr>
<th>2</th>
<th>LWACCN</th>
<th>18140#+16</th>
<th rowspan="9"><input class="txt" type="text" name="observed5"  id="lengthSidewallCarlineLh" class='validate[custom[integer]]' placeholder="Observation LH"></th>
<th rowspan="9"><input class="txt" type="text" name="observed6" id="lengthSidewallCarlineRh" class='validate[custom[integer]]' placeholder="Observation RH"></th>
</tr>
<tr>
<th>3</th>
<th>LWSCN</th>
<th>18100#+14</th>
</tr>
<tr>
<th>4</th>
<th>LGS</th>
<th>8496#+13</th>
</tr>
<tr>
<th>5</th>
<th>LWLRRM</th>
<th>17463#+10</th>
</tr>
<tr>
<th>6</th>
<th>TRC/TRS</th>
<th>17297.8#+10</th>
</tr>
<tr>
<th>7</th>
<th>LDSLR</th>
<th>5091#+15,3502#+2,2110#+2</th>
</tr>
<tr>
<th>8</th>
<th>LBC</th>
<th>17806#+23.5</th>
</tr>
<tr>
<th>9</th>
<th>LWSCZ(Non AC)</th>
<th>18116+2</th>
</tr>
<tr>
<th>10</th>
<th>LWFAC</th>
<th>18146#+8</th>
</tr>
</table>

<table>
<tr>
<td>21</td>
<td>Car line joint leakage test</td>
<td>
<input type="radio" name="option16" value="nodone"id="carlineLeakageFlag">NOT DONE
<input type="radio" name="option16" value="done"id="carlineLeakageFlag">DONE</td>
</tr>
<tr>
<td>22</td>
<td>Horizontal and vertical member welding joint grinding work</td>
<td>
<input type="radio" name="option17" value="nodone"id=" horizontalVerticalWeldingGrindingFlag">NOT DONE
<input type="radio" name="option17" value="done" id="horizontalVerticalWeldingGrindingFlag">DONE</td>
</tr>
<tr>
<td>23</td>
<td>Distance of Back piece from vertical member for fixing partion frame(LGS/LSCN)</td>
<td></td>
</tr>
<tr>
<td></td>
<td>Transverse side (Specified-511,911,1322,1772/409,527,784,1821)</td>
<td>observed<input type="text" name="transverseside" id="distanceBackpieceVerticalmemberTransverse"></td>
</tr>
<tr>
<td></td>
<td>Single side (Specified-805,1225/572,1072,1439,1552)</td>
<td>observed<input type="text" name="singleside" id="distanceBackpieceVerticalmemberSingle"></td>
</tr>
<tr>
<td>24</td>
<td>Roof flange complete length for LPC(17625 mm)</td>
<td>observed<input type="text" name="rf" id="roofFlangeLength" class='validate[custom[integer]]'></td>
</tr>
<tr>
<td>25</td>
<td>Width of hatched door for LPC (1692mm and 1292mm)</td>
<td>observed<input type="text" name="width" id="widthHatchedDoor" class='validate[custom[integer]]'></td>
</tr>
</table>
<p>26.Berth channel assembly distance from vertical channel</p>
<table border="1">
<tr>
<th>Description</th>
<th>Specified value</th>
<th>Observed</th>
</tr>
<tr>
<th>Lower(LH)</th>
<th><p>LWACCW - 307<br>LWACCN - 307<br>LWFAC - 307<br>LWFACC - 307</p></th>
<td><input class="txt" type="text" name="observed lower LH " id="distanceBerthchannelVerticalchannelLowerLh" class='validate[custom[integer]]' placeholder="Lower LH"></td>
</tr>
<tr>
<th>Middle(LH)</th>
<th><p>LWACCN - 1078</p></th>
<td><input class="txt" type="text" name="observed middle LH" id="distanceBerthchannelVerticalchannelMiddleLh" class='validate[custom[integer]]' placeholder="Middle LH"></td>
</tr>
<tr>
<th>Upper(LH)</th>
<th><p>LWACCW - 1377<br>LWACCN - 1744<br>LWFAC - 1340/1840<br>LWFACC - 1362,1768</p></th>
<td><input class="txt" type="text" name="observed upper LH" id="distanceBerthchannelVerticalchannelUpperLh" class='validate[custom[integer]]' placeholder="Upper LH"></td>
</tr>
<tr>
<th>Lower(RH)</th>
<th><p>LWACCW - 307<br>LWACCN - 307<br>LWFAC - <br>LWAFACC - 307</p></th>
<td><input class="txt" type="text" name="observed lower RH" id="distanceBerthchannelVerticalchannelLowerRh" class='validate[custom[integer]]' placeholder="Lower RH"></td>
</tr>
<tr>
<th>Upper(RH)</th>
<th><p>LWACCW - 1362<br>LWACCN - 1372<br>LWFAC - <br>LWAFACC - 1362</p></th>
<td><input class="txt" type="text" name="observed upper RH" id="distanceBerthchannelVerticalchannelUpperRh" class='validate[custom[integer]]' placeholder="Upper LH"></td>
</tr>
</table>

<table>
<tr>
<td>27</td>
<td>Distance from window center line to angle for window support for wider window in Non AC shell</td>
</tr>
<tr>
<td></td>
<td>Specified value - 170mm/170mm(LH/RH)</td>
<td>observed value<input type="text" name="distance"id="distanceWindowcenterAnglewindowsupport" class='validate[custom[integer]]'></td>
</tr>
<tr>
<td>28</td>
<td>Distance from window edge to channel for window fixing support for wider window in Non AC shell</td>
</tr>
<tr>
<td></td>
<td>Specified  value - 126mm/126mm(TOP/bottom)</td>
<td>observed value<input type="text" name="distance1" id="distanceWindowedgeChannel" class='validate[custom[integer]]'></td>
</tr>
<tr>
<td>29</td>
<td>Height of Car line complete specified value-417mm</td>
<td>observed value<input type="text" name="height" id="heightCarline" class='validate[custom[integer]]'></td>
</tr>
<tr>
<td>30</td>
<td>Complete length of small car line in(LWSCZ(Non AC))specified value -1142mm</td>
<td>observed value<input type="text" name="length" id="lengthSmallcarline" class='validate[custom[integer]]'></td>
</tr>
<tr>
<td>31</td>
<td>Mounting angle for lower luggage rack bkt height from bottom of side wall(in LGS without PRT )</td>
</tr>
<tr>
<td></td>
<td>specified value -1333mm</td>
<td>Observed value<input type="text" name="heightfrombottomofsidewall" id="angleLowerluggageBottomsidewall" class='validate[custom[integer]]'></td>
</tr>
<tr>
<td>32</td>
<td>Distance between angle for honey com PRT to side wall bottom in LSCN(without PRT in shell shop)</td>
</tr>
<tr>
<td></td>
<td>Specified value -465,430,360,640(both end near door side)</td>
<td><input  type="text" name="distance2"id="distanceAnglehoneyprtSidewallDoorside1" class='validate[custom[integer]]'>
<input  type="text" name="distance4"id="distanceAnglehoneyprtSidewallDoorside2" class='validate[custom[integer]]'>
<input  type="text" name="distance5"id="distanceAnglehoneyprtSidewallDoorside3" class='validate[custom[integer]]'>
<input  type="text" name="distance6"id="distanceAnglehoneyprtSidewallDoorside4" class='validate[custom[integer]]'></td>
</tr>
<tr>
<td></td>
<td>Specified value -469,348,360,720(in middle area)</td>
<td><input  type="text" name="distance3" id="distanceAnglehoneyprtSidewallMiddlearea1" class='validate[custom[integer]]'>
<input  type="text" name="distance3" id="distanceAnglehoneyprtSidewallMiddlearea2" class='validate[custom[integer]]'>
<input  type="text" name="distance3" id="distanceAnglehoneyprtSidewallMiddlearea3" class='validate[custom[integer]]'>
<input  type="text" name="distance3" id="distanceAnglehoneyprtSidewallMiddlearea4" class='validate[custom[integer]]'></td>
</tr>
</table>

<p>4.details</p>

<table>
<tr>
<td>1</td>
<td>Details of modification carried out (if any):</td>
<td><input type="text" name="detailsOfModification" id="detailsOfModification"></td>
</tr>
<tr>
<td>2</td>
<td>Details of trial items fitted(if any):</td>
<td><input type="text" name="detailsOfTrailItem"id="detailsOfTrialItem"></td>
</tr>
<tr>
<td>3</td>
<td>Remarks(if any)</td>
<td><input type="text" name="remarks" id="remarks"></td>
</tr>
</table>
<br>
<p align="center"><b>Side wall Testing Status</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="shellSidewallTestingStatus" id="shellSidewallTestingStatus" class='validate[required]'>
<option value="">Select</option>
<option value="Conforming">Conforming</option>
<option value="Not Conforming">Not Conforming</option>
</select></p>
</form>

 </div>
 
  <div id="RoofSIPDialog" style="height:150%; width:200%; display:none;z-index: 9;" >
    <form name="roofSIP">
<h3 align="center">SELF INSPECTION PROFARMA</h3>
<h6 align="center">Roof</h6> 
<table>
<tr>
<th>Doc No</th><td colspan="3"><input type="text" name="roofSipDocNo" id="roofSipDocNo" ></td><td></td><td></td>
</tr>
<tr>
<th>Shift</th><td><select name="" id="roofSipShift">
<option value="">Select</option>
<option value="general">General</option>
<option value="morning">Shift-I</option>
<option value="evening">Shift-II</option>
<option value="night">Shift-III</option>
<option value="">Select</option>
</select></td>
<th colspan="2">Date of Testing</th><td><input type="text" name="roofSipDate" id="roofSipDate"></td><td></td>
</tr>
<tr><td> Roof Type</td><td><input type=text id="roofType" class="validate[required]"></tr>
<tr><td> Roof make and no.(in house/MCF/convector/bought out)</td><td><input type= text id="roofMake" class='validate[required]'></td></tr>
</table>
<ol>


<li>
<b>Applicablility:</b> 
<table>
<tr><td> 1.1 Applicable Drawing No:</td><td><input type=text id="applicableDrawingNo" ></tr>
<tr><td> 1.2 Applicable WI NO(if Any):</td><td><input type= text id="applicableWiNo"></td></tr>
</table>
</li>

<li>
<b>Data of Traceability </b>
<table>

<tr><td>2.1 Machine used for spot weilding </td><td><input type=radio id="machineSpotWeild" value="CNCSpotWeilding">CNC Spot Welding</td> <td><input type=radio id="machineSpotWeild" value="ManualButtWeilding">Manual Butt Weilding</td></tr>

</table>
</li>

<li>
<b>Observations:</b>
<table> <tr><td> 3.1 Items Fitted as per Drawing</td><td>  <input type=radio id="observationItemAsPerDrawing" value="ok">OK &nbsp;<input type=radio id="observationItemAsPerDrawing" value="notok">NOT OK &nbsp<input type= radio id="observationItemAsPerDrawing" value="na"> NA</td></tr>
<tr><td> 3.2 Compliance of applicable WI</td><td>  <input type=radio id="observationComplianceWi" value="ok">OK &nbsp;<input type=radio id="observationComplianceWi" value="notok">NOT OK&nbsp<input type= radio id="observationComplianceWi" value="na"> NA</td></tr>
<tr><td> 3.3 Welding throat & length as per drawing</td><td> <input type=radio id="observationWeildingThroatLength" value="ok">OK &nbsp;<input type=radio id="observationWeildingThroatLength" value="notok">NOT OK &nbsp;<input type= radio id="observationWeildingThroatLength" value="na"> NA </td></tr>
<tr><td>3.4 Checked Dimensions As per Table</td></tr>
</table>
<table border=1>
<tr>
<td>
S.No.
</td>
<td>
Parameter
</td>
<td>
Observation
</td>
</tr>
<tr>
<td>
1
</td>
<td>
Total length of roof complete
{For LWACCN 17160#+14,LWACCW18210#+14,LCSN/LGS/-20360#+18,
LWLRRM-19247#+14,TRC/TRS-19247#+28,LDSLR-20360#+14,
LBAC-18154#+14,LWSCZ(Non AC)-20360#+15}
</td>
<td>
<input type= text id="lengthRoof" class='validate[custom[integer]]' placeholder="roof length">
</td>
</tr>
<tr>
<td>
2
</td>
<td>
Length of roof sheet
{For LWACCN 17140#+14,LWACCW18190#+14,LCSN/LGS20320}#+18,
with tray LWLRRM-19215#+14,TRC/TRS-19215#+28,LDSLR-14766.5
(from NPP to tray area)#+14/627.5#+7.0(from PP to tray area),
LBAC-18126#+28,LWSCZ(Non AC)-20320#+28
</td>
<td>
<input type= text id="lengthRoofsheet" class='validate[custom[integer]]' placeholder="roof sheet length">
</td>
</tr>
<tr>
<td>
3
</td>
<td>
Width of roof complete
{For LWACCN -2786,LWACCW-2798,LCSN/LGS/LWSCZ(Non AC)-2790,
LWLRRM-2798,TRC/TRS-27988,LDSLR-2784,LBAC-2798}
</td>
<td>
<input type= text id=widthRoofsheet class='validate[custom[integer]]' placeholder="roof sheet width">
</td>
</tr>
<tr>
<td>
4
</td>
<td>
Roof arch position from center(towards PP side)
{For LWACCN 613,LWACCW432.7,LCSN745,LGS134.5}#+0.5,
LWLRRM95.5,TRC-22#+.5,TRS-415#+0.5,LDSLR-231.7#+0.5,
LBAC-265#+0.5,LWSCZ(Non AC)-307.3(+0.5#)
</td>
<td>
<input type= text id="roofArchPositionPp" class='validate[custom[integer]]' placeholder="roof arch pp">
</td>
</tr>
<tr>
<td>
5
</td>
<td>
Roof arch position from center(towards NPP side)
{For LWACCN 549,LWACCW633,LCSN751,LGS548}#+0.5,
LWLRRM-235,TRC-128#+0.5,TRS-197.6#+0.5,LDSLR-480.3#+0.5,
LBAC-417#+0.5,LWSCZ(Non AC)-303.7(+0.5#)
</td>
<td>
<input type= text id="roofArchPositionNpp" class='validate[custom[integer]]' placeholder="roof arch npp">
</td>
</tr>
<tr>
<td>
6
</td>
<td>
Final roof arch complete (PP side) from center of coach
{For LWACCN 8580,LWACCW9073,LCSN/LGS10150}#+0.5,
LWLRRM-10140,TRC-10152#+9.5,TRS-10140#+9.5,LDSLR-10150#+5.0,
LBAC-9073#+7,LWSCZ(Non AC)-10150(+7.5#)
</td>
<td>
<input type= text id="roofArchCompletePp" class='validate[custom[integer]]' placeholder="roof arch complete pp">
</td>
</tr>
<tr>
<td>
7
</td>
<td>
Final roof arch complete (NPP side) from center of coach
{For LWACCN 8580,LWACCW9073,LCSN/LGS10150}#+0.5,
LWLRRM-9073,TRC-9063#+8.5,TRS-9077#+9.5,LDSLR-10150#+9.0,
LBAC-9073#+7,LWSCZ(Non AC)-10150(+7.5#)
</td>
<td>
<input type= text id="roofArchCompleteNpp" class='validate[custom[integer]]' placeholder="roof arch complete npp">
</td>
</tr>
<tr>
<td>
8
</td>
<td>
Cross brace height(roof center to top)
{For LWACCN 319,LWACCW301,TRC/TRS301}#+0.5
</td>
<td>
<input type= text id="crossBraceHeight" class='validate[custom[integer]]' placeholder="cross brace height">
</td>
</tr>
<tr>
<td>
9
</td>
<td>
Roof arch width
{For LWACCN,LWACCW,LCSN/LGS/LWSCZ(Non AC)-2765-10#,
LWLRRM-2765,TRC/TRS2765#-10,LDSLR-2765#-10,LBAC-2765#-10}
</td>
<td>
<input type= text id="roofArchWidth" class='validate[custom[integer]]' placeholder="roof arch width">
</td>
</tr>
<tr>
<td>
10
</td>
<td>
Distance between roof center line and fan BKT center
(LSCN/LGS)traverse side and single side respectively-
(20,500,420)/(20,500,460) 
</td>
<td>
<input type= text id="distanceRoofcenterlineFanbkt" placeholder="distance roof centerline fan">
</td>
</tr>
<tr>
<td>
11
</td>
<td>
Distance from the center line of roof and the center line of 
BKT for pillar assembly(traverse side/longitudinal side)
(L3T/LSCN/LGS/L2T)Specified:(383+-3/977+-3),(296+-3/936+-3),
(409.5+-3),(260+-3/900+-3),(mounting plate outer side)
</td>
<td>
<input type= text id="distanceRoofcenterlineCenterlinebkt" placeholder="distance roof centerline bkt">
</td>
</tr>
<tr>
<td>
12
</td>
<td>
Distance from the center line of roof to berth suspension
BKT distance(traverse side/longitudinal side)LSCN
Specified:251,951/927
</td>
<td>
<input type= text id="distanceRoofcenterlineBerthsuspensionbkt" placeholder="distance of roofcenterline berth suspension">
</td>
</tr>
<tr>
<td>
13
</td>
<td>
Tray area length for LDSLR-4886
</td>
<td>
<input type= text id="trayAreaLength" placeholder="tray area">
</td>
</tr>
<tr>
<td>
14
</td>
<td>
Distance from roof center line to fan bkt center at NPP/PP side in
LWSCZ(Non AC)Specifies:623.5,990x8/621.5,990x8
</td>
<td>
<input type= text id="distanceRoofcenterlineFanbktNppPp" placeholder="distance of roof centerline fan npp pp">
</td>
</tr>
<tr>
<td>
15
</td>
<td>
Distance from roof center line to terminal board bkt center at 
NPP/PP side in LWSCZ(Non AC)Specified:2159,1980x2,2012/2159,1980x2,2012
</td>
<td>
<input type= text id="distanceRoofcenterlineTerminalboardbktNppPp" placeholder="distance of roof centerline terminal board npp pp">
</td>
</tr>
<tr>
<td>
16
</td>
<td>
Distance from roof center line ti channel at(LH/RH)side in LWSCZ(Non AC)
Specified:359/359,128/128
</td>
<td>
<input type= text id="distanceRoofcenterlineChannelLhRh" placeholder="distance of roofcenterline channnel lh rh">
</td>
</tr>
<tr>
<td>
17
</td>
<td>
Cross brace supporting bracket distance(L3T/L2T,LWFAC,LBAC)(111/1500)
</td>
<td>
<input type= text id="distanceCrossBraceBracket" placeholder="distance of roof brace bracket">
</td>
</tr>

</table>
<table>
<tr><td>3.5 Checked Dimensions Remarks</td><td> <input type=text id="checkedDimensionRemark" ></td></tr>
<tr><td>3.6 Distance from center line of roof and the center line of 
             FL BKTS(traverse side/longitudinal side)Specified:(829,790)(LSCN)</td><td>Observed<input type=text id="distanceCenterlineroofCenterlineflbkts" ></td></tr>
<tr><td>3.7 Condition of roof sheet joint(lateral &longitudinal welding)(robotic/manual)</td><td> <input type=radio id="conditionRoofSheetJoint" value="ok">OK &nbsp;<input type=radio id="conditionRoofSheetJoint" value="notok">NOT OK &nbsp<input type= radio id="conditionRoofSheetJoint" value="na"> NA</td></tr>
<tr><td>3.8 Roof sheet joint leakage test</td><td><input type=radio id="roofSheetJointLeakage" value="done"> Done &nbsp; &nbsp; <input type=radio id="roofSheetJointLeakage" value="notdone">Not Done</td></tr>
<tr><td>3.9 Condition of roof sheet with roof arch(Spot/manual butt)weilding )</td><td> <input type=radio id="conditionRoofSheetArch" value="ok">OK &nbsp;<input type=radio id="conditionRoofSheetArch" value="notok">NOT OK &nbsp;<input type= radio id="conditionRoofSheetArch" value="na"> NA</td></tr>
<tr><td>3.10 Distance from the center line of roof and the center line of 
              EL&NL bkts Specified:576790.(LSCN)/FL bkt Specified:849(LGS) </td><td>Observed<input type= text id="distanceRoofcenterlineCenterlineelbkt" class='validate[required]'></td></tr>
<tr><td>3.11 Fitment of Standard L-Stiffner </td><td> <input type=radio id="fittmentLstiffener" value="ok">OK &nbsp<input type=radio id="fittmentLstiffener" value="notok">NOT OK &nbsp<input type= radio id="fittmentLstiffener" value="na"> NA</td></tr>
<tr><td>3.12 Distance from roof center line to speaker bkt center in LGS specified value-625mm</td><td>observed <input type=text id="distanceRoofcenterlineSpeakerbkt" ></td></tr>
<tr><td>3.13 Distance from roof center line to EL bkt center in LGS specified value=712mm </td><td>Observed <input type=text id="distanceRoofcenterlineElbkt"></td></tr>
<tr><td>3.14 Total no. of cross braces fitted in roof</td><td>Total no.<input type=text id="noCrossBracesFitted" ></td></tr>
</table>
</li>
<li>
<b>Details:</b>
<table>
<tr><td>4.1 Details of modification carried out(if any):</td><td><input type=text id="detailsOfModification"></td></tr>
<tr><td>4.2 Details of trial items fitted(if any) </td><td><input type=text id="detailsOfTrial"></td></tr>
<tr><td>4.3 Remarks(if any)</td><td><input type=text id="remarks"></td></tr>
</table>
</li>
<li>
<b>Final Decision</b>
<table>
<tr><td></td><td> <input type=radio id="shellRoofSipTestingStatus" value="Confirming">Conforming <input type=radio id="shellRoofSipTestingStatus" value="Not Comfirming">Not Conforming</td></tr>

</table>
</li>

</ol>
</form>
 </div>

<div id="UnderframeSIPDialog" style="height:150%; width:200%; display:none;z-index: 9;" >
<h3 align="center">SELF INSPECTION PROFARMA</h3>
<h6 align="center">UNDERFRAME</h6> 
 <form name="underframeSIP">
<table>
<tr><td>&nbsp; &nbsp; DOC No:</td><td  colspan=2><input type=text style="width:200px;" name="underframe_docNo" id="underframeDocNo" class='validate[required]' ></td>
</tr>
<tr></tr>
<tr><td>&nbsp; &nbsp; &nbsp;SHIFT</td><td>
<select name="underframeShiftSelect" id="underframeShiftSelect" >
<option value="none">Select</option>
<option value="general">General</option>
<option value="shift-I">Shift-I</option>
<option value="Shift-II">Shift-II</option>
<option value="Shift-III">Shift-III</option>
</select></td><td></td>
<td> DATE</td><td><input type=text name="underframeDate" id="underframeDate"></td>
</tr>
<tr>
	<td>&nbsp; &nbsp; &nbsp; SHELL TYPE</td>
	<td><input type=text id="shellType"></td>
	<td></td>
	<td>SHELL NO.</td>
	<td><input type=text id="shellNo"></td>
</tr>
</table> 
<ol type="1">
<li>
<b>Applicablility:</b> 
<table>
<tr>
	<td> 1.1 Applicable Drawing No:</td>
	<td><input type=text id="appDrawNoUnderframe" name="appDrawNoUnderframe" class='validate[required]' placeholder="Enter value" >
	</tr>
<tr>
	<td> 1.2 Applicable Line number:</td>
	<td><input type=text id="appLineNoUnderframe" name="appLineNoUnderframe" class='validate[required]' placeholder="Enter value" ></td>
	</tr>
<tr>
	<td> 1.3 Applicable WI NO(if Any):</td>
	<td><input type=text id="appWiNoUnderframe" name="appWiNoUnderframe" placeholder="Enter value" ></td>
	</tr>

</table>
</li>

<li>
<b>Data of Traceability </b>
<table>
<tr>
	<td width=20%>2.1 Front part make and no </td>
	<td width=10% align=right>PP side</td>
	<td><input type=text id="frntPrtPp"  class='validate[required]' placeholder="Enter value" ></td>
	<td width=10% align=right>NPP side</td>
	<td><input type=text id="frntPrtNpp" class='validate[required]' placeholder="Enter value"></td>
</tr>
<tr>
	<td colspan="2">2.2 Water tank BKT Make and No</td>
	<td colspan="3"><input type=text id="waterTankBkt1"class='validate[required]' placeholder="1st Water Tank" />&nbsp;&nbsp;&nbsp;&nbsp;
	<input type=text id="waterTankBkt2"class='validate[required]' placeholder="2nd Water Tank"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input type=text id="waterTankBkt3"class='validate[required]' placeholder="3rd Water Tank"/>&nbsp;&nbsp;&nbsp;&nbsp;
    <input type=text id="waterTankBkt4"class='validate[required]' placeholder="4th Water Tank"/></td>
</tr>
<tr>
	<td>2.3 CBC Make and no</td>
	<td align=right>PP side</td>
	<td><input type=text id="cbCMakePp1" class='validate[required]' placeholder="Enter make"/>&nbsp;&nbsp;&nbsp;&nbsp;
	<input type=text id="cbCMakePp2" class='validate[required]' placeholder="Enter no."></td>
	<td align=right>NPP side</td>
	<td><input type=text id="cbCMakeNpp1" class='validate[required]' placeholder="Enter make"/>&nbsp;&nbsp;&nbsp;&nbsp; 
	<input type=text id="cbCMakeNpp2" class='validate[required]' placeholder="Enter no" /></td>
	</tr>
<tr>
	<td>2.4 CBC Fitted by </td>
	<td align="right">PP side</td>
	<td><input type=text id="cbCFitPp" class='validate[required]' placeholder="Enter value" ></td>
	<td align="right">NPP side</td>
	<td><input type= text id="cbCFitNpp" class='validate[required]' placeholder="Enter value" ></td>
	</tr>
<tr>
	<td colspan="2">2.5 Under Frame complete make and no</td>
	<td colspan=3><input type=text id="underframeMakeNo" class='validate[required]'></td>
</tr>
</table>
</li>
<li>
<b>Observations:</b>
<table>
 <tr>
 <td>3.1 Items Fitted as per Drawing</td>
 <td><input type=radio id="itemsFitted" name="itemsFitted" value="OK" >OK &nbsp; <input type=radio id="itemsFitted" name="itemsFitted" value="NOT OK" > NOT OK &nbsp; <input type= radio name="itemsFitted" id="itemsFitted" value="NA" > NA</td>
 </tr>
<tr>
	<td> 3.2 Compliance of applicable WI</td>
	<td> <input type=radio id="compAppWi" name="compAppWi" value="OK" >OK &nbsp; <input type=radio id="compAppWi" name="compAppWi" value="NOT OK" >NOT OK &nbsp; <input type= radio id="compAppWi" name="compAppWi"  value="NA" > NA</td>
</tr>
<tr>
	<td> 3.3 Welding throat & length as per drawing</td>
	<td> <input type=radio id="weldThroatLen" name="weldThroatLen" value="OK" >OK &nbsp; <input type=radio id="weldThroatLen" name="weldThroatLen" value="NOT OK" >NOT OK &nbsp; <input type= radio id="weldThroatLen" name="weldThroatLen" value="NA" > NA </td>
	</tr>
<tr>
	<td>3.4 Proper Tightening of screws of CBC's support device with lock tight(torque 500/50NM)</td>
	<td> <input type=radio id="tightScrew" name="tightScrew" value="OK" >OK &nbsp; <input type=radio id="tightScrew" name="tightScrew" value="NOT OK" >NOT OK &nbsp;<input type= radio id="tightScrew" name="tightScrew" value="NA" > NA</td>
</tr>
<tr>
	<td>3.5 Outer face of outer head stock level have checked with plume line and found</td>
	<td><input type=radio id="outerFaceOuterHead" name="outerFaceOuterHead" value="OK" >OK &nbsp; <input type=radio id="outerFaceOuterHead" name="outerFaceOuterHead" value="NOT OK" >NOT OK &nbsp; <input type= radio id="outerFaceOuterHead" name="outerFaceOuterHead" value="NA" > NA</td>
</tr>
<tr>
	<td>3.6 Condition of Plug welding with trough sheet &cross member</td>
	<td> <input type=radio id="conditionOfPlugWelding" name="conditionOfPlugWelding" value="OK" >OK &nbsp;<input type=radio id="conditionOfPlugWelding" name="conditionOfPlugWelding" value="NOT OK" >NOT OK &nbsp; <input type= radio id="conditionOfPlugWelding" name="conditionOfPlugWelding" value="NA" > NA</td>
</tr>
<tr>
	<td>3.7 Condition of console with sole bar welding</td>
	<td> <input type=radio id="conditionOfConsole" name="conditionOfConsole" value="OK" >OK &nbsp; <input type=radio  id="conditionOfConsole" name="conditionOfConsole" value="NOT OK" >NOT OK &nbsp; <input type= radio  id="conditionOfConsole" name="conditionOfConsole" value="NA" > NA</td>
</tr>
<tr>
	<td>3.8 Distance between centers of body bolster(14900+10/-0mm for LHB type coaches)&nbsp; &nbsp; </td>
	<td>Observed<input type=text id="bodyBolster" class='validate[required,custom[integer]]' placeholder="Enter value" ></td>
	</tr>
<tr>
	<td>3.9 Complete length of under frame: Specified 23440mm+-16  </td>
	<td>Observed<input type= text id="completeLenUndeframe" class='validate[required,custom[integer]]' placeholder="Enter value" ></td>
</tr>
<tr>
	<td>3.10 Front part to Front part length: Specified-22700mm+-16 </td>
	<td>Observed<input type= text id="frntPartToFront"class='validate[required,custom[integer]]' placeholder="Enter value" ></td>
	</tr>
<tr>
	<td>3.11 U/F Width outside :Specified 3236 (-8, +0) </td>
	<td> Observed<input type=text id="ufWidth"class='validate[required,custom[integer]]' placeholder="Enter value" ></td>
</tr>
<tr>
<td>3.12 Covering plate torquing  Specified :200+20 NM</td>
	<td>Observed <input type=text id="coveringPlate"class='validate[required,custom[integer]]' placeholder="Enter value" ></td>
</tr>
<tr>
	<td>3.13 Wedge bolt torquing Specified:</td>
	<td>Observed&nbsp;&nbsp;&nbsp;&nbsp;<input type=text id="wedgeBolt" class='validate[required,custom[integer]]' placeholder="Enter value" ></td>
</tr>
<tr>
	<td>3.14 Water tank mounting BKT welding</td>
	<td><input type=radio id="waterTankMount" name="waterTankMount" value="OK" >OK &nbsp; &nbsp; <input type=radio id="waterTankMount" name="waterTankMount" value="NOT OK" >NOT OK &nbsp;; <input type= radio id="waterTankMount"  name="waterTankMount" value="NA" > NA</td>
</tr>
<tr>
	<td>3.15 Front part both side bracket distances. Specified: 15mm from vestibule plate </td>
	<td> Observed<input type=text id="frntPartBrktDist" class='validate[required,custom[integer]]' placeholder="Enter value" ></td>
</tr>
<tr>
	<td>3.16 Distance between Console bracket and center of hub. Specified :15mm from vestibule plate </td>
	<td>Observed<input type=text id="distBwConsoleBrkt" class='validate[required,custom[integer]]' placeholder="Enter value" ></td>
</tr>
<tr>
	<td>3.17 Foot steps bracket distance Specified- 710mm</td>
	<td>Observed<input type= text id="footStepsDist"class='validate[required,custom[integer]]' placeholder="Enter value" ></td>
</tr>
<tr>
	<td>3.18 Supporting member with trough sheet welding</td>
	<td><input type=radio id="suppMemTrough" name="suppMemTrough" value="OK" >OK &nbsp; <input type=radio id="suppMemTrough" name="suppMemTrough" value="NOT OK" >NOT OK &nbsp; <input type= radio id="suppMemTrough"  name="suppMemTrough" value="NA" > NA</td>
</tr>
<tr>
	<td>3.19 Pillar mounting channel assembly with trough sheet welding</td>
	<td><input type=radio id="pillarMountChannel" name="pillarMountChannel" value="OK" >OK &nbsp; <input type=radio id="pillarMountChannel" name="pillarMountChannel" value="NOT OK" >NOT OK &nbsp; <input type= radio id="pillarMountChannel" name="pillarMountChannel" value="NA" > NA</td>
</tr>
<tr>
	<td>3.20 Distance between curved roll bracket and center of hub. Specified 1470+-2mm</td>
	<td>Observed<input type= text id="distBwCurvedRoll"class='validate[required,custom[integer]]' placeholder="Enter value" ></td>
</tr>
<tr>
	<td>3.21 Grind the welded joints. remove the extra weld materials for proper finish and leveling</td>
	<td><input type=radio id="grindWeldJoints" name="grindWeldJoints" value="DONE" >Done &nbsp; <input type=radio id="grindWeldJoints" name="grindWeldJoints" value="NOT DONE" > NOT Done</td>
</tr>
<tr>
	<td>3.22 Holes for draining of water 10mm diameter in trough floor corugated sheet provided as per drg. </td>
	<td><input type=radio id="holesForDrawing" name="holesForDrawing" value="Done" >Done &nbsp;<input type=radio id="holesForDrawing" name="holesForDrawing" value="Not done" > NOT Done</td>
</tr>
<tr>
	<td>3.23 Holes drilled in under frame for mounting the brake pipes and under slung equipments as per drg. </td>
	<td><input type=radio id="holesDrilled" name="holesDrilled" value="DONE" >Done &nbsp; <input type=radio id="holesDrilled" name="holesDrilled" value="NOT DONE" > NOT Done</td>
</tr>
<tr>
	<td>3.24 Distance between member complete center to center:1016+-(for Power car)</td>
	<td>Observed<input type=text id="distBwCenterCenter"class='validate[required]'></td>
</tr>
<tr>
	<td>3.25 Door fixing bracket level and distance(820+-3)</td>
	<td><input type=radio id="doorFixBrkt" name="doorFixBrkt" value="OK" >OK &nbsp;<input type=radio id="doorFixBrkt" name="doorFixBrkt" value="NOT OK" >NOT OK &nbsp;<input type= radio id="doorFixBrkt" name="doorFixBrkt" value="NA" > NA
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Observed<input type=text id="doorFixBrktOb" class='validate[required,custom[integer]]'></td>
</tr>
<tr>
	<td>3.26 Fitment dimension of biological tank bracket and welding conduction:</td>
	<td><input type=radio id="fitmentDimenBiotank" name="fitmentDimenBiotank" value="OK" >OK &nbsp; <input type=radio id="fitmentDimenBiotank" name="fitmentDimenBiotank" value="NOT OK" >NOT OK &nbsp;<input type= radio id="fitmentDimenBiotank" name="fitmentDimenBiotank" value="NA" > NA</td>
</tr>
<tr>
	<td rowspan="2">&nbsp; &nbsp; &nbsp; (a) Longitudial distance between brackets to brackets : Specified 1581</td>
	<td>(PP SIDE) Observed &nbsp; &nbsp;<input type=text id="longDistBrktBrktpp" class='validate[required,custom[integer]]'/></td>
</tr>
<tr>
	<td>(NPP SIDE) Observed&nbsp; &nbsp;<input type=text id="longDistBrktBrktnpp" class='validate[required,custom[integer]]' placeholder="Enter value" ></td>
</tr>
<tr>
<td rowspan="2">&nbsp; &nbsp; &nbsp; (b) Lateral distance between brackets to front part center : Specified 995/851</td>
<td>(PP SIDE) Observed &nbsp; &nbsp;<input type=text id="latDistBrktFrntpp" class='validate[required,custom[integer]]' placeholder="Enter value"  ></td>
</tr>
<tr>
<td>(PP SIDE) Observed &nbsp; &nbsp;<input type=text id="latDistBrktFrntnpp" class='validate[required,custom[integer]]' placeholder="Enter value"  ></td>
</tr>

<tr>
<td>&nbsp; &nbsp; &nbsp; (c) Bio tank hole distance in LDSLR and LPC(Longitudnal x lateral):Specified(817*481/575)</td>
<td>Observed &nbsp; &nbsp;<input type=text id="bioTankHoleDist" class='validate[required]' placeholder="Enter value" ></td>
</tr>

<tr>
	<td>3.27 Fuel tank mounting bkt. Distance center to center: Long 956+-0.5,lat 878+-0.5,1760+-1 (for LPC)</td>
	<td> Observed Value<input type=text id="distCenCen" class='validate[required]' placeholder="Enter value" ></td> 
</tr>
<tr>
	<td>3.28 Fir TRC/TRS, gap between Generator mounting screwing piece centre(1st distance from front part head stock) 840,479,642,479</td>
	<td> Observed Value<input type=text id="genMmountScrew1" class='validate[required]' placeholder="Enter value" ></td> 
</tr>
<tr>
	<td>3.29 For TRC/TRS, gap between Generator mounting screwing piece centre 479*4</td>
	<td> Observed Value<input type=text id="genMmountScrew2" class='validate[required]' placeholder="Enter value" ></td> 
</tr>
<tr>
	<td>3.30 CBC uncoupling device hole</td>
	<td><input type= radio id="cbcUncoup" name="cbcUncoup" value="provided" >Provided<input type= radio id="cbcUncoup" name="cbcUncoup" value="not provided" >not Provided</td>
</tr>
<tr>
	<td>3.31 Transformer mounting distance outer to outer hole(BxL)&diagonal(508x706/Should be equal)</td>
	<td>Observed Value<input type=text id="transfMount" class='validate[required]' placeholder="Enter value" ></td>
</tr>
<tr>
	<td>3.32 Battery Box mounting distance outer to outer hole(BxL)&diagonal(L2T,L3T/LSCN,LGS)315x1460/500x2061.Should be equal</td>
	<td>Observed Value<input type=text id="batteryBox" class='validate[required]' placeholder="Enter value" ></td>
</tr>
<tr>
	<td>3.33 Air brake module mounting distance outer to outer hole(BxL) & diagonal(810x1460/should be equal)</td>
	<td>Observed Value<input type=text id="airBrakeModule" class='validate[required]' placeholder="Enter value" ></td>
</tr>
<tr>
	<td rowspan="2">3.34 Guide distance (Longitudinal/Lateral)1951+-1.5/483+-1</td>
	<td>PP side Observed Value &nbsp;&nbsp;<input type=text id="guideDistPP" class='validate[required]' placeholder="Enter value"/></td>
	</tr>
	<tr>
	<td>NPP side Observed Value &nbsp;&nbsp;<input type=text   id="guideDistNPP" class='validate[required]' placeholder="Enter value"/></td>
   </tr>
<tr>
	<td>3.35 Twine pipe hole and BKT(50mm/OK/NOT OK)</td>
	<td>Observed Value<input type=text id="twinePipHoleObs"class='validate[required]' placeholder="Enter value"/></td>
</tr>
<tr>
<td>3,36 Fiba bkt for Under frame air spring bogie</td>
<td><input type=radio id="fibaBktAirPro" name="fibaBktAirPro" value="PROVIDED" >Provided <input type=radio id="fibaBktAirPro" name="fibaBktAirPro" value="NOT PROVIDED" >not provided</td>
</tr>
<tr>
	<td>3.37 Rservoir tank holding bkt for under frame air spring boige</td>
	<td><input type=radio id="reserBktAirPro" name="reserBktAirPro" value="Provided" >Provided <input type=radio id="reserBktAirPro" name="reserBktAirPro" value="not provided" >not provided</td>
</tr>
<tr>
	<th colspan="2">3.38 Cross member distance from under frame center line</th>
</tr>
</table>

<table border="1">
<tr>
	<td rowspan="3" align="center">Type</td>
	<th colspan=4 align="center">Cross member distance from under frame center line</th>
</tr>
<tr>
	<td rowspan=2 colspan=2 align="center">Specified value</td>
	<td colspan=2 align="center">Observed value</td>
</tr>
<tr>
	<td align="center">PP</td><td align="center">NPP</td>
</tr>

<tr>
	<td rowspan=2><b>L3T/L2T<br>LBC/LWFAC</b></td>
	<td>NPP</td><td>555+-3,1035+-4,1795+-4,2255+-6,3035+-6,3795+-6,<br>4555+-8,5035+-8,5515+-8,6360+-8</td>
	<td rowspan="12" valign="middle">
	<input type=text id="distanceCrossMemberpp1" class='validate[custom[integer]]' placeholder="Enter 1st Value"/>
	<input type=text id="distanceCrossMemberpp2" class='validate[custom[integer]]' placeholder="Enter 2nd Value"/>
	<input type=text id="distanceCrossMemberpp3" class='validate[custom[integer]]' placeholder="Enter 3rd Value"/>
	<input type=text id="distanceCrossMemberpp4" class='validate[custom[integer]]' placeholder="Enter 4th Value"/>
	<input type=text id="distanceCrossMemberpp5" class='validate[custom[integer]]' placeholder="Enter 5th Value"/>
	<input type=text id="distanceCrossMemberpp6" class='validate[custom[integer]]' placeholder="Enter 6th Value"/>
	<input type=text id="distanceCrossMemberpp7" class='validate[custom[integer]]' placeholder="Enter 7th Value"/>
	<input type=text id="distanceCrossMemberpp8" class='validate[custom[integer]]' placeholder="Enter 8th Value"/>
	<input type=text id="distanceCrossMemberpp9" class='validate[custom[integer]]' placeholder="Enter 9th Value"/>
	<input type=text id="distanceCrossMemberpp10" class='validate[custom[integer]]' placeholder="Enter 10th Value"/>
	</td>
	<td rowspan="12" valign="middle">
	<input type=text id="distanceCrossMembernpp1" class='validate[custom[integer]]' placeholder="Enter 1st Value"/>
	<input type=text id="distanceCrossMembernpp2" class='validate[custom[integer]]' placeholder="Enter 2nd Value"/>
	<input type=text id="distanceCrossMembernpp3" class='validate[custom[integer]]' placeholder="Enter 3rd Value"/>
	<input type=text id="distanceCrossMembernpp4" class='validate[custom[integer]]' placeholder="Enter 4th Value"/>
	<input type=text id="distanceCrossMembernpp5" class='validate[custom[integer]]' placeholder="Enter 5th Value"/>
	<input type=text id="distanceCrossMembernpp6" class='validate[custom[integer]]' placeholder="Enter 6th Value"/>
	<input type=text id="distanceCrossMembernpp7" class='validate[custom[integer]]' placeholder="Enter 7th Value"/>
	<input type=text id="distanceCrossMembernpp8" class='validate[custom[integer]]' placeholder="Enter 8th Value"/>
	<input type=text id="distanceCrossMembernpp9" class='validate[custom[integer]]' placeholder="Enter 9th Value"/>
	<input type=text id="distanceCrossMembernpp10" class='validate[custom[integer]]' placeholder="Enter 10th Value"/>
	</td>
</tr>
<tr>
	<td>PP</td>
	<td>205+-2,965+-3,1445+-4,2205+-6,2965+-6,3445+-6,<br>4205+-8,4965+-8,6360+-8</td>
</tr>

<tr>
	<td rowspan=2><b>LSCN/LWSCZ<br>Non AC</b></td>
	<td>NPP</td>
	<td>205+-2,965+-3,1445+-4,2205+-6,2965+-6,3445+-6,<br>4205+-8,4965+-8,6360+-8</td>
</tr>
<tr>
	<td>PP</td>
	<td>555+-3,1035+-4,1795+-4,2255+-6,3035+-6,3795+-6,<br>4555+-8,5035+-8,5515+-8,6360+-8</td>
	
</tr>

<tr>
	<td rowspan=2><b>LGS</b></td>
	<td>NPP</td>
	<td>412.5+-3750+-3,1795+-4,2255+-6,3035+-6,3795+-6,<br>4555+8,5035+-8,5515+-8,6360+-8</td>
</tr>
<tr>
	<td>PP</td>
	<td>412.5+-3750+-3,1510+-4,1990+-42750+-6,3510+-6,3990+-6,<br>4750+-8,5035+-8,5515+-8,6360+-8</td>
</tr> 

<tr>
	<td rowspan=2><b>LRRM</b></td><td>NPP</td>
	<td>237.5+-2,766+-3,1372.6+-4,1889.2+-4,2466+-6,2866+-6,<br>3571+-6,4166+-8,4721+-8,5225.5+-8,5730+-8,6360+-8</td>
	
</tr>
<tr>
	<td>PP</td>
	<td>318+-2,755+-3,1251.2+-4,1807.5+-4,2336+-6,2942.6+-6,<br>3429.4+-6,4036+-8,4436+-8,5116+-8,5730+-8,6360+_8</td>
	
</tr>

<tr>
	<td rowspan=2><b>TRC/TRS</b></td>
	<td>NPP</td><td>251+-2,1011+-4,1711+-4,2385+-6,3080+-6,3840+-6,4322+-8,<br>5082+-8,5515+-8,6360+-8</td>
</tr>
<tr>
	<td>PP</td>
	<td>299+-2,989+-3,1821+-4,2427+.5+-6,2985+-6,3735+-8,4339+-8,<br>5045+-8,5515+-8,6360+-8</td>
</tr>

<tr>
	<td rowspan=2><b>LDSLR</b></td><td>NPP</td>
	<td>329+-2,881+-3,1372+-4,1664+-4,2215+-6,3012+-6,3522+-6,<br>4517+-8,5067+-8,5716+-8,6360+-8</td>
	</tr>
<tr>
	<td>PP</td>
	<td>366+-2,950+-31589+_4,2250+-4,2600+-4,3050+-6,3850+-6,<br>4250+-8,4605+-8,5175+-8,5445+-86360+-8</td>
</tr>
</table>

<br>
<br>
<p align="center">3.36 Distance between U/F Pillar mounting channel assembly on trough sheet</p>

<table cellspacing="0" cellpadding="0" border=1 width=100% height=100%>
<tr>
	<td width=10%><b>Type</b></td>
	<td width=60%><b>Specified value(mm)</b></td>
	<td width=30%><b>Observed value</b></td>
</tr>
<tr>
	<td><b>LSCN</b></td>
	<td>Center to PP/NPPsside -1800*11.<br> Lateral Distance -639(between both pillar center line).<br> Without PRT-702</td>
	<td rowspan=15 valign="middle"><input type=text size="60" id="obserVal" class='validate[required]' placeholder="Enter value" > <td>
</tr>
<tr>
	<td><b>LWACCN</b></td>
	<td>(a)center to PPside 625,1830*3,1840,1130<br>(b)NPP side 1205, 1830*3,1840,550<br>Lateral distance -695(between both pillar center line)</td>
</tr>
<tr>
	<td><b>LWACCW</b></td>
	<td>NPP side ddor cut out to PPside -770,1900*9<br>Lateral distance-640(between both pillar center line)</td>
</tr>
<tr>
	<td rowspan=3><b>LWACCW</b></td>
	<td>Longitudnal side(PP to NPP)-2405,1745,2405,1745,1745,2405,1745,2405</td>
</tr>
<tr>
	<td>Lateral from center lie -1st-467/IIend-735(between-268mm)</td>
</tr>
<tr>
	<td><b>Pillar mounting for door support</b><br>Longitudnal side-576,572,607,580,572,532,530,580,572,534,580,572(PP to NPP)<br>Lateral distance from center line-700</td>
</tr>
<tr>
	<td rowspan=2><b>LWFAC Composite</b></td>
	<td><b>Pillar mounting distance(AC2T)</b><br>Longitudnal side-1900,1900,1900,1900<br>Lateral distance-640(between both pillar center line)</td>
</tr>
<tr>
	<td><b>Pillar mounting distance(LFAC)</b><br>Longitudnal side-from center line 898,2420,1730,2420<br>Lateral frm center line-1st-467/IIend-735(between-268mm)</td>
</tr>
<tr>
	<td><b>LGS</b></td>
	<td>Distance between U/FCenter line and Pillar mounting Bracket on trough sheet<br>Specified-561 and 1702*5 PP& NPP side<br>Lateral distance-705(between both pillar center line)<br>Without PRT-766</td>
</tr>
<tr>
	<td><b>LWRRM</b></td>
	<td>Distance between mounting plate for Generator, Specified-1022+-2 & 1459+-2</td>
</tr>
<tr>
	<td><b>TRC</b></td><td>Distance from lateral center line  (NPP-PP)722*7,467,309</td>
</tr>
<tr>
	<td><b>Staff car</b></td><td>Distance from lateral center line  (NPP-PP)736*9,470*4</td>
</tr> 
<tr>
	<td><b>LDSLR</b></td>
	<td>Distance between U/F door center line and pillar mounting center bracket on trough sheet Specified-561 abd 421,1702*2,1688,867,3998,6285 PP& NPP side</td>
</tr>
<tr>
	<td><b>LBCA</b></td>
	<td>Distance from lateral center line(PP-NPP)7195,5362<br>Distance from lateral center line(PP-NPP)735/1031</td>
</tr>
<tr>
	<td><b>LWSCZ NONAC</b></td>
	<td>Distance from lateral center line to NPP side for chair mounting member -578,990*8 & PP side -578,990*8<br>Distance from longitudnal center line(LH & RH side for chair mounting member)-534.5,1249.5</td>
</tr>
</table>
</li>
</ol>

<table style="align:center;">
<tr>
	<td>4.1 Details of modification carried out(if any):</td>
	<td><textarea id="detlOfModf" placeholder="Enter Modification, if any"></textarea></td>
</tr>
<tr>
	<td>4.2 Details of trials of items fitted(if any):</td>
	<td><textarea id="detlOfTrialItems" placeholder="Enter Trial item, if any"></textarea></td>
</tr>
<tr>
	<td>4.3 Remarks(if any):</td>
	<td><input type=text id="rmk" placeholder="Enter remarks, if any" ></td>
</tr>
</table>
<table>
<tr align="center"><td>Testing Status</td>
<td> 
<input type=radio id="shellUnderframeSipTestingStatus"  name="shellUnderframeSipTestingStatus" value="NA">NA 
<input type=radio id="shellUnderframeSipTestingStatus" name="shellUnderframeSipTestingStatus" value="Confirming">Conforming 
<input type=radio id="shellUnderframeSipTestingStatus" name="shellUnderframeSipTestingStatus" value="Not Comfirming">Not Conforming
</td></tr>

</table>
</form>
</div>

<div id="lavsidewallSIP" style="height:150%; width:200%; display:none;z-index: 9;" >
    <h3 align="center">SELF INSPECTION PROFARMA</h3>
<h6 align="center">LAV SIDE WALL</h6>
<form name="lavSidewallForm">
<table>
<tr>
<th>Doc No</th><td colspan="3"><input type="text" name="lavsidewallSipDocNo" id="lavsidewallSipDocNo" class='validate[required]'></td><td></td><td></td>
</tr>
<tr>
<th>Shift</th><td><select  name="lavsidewallSipShift" id="lavsidewallSipShift" class='validate[required]'>
<option value="">Select</option>
<option value="general">General</option>
<option value="morning">Shift-I</option>
<option value="evening">Shift-II</option>
<option value="night">Shift-III</option>

</select></td>
<th colspan="2">Date of Testing</th><td><input type="text" name="lavsidewallSipDate" id="lavsidewallSipDate" class='validate[required]'></td><td></td>
</tr>
<tr>
<th>LavSidewall Type</th><td><input type="text" name="lavsidewallShellType" id="lavsidewallShellType"></td>
<th>LavSidewall No</th><td><input type="text" name="lavsidewallNo" id="lavsidewallNo" class='validate[required]'></td>
</tr>

</table>
<table border="1" style="border-collapse: collapse;">
<tr>
<th rowspan="2">Activity</th>
<th colspan="4">Done by /MCF contractor robotic machine/manual weldin/B.O</th>
<th colspan="4">Jig no./robotic station(L.H/R.H)/B.O</th>
</tr>
<tr>
<td>LAV-1</td>
<td>LAV-2</td>
<td>LAV-3</td>
<td>LAV-4</td>
<td>LAV-1</td>
<td>LAV-2</td>
<td>LAV-3</td>
<td>LAV-4</td>
</tr>
<tr>
<th>Frame work done</th>
<td><input type="text"  class="c1"  id="frameWorkByLav1" name="frameWorkByLav1" placeholder="Enter text here"></td>
<td><input type="text"  class="c1" id="frameWorkByLav2" name="frameWorkByLav2" placeholder="Enter text here"></td>
<td><input type="text"  class="c1"  id="frameWorkByLav3" name="frameWorkByLav3" placeholder="Enter text here"></td>
<td><input type="text"  class="c1" id="frameWorkByLav4" name="frameWorkByLav4" placeholder="Enter text here"></td>
<td><input type="text"  class="c1" id="frameJigRoboticsBoLav1" name="frameJigRoboticsBoLav1" placeholder="Enter text here"></td>
<td><input type="text"  class="c1" id="frameJigRoboticsBoLav2" name="frameJigRoboticsBoLav2" placeholder="Enter text here"></td>
<td><input type="text" class="c1" id="frameJigRoboticsBoLav3" name="frameJigRoboticsBoLav3" placeholder="Enter text here"></td>
<td><input type="text" class="c1"  id="frameJigRoboticsBoLav4" name="frameJigRoboticsBoLav4" placeholder="Enter text here"></td>
</tr>
<tr>
<th>Spot Welding Done</th>
<td><input type="text" class="c1" id="spotWeldingByLav1" name="spotweldingByLav1" placeholder="Enter text here"></td>
<td><input type="text" class="c1" id="spotWeldingByLav2" name="spotWeldingByLav2" placeholder="Enter text here"></td>
<td><input type="text" class="c1" id="spotWeldingByLav3" name="spotWeldingByLav3" placeholder="Enter text here"></td>
<td><input type="text" class="c1" id="spotWeldingByLav4" name="spotWeldingByLav4" placeholder="Enter text here"></td>
<td><input type="text" class="c1" id="spotWeldingJigRoboticsBoLav1"  name="spotWeldingJigRoboticsBoLav1" placeholder="Enter text here"></td>
<td><input type="text" class="c1" id="spotWeldingJigRoboticsBoLav2"  name="spotWeldingJigRoboticsBoLav2" placeholder="Enter text here"></td>
<td><input type="text" class="c1" id="spotWeldingJigRoboticsBoLav3" name="spotWeldingJigRoboticsBoLav3" placeholder="Enter text here"></td>
<td><input type="text" class="c1" id="spotWeldingJigRoboticsBoLav4" name="spotWeldingJigRoboticsBoLav4" placeholder="Enter text here"></td>
</tr>
<tr>
<th>Interlocking joint welding done</th>
<td><input type="text" class="c1" id="interlockJointByLav1" name="interlockJointByLav1" placeholder="Enter text here"></td>
<td><input type="text" class="c1" id="interlockJointByLav2" name="interlockJointByLav2" placeholder="Enter text here"></td>
<td><input type="text" class="c1" id="interlockJointByLav3" name="interlockJointByLav3" placeholder="Enter text here"></td>
<td><input type="text" class="c1" id="interlockJointByLav4" name="interlockJointByLav4" placeholder="Enter text here"></td>
<td><input type="text" class="c1" id="interlockJointJigRoboticsBoLav1"  name="interlockJointJigRoboticsBoLav1" placeholder="Enter text here"></td>
<td><input type="text" class="c1" id="interlockJointJigRoboticsBoLav2"  name="interlockJointJigRoboticsBoLav2" placeholder="Enter text here"></td>
<td><input type="text" class="c1" id="interlockJointJigRoboticsBoLav3"  name="interlockJointJigRoboticsBoLav3" placeholder="Enter text here"></td>
<td><input type="text" class="c1" id="interlockJointJigRoboticsBoLav4"  name="interlockJointJigRoboticsBoLav4" placeholder="Enter text here"></td>
</tr>
</table>
<h4>1.Applicability:</h4>
  <h5>1.1 Applicable Drawing No.<input type="text" name="drawingNo"  id="drawingNo" ></h5>
  <h5>1.2 Applica ble W.I No.(If Any)<input type="text" name="wiNo" id="wiNo"></h5>
 <h4>2. Data of Traceability:</h4>
  <h5>2.1 LAV side wall make and Sr.no</h5>
  <input type="text" id="lavsidewallMake1" name="lavsidewallMake1">
  <input type="text" id="lavsidewallMake2" name="lavsidewallMake2">
  <input type="text" id="lavsidewallMake3" name="lavsidewallMake3">
  <input type="text" id="lavsidewallMake4" name="lavsidewallMake4">
 <h4>3. Observations:</h4>
 <table>
 <tr>
 <td><h5>3.1 Items fitted as per drawing</h5><td>
 <td>
 <input type="radio" class="c4" id="observationItemsAsPerDrawingFlag" name="observationItemsAsPerDrawingFlag" value="OK"> OK
  <input type="radio" class="c4" id="observationItemsAsPerDrawingFlag" name="observationItemsAsPerDrawingFlag" value="NOT OK">NOT Ok
  <input type="radio" class="c4" id="observationItemsAsPerDrawingFlag" name="observationItemsAsPerDrawingFlag" value="NA"> NA
 </td>
 </tr>
 <tr>
<td><h5>3.2 Compliance of applicble W.I</h5></td>
<td>
  <input type="radio" class="c4" id="observationComplianceWiFlag" name="observationComplianceWiFlag" value="OK"> OK
  <input type="radio" class="c4" id="observationComplianceWiFlag" name="observationComplianceWiFlag" value="NOT OK">NOT Ok
  <input type="radio" class="c4" id="observationComplianceWiFlag" name="observationComplianceWiFlag" value="NA"> NA
</td>
 </tr>
 <tr>
 <td><h5>3.3 Welding throat and length as per drawing</h5></td>
 <td>
  <input type="radio" class="c4" id="observationWeldingThroatFlag" name="observationWeldingThroatFlag" value="OK"> OK
  <input type="radio" class="c4" id="observationWeldingThroatFlag" name="observationWeldingThroatFlag" value="NOT OK">NOT Ok
  <input type="radio" class="c4" id="observationWeldingThroatFlag" name="observationWeldingThroatFlag" value="NA"> NA
  </td>
  </tr>
  </table>
<table border= "1" style="border-collapse: collapse;">
<tr class="c3" >
<th>SNo.</th>
<th>Parameter</th>
<th>Value Specified</th>
<th>Lav.1</th>
<th>Lav.2</th>
<th>Lav.3</th>
<th>Lav.4</th>
</tr>
<tr>
<th>1.</th>
<th style="height:1%;padding:0; cellspacing=0;">Total Height</th>
<th>1996.5+2</th>
<td><input type="text"  id="totalheightLav1" name="totalheightLav1" class='validate[custom[number]]' placeholder="Enter text here"></td>
<td><input type="text"  id="totalheightLav2" name="totalheightLav2" class='validate[custom[number]]' placeholder="Enter text here"></td>
<td><input type="text"  id="totalheightLav3" name="totalheightLav3" class='validate[custom[number]]' placeholder="Enter text here"></td>
<td><input type="text"  id="totalheightLav4" name="totalheightLav4" class='validate[custom[number]]' placeholder="Enter text here"></td>
</tr>
<tr>
<th>2.</th>
<th>Total width outside</th>
<th>1336.7+3</th>
<td><input type="text"  id="totalwidthoutsideLav1" name="totalwidthoutsideLav1" class='validate[custom[number]]' placeholder="Enter text here"></td>
<td><input type="text"  id="totalwidthoutsideLav2" name="totalwidthoutsideLav2" class='validate[custom[number]]' placeholder="Enter text here"></td>
<td><input type="text"  id="totalwidthoutsideLav3" name="totalwidthoutsideLav3" class='validate[custom[number]]' placeholder="Enter text here"></td>
<td><input type="text"  id="totalwidthoutsideLav4" name="totalwidthoutsideLav4" class='validate[custom[number]]' placeholder="Enter text here"></td>

</tr>
<tr>
<th>3.</th>
<th>Total width inside</th>
<th>1295.8</th>
<td><input type="text"  id="totalwidthinsideLav1" name="totalwidthinsideLav1" class='validate[custom[number]]' placeholder="Enter text here"></td>
<td><input type="text"  id="totalwidthinsideLav2" name="totalwidthinsideLav2" class='validate[custom[number]]' placeholder="Enter text here"></td>
<td><input type="text"  id="totalwidthinsideLav3" name="totalwidthinsideLav3" class='validate[custom[number]]' placeholder="Enter text here"></td>
<td><input type="text"  id="totalwidthinsideLav4" name="totalwidthinsideLav4" class='validate[custom[number]]' placeholder="Enter text here"></td>

</tr>
<tr>
<th>4.</th>
<th>Window cut out</th>
<th>700+2</th>
<td><input type="text"  id="windowcutOutLav1" name="windowcutOutLav1" class='validate[custom[number]]' placeholder="Enter text here"></td>
<td><input type="text"  id="windowcutOutLav2" name="windowcutOutLav2" class='validate[custom[number]]' placeholder="Enter text here"></td>
<td><input type="text"  id="windowcutOutLav3" name="windowcutOutLav3" class='validate[custom[number]]' placeholder="Enter text here"></td>
<td><input type="text"  id="windowcutOutLav4" name="windowcutOutLav4" class='validate[custom[number]]' placeholder="Enter text here"></td>
</tr>
<tr>
<th>5.</th>
<th>Window cut out side</th>
<th>680+2</th>
<td><input type="text"  id="windowcutOutsideLav1" name="windowcutOutsideLav1" class='validate[custom[number]]' placeholder="Enter text here"></td>
<td><input type="text"  id="windowcutOutsideLav2" name="windowcutOutsideLav2" class='validate[custom[number]]' placeholder="Enter text here"></td>
<td><input type="text"  id="windowcutOutsideLav3" name="windowcutOutsideLav3" class='validate[custom[number]]' placeholder="Enter text here"></td>
<td><input type="text"  id="windowcutOutsideLav4" name="windowcutOutsideLav4" class='validate[custom[number]]' placeholder="Enter text here"></td>
</tr>
<tr>
<th>6.</th>
<th class="c3" >Pillar height from sheet</th>
<th>60</th>
<td><input type="text" id="pillarheightSheetLav1" name="pillarheightSheetLav1" class='validate[custom[number]]' placeholder="Enter text here"></td>
<td><input type="text" id="pillarheightSheetLav2" name="pillarheightSheetLav2" class='validate[custom[number]]' placeholder="Enter text here"></td>
<td><input type="text" id="pillarheightSheetLav3" name="pillarheightSheetLav3" class='validate[custom[number]]' placeholder="Enter text here"></td>
<td><input type="text" id="pillarheightSheetLav4" name="pillarheightSheetLav4" class='validate[custom[number]]' placeholder="Enter text here"></td>
</tr>
<tr>
<th>7.</th>
<th class="c3">Window profile cut for Exhaust(in LscN/LGS)</th>
<th class="c3" >provided/notprovided</th>
<td><input type="text" id="windowprofilecutForExhaustLav1" placeholder="Enter text here"></td>
<td><input type="text" id="windowprofilecutForExhaustLav2" placeholder="Enter text here"></td>
<td><input type="text" id="windowprofilecutForExhaustLav3" placeholder="Enter text here"></td>
<td><input type="text" id="windowprofilecutForExhaustLav4" placeholder="Enter text here"></td>
</tr>
</table>
<table>
<tr>
<td><h5>3.4 Lav.Side wall sheet frame as per drawing</h5></td>
<td>
  <input type="radio" class="c4"  id="lavsidewallFrameAsPerDrawingFlag" value="DONE">DONE
  <input type="radio" class="c4" id="lavsidewallFrameAsPerDrawingFlag" value="NOT DONE">NOT DONE
</td>
</tr>
<tr>  
<td><h5>3.5 Lav.Side wall sheet with member spot welding/manual butt welding</h5></td>
<td>
  <input type="radio" class="c4"  id="lavsidewallMemberWeldingFlag" value="DONE">DONE
  <input type="radio" class="c4" id="lavsidewallMemberWeldingFlag" value="NOT DONE">NOT DONE
 </td>
 </tr>
 <tr> 
<td><h5>3.6 Condition of Lav.Side wall member joint(robotic/manual)</h5></td>
<td>
  <input type="radio" class="c4"  id="conditionLavsidewallMemberJointweldingFlag" value="OK"> OK
  <input type="radio" class="c4"  id="conditionLavsidewallMemberJointweldingFlag" value="NOT OK">NOT Ok
  <input type="radio" class="c4"  id="conditionLavsidewallMemberJointweldingFlag" value="NA"> NA
</td>  
 </tr>
 <tr>
 <td><h5>3.7 Condition of Lav.Side wall sheet laser joint welding(visually)</h5></td>
 <td>
 <input type="radio" class="c4" id="conditionLavsidewallSheetLaserweldingFlag" value="OK"> OK
  <input type="radio" class="c4" id="conditionLavsidewallSheetLaserweldingFlag" value="NOT OK">NOT Ok
  <input type="radio" class="c4" id="conditionLavsidewallSheetLaserweldingFlag" value="NA"> NA
  </td>
 </tr>
 <tr>
<td><h4>Details of modification carried out(if any)</h4></td>
<td>
  <input type="radio" class="c4" id="detailsOfModification" name="detailsOfModification" value="NO">NO
  <input type="radio" class="c4" id="detailsOfModification" name="detailsOfModification" value="YES">YES
 </td>
 </tr>
 <tr> 
 <td><h4>Details of trail items fitted(if any):</h4></td>
 <td>
  <input type="radio" class="c4" id="detailsOfTrial" name="detailsOfTrial" value="OK">NO
  <input type="radio" class="c4" id="detailsOfTrial" name="detailsOfTrial" value="NOT OK">YES
 </td>
 </tr>
 <tr> 
<td><h4>Remarks(if any):</h4></td>
<td>
<input  type="radio" class="c4"  id="remarks" name="remarks" value="NO">NO
  <input  type="radio" class="c4" id="remarks" name="remarks" value="YES">YES
  </td>
</tr>  
  </table>
  <table>
<tr align="center"><td>Testing Status</td>
<td> 
<input type=radio name="shellLavSidewallSipTestingStatus" id="shellLavSidewallSipTestingStatus" value="NA">NA 
<input type=radio name="shellLavSidewallSipTestingStatus" id="shellLavSidewallSipTestingStatus" value="Confirming">Conforming 
<input type=radio  name="shellLavSidewallSipTestingStatus" id="shellLavSidewallSipTestingStatus" value="Not Comfirming">Not Conforming
</td></tr>

</table>
</form>
 </div>


<div id="endwallSIP" style="height:150%; width:200%; display:none;z-index: 9;">
     <h3 align="center">SELF INSPECTION PROFARMA</h3>
<h6 align="center">END WALL</h6>
<form name="endwallSIP">
<table>
<tr>
<th>Doc No</th><td colspan="3"><input type="text" name="endwallSipDocNo" id="endwallSipDocNo" class='validate[required]'></td><td></td><td></td>
</tr>
<tr>
<th>Shift</th><td><select  name="endwallSipShift" id="endwallSipShift" class='validate[required]'>
<option value="">Select</option>
<option value="general">General</option>
<option value="morning">Shift-I</option>
<option value="evening">Shift-II</option>
<option value="night">Shift-III</option>

</select></td>
<th colspan="2">Date of Testing</th><td><input type="text" name="endwallSipDate" id="endwallSipDate" class='validate[required]'></td><td></td>
</tr>
<tr>
<th>LavSidewall Type</th><td><input type="text" name="endwallShellType" id="endwallShellType"></td>
<th>LavSidewall No</th><td><input type="text" name="endwallNo" id="endwallNo" class='validate[required]'></td>
</tr>
</table>
<h4>1.Applicability:</h4>
  <h5>1.1 Applicable Drawing No.<input type="text" name="drawingNoendwall"  id="drawingNoendwall" ></h5>
  <h5>1.2 Applica ble W.I No.(If Any)<input type="text" name="wiNoendwall" id="wiNoendwall"></h5>
<h4>2. Data of Traceability:</h4>  
  <h4>End wall make and No.(in house(MCF/Contractor)/bought out)</h4>
  <h5>PP side<input type="text" name="endwallPpMake" id="endwallPpMake"></h5>
   <h5>NPP side<input type="text" name="endwallNppMake" id="endwallNppMake"></h5>
 <h4>3. Observations:</h4> 
  <table>
 <tr>
 <td><h5>3.1 Items fitted as per drawing</h5><td>
 <td>
 <input type="radio"  id="observationItemAsPerDrawing" name="observationItemAsPerDrawing" value="OK"> OK
  <input type="radio" id="observationItemAsPerDrawing" name="observationItemAsPerDrawing" value="NOT OK">NOT Ok
  <input type="radio" id="observationItemAsPerDrawing" name="observationItemAsPerDrawing" value="NA"> NA
 </td>
 </tr>
 <tr>
<td><h5>3.2 Compliance of applicble W.I</h5></td>
<td>
  <input type="radio" id="observationComplianceWi" name="observationComplianceWi" value="OK"> OK
  <input type="radio" id="observationComplianceWi" name="observationComplianceWi" value="NOT OK">NOT Ok
  <input type="radio" id="observationComplianceWi" name="observationComplianceWi" value="NA"> NA
</td>
 </tr>
 <tr>
 <td><h5>3.3 Welding throat and bead length as per drawing</h5></td>
 <td>
  <input type="radio" id="observationWeldingThroatLength" name="observationWeldingThroatLength" value="OK"> OK
  <input type="radio" id="observationWeldingThroatLength" name="observationWeldingThroatLength" value="NOT OK">NOT Ok
  <input type="radio" id="observationWeldingThroatLength" name="observationWeldingThroatLength" value="NA"> NA
  </td>
  </tr>
  
  <tr>
  <td><h5>3.4 Stopper hole distance from U channel:Specified  15+0.5mm,</h5></td>
  <td>Observed<input type="text" id="distanceStopperholeUchannel" class='validate[custom[number]]' placeholder="Enter text here" ></td>
  </tr>
  
  <tr>
  <td><h5>3.5 Distance between U channel and stopper hole:Specified 41+1mm,</h5></td>
  <td>Observed<input type="text" id="distanceUchannelStopperhole" class='validate[custom[number]]'  placeholder="Enter text here" ></td>
  </tr>
  
  <tr>
  <td><h5>3.6 Vestibule U channel between gap inner distance:Specified 1148+4mm,</h5></td>
  <td>PP<input type="text" id="distanceVestibuleUchannelPp" class='validate[custom[number]]' placeholder="Enter text here" ></td>
    <td>NPP<input type="text" id="distanceVestibuleUchannelNpp" class='validate[custom[number]]' placeholder="Enter text here" ></td>
  </tr>
  
  <tr>
 <td><h5>3.7 Condition of Tail lamp bracket holes:</h5></td>
 <td>
  <input type="radio" id="conditionTailLampHole" name="conditionTailLampHole" value="OK"> OK
  <input type="radio" id="conditionTailLampHole" name="conditionTailLampHole" value="NOT OK">NOT Ok
  <input type="radio" id="conditionTailLampHole" name="conditionTailLampHole" value="NA"> NA
  </td>
  </tr>
  
  <tr>
 <td><h5>3.8 Condition of Vestibule hole:</h5></td>
 <td>
  <input type="radio" id="conditionVestibuleHole" name="conditionVestibuleHole" value="OK"> OK
  <input type="radio" id="conditionVestibuleHole" name="conditionVestibuleHole" value="NOT OK">NOT Ok
  <input type="radio" id="conditionVestibuleHole" name="conditionVestibuleHole" value="NA"> NA
  </td>
  </tr>
  
  <tr>
 <td><h5>3.9 Condition of Drain hole:</h5></td>
 <td>
  <input type="radio" id="conditionDrainHole" name="conditionDrainHole" value="OK"> OK
  <input type="radio" id="conditionDrainHole" name="conditionDrainHole" value="NOT OK">NOT Ok
  <input type="radio" id="conditionDrainHole" name="conditionDrainHole" value="NA"> NA
  </td>
  </tr>
  
  <tr>
  <td><h5>3.10 End wall outer width:Specified 3122+6mm,</h5></td>
  <td>Observed<input type="text" id="endwallOuterWidth" class='validate[custom[number]]' placeholder="Enter text here" ></td>
  </tr>
  
  
  <tr>
 <td><h5>3.11 End wall exhaust cutting(in AC Shell)</h5></td>
 <td>
  <input type="radio" id="endwallExhaustCutting" name="endwallExhaustCutting" value="Provided">Provided
  <input type="radio" id="endwallExhaustCutting" name="endwallExhaustCutting" value="Not Provided">Not Provided
  </td>
  </tr>
  
   <tr>
 <td><h5>3.12 End wall back pieces for vestibule door</h5></td>
 <td>
  <input type="radio" id="endwallPieceVerstibule" name="endwallPieceVerstibule" value="Provided">Provided
  <input type="radio" id="endwallPieceVerstibule" name="endwallPieceVerstibule" value="Not Provided">Not Provided
  </td>
  </tr>
  
   <tr>
  <td><h5>3.13 Roof Element water eject hole size at end wall(L*W)(105*55mm),</h5></td>
  <td>Observed<input type="text" id="roofelementWaterejectHole" placeholder="Enter text here" ></td>
  </tr>
  
  <tr>
  <td><h5>3.14 End Back pieces for mounting of vestibule door :Specified value(1572,720,70 mm)</h5></td>
  <td>Observed<input type="text" id="backpieceVestibuleDoor" placeholder="Enter text here" ></td>
  </tr>
  
  <tr>
  <td><h4>4.1 Details of modification carried out(if any)</h4></td>
  <td><input type="text" id="detailsOfModificationendwall" placeholder="Enter text here"></td>
  </tr>
   <tr>
  <td><h4>4.2 Details of trial items fitted(if any)</h4></td>
  <td><input type="text" id="detailsOfTrialendwall" placeholder="Enter text here"></td>
  </tr>
    <tr>
  <td><h4>4.3 Remarks</h4></td>
  <td><input type="text" id="remarksendwall" placeholder="Enter text here"></td>
  </tr>
  
  <tr>
 <td><h5>Endwall Testing Status</h5></td>
 <td>
  <input type="radio" id="endwallTestingStatus" name="endwallTestingStatus" value="Conforming">Conforming
  <input type="radio" id="endwallTestingStatus" name="endwallTestingStatus" value="Non Conforming">Non Conforming
  </td>
  </tr>
  </table>
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
			
			$('#sidewallSipDate').datepicker({
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

		    });
			$('#roofSipDate').datepicker({
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

		    });
			$('#underframeDate').datepicker({
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

		    });
			$('#lavsidewallSipDate').datepicker({
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

			$('#endwallSipDate').datepicker({
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
                         text: 'Sidewall SIP',
                         click: function () {
                         	var $selectedRows = $('#ShellProductionTableContainer').jtable('selectedRows');
                     	 	 if ($selectedRows.length<1)
                     		 alert("Please select a row for which you want to Fill SIP Data");
                     	 	 else{
                     	 		var record;
                     	 		$selectedRows.each(function () {
                                     record = $(this).data('record');
                                     });
 								//setting min value
 								
 								//to show data predefine in shell transaction
 								$.ajax({
 								url:"showExistingShellData", //action-name as defined in struts.xml
 								dataType:'json',
 								type:'POST',
 								async:false,
 								data:{
 								shellAssetId:record.shellAssetId,	
 								},
 								success:function(data)
 								{
 									$('#sidewallSipDocNo').val(data.docNoSideWall);
 									$('#sidewallType').val(data.sideWallType);
 									$('#sidewallShellNo').val(data.shellNo);
 									$('#sidewallShellType').val(data.shellType);
 								}
 									
 								});
 								
 								
 								
 							if(record.sidewallSipFlag==1)
 								{
 								var cfm=confirm("Data for Side Wall SIP Testing is already updated for selected Shell. Do you want to verify data?");
 	                          	if(cfm==false){return false;}	
 								$.ajax({
 									url:"showSaveDataSideWall", //action-name as defined in struts.xml
 									dataType:'json',
 									type:'POST',
 									async:false,
 									data:{
 									shellAssetId:record.shellAssetId,	
 									},
 									success:function(data)
 									{
 										$('#sidewallSipShift').val(data.shellSideWallTran.sidewallSipShift);
 										$('#sidewallType').val(data.shellSideWallTran.sidewallType);
 										var sideWallDate=(data.shellSideWallTran.sidewallSipDate).substring(0,10);
 										var sideWallDateArray=sideWallDate.split("-");
 										//var sideWallD= new Date(sideWallDateArray[0],sideWallDateArray[1]-1,sideWallDateArray[2]);
 										$('#sidewallSipDate').datepicker("setDate", new Date(sideWallDateArray[0],sideWallDateArray[1]-1,sideWallDateArray[2]))
 										$('#drawingNo').val(data.shellSideWallTran.drawingNo);
 										$('#wiNo').val(data.shellSideWallTran.wiNo);
 										$('#frameWorkBy').val(data.shellSideWallTran.frameWorkBy);
 										$('#frameJigRoboticsBo').val(data.shellSideWallTran.frameJigRoboticsBo);
 										$('#spotWeldingBy').val(data.shellSideWallTran.spotWeldingBy);
 										$('#spotWeldingJigRoboticsBo').val(data.shellSideWallTran.spotWeldingJigRoboticsBo);
 										$('#interlockJointBy').val(data.shellSideWallTran.interlockJointBy);
 										$('#interlockJointJigRoboticsBo').val(data.shellSideWallTran.interlockJointJigRoboticsBo);
 										$('#sidewallCarlineMakeLh').val(data.shellSideWallTran.sidewallCarlineMakeLh);
 										$('#sidewallCarlineMakeRh').val(data.shellSideWallTran.sidewallCarlineMakeRh);
 										$('#sidewallMakeNoLh').val(data.shellTran.sideWallMakeNoPp);
 										$('#sidewallMakeNoRh').val(data.shellTran.sideWallMakeNoNpp);
 										$('[id="observationItemAsPerDrawingFlag"]').val([data.shellSideWallTran.observationItemAsPerDrawingFlag]);
 										$('[id="observationComplianceWiFlag"]').val([data.shellSideWallTran.observationComplianceWiFlag]);
 										$('[id="observationWeldingThoatLengthFlag"]').val([data.shellSideWallTran.observationWeldingThoatLengthFlag]);
 										$('[id="observationSheetJointLaserFlag"]').val([data.shellSideWallTran.observationSheetJointLaserFlag]);
 										$('[id="observationSidewallFrameWorkFlag"]').val([data.shellSideWallTran.observationSidewallFrameWorkFlag]);
 										$('[id="observationSidewallConditionSpotWeldingFlag"]').val([data.shellSideWallTran.observationSidewallConditionSpotWeldingFlag]);
 										$('[id="observationHorizontalVerticalJointWeldingFlag"]').val([data.shellSideWallTran.observationHorizontalVerticalJointWeldingFlag]);
 										$('[id="observationRoofFlangeJointFlag"]').val([data.shellSideWallTran.observationRoofFlangeJointFlag]);

 										
 										$('#observationSidewallSheetTorque').val(data.shellSideWallTran.observationSidewallSheetTorque);
 										
 										$('#sidewallSheetLengthLh').val(data.shellSideWallTran.sidewallSheetLengthLh);
 										$('#sidewallSheetLengthRh').val(data.shellSideWallTran.sidewallSheetLengthRh);
 										$('#sidewallSheetWidth').val(data.shellSideWallTran.sidewallSheetWidth);
 										$('#sidewallHeightVerticalmemberRoofflange').val(data.shellSideWallTran.sidewallHeightVerticalmemberRoofflange);
 										
 										$('[id="spotWeldingCarlinearchFlag"]').val([data.shellSideWallTran.spotWeldingCarlinearchFlag]);
 										
 										$('[id="brazingCarlineSidewallFlag"]').val([data.shellSideWallTran.brazingCarlineSidewallFlag]);
 						
 										$('[id="windowProfileFlag"]').val([data.shellSideWallTran.windowProfileFlag]);
 										$('#pullBoxDistance').val(data.shellSideWallTran.pullBoxDistance);
 										
 										$('[id="windowSealLeakageFlag"]').val([data.shellSideWallTran.windowSealLeakageFlag]);
 										
 										$('[id="windowSealAngleFlag"]').val([data.shellSideWallTran.windowSealAngleFlag]);
 										$('#distanceCarlinetopVerticalmember').val(data.shellSideWallTran.distanceCarlinetopVerticalmember);
 										$('#lengthSidewallCarlineLh').val(data.shellSideWallTran.lengthSidewallCarlineLh);
 										$('#lengthSidewallCarlineRh').val(data.shellSideWallTran.lengthSidewallCarlineRh);
 									
 										$('[id="carlineLeakageFlag"]').val([data.shellSideWallTran.carlineLeakageFlag]);
 									
 										$('[id="horizontalVerticalWeldingGrindingFlag"]').val([data.shellSideWallTran.horizontalVerticalWeldingGrindingFlag]);
 										$('#distanceBackpieceVerticalmemberTransverse').val(data.shellSideWallTran.distanceBackpieceVerticalmemberTransverse);
 										$('#distanceBackpieceVerticalmemberSingle').val(data.shellSideWallTran.distanceBackpieceVerticalmemberSingle);
 										$('#roofFlangeLength').val(data.shellSideWallTran.roofFlangeLength);
 										$('#widthHatchedDoor').val(data.shellSideWallTran.widthHatchedDoor);
 										$('#distanceBerthchannelVerticalchannelLowerLh').val(data.shellSideWallTran.distanceBerthchannelVerticalchannelLowerLh);
 										$('#distanceBerthchannelVerticalchannelMiddleLh').val(data.shellSideWallTran.distanceBerthchannelVerticalchannelMiddleLh);
 										$('#distanceBerthchannelVerticalchannelUpperLh').val(data.shellSideWallTran.distanceBerthchannelVerticalchannelUpperLh);
 										$('#distanceBerthchannelVerticalchannelUpperRh').val(data.shellSideWallTran.distanceBerthchannelVerticalchannelUpperRh);
 								        $('#distanceBerthchannelVerticalchannelLowerRh').val(data.shellSideWallTran.distanceBerthchannelVerticalchannelLowerRh);
 										$('#distanceWindowcenterAnglewindowsupport').val(data.shellSideWallTran.distanceWindowcenterAnglewindowsupport);
 										$('#distanceWindowedgeChannel').val(data.shellSideWallTran.distanceWindowedgeChannel);
 										$('#heightCarline').val(data.shellSideWallTran.heightCarline);
 										$('#lengthSmallcarline').val(data.shellSideWallTran.lengthSmallcarline);
 										$('#angleLowerluggageBottomsidewall').val(data.shellSideWallTran.angleLowerluggageBottomsidewall);
 										$('#distanceAnglehoneyprtSidewallDoorside1').val(data.shellSideWallTran.distanceAnglehoneyprtSidewallDoorside1);
 										$('#distanceAnglehoneyprtSidewallDoorside2').val(data.shellSideWallTran.distanceAnglehoneyprtSidewallDoorside2);
 										$('#distanceAnglehoneyprtSidewallDoorside3').val(data.shellSideWallTran.distanceAnglehoneyprtSidewallDoorside3);
 										$('#distanceAnglehoneyprtSidewallDoorside4').val(data.shellSideWallTran.distanceAnglehoneyprtSidewallDoorside4);
 										$('#distanceAnglehoneyprtSidewallMiddlearea1').val(data.shellSideWallTran.distanceAnglehoneyprtSidewallMiddlearea1);
 										$('#distanceAnglehoneyprtSidewallMiddlearea2').val(data.shellSideWallTran.distanceAnglehoneyprtSidewallMiddlearea2);
 										$('#distanceAnglehoneyprtSidewallMiddlearea3').val(data.shellSideWallTran.distanceAnglehoneyprtSidewallMiddlearea3);
 										$('#distanceAnglehoneyprtSidewallMiddlearea4').val(data.shellSideWallTran.distanceAnglehoneyprtSidewallMiddlearea4);
 										$('#detailsOfModification').val(data.shellSideWallTran.detailsOfModification);
 										$('#detailsOfTrialItem').val(data.shellSideWallTran.detailsOfTrialItem);
 										$('#remarks').val(data.shellSideWallTran.remarks);
 										$('#shellSidewallTestingStatus').val(data.shellSideWallTran.shellSidewallTestingStatus);
 										
 									}
 										
 									});
 								
 								}
 												
 								$('#sidewallDate').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
 								
             					
                     	 	 	$("#sidewallSIPDialog").dialog({
                     	 	 		title : 'Side Wall Inspection for  '+record.shellTransactionId + 'from Stage- <%=stageID%>',
                     	 	 		width:'60%',
                     	 	 		close: function (e, u) {
               	 		              //$(".formError").remove();
               	 		          	$("#sidewallSIPDialog").validationEngine('hideAll');
               	 		         $('#sidewallSIPDialog').find('form[name="sidewallSip"]')[0].reset();
               	 		          },
                 	 		 	
  		 							buttons: {
 	                                    Submit: {
 	                                       text: "Submit",
 	                                        id: "my-button-submit",
 	                                        click:function () {
 	                                    		
 	                                    	//alert("$('#qtyDispatched').val()->"+$('#qtyDispatched').val());
 	                                    	//alert("record.balanceQtyToDispatch->"+record.balanceQtyToDispatch);
 	                            	 		
 	                                    	if ($('#sidewallSipShift').validationEngine('validate')) {
 				                                        	
 				                                            return false;
 				                                        }  //similar for other
 				                                        
 											if ($('#sidewallSipDocNo').validationEngine('validate')) {
 				                                        	
 				                                            return false;
 				                                        } 
 											if ($('#sidewallSipDate').validationEngine('validate')) {
 	                                        	
 	                                            return false;
 	                                        }
 											if ($('#observationSidewallSheetTorque').validationEngine('validate')) {
 	                                        	
 	                                            return false;
 	                                        }
 											if ($('#sidewallSheetLengthLh').validationEngine('validate')) {
 	                                        	
 	                                            return false;
 	                                        }
 											if ($('#sidewallSheetLengthRh').validationEngine('validate')) {
 	                                        	
 	                                            return false;
 	                                        }
 											if ($('#sidewallSheetWidth').validationEngine('validate')) {
 	                                        	
 	                                            return false;
 	                                        }
 											if ($('#sidewallHeightVerticalmemberRoofflange').validationEngine('validate')) {
 	                                        	
 	                                            return false;
 	                                        }
 											if ($('#pullBoxDistance').validationEngine('validate')) {
 	                                        	
 	                                            return false;
 	                                        }
 											if ($('#distanceCarlinetopVerticalmember').validationEngine('validate')) {
 	                                        	
 	                                            return false;
 	                                        }
 											if ($('#lengthSidewallCarlineLh').validationEngine('validate')) {
 	                                        	
 	                                            return false;
 	                                        }
 											if ($('#lengthSidewallCarlineRh').validationEngine('validate')) {
 	                                        	
 	                                            return false;
 	                                        }
 											if ($('#roofFlangeLength').validationEngine('validate')) {
 	                                        	
 	                                            return false;
 	                                        }
 											if ($('#widthHatchedDoor').validationEngine('validate')) {
 	                                        	
 	                                            return false;
 	                                        }
 											if ($('#distanceBerthchannelVerticalchannelLowerLh').validationEngine('validate')) {
 	
     												return false;
 											}
 											if ($('#distanceBerthchannelVerticalchannelUpperRh').validationEngine('validate')) {
 	
    													 return false;
 											}
 											if ($('#distanceWindowcenterAnglewindowsupport').validationEngine('validate')) {
 	
     											return false;
 											}
 											if ($('#distanceWindowedgeChannel').validationEngine('validate')) {
 	
    													 return false;
 											}
 											if ($('#heightCarline').validationEngine('validate')) {
 												
 													 return false;
 										    }
 											if ($('#lengthSmallcarline').validationEngine('validate')) {
 												
 													 return false;
 										}
 											if ($('#angleLowerluggageBottomsidewall').validationEngine('validate')) {
 												
 													 return false;
 										}
 											if ($('#distanceAnglehoneyprtSidewallDoorside1').validationEngine('validate')) {
 												
 													 return false;
 										}
 											if ($('#distanceAnglehoneyprtSidewallDoorside2').validationEngine('validate')) {
 												
 												 return false;
 									}
 											if ($('#distanceAnglehoneyprtSidewallDoorside3').validationEngine('validate')) {
 												
 												 return false;
 									}
 											if ($('#distanceAnglehoneyprtSidewallDoorside4').validationEngine('validate')) {
 												
 												 return false;
 									}
 											if ($('#distanceAnglehoneyprtSidewallMiddlearea1').validationEngine('validate')) {
 												
 												 return false;
 									}
 											if ($('#distanceAnglehoneyprtSidewallMiddlearea2').validationEngine('validate')) {
 												
 												 return false;
 									}
 											if ($('#distanceAnglehoneyprtSidewallMiddlearea3').validationEngine('validate')) {
 												
 												 return false;
 									}
 											if ($('#distanceAnglehoneyprtSidewallMiddlearea4').validationEngine('validate')) {
 												
 												 return false;
 									}
 											if ($('#shellSidewallTestingStatus').validationEngine('validate')) {
 												
												 return false;
									}

 											
 	                                   var c=confirm("Do you want to submit data for Sidewall Testing");
 	                                    	if(c==false){return false;}
                                          		    	   
 	                                    	$.ajax({
 	                    						url : "savesidewallSIP",  //action-name as defined in struts.xml
 	                    						dataType: 'json', 
 	                    						data : {
 	                    							shellAssetId: record.shellAssetId,
 	                    							sidewallDate:$('#sidewallSipDate').val(),
 	                    							 sidewallSipDocNo:$('#sidewallSipDocNo').val(),
 	                    							 sidewallShellType:$('#sidewallShellType').val(),
 	                    							 sidewallShellNo:$('#sidewallShellNo').val(),
 	                    						  sidewallSipShift:$('#sidewallSipShift').val(),
 	                    						  sidewallType:$('#sidewallType').val(),
 	                    						  drawingNo:$('#drawingNo').val(),
 	                    						  wiNo:$('#wiNo').val(),
 	                    						  frameWorkBy:$('#frameWorkBy').val(),
 	                    						  frameJigRoboticsBo:$('#frameJigRoboticsBo').val(),
 	                    						  spotWeldingBy:$('#spotWeldingBy').val(),
 	                    						  spotWeldingJigRoboticsBo:$('#spotWeldingJigRoboticsBo').val(),
 	                    						  interlockJointBy:$('#interlockJointBy').val(),
 	                    					  	  interlockJointJigRoboticsBo:$('#interlockJointJigRoboticsBo').val(),
 	                    						  sidewallCarlineMakeLh:$('#sidewallCarlineMakeLh').val(),
 	                    						  sidewallCarlineMakeRh:$('#sidewallCarlineMakeRh').val(),
 	                    						  sidewallMakeNoLh:$('#sidewallMakeNoLh').val(),
 	                    						  sidewallMakeNoRh:$('#sidewallMakeNoRh').val(),
 	                    						  observationItemAsPerDrawingFlag:$("input[id='observationItemAsPerDrawingFlag']:checked").val(),
 	                    						  observationComplianceWiFlag:$("input[id='observationComplianceWiFlag']:checked").val(),
 	                    						  observationWeldingThoatLengthFlag:$("input[id='observationWeldingThoatLengthFlag']:checked").val(),
 	                    						  observationSheetJointLaserFlag:$("input[id='observationSheetJointLaserFlag']:checked").val(),
 	                    						  observationSidewallSheetTorque:$('#observationSidewallSheetTorque').val(),
 	                    						  observationSidewallFrameWorkFlag:$("input[id='observationSidewallFrameWorkFlag']:checked").val(),
 	                    						  observationSidewallConditionSpotWeldingFlag:$("input[id='observationSidewallConditionSpotWeldingFlag']:checked").val(),
 	                    						  observationHorizontalVerticalJointWeldingFlag:$('#observationHorizontalVerticalJointWeldingFlag').val(),
 	                    						  observationRoofFlangeJointFlag:$("input[id='observationRoofFlangeJointFlag']:checked").val(),
 	                    						  sidewallSheetLengthLh:$('#sidewallSheetLengthLh').val(),
 	                    						  sidewallSheetLengthRh:$('#sidewallSheetLengthRh').val(),
 	                    						  sidewallSheetWidth:$('#sidewallSheetWidth').val(),
 	                    						  sidewallHeightVerticalmemberRoofflange:$('#sidewallHeightVerticalmemberRoofflange').val(),
 	                    						  spotWeldingCarlinearchFlag:$("input[id='spotWeldingCarlinearchFlag']:checked").val(),
 	                    						  brazingCarlineSidewallFlag:$("input[id='brazingCarlineSidewallFlag']:checked").val(),
 	                    						  windowProfileFlag:$("input[id='windowProfileFlag']:checked").val(),
 	                    						  pullBoxDistance:$('#pullBoxDistance').val(),
 	                    						  windowSealLeakageFlag:$("input[id='windowSealLeakageFlag']:checked").val(),
 	                    						  windowSealAngleFlag:$("input[id='windowSealAngleFlag']:checked").val(),
 	                    						  distanceCarlinetopVerticalmember:$('#distanceCarlinetopVerticalmember').val(),
 	                    						  lengthSidewallCarlineLh:$('#lengthSidewallCarlineLh').val(),
 	                    						  lengthSidewallCarlineRh:$('#lengthSidewallCarlineRh').val(),
 	                    						  carlineLeakageFlag:$("input[id='carlineLeakageFlag']:checked").val(),
 	                    						  horizontalVerticalWeldingGrindingFlag:$("input[id='horizontalVerticalWeldingGrindingFlag']:checked").val(), 
 	                    						  distanceBackpieceVerticalmemberTransverse:$('#distanceBackpieceVerticalmemberTransverse').val(),
 	                    						  distanceBackpieceVerticalmemberSingle:$('#distanceBackpieceVerticalmemberSingle').val(),
 	                    						  roofFlangeLength:$('#roofFlangeLength').val(),
 	                    						  widthHatchedDoor:$('#widthHatchedDoor').val(),
 	                    						  distanceBerthchannelVerticalchannelLowerLh:$('#distanceBerthchannelVerticalchannelLowerLh').val(),
 	                    						  distanceBerthchannelVerticalchannelMiddleLh:$('#distanceBerthchannelVerticalchannelMiddleLh').val(),
 	                    						  distanceBerthchannelVerticalchannelUpperLh:$('#distanceBerthchannelVerticalchannelUpperLh').val(),
 	                    						  distanceBerthchannelVerticalchannelLowerRh:$('#distanceBerthchannelVerticalchannelLowerRh').val(),
 	                    						  distanceBerthchannelVerticalchannelUpperRh:$('#distanceBerthchannelVerticalchannelUpperRh').val(),
 	                    						  distanceWindowcenterAnglewindowsupport:$('#distanceWindowcenterAnglewindowsupport').val(),
 	                    						  distanceWindowedgeChannel:$('#distanceWindowedgeChannel').val(),
 	                    						  heightCarline:$('#heightCarline').val(),
 	                    						  lengthSmallcarline:$('#lengthSmallcarline').val(),
 	                    						  angleLowerluggageBottomsidewall:$('#angleLowerluggageBottomsidewall').val(),
 	                    						  distanceAnglehoneyprtSidewallDoorside1:$('#distanceAnglehoneyprtSidewallDoorside1').val(),
 	                    						  distanceAnglehoneyprtSidewallDoorside2:$('#distanceAnglehoneyprtSidewallDoorside2').val(),
 	                    						  distanceAnglehoneyprtSidewallDoorside3:$('#distanceAnglehoneyprtSidewallDoorside3').val(),
 	                    					  	  distanceAnglehoneyprtSidewallDoorside4:$('#distanceAnglehoneyprtSidewallDoorside4').val(),
 	                    						  distanceAnglehoneyprtSidewallMiddlearea1:$('#distanceAnglehoneyprtSidewallMiddlearea1').val(),
 	                    						  distanceAnglehoneyprtSidewallMiddlearea2:$('#distanceAnglehoneyprtSidewallMiddlearea2').val(),
 	                    						  distanceAnglehoneyprtSidewallMiddlearea3:$('#distanceAnglehoneyprtSidewallMiddlearea3').val(),
 	                    						  distanceAnglehoneyprtSidewallMiddlearea4:$('#distanceAnglehoneyprtSidewallMiddlearea4').val(),
 	                    						  detailsOfModification:$('#detailsOfModification').val(),
 	                    						  detailsOfTrialItem:$('#detailsOfTrialItem').val(),
 	                    						  remarks:$('#remarks').val(),
 	                    						 shellSidewallTestingStatus: $('#shellSidewallTestingStatus').val(),
 	                    						 
 	                    						  
 	                    						},
 	                    						
 	                    						type : 'POST',
 	                    						async : false,
 	                            	 		})
 	                    						.done(function( msg ) {
 	                    							
 	                    						$('#sidewallSipDate').val(''),
 	                    							$('#sidewallSipDocNo').val(''),
 	                    							$('#sidewallShellNo').val(''),
 	                    							$('#sidewallShellType').val(''),
 	                    						  	$('#sidewallSipShift').val(''),
 	                    						  	$('#sidewallType').val(''),
 	                    						  $('#drawingNo').val(''),
 	                    						  $('#wiNo').val(''),
 	                    						  $('#frameWorkBy').val(''),
 	                    						  $('#frameJigRoboticsBo').val(''),
 	                    						  $('#spotWeldingBy').val(''),
 	                    						  $('#spotWeldingJigRoboticsBo').val(''),
 	                    						  $('#interlockJointBy').val(''),
 	                    					  	  $('#interlockJointJigRoboticsBo').val(''),
 	                    						  $('#sidewallCarlineMakeLh').val(''),
 	                    						  $('#sidewallCarlineMakeRh').val(''),
 	                    						  $('#sidewallMakeNoLh').val(''),
 	                    						  $('#sidewallMakeNoRh').val(''),
 	                    						  $("input[id='observationItemAsPerDrawingFlag']:checked").val(''),
 	                    						  $("input[id='observationComplianceWiFlag']:checked").val(''),
 	                    						  $("input[id='observationWeldingThoatLengthFlag']:checked").val(''),
 	                    						  $("input[id='observationSheetJointLaserFlag']:checked").val(''),
 	                    						  $('#observationSidewallSheetTorque').val(''),
 	                    						  $("input[id='observationSidewallFrameWorkFlag']:checked").val(''),
 	                    						  $("input[id='observationSidewallConditionSpotWeldingFlag']:checked").val(''),
 	                    						  $('#observationHorizontalVerticalJointWeldingFlag').val(''),
 	                    						  $("input[id='observationRoofFlangeJointFlag']:checked").val(''),
 	                    						  $('#sidewallSheetLengthLh').val(''),
 	                    						  $('#sidewallSheetLengthRh').val(''),
 	                    						  $('#sidewallSheetWidth').val(''),
 	                    						  $('#sidewallHeightVerticalmemberRoofflange').val(''),
 	                    						  $("input[id='spotWeldingCarlinearchFlag']:checked").val(''),
 	                    						  $("input[id='brazingCarlineSidewallFlag']:checked").val(''),
 	                    						  $("input[id='windowProfileFlag']:checked").val(''),
 	                    						  $('#pullBoxDistance').val(''),
 	                    						  $("input[id='windowSealLeakageFlag']:checked").val(''),
 	                    						  $("input[id='windowSealAngleFlag']:checked").val(''),
 	                    						  $('#distanceCarlinetopVerticalmember').val(''),
 	                    						  $('#lengthSidewallCarlineLh').val(''),
 	                    						  $('#lengthSidewallCarlineRh').val(''),
 	                    						  $("input[id='carlineLeakageFlag']:checked").val(''),
 	                    						  $("input[name='horizontalVerticalWeldingGrindingFlag']:checked").val(''), 
 	                    						  $('#distanceBackpieceVerticalmemberTransverse').val(''),
 	                    						  $('#distanceBackpieceVerticalmemberSingle').val(''),
 	                    						  $('#roofFlangeLength').val(''),
 	                    						  $('#widthHatchedDoor').val(''),
 	                    						  $('#distanceBerthchannelVerticalchannelLowerLh').val(''),
 	                    						  $('#distanceBerthchannelVerticalchannelMiddleLh').val(''),
 	                    						  $('#distanceBerthchannelVerticalchannelUpperLh').val(''),
 	                    						  $('#distanceBerthchannelVerticalchannelLowerRh').val(''),
 	                    						  $('#distanceBerthchannelVerticalchannelUpperRh').val(''),
 	                    						  $('#distanceWindowcenterAnglewindowsupport').val(''),
 	                    						  $('#distanceWindowedgeChannel').val(''),
 	                    						  $('#heightCarline').val(''),
 	                    						  $('#lengthSmallcarline').val(''),
 	                    						  $('#angleLowerluggageBottomsidewall').val(''),
 	                    						  $('#distanceAnglehoneyprtSidewallDoorside1').val(''),
 	                    						  $('#distanceAnglehoneyprtSidewallDoorside2').val(''),
 	                    						  $('#distanceAnglehoneyprtSidewallDoorside3').val(''),
 	                    					  	  $('#distanceAnglehoneyprtSidewallDoorside4').val(''),
 	                    						  $('#distanceAnglehoneyprtSidewallMiddlearea1').val(''),
 	                    						  $('#distanceAnglehoneyprtSidewallMiddlearea2').val(''),
 	                    						  $('#distanceAnglehoneyprtSidewallMiddlearea3').val(''),
 	                    						  $('#distanceAnglehoneyprtSidewallMiddlearea4').val(''),
 	                    						  $('#detailsOfModification').val(''),
 	                    						  $('#detailsOfTrialItem').val(''),
 	                    						  $('#remarks').val(''),
 	                
 	                    							                    							
 	                    							$('#sidewallSIPDialog').dialog('close');
 	                    							$('#ShellProductionTableContainer').jtable('load');
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
 				                        	$('#sidewallSIPDialog').find('form[name="sidewallSip"]')[0].reset(); 
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
                         text: 'Roof SIP',
                         click: function () {
                         	
                         	
                         	
                         	 var $selectedRows = $('#ShellProductionTableContainer').jtable('selectedRows');
                     	 	 if ($selectedRows.length<1)
                     		 alert("Please select a row for which you want to fill inspection");
                     	 	 else{
                     	 		var record;
                     	 		$selectedRows.each(function () {
                                     record = $(this).data('record');
                                     });
 								//setting min value
 								$.ajax({
 								url:"showExistingRoofData",  //action-name as defined in struts.xml
 								dataType:'json',
 								type:'POST',
 								async:false,
 								data:{
 								shellAssetId:record.shellAssetId,	
 								},
 								success:function(data)
 								{
 									$('#roofSipDocNo').val(data.docNoRoof);
 									$('#roofType').val(data.shellType);
 									$('#roofMake').val(data.shellNo);
 									
 								}
 									
 								});
 								//end of code
 								if(record.roofSipFlag==1)
 								{
 								
 								$.ajax({
 									url:"showSaveDataRoof", //action-name as defined in struts.xml
 									dataType:'json',
 									type:'POST',
 									async:false,
 									data:{
 									shellAssetId:record.shellAssetId,	
 									},
 									success:function(data)
 									{
 										$('#roofSipShift').val(data.shellRoofTransaction.roofSipShift);
 										$('#roofType').val(data.shellRoofTransaction.roofType);
 										
 										var roofDate=(data.shellRoofTransaction.roofSipDate).substring(0,10);
 										var roofDateArray=roofDate.split("-");
 										$('#roofSipDate').datepicker("setDate",new Date(roofDateArray[0],roofDateArray[1]-1,roofDateArray[2])); 
 										$('#applicableDrawingNo').val(data.shellRoofTransaction.applicableDrawingNo);
 										$('#applicableWiNo').val(data.shellRoofTransaction.applicableWiNo);
 									   $('[id="machineSpotWeild"]').val([data.shellRoofTransaction.machineSpotWeild]);
 										//$('#machineSpotWeild').val(data.shellRoofTransaction.machineSpotWeild);
 										$('[id="observationItemAsPerDrawing"]').val([data.shellRoofTransaction.observationItemAsPerDrawing]);
 										//$('#observationItemAsPerDrawing').val(data.shellRoofTransaction.observationItemAsPerDrawing);
 										$('[id="observationComplianceWi"]').val([data.shellRoofTransaction.observationComplianceWi]);
 										//$('#observationComplianceWi').val(data.shellRoofTransaction.observationComplianceWi);
 										$('[id="observationWeildingThroatLength"]').val([data.shellRoofTransaction.observationWeildingThroatLength]);
 										//$('#observationWeildingThroatLength').val(data.shellRoofTransaction.observationWeildingThroatLength);
 										$('#lengthRoof').val(data.shellRoofTransaction.lengthRoof);
 										$('#lengthRoofsheet').val(data.shellRoofTransaction.lengthRoofsheet);
 										$('#widthRoofsheet').val(data.shellRoofTransaction.widthRoofsheet);
 										$('#roofArchPositionPp').val(data.shellRoofTransaction.roofArchPositionPp);
 										$('#roofArchPositionNpp').val(data.shellRoofTransaction.roofArchPositionNpp);
 										$('#roofArchCompletePp').val(data.shellRoofTransaction.roofArchCompletePp);
 										$('#roofArchCompleteNpp').val(data.shellRoofTransaction.roofArchCompleteNpp);
 										$('#crossBraceHeight').val(data.shellRoofTransaction.crossBraceHeight);
 										$('#roofArchWidth').val(data.shellRoofTransaction.roofArchWidth);
 										$('#distanceRoofcenterlineFanbkt').val(data.shellRoofTransaction.distanceRoofcenterlineFanbkt);
 										$('#distanceRoofcenterlineCenterlinebkt').val(data.shellRoofTransaction.distanceRoofcenterlineCenterlinebkt);
 										$('#distanceRoofcenterlineBerthsuspensionbkt').val(data.shellRoofTransaction.distanceRoofcenterlineBerthsuspensionbkt);
 										$('#trayAreaLength').val(data.shellRoofTransaction.trayAreaLength);
 										$('#distanceRoofcenterlineFanbktNppPp').val(data.shellRoofTransaction.distanceRoofcenterlineFanbktNppPp);
 										$('#distanceRoofcenterlineTerminalboardbktNppPp').val(data.shellRoofTransaction.distanceRoofcenterlineTerminalboardbktNppPp);
 										$('#distanceRoofcenterlineChannelLhRh').val(data.shellRoofTransaction.distanceRoofcenterlineChannelLhRh);
 										$('#distanceCrossBraceBracket').val(data.shellRoofTransaction.distanceCrossBraceBracket);
 										$('#checkedDimensionRemark').val(data.shellRoofTransaction.checkedDimensionRemark);
 										$('#distanceCenterlineroofCenterlineflbkts').val(data.shellRoofTransaction.distanceCenterlineroofCenterlineflbkts);
 										//$('#conditionRoofSheetJoint').val(data.shellRoofTransaction.conditionRoofSheetJoint);
 										$('[id="conditionRoofSheetJoint"]').val([data.shellRoofTransaction.conditionRoofSheetJoint]);
 										//$('#roofSheetJointLeakage').val(data.shellRoofTransaction.roofSheetJointLeakage);
 										$('[id="roofSheetJointLeakage"]').val([data.shellRoofTransaction.roofSheetJointLeakage]);
 										//$('#conditionRoofSheetArch').val(data.shellRoofTransaction.conditionRoofSheetArch);
 										$('[id="conditionRoofSheetArch"]').val([data.shellRoofTransaction.conditionRoofSheetArch]);
 										$('#distanceRoofcenterlineCenterlineelbkt').val(data.shellRoofTransaction.distanceRoofcenterlineCenterlineelbkt);
 										//$('#fittmentLstiffener').val(data.shellRoofTransaction.fittmentLstiffener);
 										$('[id="fittmentLstiffener"]').val([data.shellRoofTransaction.fittmentLstiffener]);
 										$('#distanceRoofcenterlineSpeakerbkt').val(data.shellRoofTransaction.distanceRoofcenterlineSpeakerbkt);
 										$('#distanceRoofcenterlineElbkt').val(data.shellRoofTransaction.distanceRoofcenterlineElbkt);
 										$('#noCrossBracesFitted').val(data.shellRoofTransaction.noCrossBracesFitted);
 										$('#detailsOfModification').val(data.shellRoofTransaction.detailsOfModification);
 										$('#detailsOfTrial').val(data.shellRoofTransaction.detailsOfTrial);
 										$('#remarks').val(data.shellRoofTransaction.remarks);
 										//$('#shellRoofSipTestingStatus').val(data.shellRoofTransaction.shellRoofSipTestingStatus);
 										$('[id="shellRoofSipTestingStatus"]').val([data.shellRoofTransaction.shellRoofSipTestingStatus]);
 										$('#entryBy').val(data.shellRoofTransaction.entryBy);
 										$('#entryTime').val(data.shellRoofTransaction.entryTime);
 										
 									}
 										
 									});
 								
 								}
 								
 								$('#roofSipDate').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
 								
             					
                     	 	 	$("#RoofSIPDialog").dialog({
                     	 	 		title : 'Roof Inspection for '+record.shellTransactionId + 'from Stage- <%=stageID%>', 
                     	 	 		width:'60%',
                     	 	 		close: function (e, u) {
               	 		              //$(".formError").remove();
               	 		          	$("#RoofSIPDialog").validationEngine('hideAll');
               	 		          	$('#RoofSIPDialog').find('form[name="roofSIP"]')[0].reset();
               	 		          	
               	 		          },
                 	 		 	
  		 							buttons: {
 	                                    Submit: {
 	                                       text: "Submit",
 	                                        id: "my-button-submit",
 	                                        click:function () {
 	                                        	
 	 	                                    	
 	                            	 		 	
 	                                    	
 	                                   
 	                                    	 
 	                                    	if ($('#roofType').validationEngine('validate')) {
 				                                            return false;
 				                                        }
 	                                    	

 	                                    	if ($('#roofMake').validationEngine('validate')) {
 				                                            return false;
 				                                        }
 	                                    	
 	                                    	
 	                                    	if ($('#lengthRoof').validationEngine('validate')) {
 	                                            return false;
 	                                        }
 	                                    	//alert("error");
 	                                    	if ($('#lengthRoofsheet').validationEngine('validate')) {
 	                                            return false;
 	                                        }
 	                                    	if ($('#widthRoofsheet').validationEngine('validate')) {
 	                                            return false;
 	                                        }
 	                                    	if ($('#roofArchPositionPp').validationEngine('validate')) {
 	                                            return false;
 	                                        }
 	                                    	
 	                                    	if ($('#roofArchPositionNpp').validationEngine('validate')) {
 	                                            return false;
 	                                        }
 	                                    
 	                                    	if ($('#roofArchCompletePp').validationEngine('validate')) {
 	                                            return false;
 	                                        }
 	                                    	if ($('#roofArchCompleteNpp').validationEngine('validate')) {
 	                                            return false;
 	                                        }
 	                                    	if ($('#crossBraceHeight').validationEngine('validate')) {
 	                                            return false;
 	                                        }
 	                                    	if ($('#roofArchWidth').validationEngine('validate')) {
 	                                            return false;
 	                                        }
 	                                    	
 	                                    	
 	                                    	//similar for others
 				                                        
 	                                    	var c=confirm("submit data for Roof");
 	                                    	if(c==false){return false;}
                                           //   if ($('#underFrameNumber').validationEngine('validate')) {
 	                                        	
 	                                       //     return false;
 	                                      //  }
 	                                    		    	   
 	                                    	$.ajax({
 	                    						url : "saveRoofSIP",  //action-name as defined in struts.xml
 	                    						dataType: 'json', 
 	                    						data : {
 	                    							shellAssetId: record.shellAssetId,                   							
 	                    							roofSipDocNo:$('#roofSipDocNo').val(),              							
 	                    							roofSipShift:$('#roofSipShift').val(),
 	                    					
 	                    					        roofSipDate: $('#roofSipDate').val(),  
 	                    							roofType:$('#roofType').val(),
 	                    							roofMake:$('#roofMake').val(),              							
 	                    							applicableDrawingNo:$('#applicableDrawingNo').val(),
 	                    							applicableWiNo: $('#applicableWiNo').val(),                   							
 	                    							machineSpotWeild:$("input[id='machineSpotWeild']:checked").val(),              							
 	                    							observationItemAsPerDrawing:$("input[id='observationItemAsPerDrawing']:checked").val(),
 	                    							observationComplianceWi: $("input[id='observationComplianceWi']:checked").val(),                   							
 	                    							observationWeildingThroatLength:$("input[id='observationWeildingThroatLength']:checked").val(),              							
 	                    							lengthRoof:$('#lengthRoof').val(),
 	                    						//	underFrameNumber:$('#underFrameNumber').val(),
 	                    							lengthRoofsheet:$('#lengthRoofsheet').val(),
 	                    							widthRoofsheet:$('#widthRoofsheet').val(),
 	                    							 roofArchPositionPp:$('#roofArchPositionPp').val(),
 	                    							 roofArchPositionNpp:$('#roofArchPositionNpp').val(),
 	                    							roofArchCompletePp:$('#roofArchCompletePp').val(),
 	                    							roofArchCompleteNpp:$('#roofArchCompleteNpp').val(),
 	                    						    crossBraceHeight:$('#crossBraceHeight').val(),
 	                    							roofArchWidth:$('#roofArchWidth').val(),
 	                    							distanceRoofcenterlineFanbkt:$('#distanceRoofcenterlineFanbkt').val(),
 	                    							distanceRoofcenterlineCenterlinebkt:$('#distanceRoofcenterlineCenterlinebkt').val(),
 	                    							distanceRoofcenterlineBerthsuspensionbkt:$('#distanceRoofcenterlineBerthsuspensionbkt').val(),
 	                    							trayAreaLength:$('#trayAreaLength').val(),
 	                    							distanceRoofcenterlineFanbktNppPp:$('#distanceRoofcenterlineFanbktNppPp').val(),
 	                    							distanceRoofcenterlineTerminalboardbktNppPp:$('#distanceRoofcenterlineTerminalboardbktNppPp').val(),
 	                    							distanceRoofcenterlineChannelLhRh:$('#distanceRoofcenterlineChannelLhRh').val(),
 	                    							distanceCrossBraceBracket:$('#distanceCrossBraceBracket').val(),
 	                    						    checkedDimensionRemark:$('#checkedDimensionRemark').val(),
 	                    						    distanceCenterlineroofCenterlineflbkts:$('#distanceCenterlineroofCenterlineflbkts').val(),
 	                    							conditionRoofSheetJoint:$("input[id='conditionRoofSheetJoint']:checked").val(),
 	                    							roofSheetJointLeakage:$("input[id='roofSheetJointLeakage']:checked").val(),
 	                    							conditionRoofSheetArch:$("input[id='conditionRoofSheetArch']:checked").val(),
 	                    						    distanceRoofcenterlineCenterlineelbkt:$('#distanceRoofcenterlineCenterlineelbkt').val(),
 	                    						    fittmentLstiffener:$("input[id='fittmentLstiffener']:checked").val(),
 	                    							distanceRoofcenterlineSpeakerbkt:$('#distanceRoofcenterlineSpeakerbkt').val(),
 	                    							distanceRoofcenterlineElbkt:$('#distanceRoofcenterlineElbkt').val(),
 	                    							noCrossBracesFitted:$('#noCrossBracesFitted').val(),
 	                    				            detailsOfModification:$('#detailsOfModification').val(),
 	                    							detailsOfTrial:$('#detailsOfTrial').val(),
 	                    							remarks:$('#remarks').val(),
 	                    							shellRoofSipTestingStatus:$('#shellRoofSipTestingStatus').val(),
 	                    							entryby:$('#entryBy').val(),
 	                    							entrytime:$('#entryTime').val()
 	                    						},
 	                    						
 	                    						type : 'POST',
 	                    						async : false,
 	                            	 		})
 	                    						.done(function( msg ) {
 	                    							$('#shellAssetId').val(''),                   							
 		                    						$('#roofSipDocNo').val(''),              							
 		                    					    $('#roofSipShift').val(''),
 		                    						$('#roofSipDate').val(''),
 		                    						$('#roofType').val(''),
 		                    						$('#roofMake').val(''),              							
 		                    						$('#applicableDrawingNo').val(''),
 		                    						$('#applicableWiNo').val(''),                   							
 		                    						$('#machineSpotWeild').val(''),              							
 		                    						$('#observationItemAsPerDrawing').val(''),
 		                    						$('#observationComplianceWi').val(''),                   							
 		                    						$('#observationWeildingThroatLength').val(''),              							
 		                    						$('#lengthRoof').val(''),
 		                    						//	underFrameNumber:$('#underFrameNumber').val(),
 		                    						$('#lengthRoofsheet').val(''),
 		                    						$('#widthRoofsheet').val(''),
 		                    						$('#roofArchPositionPp').val(''),
 		                    						$('#roofArchPositionNpp').val(''),
 		                    						$('#roofArchCompletePp').val(''),
 		                    						$('#roofArchCompleteNpp').val(''),
 		                    					    $('#crossBraceHeight').val(''),
 		                    						$('#roofArchWidth').val(''),
 		                    						$('#distanceRoofcenterlineFanbkt').val(''),
 		                   							$('#distanceRoofcenterlineCenterlinebkt').val(''),
 		                   							$('#distanceRoofcenterlineBerthsuspensionbkt').val(''),
 		                   							$('#trayAreaLength').val(''),
 		                   							$('#distanceRoofcenterlineFanbktNppPp').val(''),
 		                   							$('#distanceRoofcenterlineTerminalboardbktNppPp').val(''),
 		                   							$('#distanceRoofcenterlineChannelLhRh').val(''),
 		                   						    $('#distanceCrossBraceBracket').val(''),
 		                   							$('#checkedDimensionRemark').val(''),
 		                    						$('#distanceCenterlineroofCenterlineflbkts').val(''),
 		                    						$('#conditionRoofSheetJoint').val(''),
 		                    						$('#roofSheetJointLeakage').val(''),
 		                    					    $('#conditionRoofSheetArch').val(''),
 		                    						$('#distanceRoofcenterlineCenterlineelbkt').val(''),
 		                    						$('#fittmentLstiffener').val(''),
 		                    						$('#distanceRoofcenterlineSpeakerbkt').val(''),
 		                    					    $('#distanceRoofcenterlineElbkt').val(''),
 		                    				        $('#noCrossBracesFitted').val(''),
 		                    						$('#detailsOfModification').val(''),
 		                    					    $('#detailsOfTrial').val(''),
 		                    						$('#remarks').val(''),
 		                    					    $('#shellRoofSipTestingStatus').val(''),
 		                    					    $('#entryBy').val(''),
 		                    					    $('#entryTime').val(''),
 	                    							
 	      
 	                    							$('#RoofSIPDialog').dialog('close');
 	                    							
 	                    							$('#ShellProductionTableContainer').jtable('load');
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
 				                        	$('#RoofSIPDialog').find('form[name="roofSIP"]')[0].reset();
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
                         text: 'Underframe SIP',
                         click: function () {
                         	
                         	
                         	
                         	 var $selectedRows = $('#ShellProductionTableContainer').jtable('selectedRows');
                     	 	 if ($selectedRows.length<1)
                     		 alert("Please select a row for which you want to set Inspection For Underframe");
                     	 	 else{
                     	 		var record;
                     	 		$selectedRows.each(function () {
                                     record = $(this).data('record');
                                     });
 								//setting min value
 								$.ajax({
 								url:"showExistingShellData",  //action-name as defined in struts.xml
 								dataType:'json',
 								type:'POST',
 								async:false,
 								data:{
 								shellAssetId:record.shellAssetId,	
 								},
 								success:function(data)
 								{
 									$('#underframeDocNo').val(data.docnounderframe);
 									$('#shellType').val(data.shellType);
 									$('#shellNo').val(data.shellNo);
 									
 								}
 									
 								});
 								
 								if(record.underframeSipFlag==1)
 								{
 								
 								$.ajax({
 									url:"showSaveDataUnderframe", //action-name as defined in struts.xml
 									dataType:'json',
 									type:'POST',
 									async:false,
 									data:{
 									shellAssetId:record.shellAssetId,	
 									},
 									success:function(data)
 									{	
 										$('#underframeShiftSelect').val(data.shellUndeframeSipTrans.underframeShiftSelect);
 										var underframedate=(data.shellUndeframeSipTrans.underframeDate).substring(0,10);
 										var framedateArray=underframedate.split("-");
 										$('#underframeDate').datepicker("setDate",new Date(framedateArray[0],framedateArray[1]-1,framedateArray[2]));
 										$('#appDrawNoUnderframe').val(data.shellUndeframeSipTrans.appDrawNoUnderframe);
 										$('#appLineNoUnderframe').val(data.shellUndeframeSipTrans.appLineNoUnderframe);
 										$('#appWiNoUnderframe').val(data.shellUndeframeSipTrans.appWiNoUnderframe);
 										
 										$('#frntPrtPp').val(data.shellTran.frntPrtPp);
 										$('#frntPrtNpp').val(data.shellTran.frntPrtNpp);
 										$('#waterTankBkt1').val(data.shellTran.waterTankBkt1);
 										
 										$('#waterTankBkt2').val(data.shellTran.waterTankBkt2);
 										$('#waterTankBkt3').val(data.shellTran.waterTankBkt3);
 										$('#waterTankBkt4').val(data.shellTran.waterTankBkt4);
 										$('#cbCMakePp1').val(data.shellTran.cbCMakePp1);
 										$('#cbCMakePp2').val(data.shellTran.cbCMakePp2);
 										$('#cbCMakeNpp1').val(data.shellTran.cbCMakeNpp1);
 										$('#cbCMakeNpp2').val(data.shellTran.cbCMakeNpp2);
 										$('#cbCFitPp').val(data.shellTran.cbCFitPp);
 										$('#cbCFitNpp').val(data.shellTran.cbCFitNpp);
 										$('#underframeMakeNo').val(data.shellTran.underframeMakeNo);
 										
 										$('[id="itemsFitted"]').val([data.shellUndeframeSipTrans.itemsFitted]);
 										$('[id="compAppWi"]').val([data.shellUndeframeSipTrans.compAppWi]);
 										$('[id="weldThroatLen"]').val([data.shellUndeframeSipTrans.weldThroatLen]);
 										$('[id="tightScrew"]').val([data.shellUndeframeSipTrans.tightScrew]);
 										$('[id="outerFaceOuterHead"]').val([data.shellUndeframeSipTrans.outerFaceOuterHead]);
 										$('[id="conditionOfPlugWelding"]').val([data.shellUndeframeSipTrans.conditionOfPlugWelding]);
 										$('[id="conditionOfConsole"]').val([data.shellUndeframeSipTrans.conditionOfConsole]);
 										$('#bodyBolster').val(data.shellUndeframeSipTrans.bodyBolster);
 										$('#completeLenUndeframe').val(data.shellUndeframeSipTrans.completeLenUndeframe);
 										$('#frntPartToFront').val(data.shellUndeframeSipTrans.frntPartToFront);
 										$('#ufWidth').val(data.shellUndeframeSipTrans.ufWidth);
 										$('#coveringPlate').val(data.shellUndeframeSipTrans.coveringPlate);
 										$('#wedgeBolt').val(data.shellUndeframeSipTrans.wedgeBolt);
 										$('[id="waterTankMount"]').val([data.shellUndeframeSipTrans.waterTankMount]);
 										$('#frntPartBrktDist').val(data.shellUndeframeSipTrans.frntPartBrktDist);
 										$('#distBwConsoleBrkt').val(data.shellUndeframeSipTrans.distBwConsoleBrkt);
 										$('#footStepsDist').val(data.shellUndeframeSipTrans.footStepsDist);
 										$('[id="suppMemTrough"]').val([data.shellUndeframeSipTrans.suppMemTrough]);
 										$('[id="pillarMountChannel"]').val([data.shellUndeframeSipTrans.pillarMountChannel]);
 										$('#distBwCurvedRoll').val(data.shellUndeframeSipTrans.distBwCurvedRoll);
 										$('[id="grindWeldJoints"]').val([data.shellUndeframeSipTrans.grindWeldJoints]);
 										$('[id="holesForDrawing"]').val([data.shellUndeframeSipTrans.holesForDrawing]);
 										$('[id="holesDrilled"]').val([data.shellUndeframeSipTrans.holesDrilled]);
 										$('#distBwCenterCenter').val(data.shellUndeframeSipTrans.distBwCenterCenter);
 										$('[id="doorFixBrkt"]').val([data.shellUndeframeSipTrans.doorFixBrkt]);
 										$('#doorFixBrktOb').val(data.shellUndeframeSipTrans.doorFixBrktOb);
 										$('[id="fitmentDimenBiotank"]').val([data.shellUndeframeSipTrans.fitmentDimenBiotank]);
 										$('#longDistBrktBrktpp').val(data.shellUndeframeSipTrans.longDistBrktBrktpp);
 										$('#longDistBrktBrktnpp').val(data.shellUndeframeSipTrans.longDistBrktBrktnpp);
 										$('#latDistBrktFrntpp').val(data.shellUndeframeSipTrans.latDistBrktFrntpp);
 										$('#latDistBrktFrntnpp').val(data.shellUndeframeSipTrans.latDistBrktFrntnpp);
 										$('#bioTankHoleDist').val(data.shellUndeframeSipTrans.bioTankHoleDist);
 										$('#distCenCen').val(data.shellUndeframeSipTrans.distCenCen);
 										$('#genMmountScrew1').val(data.shellUndeframeSipTrans.genMmountScrew1);
 										$('#genMmountScrew2').val(data.shellUndeframeSipTrans.genMmountScrew2);
 										$('[id="cbcUncoup"]').val([data.shellUndeframeSipTrans.cbcUncoup]);
 										$('#transfMount').val(data.shellUndeframeSipTrans.transfMount);
 										$('#batteryBox').val(data.shellUndeframeSipTrans.batteryBox);
 										$('#airBrakeModule').val(data.shellUndeframeSipTrans.airBrakeModule);
 										$('#guideDistPP').val(data.shellUndeframeSipTrans.guideDistPP);
 										$('#guideDistNPP').val(data.shellUndeframeSipTrans.guideDistNPP);
 										$('#twinePipHoleObs').val(data.shellUndeframeSipTrans.twinePipHoleObs);
 										$('[id="fibaBktAirPro"]').val([data.shellUndeframeSipTrans.fibaBktAirPro]);
 										$('[id="reserBktAirPro"]').val([data.shellUndeframeSipTrans.reserBktAirPro]);
 										$('#distanceCrossMemberpp1').val(data.shellUndeframeSipTrans.distanceCrossMemberpp1);
 										$('#distanceCrossMemberpp2').val(data.shellUndeframeSipTrans.distanceCrossMemberpp2);
 										$('#distanceCrossMemberpp3').val(data.shellUndeframeSipTrans.distanceCrossMemberpp3);
 										$('#distanceCrossMemberpp4').val(data.shellUndeframeSipTrans.distanceCrossMemberpp4);
 										
 										$('#distanceCrossMemberpp5').val(data.shellUndeframeSipTrans.distanceCrossMemberpp5);
 										$('#distanceCrossMemberpp6').val(data.shellUndeframeSipTrans.distanceCrossMemberpp6);
 										$('#distanceCrossMemberpp7').val(data.shellUndeframeSipTrans.distanceCrossMemberpp7);
 										$('#distanceCrossMemberpp8').val(data.shellUndeframeSipTrans.distanceCrossMemberpp8);
 										$('#distanceCrossMemberpp9').val(data.shellUndeframeSipTrans.distanceCrossMemberpp9);
 										$('#distanceCrossMemberpp10').val(data.shellUndeframeSipTrans.distanceCrossMemberpp10);
 										$('#distanceCrossMembernpp1').val(data.shellUndeframeSipTrans.distanceCrossMembernpp1);
 										$('#distanceCrossMembernpp2').val(data.shellUndeframeSipTrans.distanceCrossMembernpp2);
 										$('#distanceCrossMembernpp3').val(data.shellUndeframeSipTrans.distanceCrossMembernpp3);
 										$('#distanceCrossMembernpp4').val(data.shellUndeframeSipTrans.distanceCrossMembernpp4);
 										$('#distanceCrossMembernpp5').val(data.shellUndeframeSipTrans.distanceCrossMembernpp5);
 										$('#distanceCrossMembernpp6').val(data.shellUndeframeSipTrans.distanceCrossMembernpp6);
 										$('#distanceCrossMembernpp7').val(data.shellUndeframeSipTrans.distanceCrossMembernpp7);
 										$('#distanceCrossMembernpp8').val(data.shellUndeframeSipTrans.distanceCrossMembernpp8);
 										$('#distanceCrossMembernpp9').val(data.shellUndeframeSipTrans.distanceCrossMembernpp9);
 										$('#distanceCrossMembernpp10').val(data.shellUndeframeSipTrans.distanceCrossMembernpp10);
 										$('#obserVal').val(data.shellUndeframeSipTrans.obserVal);
 										$('#detlOfModf').val(data.shellUndeframeSipTrans.detlOfModf);
 										$('#detlOfTrialItems').val(data.shellUndeframeSipTrans.detlOfTrialItems);
 										$('#rmk').val(data.shellUndeframeSipTrans.rmk);
 										$('#shellUnderframeSipTestingStatus').val(data.shellUndeframeSipTrans.underframeTestingStatus);
 										
 								
 										
 									}
 										
 									});
 								
 								}


 								
 								$('#underframeDate').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
 								
             					
                     	 	 	$("#UnderframeSIPDialog").dialog({
                     	 	 		title : 'Exit for  '+record.shellTransactionId + 'from Stage- <%=stageID%>',  
                     	 	 		width:'60%',
                     	 	 		close: function (e, u) {
                     	 	 			$('#UnderframeSIPDialog').find('form[name="underframeSIP"]')[0].reset();
               	 		          	$("#UnderframeSIPDialog").validationEngine('hideAll');
               	 		          },
                 	 		 	
  		 							buttons: {
 	                                    Submit: {
 	                                       text: "Submit",
 	                                        id: "my-button-submit",
 	                                        click:function () {
 	                                     
 	                                    	if ($('#underframeDocNo').validationEngine('validate')) {
 	                                        	
 	                                            return false;
 	                                        }
 	                                    	
 											  if ($('#appDrawNoUnderframe').validationEngine('validate')) {
 		                                        	
 		                                            return false;
 		                                        }

 											if ($('#appLineNoUnderframe').validationEngine('validate')) {
 	                                        	
 	                                            return false;
 	                                        }										
 											if ($('#frntPrtPp').validationEngine('validate')) {
 												
 	   											 return false;
 												}
 											if ($('#frntPrtNpp').validationEngine('validate')) {
 												
 	   											 return false;
 												}
 											if ($('#waterTankBkt1').validationEngine('validate')) {
 												
 	   											 return false;
 												}
 											if ($('#waterTankBkt2').validationEngine('validate')) {
 												
 	   											 return false;
 												}
 											if ($('#waterTankBkt3').validationEngine('validate')) {
 												
 	   											 return false;
 												}
 											if ($('#waterTankBkt4').validationEngine('validate')) {
 												
 	   											 return false;
 												}
 											if ($('#cbCMakePp1').validationEngine('validate')) {
 												
 	   											 return false;
 												}
 											if ($('#cbCMakePp2').validationEngine('validate')) {
 												
 	   											 return false;
 												}
 											if ($('#cbCMakeNpp1').validationEngine('validate')) {
 												
 	   											 return false;
 												}
 											if ($('#cbCMakeNpp2').validationEngine('validate')) {
 												
 	   											 return false;
 												}
 											if ($('#cbCFitPp').validationEngine('validate')) {
 												
 	   											 return false;
 												}
 											if ($('#cbCFitNpp').validationEngine('validate')) {
 												
 	   											 return false;
 												}

 											if ($('#underframeMakeNo').validationEngine('validate')) {
 												
 	   											 return false;
 												}
 											
 											if ($('#bodyBolster').validationEngine('validate')) {
 	
 											    return false;
 											}
 											if ($('#completeLenUndeframe').validationEngine('validate')) {
 												
 											    return false;
 											}
 											if ($('#frntPartToFront').validationEngine('validate')) {
 												
 											    return false;
 											}
 											if ($('#ufWidth').validationEngine('validate')) {
 												
 											    return false;
 											}
 											if ($('#coveringPlate').validationEngine('validate')) {
 												
 											    return false;
 											}
 											if ($('#wedgeBolt').validationEngine('validate')) {
 												
 											    return false;
 											}
 											
 											if ($('#frntPartBrktDist').validationEngine('validate')) {
 												
 											    return false;
 											}
 											
 											
 											if ($('#distBwConsoleBrkt').validationEngine('validate')) {
 												
 											    return false;
 											}
 											if ($('#footStepsDist').validationEngine('validate')) {
 												                                        	
 												 return false;
 												                                        }
 											if ($('#distBwCurvedRoll').validationEngine('validate')) {
 												
 											    return false;
 											}
 											if ($('#distBwCenterCenter').validationEngine('validate')) {
 												
 											    return false;
 											}
 											if ($('#doorFixBrktOb').validationEngine('validate')) {
 												
 											    return false;
 											}

 											
 											if ($('#longDistBrktBrktpp').validationEngine('validate')) {
 												
 											    return false;
 											}
 											if ($('#longDistBrktBrktnpp').validationEngine('validate')) {
 												
 											    return false;
 											}
 											if ($('#latDistBrktFrntpp').validationEngine('validate')) {
 												
 											    return false;
 											}
 											if ($('#latDistBrktFrntnpp').validationEngine('validate')) {
 												
 											    return false;
 											}
 											if ($('#bioTankHoleDist').validationEngine('validate')) {
 																							
 											    return false;
 											}
 											if ($('#distCenCen').validationEngine('validate')) {
 												
 											    return false;
 											}
 											if ($('#genMmountScrew1').validationEngine('validate')) {
 												
 											    return false;
 											}
 											if ($('#genMmountScrew2').validationEngine('validate')) {
 												
 											    return false;
 											}
 											if ($('#transfMount').validationEngine('validate')) {
 												
 											    return false;
 											}
 											if ($('#batteryBox').validationEngine('validate')) {
 												
 											    return false;
 											}
 											if ($('#airBrakeModule').validationEngine('validate')) {
 												
 											    return false;
 											}
 											if ($('#guideDistPP').validationEngine('validate')) {
 												
 											    return false;
 											}
 											if ($('#guideDistNPP').validationEngine('validate')) {
 												
 											    return false;
 											}
 											if ($('#twinePipHoleObs').validationEngine('validate')) {
 																							
 											   return false;
 											}
 											if ($('#distanceCrossMemberpp1').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#distanceCrossMemberpp2').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#distanceCrossMemberpp3').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#distanceCrossMemberpp4').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#distanceCrossMemberpp5').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#distanceCrossMemberpp6').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#distanceCrossMemberpp7').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#distanceCrossMemberpp8').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#distanceCrossMemberpp9').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#distanceCrossMemberpp10').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#distanceCrossMembernpp1').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#distanceCrossMembernpp2').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#distanceCrossMembernpp3').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#distanceCrossMembernpp4').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#distanceCrossMembernpp5').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#distanceCrossMembernpp6').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#distanceCrossMembernpp7').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#distanceCrossMembernpp8').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#distanceCrossMembernpp9').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#distanceCrossMembernpp10').validationEngine('validate')) {
 												
 												   return false;
 												}
 											if ($('#obserVal').validationEngine('validate')) {
 												
 											    return false;
 											}
 											
 	                                    	var c=confirm("Verify data before save, Do you want to Save");
 	                                    	if(c==false){return false;}
                                           //   if ($('#underFrameNumber').validationEngine('validate')) {
 	                                        	
 	                                       //     return false;
 	                                      //  }
 	                                    		    	   
 	                                    	$.ajax({
 	                    						url : "UnderframeSIP",  //action-name as defined in struts.xml
 	                    						dataType: 'json', 
 	                    						data : {
 	                    							shellAssetId: record.shellAssetId,
 	                    							
 	                    							
 	                    							appDrawNoUnderframe:$('#appDrawNoUnderframe').val(),
 	                    							underframeDocNo:$('#underframeDocNo').val(),              							
 	                    							underframeShiftSelect:$('#underframeShiftSelect').val(),
 	                    							underframeDate:$('#underframeDate').val(),
 	                    							appLineNoUnderframe:$('#appLineNoUnderframe').val(),
 	                    							appWiNoUnderframe:$('#appWiNoUnderframe').val(),
 	                    							
 	                    							frntPrtPp:$('#frntPrtPp').val(),
 	                    							frntPrtNpp:$('#frntPrtNpp').val(),
 	                    							waterTankBkt1:$('#waterTankBkt1').val(),
 	                    							waterTankBkt2:$('#waterTankBkt2').val(),
 	                    							waterTankBkt3:$('#waterTankBkt3').val(),
 	                    							waterTankBkt4:$('#waterTankBkt4').val(),
 	                    							cbCMakePp1:$('#cbCMakePp1').val(),
 	                    							cbCMakePp2:$('#cbCMakePp2').val(),
 	                    							cbCMakeNpp1:$('#cbCMakeNpp1').val(),
 	                    							cbCMakeNpp2:$('#cbCMakeNpp2').val(),
 	                    							cbCFitPp:$('#cbCFitPp').val(),
 	                    							cbCFitNpp:$('#cbCFitNpp').val(),
 	                    							underframeMakeNo:$('#underframeMakeNo').val(),
 	                    							
 	                    							itemsFitted:$("input[id='itemsFitted']:checked").val(),
 	                    							compAppWi:$("input[id='compAppWi']:checked").val(),
 	                    							
 	                    							weldThroatLen:$("input[id='weldThroatLen']:checked").val(),
 	                    							tightScrew:$("input[id='tightScrew']:checked").val(),
 	                    							outerFaceOuterHead:$("input[id='outerFaceOuterHead']:checked").val(),
 	                    							conditionOfPlugWelding:$("input[id='conditionOfPlugWelding']:checked").val(),
 	                    							conditionOfConsole:$("input[id='conditionOfConsole']:checked").val(),
 	                    							bodyBolster:$('#bodyBolster').val(),
 	                    							completeLenUndeframe:$('#completeLenUndeframe').val(),
 	                    							frntPartToFront:$('#frntPartToFront').val(),
 	                    							ufWidth:$('#ufWidth').val(),
 	                    							coveringPlate:$('#coveringPlate').val(),
 	                    							wedgeBolt:$('#wedgeBolt').val(),
 	                    							waterTankMount:$("input[id='waterTankMount']:checked").val(),
 	                    							frntPartBrktDist:$('#frntPartBrktDist').val(),
 	                    							footStepsDist:$('#footStepsDist').val(),
 	                    							distBwConsoleBrkt:$('#distBwConsoleBrkt').val(),
 	                    							suppMemTrough:$("input[id='suppMemTrough']:checked").val(),
 	                    							pillarMountChannel:$("input[id='pillarMountChannel']:checked").val(),
 	                    							distBwCurvedRoll:$('#distBwCurvedRoll').val(),
 	                    							grindWeldJoints:$("input[id='grindWeldJoints']:checked").val(),
 	                    							holesForDrawing:$("input[id='holesForDrawing']:checked").val(),
 	                    							holesDrilled:$("input[id='holesDrilled']:checked").val(),
 	                    							distBwCenterCenter:$('#distBwCenterCenter').val(),
 	                    							doorFixBrkt:$("input[id='doorFixBrkt']:checked").val(),
 	                    							doorFixBrktOb:$('#doorFixBrktOb').val(),
 	                    							fitmentDimenBiotank:$('#fitmentDimenBiotank').val(),
 	                    							longDistBrktBrktpp:$('#longDistBrktBrktpp').val(),
 	                    							longDistBrktBrktnpp:$('#longDistBrktBrktnpp').val(),
 	                    						    latDistBrktFrntpp:$('#latDistBrktFrntpp').val(),
 	                    							latDistBrktFrntnpp:$('#latDistBrktFrntnpp').val(),
 	                    							bioTankHoleDist:$('#bioTankHoleDist').val(),
 	                    							distCenCen:$('#distCenCen').val(),
 	                    							genMmountScrew1:$('#genMmountScrew1').val(),
 	                    							genMmountScrew2:$('#genMmountScrew2').val(),
 	                    							cbcUncoup:$("input[id='cbcUncoup']:checked").val(),
 	                    							transfMount:$('#transfMount').val(),
 	                    							batteryBox:$('#batteryBox').val(),
 	                    							airBrakeModule:$('#airBrakeModule').val(),
 	                    							guideDistPP:$('#guideDistPP').val(),
 	                    							guideDistNPP:$('#guideDistNPP').val(),
 	                    							twinePipHoleObs:$('#twinePipHoleObs').val(),
 	                    							fibaBktAirPro:$("input[id='fibaBktAirPro']:checked").val(),
 	                    							reserBktAirPro:$("input[id='reserBktAirPro']:checked").val(),
 	                    							distanceCrossMemberpp1:$('#distanceCrossMemberpp1').val(),
 	                    							distanceCrossMemberpp2:$('#distanceCrossMemberpp2').val(),
 	                    							distanceCrossMemberpp3:$('#distanceCrossMemberpp3').val(),
 	                    							distanceCrossMemberpp4:$('#distanceCrossMemberpp4').val(),
 	                    							distanceCrossMemberpp5:$('#distanceCrossMemberpp5').val(),
 	                    							distanceCrossMemberpp6:$('#distanceCrossMemberpp6').val(),
 	                    							distanceCrossMemberpp7:$('#distanceCrossMemberpp7').val(),
 	                    							distanceCrossMemberpp8:$('#distanceCrossMemberpp8').val(),
 	                    							distanceCrossMemberpp9:$('#distanceCrossMemberpp9').val(),
 	                    							distanceCrossMemberpp10:$('#distanceCrossMemberpp10').val(),
 	                    							distanceCrossMembernpp1:$('#distanceCrossMembernpp1').val(),
 	                    							distanceCrossMembernpp2:$('#distanceCrossMembernpp2').val(),
 	                    							distanceCrossMembernpp3:$('#distanceCrossMembernpp3').val(),
 	                    							distanceCrossMembernpp4:$('#distanceCrossMembernpp4').val(),
 	                    							distanceCrossMembernpp5:$('#distanceCrossMembernpp5').val(),
 	                    							distanceCrossMembernpp6:$('#distanceCrossMembernpp6').val(),
 	                    							distanceCrossMembernpp7:$('#distanceCrossMembernpp7').val(),
 	                    							distanceCrossMembernpp8:$('#distanceCrossMembernpp8').val(),
 	                    							distanceCrossMembernpp9:$('#distanceCrossMembernpp9').val(),
 	                    							distanceCrossMembernpp10:$('#distanceCrossMembernpp10').val(),
 	                    							obserVal:$('#obserVal').val(),
 	                    							detlOfModf:$('#detlOfModf').val(),
 	                    							detlOfTrialItems:$('#detlOfTrialItems').val(),
 	                    							rmk:$('#rmk').val(),
 	                    							underframeTestingStatus:$('#shellUnderframeSipTestingStatus').val(),
 	                    						
 	                    						},
 	                    						
 	                    						type : 'POST',
 	                    						async : false,
 	                            	 		})
 	                            	 		
 	                            	 	
 	                    						.done(function( msg ) {
 	                    							
 	                    							
 	                    						    $('#appDrawNoUnderframe').val(''),                   							
 	                    							$('#underframeDocNo').val(''),              							
 	                    							$('#underframeShiftSelect').val(''),
 	                    							$('#underframeDate').val(''),
 	                    							$('#appLineNoUnderframe').val(''),
 	                    							$('#appWiNoUnderframe').val(''),
 	                    							
 	                    							$('#frntPrtPp').val(''),
 	                    							$('#frntPrtNpp').val(''),
 	                    							$('#waterTankBkt1').val(''),
 	                    							$('#waterTankBkt2').val(''),
 	                    							$('#waterTankBkt3').val(''),
 	                    							$('#waterTankBkt4').val(''),
 	                    							$('#cbCMakePp1').val(''),
 	                    							$('#cbCMakePp2').val(''),
 	                    							$('#cbCMakeNpp1').val(''),
 	                    							$('#cbCMakeNpp2').val(''),
 	                    							$('#cbCFitPp').val(''),
 	                    							$('#cbCFitNpp').val(''),
 	                    							$('#underframeMakeNo').val(''),
 	                    							
 	       				  							$('#itemsFitted').val(''),
 	                    							$('#compAppWi').val(''),
 	                    							$('#weldThroatLen').val(''),
 	                    							$('#tightScrew').val(''),
 	                    							$('#outerFaceOuterHead').val(''),
 	                    							$('#conditionOfPlugWelding').val(''),
 	                    							$('#conditionOfConsole').val(''),
 	                    							$('#bodyBolster').val(''),
 	                    							$('#completeLenUndeframe').val(''),
 	                    							$('#frntPartToFront').val(''),
 	                    							$('#ufWidth').val(''),
 	                    							$('#coveringPlate').val(''),
 	                    							$('#wedgeBolt').val(''),
 	                    							$('#waterTankMount').val(''),
 	                    							$('#frntPartBrktDist').val(''),
 	                    							$('#footStepsDist').val(''),
 	                    							$('#distBwConsoleBrkt').val(''),
 	                    							$('#suppMemTrough').val(''),
 	                    							$('#pillarMountChannel').val(''),
 	                    							$('#distBwCurvedRoll').val(''),
 	                    							$('#grindWeldJoints').val(''),
 	                    							$('#holesForDrawing').val(''),
 	                    							$('#holesDrilled').val(''),
 	                    							$('#distBwCenterCenter').val(''),
 	                    							$('#doorFixBrkt').val(''),
 	                    							$('#doorFixBrktOb').val(''),
 	                    							$('#fitmentDimenBiotank').val(''),
 	                    							$('#longDistBrktBrktpp').val(''),
 	                    							$('#longDistBrktBrktnpp').val(''),
 	                    						    $('#latDistBrktFrntpp').val(''),
 	                    							$('#latDistBrktFrntnpp').val(''),
 	                    							$('#bioTankHoleDist').val(''),
 	                    							$('#distCenCen').val(''),
 	                    							$('#genMmountScrew1').val(''),
 	                    							$('#genMmountScrew2').val(''),
 	                    							$('#cbcUncoup').val(''),
 	                    							$('#transfMount').val(''),
 	                    							$('#batteryBox').val(''),
 	                    							$('#airBrakeModule').val(''),
 	                    							$('#guideDistPP').val(''),
 	                    							$('#guideDistNPP').val(''),
 	                    							$('#twinePipHoleObs').val(''),
 	                    							$('#fibaBktAirPro').val(''),
 	                    							$('#reserBktAirPro').val(''),
 	                    							$('#distanceCrossMemberpp1').val(''),
 	                    							$('#distanceCrossMemberpp2').val(''),
 	                    							$('#distanceCrossMemberpp3').val(''),
 	                    							$('#distanceCrossMemberpp4').val(''),
 	                    							$('#distanceCrossMemberpp5').val(''),
 	                    							$('#distanceCrossMemberpp6').val(''),
 	                    							$('#distanceCrossMemberpp7').val(''),
 	                    							$('#distanceCrossMemberpp8').val(''),
 	                    							$('#distanceCrossMemberpp9').val(''),
 	                    							$('#distanceCrossMemberpp10').val(''),
 	                    							$('#distanceCrossMembernpp1').val(''),
 	                    							$('#distanceCrossMembernpp2').val(''),
 	                    							$('#distanceCrossMembernpp3').val(''),
 	                    							$('#distanceCrossMembernpp4').val(''),
 	                    							$('#distanceCrossMembernpp5').val(''),
 	                    							$('#distanceCrossMembernpp6').val(''),
 	                    							$('#distanceCrossMembernpp7').val(''),
 	                    							$('#distanceCrossMembernpp8').val(''),
 	                    							$('#distanceCrossMembernpp9').val(''),
 	                    							$('#distanceCrossMembernpp10').val(''),
 	                    							$('#obserVal').val(''),
 	                    							$('#detlOfModf').val(''),
 	                    							$('#detlOfTrialItems').val(''),
 	                    							$('#rmk').val(''),
 	                    							$('#shellUnderframeSipTestingStatus').val(''),    							
 	                    							$('#UnderframeSIPDialog').dialog('close');
 	                    						   $('#UnderframeSIPDialog').find('form[name="underframeSIP"]')[0].reset();
 	                    							$('#ShellProductionTableContainer').jtable('load');
 	                    							
 	                    							
 	                    							
 	                    							
 	                    							
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
 				                        	$('#UnderframeSIPDialog').find('form[name="underframeSIP"]')[0].reset();
 				                                        $(this).dialog('close');
 				                                        
 				                                    }
 	                                    },
 	                    	        modal: true
     	    });
                     	 		
             			    	   return true;
                     	 		    
                     	 			  
                     	 		  }		
     						 
                         }
                     },  
                     
                     
                     // dialog code for lav. sidewall
                     
                      {
                    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'Lavsidewall SIP',
                        click: function () {
                        	
                        	
                        	
                        	 var $selectedRows = $('#ShellProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you want to fill SIP data");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
								//setting min value
								$.ajax({
								url:"showExistingShellData",  //action-name as defined in struts.xml
								dataType:'json',
								type:'POST',
								async:false,
								data:{
								shellAssetId:record.shellAssetId,	
								},
								success:function(data)
								{
									$('#lavsidewallSipDocNo').val(data.lavsidewallSipDocNo);
								    $('#lavsidewallNo').val(data.shellNo);
								    $('#lavsidewallShellType').val(data.shellType);
								}
									
								});
								
								
                      	if(record.lavsidewallSipFlag==1)
								{
								
								$.ajax({
									url:"showSaveDataLavSideWall", //action-name as defined in struts.xml
									dataType:'json',
									type:'POST',
									async:false,
									data:{
									shellAssetId:record.shellAssetId,	
									},
									success:function(data)
									{
										
										$('#lavsidewallSipShift').val(data.shellLavSideWallTran.lavsidewallSipShift);
										var lavDate=(data.shellLavSideWallTran.lavsidewallSipDate).substring(0,10);
										var lavDateArray=lavDate.split("-");
										$('#lavsidewallSipDate').datepicker("setDate",new Date(lavDateArray[0],lavDateArray[1]-1,lavDateArray[2]));
										$('#drawingNo').val(data.shellLavSideWallTran.drawingNo);
										$('#wiNo').val(data.shellLavSideWallTran.wiNo);
										$('#frameWorkByLav1').val(data.shellLavSideWallTran.frameWorkByLav1);
										
										$('#frameJigRoboticsBoLav1').val(data.shellLavSideWallTran.frameJigRoboticsBoLav1);
										$('#frameWorkByLav2').val(data.shellLavSideWallTran.frameWorkByLav2);
										$('#frameJigRoboticsBoLav2').val(data.shellLavSideWallTran.frameJigRoboticsBoLav2);
										$('#frameWorkByLav3').val(data.shellLavSideWallTran.frameWorkByLav3);
										$('#frameJigRoboticsBoLav3').val(data.shellLavSideWallTran.frameJigRoboticsBoLav3);
										$('#frameWorkByLav4').val(data.shellLavSideWallTran.frameWorkByLav4);
										$('#frameJigRoboticsBoLav4').val(data.shellLavSideWallTran.frameJigRoboticsBoLav4);
										$('#spotWeldingByLav1').val(data.shellLavSideWallTran.spotWeldingByLav1);
										$('#spotWeldingByLav2').val(data.shellLavSideWallTran.spotWeldingByLav2);
										$('#spotWeldingByLav3').val(data.shellLavSideWallTran.spotWeldingByLav3);
										$('#spotWeldingByLav4').val(data.shellLavSideWallTran.spotWeldingByLav4);
										$('#spotWeldingJigRoboticsBoLav1').val(data.shellLavSideWallTran.spotWeldingJigRoboticsBoLav1);
										$('#spotWeldingJigRoboticsBoLav2').val(data.shellLavSideWallTran.spotWeldingJigRoboticsBoLav2);
										$('#spotWeldingJigRoboticsBoLav3').val(data.shellLavSideWallTran.spotWeldingJigRoboticsBoLav3);
										$('#spotWeldingJigRoboticsBoLav4').val(data.shellLavSideWallTran.spotWeldingJigRoboticsBoLav4);
										$('#interlockJointByLav1').val(data.shellLavSideWallTran.interlockJointByLav1);
										$('#interlockJointByLav2').val(data.shellLavSideWallTran.interlockJointByLav2);
										$('#interlockJointByLav3').val(data.shellLavSideWallTran.interlockJointByLav3);
										$('#interlockJointByLav4').val(data.shellLavSideWallTran.interlockJointByLav4);
										$('#interlockJointJigRoboticsBoLav1').val(data.shellLavSideWallTran.interlockJointJigRoboticsBoLav1);
										$('#interlockJointJigRoboticsBoLav2').val(data.shellLavSideWallTran.interlockJointJigRoboticsBoLav2);
										$('#interlockJointJigRoboticsBoLav3').val(data.shellLavSideWallTran.interlockJointJigRoboticsBoLav3);
										$('#interlockJointJigRoboticsBoLav4').val(data.shellLavSideWallTran.interlockJointJigRoboticsBoLav4);
										$('[id="observationItemsAsPerDrawingFlag"]').val([data.shellLavSideWallTran.observationItemsAsPerDrawingFlag]);
										$('[id="observationComplianceWiFlag"]').val([data.shellLavSideWallTran.observationComplianceWiFlag]);
										$('[id="observationWeldingThroatFlag"]').val([data.shellLavSideWallTran.observationWeldingThroatFlag]);
										$('#lavsidewallMake1').val(data.shellLavSideWallTran.lavsidewallMake1);
										$('#lavsidewallMake2').val(data.shellLavSideWallTran.lavsidewallMake2);
										$('#lavsidewallMake3').val(data.shellLavSideWallTran.lavsidewallMake3);
										$('#lavsidewallMake4').val(data.shellLavSideWallTran.lavsidewallMake4);
										$('#totalheightLav1').val(data.shellLavSideWallTran.totalheightLav1);
										$('#totalheightLav2').val(data.shellLavSideWallTran.totalheightLav2);
										$('#totalheightLav3').val(data.shellLavSideWallTran.totalheightLav3);
										$('#totalheightLav4').val(data.shellLavSideWallTran.totalheightLav4);
										$('#totalwidthoutsideLav1').val(data.shellLavSideWallTran.totalwidthoutsideLav1);
										$('#totalwidthoutsideLav2').val(data.shellLavSideWallTran.totalwidthoutsideLav2);
										$('#totalwidthoutsideLav3').val(data.shellLavSideWallTran.totalwidthoutsideLav3);
										$('#totalwidthoutsideLav4').val(data.shellLavSideWallTran.totalwidthoutsideLav4);
										$('#totalwidthinsideLav1').val(data.shellLavSideWallTran.totalwidthinsideLav1);
										$('#totalwidthinsideLav2').val(data.shellLavSideWallTran.totalwidthinsideLav2);
										$('#totalwidthinsideLav3').val(data.shellLavSideWallTran.totalwidthinsideLav3);
										$('#totalwidthinsideLav4').val(data.shellLavSideWallTran.totalwidthinsideLav4);
										$('#windowcutOutLav1').val(data.shellLavSideWallTran.windowcutOutLav1);
										$('#windowcutOutLav2').val(data.shellLavSideWallTran.windowcutOutLav2);
										$('#windowcutOutLav3').val(data.shellLavSideWallTran.windowcutOutLav3);
										$('#windowcutOutLav4').val(data.shellLavSideWallTran.windowcutOutLav4);
										$('#windowcutOutsideLav1').val(data.shellLavSideWallTran.windowcutOutsideLav1);
										$('#windowcutOutsideLav2').val(data.shellLavSideWallTran.windowcutOutsideLav2);
										$('#windowcutOutsideLav3').val(data.shellLavSideWallTran.windowcutOutsideLav3);
										$('#windowcutOutsideLav4').val(data.shellLavSideWallTran.windowcutOutsideLav4);
										$('#pillarheightSheetLav1').val(data.shellLavSideWallTran.pillarheightSheetLav1);
										$('#pillarheightSheetLav2').val(data.shellLavSideWallTran.pillarheightSheetLav2);
										$('#pillarheightSheetLav3').val(data.shellLavSideWallTran.pillarheightSheetLav3);
										$('#pillarheightSheetLav4').val(data.shellLavSideWallTran.pillarheightSheetLav4);
										$('#windowprofilecutForExhaustLav1').val(data.shellLavSideWallTran.windowprofilecutForExhaustLav1);
										$('#windowprofilecutForExhaustLav2').val(data.shellLavSideWallTran.windowprofilecutForExhaustLav2);
										$('#windowprofilecutForExhaustLav3').val(data.shellLavSideWallTran.windowprofilecutForExhaustLav3);
										$('#windowprofilecutForExhaustLav4').val(data.shellLavSideWallTran.windowprofilecutForExhaustLav4);
										$('[id="lavsidewallFrameAsPerDrawingFlag"]').val([data.shellLavSideWallTran.lavsidewallFrameAsPerDrawingFlag]);
										$('[id="lavsidewallMemberWeldingFlag"]').val([data.shellLavSideWallTran.lavsidewallMemberWeldingFlag]);
										$('[id="conditionLavsidewallMemberJointweldingFlag"]').val([data.shellLavSideWallTran.conditionLavsidewallMemberJointweldingFlag]);
										$('[id="conditionLavsidewallSheetLaserweldingFlag"]').val([data.shellLavSideWallTran.conditionLavsidewallSheetLaserweldingFlag]);
										$('[id="detailsOfModification"]').val([data.shellLavSideWallTran.detailsOfModification]);
										$('[id="detailsOfTrial"]').val([data.shellLavSideWallTran.detailsOfTrial]);
										$('[id="remarks"]').val([data.shellLavSideWallTran.remarks]);
									  
									}
									});
								
								}
								
								$('#lavsidewallSipDate').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
								
            					
                    	 	 	$("#lavsidewallSIP").dialog({
                    	 	 		title : 'LavSideWall Inspection Form'+record.shellTransactionId + 'from Stage- <%=stageID%>',
                    	 	 		width:'60%',
                    	 	 		close: function (e, u) {
                    	 	 			$('#lavsidewallSIP').find('form[name="lavSidewallForm"]')[0].reset();
              	 		          	$("#lavsidewallSIP").validationEngine('hideAll');
              	 		          },
              	 		          
              	 		 
                	 		 	
 		 							buttons: {
	                                    Submit: {
	                                       text: "Submit",
	                                        id: "my-button-submit",
	                                        click:function () {
	                                        	 
	                                    	//alert("$('#qtyDispatched').val()->"+$('#qtyDispatched').val());
	                                    	//alert("record.balanceQtyToDispatch->"+record.balanceQtyToDispatch);
	                            	 		
	                                    	if ($('#lavsidewallSipDate').validationEngine('validate')) {
				                                        	//alert(!$("#dialog").validationEngine('validate'));
				                                            return false;}
	                                    	 
	                                    	  if ($('#lavsidewallSipDocNo').validationEngine('validate')) {
	                                            return false;
	                                            
	                                          }
                                              
	                                    	  if ($('#totalheightLav1').validationEngine('validate')) {
	                                        	
	                                          return false;
	                                        }
	                                    	  
                                           if ($('#totalheightLav2').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           
                                           
                                           if ($('#totalheightLav3').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           if ($('#totalheightLav4').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           if ($('#totalwidthoutsideLav1').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           if ($('#totalwidthoutsideLav2').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           if ($('#totalwidthoutsideLav3').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           if ($('#totalwidthoutsideLav4').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           if ($('#totalwidthinsideLav1').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           if ($('#totalwidthinsideLav2').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           if ($('#totalwidthinsideLav3').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           if ($('#totalwidthinsideLav4').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           
                                          
                                           
                                           if ($('#windowcutOutLav1').validationEngine('validate')) {
                                    	
	                                            return false;
	                                        }
                                           if ($('#windowcutOutLav2').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                         
                                           if ($('#windowcutOutLav3').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           if ($('#windowcutOutLav4').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                         
                                           if ($('#windowcutOutsideLav1').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           if ($('#windowcutOutsideLav2').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                          
                                           if ($('#windowcutOutsideLav3').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
                                           if ($('#windowcutOutsideLav4').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                        
                                         
                                           if ($('#pillarheightSheetLav1').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           
                                           if ($('#pillarheightSheetLav2').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                          
                                           if ($('#pillarheightSheetLav3').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           
                                           if ($('#pillarheightSheetLav4').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                      
                                            var c=confirm("Do you want to confirm lavsidewall testing?");
	                                    	if(c==false){return false;}
                                          //   if ($('#underFrameNumber').validationEngine('validate')) {
	                                        	
	                                       //     return false;
	                                      //  }
	                                    		 
                 
	                                    	$.ajax({
	                    						url : "saveLavShell",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						data : {
	                    							shellAssetId: record.shellAssetId,
	                    	                        //	underFrameNumber:$('#underFrameNumber').val(),
	                    							lavsidewallSipDocNo:$ ('#lavsidewallSipDocNo').val(),
	                    							lavsidewallSipShift: $('#lavsidewallSipShift').val(),
	                    							lavsidewallSipDate: $('#lavsidewallSipDate').val(),
	                    							lavsidewallNo:$('#lavsidewallNo').val(),
	                    							lavsidewallShellType:$('#lavsidewallShellType').val(),
	                    							drawingNo:$('#drawingNo').val(),
	                    							wiNo: $('#wiNo').val(),
	                    							frameWorkByLav1:$('#frameWorkByLav1').val(),
	                    							frameJigRoboticsBoLav1: $('#frameJigRoboticsBoLav1').val(),
	                    							frameWorkByLav2:$('#frameWorkByLav2').val(),
	                    							frameJigRoboticsBoLav2:$('#frameJigRoboticsBoLav2').val(),
	                    							frameWorkByLav3:$('#frameWorkByLav3').val(),
	                    							frameJigRoboticsBoLav3:$('#frameJigRoboticsBoLav3').val(),
	                    							frameWorkByLav4:$('#frameWorkByLav4').val(),
	                    							frameJigRoboticsBoLav4:$('#frameJigRoboticsBoLav4').val(),
	                    							spotWeldingByLav1:$('#spotWeldingByLav1').val(),
	                    							spotWeldingJigRoboticsBoLav1:$('#spotWeldingJigRoboticsBoLav1').val(),
	                    							spotWeldingByLav2:$('#spotWeldingByLav2').val(),
	                    							spotWeldingJigRoboticsBoLav2:$('#spotWeldingJigRoboticsBoLav2').val(),
	                    							spotWeldingByLav3:$('#spotWeldingByLav3').val(),
	                    							spotWeldingJigRoboticsBoLav3:$('#spotWeldingJigRoboticsBoLav3').val(),
	                    							spotWeldingByLav4:$('#spotWeldingByLav4').val(),
	                    							spotWeldingJigRoboticsBoLav4:$('#spotWeldingJigRoboticsBoLav4').val(),
	                    							interlockJointByLav1: $('#interlockJointByLav1').val(),
	                    							interlockJointJigRoboticsBoLav1:$('#interlockJointJigRoboticsBoLav1').val(),
	                    							interlockJointByLav2:$('#interlockJointByLav2').val(),
	                    							interlockJointJigRoboticsBoLav2:$('#interlockJointJigRoboticsBoLav2').val(),
	                    							interlockJointByLav3: $('#interlockJointByLav3').val(),
	                    							interlockJointJigRoboticsBoLav3:$('#interlockJointJigRoboticsBoLav3').val(),
	                    							interlockJointByLav4:$('#interlockJointByLav4').val(),
	                    							interlockJointJigRoboticsBoLav4:$('#interlockJointJigRoboticsBoLav4').val(),
	                    							lavsidewallMake1:$('#lavsidewallMake1').val(),
	                    							lavsidewallMake2:$('#lavsidewallMake2').val(),
	                    							lavsidewallMake3:$('#lavsidewallMake3').val(),
	                    							lavsidewallMake4:$('#lavsidewallMake4').val(),
	                    							observationItemsAsPerDrawingFlag:$("input[id='observationItemsAsPerDrawingFlag']:checked").val(),
	                    							observationComplianceWiFlag:$("input[id='observationComplianceWiFlag']:checked").val(),
	                    							observationWeldingThroatFlag:$("input[id='observationWeldingThroatFlag']:checked").val(),
	                    							totalheightLav1:$('#totalheightLav1').val(),
	                    							totalheightLav2:$('#totalheightLav2').val(),
	                    							totalheightLav3:$('#totalheightLav3').val(),
	                    							totalheightLav4:$('#totalheightLav4').val(),
	                    							totalwidthoutsideLav1:$('#totalwidthoutsideLav1').val(),
	                    							totalwidthoutsideLav2:$('#totalwidthoutsideLav2').val(),
	                    							totalwidthoutsideLav3:$('#totalwidthoutsideLav3').val(),
	                    							totalwidthoutsideLav4:$('#totalwidthoutsideLav4').val(),
	                    							totalwidthinsideLav1:$('#totalwidthinsideLav1').val(),
	                    							totalwidthinsideLav2:$('#totalwidthinsideLav2').val(),
	                    							totalwidthinsideLav3:$('#totalwidthinsideLav3').val(),
	                    							totalwidthinsideLav4:$('#totalwidthinsideLav4').val(),
	                    							windowcutOutLav1:$('#windowcutOutLav1').val(),
	                    							windowcutOutLav2:$('#windowcutOutLav2').val(),
	                    							windowcutOutLav3:$('#windowcutOutLav3').val(),
	                    							windowcutOutLav4:$('#windowcutOutLav4').val(),
	                    							windowcutOutsideLav1:$('#windowcutOutsideLav1').val(),
	                    							windowcutOutsideLav2:$('#windowcutOutsideLav2').val(),
	                    							windowcutOutsideLav3:$('#windowcutOutsideLav3').val(),
	                    							windowcutOutsideLav4:$('#windowcutOutsideLav4').val(),
	                    							pillarheightSheetLav1:$('#pillarheightSheetLav1').val(),
	                    							pillarheightSheetLav2:$('#pillarheightSheetLav2').val(),
	                    							pillarheightSheetLav3:$('#pillarheightSheetLav3').val(),
	                    							pillarheightSheetLav4:$('#pillarheightSheetLav4').val(),
	                    							windowprofilecutForExhaustLav1:$('#windowprofilecutForExhaustLav1').val(),
	                    							windowprofilecutForExhaustLav2:$('#windowprofilecutForExhaustLav2').val(),
	                    							windowprofilecutForExhaustLav3:$('#windowprofilecutForExhaustLav3').val(),
	                    							windowprofilecutForExhaustLav4:$('#windowprofilecutForExhaustLav4').val(),
	                    							lavsidewallFrameAsPerDrawingFlag:$("input[id='lavsidewallFrameAsPerDrawingFlag']:checked").val(),
	                    							lavsidewallMemberWeldingFlag:$("input[id='lavsidewallMemberWeldingFlag']:checked").val(),
	                                                conditionLavsidewallMemberJointweldingFlag:$("input[id='conditionLavsidewallMemberJointweldingFlag']:checked").val(),
	                                                conditionLavsidewallSheetLaserweldingFlag:$("input[id='conditionLavsidewallSheetLaserweldingFlag']:checked").val(),
	                                                detailsOfModification:$("input[id='detailsOfModification']:checked").val(),
	                                                detailsOfTrial:$("input[id='detailsOfTrial']:checked").val(),
	                                                remarks:$("input[name='remarks']:checked").val(),
	                                                lavSidewallTestingStatus:$("input[name='shellLavSidewallSipTestingStatus']:checked").val(),
	                    						
	                    						},
	                    						
	                    						type : 'POST',
	                    						async : false,
	                            	 		})

	                            	 		
	                    						.done(function( msg ) {
	                    							shellAssetId: record.shellAssetId,
	                    	                        //	underFrameNumber:$('#underFrameNumber').val(),
	                    							$('#lavsidewallSipDocNo').val(''),
	                    							$('#lavsidewallSipShift').val(''),
	                    							$('#lavsidewallSipDate').val(''),
	                    							$('#lavsidewallNo').val(''),
	                    							$('#lavsidewallShellType').val(''),
	                    							$('#drawingNo').val(''),
	                    							$('#wiNo').val(''),
	                    							$('#frameWorkByLav1').val(''),
	                    						    $('#frameJigRoboticsBoLav1').val(''),
	                    							$('#frameWorkByLav2').val(''),
	                    							$('#frameJigRoboticsBoLav2').val(''),
	                    							$('#frameWorkByLav3').val(''),
	                    							$('#frameJigRoboticsBoLav3').val(''),
	                    							$('#frameWorkByLav4').val(''),
	                    							$('#frameJigRoboticsBoLav4').val(''),
	                    							$('#spotWeldingByLav1').val(''),
	                    							$('#spotWeldingJigRoboticsBoLav1').val(''),
	                    							$('#spotWeldingByLav2').val(''),
	                    						    $('#spotWeldingJigRoboticsBoLav2').val(''),
	                    							$('#spotWeldingByLav3').val(''),
	                    							$('#spotWeldingJigRoboticsBoLav3').val(''),
	                    							$('#spotWeldingByLav4').val(''),
	                    							$('#spotWeldingJigRoboticsBoLav4').val(''),
	                    						    $('#interlockJointByLav1').val(''),
	                    						    $('#interlockJointJigRoboticsBoLav1').val(''),
	                    						    $('#interlockJointByLav2').val(''),
	                    						    $('#interlockJointJigRoboticsBoLav2').val(''),
	                    						    $('#interlockJointByLav3').val(''),
	                    							$('#interlockJointJigRoboticsBoLav3').val(''),
	                    							$('#interlockJointByLav4').val(''),
	                                                $('#interlockJointJigRoboticsBoLav4').val(''),
	                    							$('#lavsidewallMake1').val(''),
	                    							$('#lavsidewallMake2').val(''),
	                    							$('#lavsidewallMake3').val(''),
	                    							$('lavsidewallMake4').val(''),
	                    							$("input[id='observationItemsAsPerDrawingFlag']:checked").val(''),
	                    							$("input[id='observationComplianceWiFlag']:checked").val(''),
	                    							$("input[id='observationWeldingThroatFlag']:checked").val(''),
	                    							$('#totalheightLav1').val(''),
	                    							$('#totalheightLav2').val(''),
	                    						    $('#totalheightLav3').val(''),
	                    							$('#totalheightLav4').val(''),
	                    							$('#totalwidthoutsideLav1').val(''),
	                    							$('#totalwidthoutsideLav2').val(''),
	                    							$('#totalwidthoutsideLav3').val(''),
	                    							$('#totalwidthoutsideLav4').val(''),
	                    							$('#totalwidthinsideLav1').val(''),
	                    					        $('#totalwidthinsideLav2').val(''),
	                    						    $('#totalwidthinsideLav3').val(''),
	                    							$('#totalwidthinsideLav4').val(''),
	                    							$('#windowcutOutLav1').val(''),
	                    							$('#windowcutOutLav2').val(''),
	                    					        $('#windowcutOutLav3').val(''),
	                    						    $('#windowcutOutLav4').val(''),
	                    							$('#windowcutOutsideLav1').val(''),
	                    							$('#windowcutOutsideLav2').val(''),
	                    							$('#windowcutOutsideLav3').val(''),
	                    							$('#windowcutOutsideLav4').val(''),
	                    							$('#pillarheightSheetLav1').val(''),
	                    						    $('#pillarheightSheetLav2').val(''),
	                    							$('#pillarheightSheetLav3').val(''),
	                    							$('#pillarheightSheetLav4').val(''),
	                    							$('#windowprofilecutForExhaustLav1').val(''),
	                    							$('#windowprofilecutForExhaustLav2').val(''),
	                    					        $('#windowprofilecutForExhaustLav3').val(''),
	                    							$('#windowprofilecutForExhaustLav4').val(''),
	                    							$("input[id='lavsidewallFrameAsPerDrawingFlag']:checked").val(''),
	                    							$("input[id='lavsidewallMemberWeldingFlag']:checked").val(''),
	                                                $("input[id='conditionLavsidewallMemberJointweldingFlag']:checked").val(''),
	                                                $("input[id='conditionLavsidewallSheetLaserweldingFlag']:checked").val(''),
	                                                $("input[id='detailsOfModification']:checked").val('');
	                                                $("input[id='detailsOfTrial']:checked").val('');
	                                                $("input[id='remarks']:checked").val(''),
	                                                $("input[id='shellLavSidewallSipTestingStatus']:checked").val(''),
	                                                
	                    							$('#lavsidewallSIP').dialog('close');
	                                                $('#lavsidewallSIP').find('form[name="lavSidewallForm"]')[0].reset();
	                    							$('#ShellProductionTableContainer').jtable('load');
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
				                        	$('#lavsidewallSIP').find('form[name="lavSidewallForm"]')[0].reset();
				                                        $(this).dialog('close');
				                                    }
	                                    },
	                    	        modal: true
    	    });
                    	 		
                    	 		
                    	 		
                    	 		
                    	 		
                    	 		    
            			    	   return true;
                    	 		    
                    	 			  
                    	 		  }
                 	 		
                    	//ending else               	  
                        // ajax call ends here				
    						 
                        }
                    },
                    
                    // endwall
                    
                    {
                    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'Endwall SIP',
                        click: function () {
                        	
                        	
                        	
                        	 var $selectedRows = $('#ShellProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you want to fill SIP data");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
								//setting min value
									$.ajax({
								url:"showExistingEndwallData",  //action-name as defined in struts.xml
								dataType:'json',
								type:'POST',
								async:false,
								data:{
								shellAssetId:record.shellAssetId,	
								},
								success:function(data)
								{
									$('#endwallSipDocNo').val(data.endwallSipDocNo);
								    $('#endwallNo').val(data.shellNo);
								    $('#endwallShellType').val(data.shellType);
								    $('#endwallPpMake').val(data.endwallMakePp);
								    $('#endwallNppMake').val(data.endwallMakeNpp);
								}
									
								});
                      	if(record.endwallSipFlag==1)
								{
						
								$.ajax({
									url:"showSaveDataEndWall", //action-name as defined in struts.xml
									dataType:'json',
									type:'POST',
									async:false,
									data:{
									shellAssetId:record.shellAssetId,	
									},
									success:function(data)
									{
										
										$('#endwallSipShift').val(data.shellEndwallSipTran.endwallSipShift);
										var endDate=(data.shellEndwallSipTran.endwallSipDate).substring(0,10);
										var endDateArray=endDate.split("-");
										$('#endwallSipDate').datepicker("setDate",new Date(endDateArray[0],endDateArray[1]-1,endDateArray[2]));
										$('#drawingNoendwall').val(data.shellEndwallSipTran.drawingNo);
										$('#wiNoendwall').val(data.shellEndwallSipTran.wiNo);
										$('[id="observationItemAsPerDrawing"]').val([data.shellEndwallSipTran.observationItemAsPerDrawing]);
										$('[id="observationComplianceWi"]').val([data.shellEndwallSipTran.observationComplianceWi]);
										$('[id="observationWeldingThroatLength"]').val([data.shellEndwallSipTran.observationWeldingThroatLength]);
										$('#distanceStopperholeUchannel').val(data.shellEndwallSipTran.distanceStopperholeUchannel);
										$('#distanceUchannelStopperhole').val(data.shellEndwallSipTran.distanceUchannelStopperhole);
										$('#distanceVestibuleUchannelPp').val(data.shellEndwallSipTran.distanceVestibuleUchannelPp);
										$('#distanceVestibuleUchannelNpp').val(data.shellEndwallSipTran.distanceVestibuleUchannelNpp);
										$('[id="conditionTailLampHole"]').val([data.shellEndwallSipTran.conditionTailLampHole]);
										$('[id="conditionVestibuleHole"]').val([data.shellEndwallSipTran.conditionVestibuleHole]);
										$('[id="conditionDrainHole"]').val([data.shellEndwallSipTran.conditionDrainHole]);
										$('#endwallOuterWidth').val(data.shellEndwallSipTran.endwallOuterWidth);
										$('[id="endwallExhaustCutting"]').val([data.shellEndwallSipTran.endwallExhaustCutting]);
										$('[id="endwallPieceVerstibule"]').val([data.shellEndwallSipTran.endwallPieceVerstibule]);
										$('[id="endwallTestingStatus"]').val([data.shellEndwallSipTran.endwallTestingStatus]);
										$('#roofelementWaterejectHole').val(data.shellEndwallSipTran.roofelementWaterejectHole);
										$('#backpieceVestibuleDoor').val(data.shellEndwallSipTran.backpieceVestibuleDoor);
										$('#detailsOfModificationendwall').val(data.shellEndwallSipTran.detailsOfModification);
										$('#detailsOfTrialendwall').val(data.shellEndwallSipTran.detailsOfTrial);
										$('#remarksendwall').val(data.shellEndwallSipTran.remarks);
									}
										
									});
								
								}
								
								
								
								$('#endwallSipDate').datepicker('option', 'minDate', new Date(record.assemblyStartDate));

						
                    	 	 	$("#endwallSIP").dialog({
                    	 	 		title : 'LavSideWall Inspection Form'+record.shellTransactionId + 'from Stage- <%=stageID%>',
                    	 	 		width:'60%',
                    	 	 		close: function (e, u) {
                    	 	 			$('form[name="endwallSIP"]')[0].reset();
              	 		          	$("#endwallSIP").validationEngine('hideAll');
              	 		          },
              	 		    
 		 							buttons: {
	                                    Submit: {
	                                       text: "Submit",
	                                        id: "my-button-submit",
	                                        click:function () {
	                                        	 
	                                    	//alert("$('#qtyDispatched').val()->"+$('#qtyDispatched').val());
	                                    	//alert("record.balanceQtyToDispatch->"+record.balanceQtyToDispatch);
	                            	 		if ($('#endwallSipDate').validationEngine('validate')) {
				                                        	//alert(!$("#dialog").validationEngine('validate'));
				                                            return false;}
	                                    	 
	                                    	  if ($('#endwallSipDocNo').validationEngine('validate')) {
	                                            return false;
	                                            
	                                          }
	                                    
	                                    	  if ($('#distanceStopperholeUchannel').validationEngine('validate')) {
		                                            return false;
		                                            
		                                          }
	                                    	  if ($('#distanceUchannelStopperhole').validationEngine('validate')) {
		                                            return false;
		                                            
		                                          }
	                                    	  if ($('#distanceVestibuleUchannelPp').validationEngine('validate')) {
		                                            return false;
		                                            
		                                          }
	                                    	  if ($('#distanceVestibuleUchannelNpp').validationEngine('validate')) {
		                                            return false;
		                                            
		                                          }
	                                    	  if ($('#endwallOuterWidth').validationEngine('validate')) {
		                                            return false;
		                                            
		                                          }
	                     
                                            var c=confirm("Do you want to confirm lavsidewall testing?");
	                                    	if(c==false){return false;}
                                          
                 
	                                    	$.ajax({
	                           	             url : "saveEndShell",  //action-name as defined in struts.xml
	                           	                dataType: 'json', 
	                           	                 data : {
	                           	                 shellAssetId: record.shellAssetId,
	                           	                   //	underFrameNumber:$('#underFrameNumber').val(),
	                           	                          endwallSipDocNo:$ ('#endwallSipDocNo').val(),
	                           	                          endwallSipShift:$ ('#endwallSipShift').val(),
	                                                      endwallSipDate:$ ('#endwallSipDate').val(),
	                           	                          drawingNo:$ ('#drawingNoendwall').val(),
	                                                      wiNo:$ ('#wiNoendwall').val(),
	                                                      observationItemAsPerDrawing:$("input[id='observationItemAsPerDrawing']:checked").val(),        						
	                           	                          observationComplianceWi:$("input[id='observationComplianceWi']:checked").val(),
	                                                      observationWeldingThroatLength:$("input[id='observationWeldingThroatLength']:checked").val(),                                
	                           	                          distanceStopperholeUchannel:$ ('#distanceStopperholeUchannel').val(), 
	                                                      distanceUchannelStopperhole:$ ('#distanceUchannelStopperhole').val(), 
	                                                      distanceVestibuleUchannelPp:$ ('#distanceVestibuleUchannelPp').val(),
	                                                      distanceVestibuleUchannelNpp:$ ('#distanceVestibuleUchannelNpp').val(),
	                                                      conditionTailLampHole:$("input[id='conditionTailLampHole']:checked").val(),
	                                                      conditionVestibuleHole:$("input[id='conditionVestibuleHole']:checked").val(),
	                                                      conditionDrainHole:$("input[id='conditionDrainHole']:checked").val(),
	                                                      endwallOuterWidth:$ ('#endwallOuterWidth').val(),
	                                                      endwallExhaustCutting:$("input[id='endwallExhaustCutting']:checked").val(),
	                                                      endwallPieceVerstibule:$("input[id='endwallPieceVerstibule']:checked").val(),
	                                                      endwallTestingStatus:$("input[id='endwallTestingStatus']:checked").val(),
	                                                      roofelementWaterejectHole:$ ('#roofelementWaterejectHole').val(),
	                                                      backpieceVestibuleDoor:$ ('#backpieceVestibuleDoor').val(),
	                                                      detailsOfModification:$('#detailsOfModificationendwall').val(),
	                           	                          detailsOfTrial:$('#detailsOfTrialendwall').val(),
	                           	                          remarks:$('#remarksendwall').val(),
	                                                     		
	                           	               },
	                           	                    						
	                           	                  type : 'POST',
	                           	                  async : false,
	                           	               })

	                            	 		.done(function( msg ) {
	                                                 shellAssetId: record.shellAssetId,
	                     	                        
	                                                 $('#endwallSipDocNo').val(''),
	                                                 $('#endwallSipShift').val(''),
                                                     $('#endwallSipDate').val(''),
                                                     $('#drawingNoendwall').val(''),
                                                     $ ('#wiNoendwall').val(''),
                                                     $("input[id='observationItemAsPerDrawing']:checked").val(''),        						
	                                                 $("input[id='observationComplianceWi']:checked").val(''),
                                                     $("input[id='observationWeldingThroatLength']:checked").val(''),                                
	                                                 $('#distanceStopperholeUchannel').val(''), 
                                                     $('#distanceUchannelStopperhole').val(''), 
                                                     $('#distanceVestibuleUchannelPp').val(''),
                                                     $ ('#distanceVestibuleUchannelNpp').val(''),
                                                     $("input[id='conditionTailLampHole']:checked").val(''),
                                                     $("input[id='conditionVestibuleHole']:checked").val(''),
                                                     $("input[id='conditionDrainHole']:checked").val(''),
                                                     $ ('#endwallOuterWidth').val(''),
                                                     $("input[id='endwallExhaustCutting']:checked").val(''),
                                                     $("input[id='endwallPieceVerstibule']:checked").val(''),
                                                     $("input[id='endwallTestingStatus']:checked").val(''),
                                                     $ ('#roofelementWaterejectHole').val(''),
                                                     $ ('#backpieceVestibuleDoor').val(''),	
                                                     $('#detailsOfModificationendwall').val(''),
	                                                 $('#detailsOfTrialendwall').val(''),
	                                                 $('#remarksendwall').val(''),
	                                                 $('#endwallSIP').dialog('close');
	                                                 $('#ShellProductionTableContainer').jtable('load');
	              })
	                    					
	         								.error(function (msg){
	         									$('form[name="endwallSIP"]')[0].reset();
	         									alert("Error Fetching Data");
	         								})
	         								  ;
					                 			    	   return true;
				                                    }
	                                    },
				                        Close: function () {
				                        	$('form[name="endwallSIP"]')[0].reset();
				                                        $(this).dialog('close');
				                                    }
	                                    },
	                    	        modal: true
    	    });
                    	 		
                    	 		
                    	 		
                    	 		
                    	 		
                    	 		    
            			    	   return true;
                    	 		    
                    	 			  
                    	 		  }
                 	 		
                    	//ending else               	  
                        // ajax call ends here				
    						 
                        }
                    },
                    
                  
                    
                    
                    
                    
                     
            ]
            },
         
			actions : {
			
 	
 			listAction: 'listSIPComonentShellAction?stageID=<%=stageID%>'
 			
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
						
				shellType: {
					title: 'Shell Type',
					width: '10%',
					options: shelltypes,
					
					list: true,
					edit : true
				},
				shellNumber:
					{
					title: 'Shell No'
					},
				remarks: {
				   title: 'Remarks',
				   width : '20%',
					type : 'textarea',
					edit : true,
					create: true 
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