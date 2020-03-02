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
.b{
border: 1px solid black
}
.c{
	border:1px solid black;
	width: 100%;
	}
.d{
	width:100%;
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
</style>

<body>
<div id="ShellProductionTableContainer"></div>
 <div id="detailDialog" style="height: 200%; width:50%; display:none;z-index: 99;" ></div>
    <div id="shellAssemblyStage1Dialog" style="height:150%; width:200%; display:none;z-index: 9;" >
    <form name="shellAssemblyStage1">
  <h3 align="center">SELF INSPECTION PROFARMA</h3>
<h6 align="center">SHELL ASSEMBLY-STAGE-1</h6> 
<table border="1" align="center" style="width:80%">
<tr>
<th>Doc No</th><td><input type="text" name="docno" id="stage1SipDocNo" class='validate[required]' size="30%" style="border:none;"></td>
<th>Date</th><td><input type="text" name="Date" id="date" size="30%" style="border:none;" disabled="disabled"></td>
</tr>
</table>
<br></br>

<table border="1" align="center" style="width:80%">
<tr>
<th>Shell assembly stage 1</th>
<th>Shell type</th><td><input type="text" name="shellType" id="shellType" class='validate[required]' size="50%" style="border:none;"></td>
<th>Shell no.</th><td><input type="text" name="shellNumber" id="shellNumber" class='validate[required]' size="50%" style="border:none;"></td>
</tr>
</table>
<br></br>

<table border="1" align="center" style="width:80%">
<tr>
<th>Shift</th><td><select name="" id="stage1SipShift" class='validate[required]'>
<option value="">Select</option>
<option value="general">General</option>
<option value="morning">Shift-I</option>
<option value="evening">Shift-II</option>
<option value="night">Shift-III</option>
<option value="">Select</option>
</select></td>
<th>Shell assembly work done by</th><td><input type="text" name="stage1WorkBy" id="stage1WorkBy" class='validate[required]' size="50%" style="border:none;"></td>
<th>Date of Testing</th><td><input type="text" name="stage1SipDate" id="stage1SipDate" class='validate[required]'size="50%" style="border:none;"></td> <!--  shell_tran-->
</tr>
</table>
<br></br>

<table border="1" align="center">
<tr>

 <th> Shell assembly by </th>
 <th>Jig no. </th>
<th> U/frame make & no.</th>
<th> Roof make & no.</th>
<th colspan="2"> End wall make & no.</th>
<th colspan="2"> Side wall make & no.</th>
</tr>
<tr>
<td rowspan="2"><input type=text id="shellAssembledBy" size="30%" style="border:none;" placeholder="Enter Shell Aseembled By" ></td>
<td rowspan="2"><input type=text id="jigNo" size="30%" style="border:none;" placeholder="Enter Jig No."></td>
<td rowspan="2"><input type=text id="underframeCompleteMake" size="30%" style="border:none;" placeholder="Enter Underframe Make"></td>
<td rowspan="2"><input type=text id="roofMake" size="30%" style="border:none;" placeholder="Enter roof Make"></td>
<td> PP</td>
<td><input type=text id="endwallMakePp" size="30%" style="border:none;" placeholder="Enter end wall(PP) Make"></td>
<td> LH</td>
<td><input type=text id="sideWallMakeNoPp" size="30%" style="border:none;" placeholder="Enter side wall(PP) Make"></td>
</tr>
<tr>
<td> NPP</td>
<td><input type=text id="endwallMakeNpp" size="30%" style="border:none;"></td>
<td> RH</td>
<td><input type=text id="sideWallMakeNoNpp" size="30%" style="border:none;"></td>
</tr>

</table>

<b>1.Applicability:</b> 
<table>
<tr><td> 1.1 Applicable Drawing No:</td><td><input type=text id="stage1DrawingNo" ></tr>
<tr><td> 1.2 Applicable WI NO(if Any):</td><td><input type= text id="stage1WiNo" ></td></tr>
</table>

<b>2.Data of Traceability </b>
<table>

<tr><td>2.1 Body Side Door frame make  &#38; no. </td><td>Left Side<input type=text id="sideDoorMakeNoLeft" ></td><td>Right side<input type=text id="sideDoorMakeNoRight"></td></tr>
<tr><td>2.2 Roof AC Unit assembly make  &#38; no.</td><td>PP Side<input type=text id="roofAcAssemblyMakeNoPp" ></td><td>NPP Side<input type=text id="roofAcAssemblyMakeNoNpp" ></td></tr>
<tr><td>2.3 WTCC make & no.(LSCN\LGS)</td><td>PP Side<input type=text id="wtccMakeNoPp"></td><td>NPP Side<input type=text id="wtccMakeNoNpp"></td></tr>
<tr><td>2.4 Sliding door make & no.(LPC & LDSLR)</td><td>Left Side<input type=text id="slidingDoorMakeNoLeft"></td><td>Right Side<input type=text id="slidingDoorMakeNoRight"></td></tr>

</table>

<b>3.Observations:</b>
<table> <tr><td> 3.1 Items Fitted as per Drawing</td><td>  <input type=radio id="itemAsPerDrawingFlag" value="ok">OK &nbsp<input type=radio id="itemAsPerDrawingFlag" value="notok">NOT OK &nbsp<input type= radio id="itemAsPerDrawingFlag" value="na"> NA</td></tr>
<tr><td> 3.2 Compliance of applicable WI</td><td>  <input type=radio id="complianceWiFlag" value="ok">OK &nbsp<input type=radio id="complianceWiFlag" value="notok">NOT OK&nbsp<input type= radio id="complianceWiFlag" value="na"> NA</td></tr>
<tr><td> 3.3 Welding throat & length as per drawing</td><td> <input type=radio id="weldingThroatLengthFlag" value="ok">OK &nbsp;<input type=radio id="weldingThroatLengthFlag" value="notok">NOT OK &nbsp;<input type= radio id="weldingThroatLengthFlag" value="na"> NA </td></tr>
<tr><td> 3.4 Leveling and centering of underframeOK &nbsp;</td><td> <input type=radio id="levelingCenteringUnderframeFlag" value="ok">OK &nbsp;<input type=radio id="levelingCenteringUnderframeFlag"value="notok">NOT OK &nbsp;<input type= radio id="levelingCenteringUnderframeFlag" value="na"> NA</td></tr>
<tr><td> 3.5 No. of level trestles of jig:</td><td><input type=text id="noOfLevelTrestle" class='validate[custom[integer]]'></td><td> 
<tr><td> 3.6 Grinding and cleaning of sole bar</td><td>  <input type=radio id="grindingCleaningSolebarFlag" value="ok">OK &nbsp;<input type=radio id="grindingCleaningSolebarFlag" value="notok">NOT OK &nbsp;<input type= radio id="grindingCleaningSolebarFlag" value="na"> NA</td></tr>
<tr><td> 3.7 Application of wieldable primer on sole bar before placing of side wall</td><td>  <input type=radio id="weildablePrimerSolebarFlag" value="ok">OK &nbsp<input type=radio id="weildablePrimerSolebarFlag" value="notok">NOT OK &nbsp;<input type= radio id="weildablePrimerSolebarFlag" value="na"> NA</td></tr>
<tr><td>3.8 Checked Dimensions As per Table</td></tr>
</table>
<table border=1>
<tr>
<td>
S.No.
</td>
<td colspan="2">
Parameter
</td>
<td colspan="2">
Specified Value
</td>
<td colspan="2">
Observation
</td>
</tr>
<tr>
<td rowspan="2">
1
</td>
<td rowspan="2">
Length over Body
</td>
<td>
LH
</td>
<td colspan="2">
23700+10/-0
</td>
<td colspan="2">
<input type= text id="lengthOverBodyLh" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
RH
</td>
<td colspan="2">
23700+10/-0
</td>
<td colspan="2">
<input type= text id="lengthOverBodyRh" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td rowspan="5">
2
</td>
<td rowspan="5">
Side Wall Sheet Complete Length before fitment
</td>
<td rowspan="3">
LH
</td>

<td colspan="2">
L2T,L3T,LSCN,LBN,LWFAC,LWSCZ Non AC-18128(+22#)
</td>
<td rowspan="3" colspan="2">
<input type= text id="sidewallSheetLengthLh" placeholder="1" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td colspan="2">
LGS-8496(+13#)
</td>
</tr>
<tr>
<td colspan="2">
LPC-17471
</td>
</tr>
<tr>
<td rowspan="2">
RH
</td>
<td colspan="2">
TRS/TRC-17373+20#
</td>
<td rowspan="2" colspan="2">
<input type= text id="sidewallSheetLengthRh" placeholder="1" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td colspan="2">
LDSLR(9511#+16,3495#+4#,2260+12#)
</td>
</tr>


<tr>
<td>
3
</td>
<td>
Side Wall Sheet width before fitment
(L2T,L3T,LSCN,LGS,LDSLR,TRC,TRS,LBC,LPC,LWFAC,
LWSCZ Non AC)
</td>
<td>
LH
</td>
<td colspan="2">
1995(+2#)
</td>
<td colspan="2">
<input type= text id="sidewallSheetWidth" placeholder="1" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
4
</td>
<td>
Side Wall height from vertical member from roof flange
top before fitment(L2T,L3T,LSCN,LGS,LBC,LPC,LWFAC,
LDSLR,TRC,TRS,LWSCZ Non AC)
</td>
<td>
LH/RH 
</td>
<td colspan="2">
1963(+2#)
</td>
<td colspan="2">
<input type= text id="sidewallHeightVerticalmemberRoofflange" placeholder="1" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td rowspan="3">
5
</td>
<td rowspan="3">
Width of shell
</td>
<td>
PP
</td>
<td colspan="2">
3240-8/+0
</td>
<td colspan="2">
<input type= text id="shellWidthPp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
NPP
</td>
<td colspan="2">
3240-8/+0
</td>
<td colspan="2">
<input type= text id="shellWidthNpp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
center
</td>
<td colspan="2">
3240-8/+0
</td>
<td colspan="2">
<input type= text id="shellWidthCenter" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td rowspan="2">
6
</td>
<td rowspan="2">
Width of end wall
</td>
<td>
PP
</td>
<td colspan="2">
3100-8/+0
</td>
<td colspan="2">
<input type= text id="endwallWidthPp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
NPP
</td>
<td colspan="2">
3100-8/+0
</td>
<td colspan="2">
<input type= text id="endwallWidthNpp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td rowspan="2">
7
</td>
<td rowspan="2">
Lateral width of opening for AC trough
(L2T,L3T,TRC,TRS,LRRM,LBC,LWFAC)
</td>
<td>
PP
</td>
<td colspan="2">
2140+-6/2230+-6
</td>
<td colspan="2">
<input type= text id="lateralWidthAcTroughPp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
NPP
</td>
<td colspan="2">
2140+-6/2230+-6
</td>
<td colspan="2">
<input type= text id="lateralWidthAcTroughNpp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td rowspan="2">
8
</td>
<td rowspan="2">
Longitudinal width of opening for AC trough
(L2T,L3T,TRC,TRS,LRRM,LBC,LWFAC)
</td>
<td>
PP
</td>
<td colspan="2">
2341+-6
</td>
<td colspan="2">
<input type= text id="longitudinalWidthAcTroughPp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
NPP
</td>
<td colspan="2">
2341+-6
</td>
<td colspan="2">
<input type= text id="longitudinalWidthAcTroughNpp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td rowspan="2">
9
</td>
<td rowspan="2">
Distance between vestibule U channel both side End wall
</td>
<td>
PP
</td>
<td colspan="2">
1148+-4
</td>
<td colspan="2">
<input type= text id="distanceVestibuleUchannelPp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
NPP
</td>
<td colspan="2">
1148+-4
</td>
<td colspan="2">
<input type= text id="distanceVestibuleUchannelNpp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td rowspan="6">
10
</td>
<td rowspan="6">
Diagonal width of main entrance door
(For LGS & LDSLR D1 to D6)
LDSLR Shell door no.-D3,D4 specified value
2126+-1
</td>
<td>
D1
</td>
<td colspan="2">
2043/2087+-1
</td>
<td colspan="2">
<input type= text id="diagonalWidthEntranceDoor1" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
D2
</td>
<td colspan="2">
2043/2087+-1
</td>
<td colspan="2">
<input type= text id="diagonalWidthEntranceDoor2" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
D3
</td>
<td colspan="2">
2043/2087+-1/21263+-1
</td>
<td colspan="2">
<input type= text id="diagonalWidthEntranceDoor3" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
D4
</td>
<td colspan="2">
2043/2087+-1/2126+-1
</td>
<td colspan="2">
<input type= text id="diagonalWidthEntranceDoor4" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
D5
</td>
<td colspan="2">
2043/2087+-1
</td>
<td colspan="2">
<input type= text id="diagonalWidthEntranceDoor5" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
D6
</td>
<td colspan="2">
2043/2087+-1
</td>
<td colspan="2">
<input type= text id="diagonalWidthEntranceDoor6" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td rowspan="6">
11
</td>
<td rowspan="6">
Height of main entrance door
(For LGS & LDSLR D1 to D6)
</td>
<td>
D1
</td>
<td colspan="2">
1867+4/-2
</td>
<td colspan="2">
<input type= text id="heightEntranceDoor1" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
D2
</td>
<td colspan="2">
1867+4/-2
</td>
<td colspan="2">
<input type= text id="heightEntranceDoor2" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
D3
</td>
<td colspan="2">
1867+4/-2
</td>
<td colspan="2">
<input type= text id="heightEntranceDoor3" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
D4
</td>
<td colspan="2">
1867+4/-2
</td>
<td colspan="2">
<input type= text id="heightEntranceDoor4" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
D5
</td>
<td colspan="2">
1867+4/-2
</td>
<td colspan="2">
<input type= text id="heightEntranceDoor5" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
D6
</td>
<td colspan="2">
1867+4/-2
</td>
<td colspan="2">
<input type= text id="heightEntranceDoor6" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td rowspan="6">
12
</td>
<td rowspan="6">
Width of main entrance door
(For LGS & LDSLR D1 to D6)
LDSLR Shell door no.-D3,D4 specified value 920+-3
</td>
<td>
D1
</td>
<td colspan="2">
825+5/-1
</td>
<td colspan="2">
<input type= text id="widthEntranceDoor1" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
D2
</td>
<td colspan="2">
825+5/-1
</td>
<td colspan="2">
<input type= text id="widthEntranceDoor2" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
D3
</td>
<td colspan="2">
825+5/-1,920+-3
</td>
<td colspan="2">
<input type= text id="widthEntranceDoor3" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
D4
</td>
<td colspan="2">
825+5/-1,920+-3
</td>
<td colspan="2">
<input type= text id="widthEntranceDoor4" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
D5
</td>
<td colspan="2">
825+5/-1
</td>
<td colspan="2">
<input type= text id="widthEntranceDoor5" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
D6
</td>
<td colspan="2">
825+5/-1
</td>
<td colspan="2">
<input type= text id="widthEntranceDoor6" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td rowspan="2">
13
</td>
<td rowspan="2">
Height from top of trough floor to bottom of 
roof sheet center(L3T)
</td>
<td>
PP
</td>
<td colspan="2">
2986.25+-6
</td>
<td colspan="2">
<input type= text id="heightTopTroughfloorToRoofsheetBottomPp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
NPP
</td>
<td colspan="2">
2986.25+-6
</td>
<td colspan="2">
<input type= text id="heightTopTroughfloorToRoofsheetBottomNpp" class='validate[custom[integer]]'>
</td>
</tr>


<tr>
<td rowspan="10">
14
</td>
<td rowspan="10">
Height from top of pillar support assembly to 
bottom of cross brace for L3T shell
</td>
<td rowspan="10">
NPP to PP end
</td>
<td colspan="1" rowspan="10">
2545+-6
</td>
<td>
</td>
<td>
Single Side
</td>
<td>
Cabin Side
</td>
</tr>
<tr>
<td align="right">
1
</td>
<td>
<input type= text id="heightTopPillarsupportToBottomCrossbraceSingleside1" class='validate[custom[integer]]'>
</td>
<td>
<input type= text id="heightTopPillarsupportToBottomCrossbraceCabinside1" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td align="right">
2
</td>
<td>
<input type= text id="heightTopPillarsupportToBottomCrossbraceSingleside2" class='validate[custom[integer]]'>
</td>
<td>
<input type= text id="heightTopPillarsupportToBottomCrossbraceCabinside2" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td align="right">
3
</td>
<td>
<input type= text id="heightTopPillarsupportToBottomCrossbraceSingleside3" class='validate[custom[integer]]'>
</td>
<td>
<input type= text id="heightTopPillarsupportToBottomCrossbraceCabinside3" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td align="right">
4
</td>
<td>
<input type= text id="heightTopPillarsupportToBottomCrossbraceSingleside4" class='validate[custom[integer]]'>
</td>
<td>
<input type= text id="heightTopPillarsupportToBottomCrossbraceCabinside4" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td align="right">
5 
</td>
<td>
<input type= text id="heightTopPillarsupportToBottomCrossbraceSingleside5" class='validate[custom[integer]]'>
</td>
<td>
<input type= text id="heightTopPillarsupportToBottomCrossbraceCabinside5" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td align="right">
6
</td>
<td>
<input type= text id="heightTopPillarsupportToBottomCrossbraceSingleside6" class='validate[custom[integer]]'> 
</td>
<td>
<input type= text id="heightTopPillarsupportToBottomCrossbraceCabinside6" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td align="right">
7
</td>
<td>
<input type= text id="heightTopPillarsupportToBottomCrossbraceSingleside7" class='validate[custom[integer]]'>
</td>
<td>
<input type= text id="heightTopPillarsupportToBottomCrossbraceCabinside7" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td align="right">
8
</td>
<td>
<input type= text id="heightTopPillarsupportToBottomCrossbraceSingleside8" class='validate[custom[integer]]'>
</td>
<td>
<input type= text id="heightTopPillarsupportToBottomCrossbraceCabinside8" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td align="right">
9
</td>
<td>
<input type= text id="heightTopPillarsupportToBottomCrossbraceSingleside9" class='validate[custom[integer]]'>
</td>
<td>
<input type= text id="heightTopPillarsupportToBottomCrossbraceCabinside9" class='validate[custom[integer]]'>
</td>
</tr>

<tr>
<td rowspan="11">
15
</td>
<td rowspan="11">
Height of cross brace from partition pillar mounting 
through floor channel(L2T,TRC,TRS,LBC,LWFAC)
</td>
<td rowspan="11">
NPP to PP end
</td>
<td rowspan="11">
2545+-6
</td>
<td>
</td>
<td>
Single Side
</td>
<td>
Cabin Side
</td>
</tr>
<tr>
<td align="right">
1
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerSingelside1" class='validate[custom[integer]]'>
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerCabinside1" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td align="right">
2
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerSingelside2" class='validate[custom[integer]]'>
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerCabinside2" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td align="right">
3
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerSingelside3" class='validate[custom[integer]]'>
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerCabinside3" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td align="right">
4
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerSingelside4" class='validate[custom[integer]]'>
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerCabinside4" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td align="right">
5
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerSingelside5" class='validate[custom[integer]]'>
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerCabinside5" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td align="right">
6 
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerSingelside6" class='validate[custom[integer]]'>
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerCabinside6" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td align="right">
7
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerSingelside7" class='validate[custom[integer]]'>
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerCabinside7" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td align="right">
8
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerSingelside8" class='validate[custom[integer]]'>
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerCabinside8" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td align="right">
9
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerSingelside9" class='validate[custom[integer]]'>
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerCabinside9" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td align="right">
10
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerSingelside10" class='validate[custom[integer]]'>
</td>
<td>
<input type= text id="heightCrossbracePartitionpillerCabinside10" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td rowspan="2">
16
</td>
<td rowspan="2">
Height from top of vestibule plate of end wall
door(L3T,L2T,LSCN,LGS,LBC,LWFAC,TRC,TRS)
(LPC,LDSLR only PP side)
</td>
<td>
PP
</td>
<td colspan="2">
1929+-4
</td>
<td colspan="2">
<input type= text id="heightVestibuleplateEndwallPp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
NPP
</td>
<td colspan="2">
1929+-4
</td>
<td colspan="2">
<input type= text id="heightVestibuleplateEndwallNpp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td rowspan="2">
17
</td>
<td rowspan="2">
Height of WTCC
(LSCN/LGS,LWSCZ Non AC)
</td>
<td>
PP
</td>
<td colspan="2">
734+5/-0
</td>
<td colspan="2">
<input type= text id="heightWtccPp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
NPP
</td>
<td colspan="2">
734+5/-0
</td>
<td colspan="2">
<input type= text id="heightWtccNpp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td rowspan="2">
18
</td>
<td rowspan="2">
Width of WTCC
(LSCN/LGS,LWSCZ Non AC)
</td>
<td>
PP
</td>
<td colspan="2">
1362+-3
</td>
<td colspan="2">
<input type= text id="widthWtccPp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
NPP
</td>
<td colspan="2">
1362+-3
</td>
<td colspan="2">
<input type= text id="widthWtccNpp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td rowspan="2">
19
</td>
<td rowspan="2">
Height from top of trough floor to bottom 
of roof arch center(LDSLR,LBC.2T,TRC,TRS,LSCN,
LGS,LWFAC,LWSCZ Non AC)
</td>
<td>
PP
</td>
<td colspan="2">
2673.3+-6
</td>
<td colspan="2">
<input type= text id="heightTopThroughfloorBottomRoofArchPp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
NPP
</td>
<td colspan="2">
2673.3+-6
</td>
<td colspan="2">
<input type= text id="heightTopThroughfloorBottomRoofArchNpp" class='validate[custom[integer]]'>
</td>
</tr>

 <tr>
<td rowspan="12">
20
</td>
<td rowspan="12" colspan="2">
Height from floor pillarbracket to top of the roof
LSCN(traverse side/longitudinal side)
</td>
<td colspan="2" rowspan="6">
Single-2501+-6
(NPP end to PP end)
</td>
<td>1-
<input type= text id="heightFloorpillerbracketToRoofSingle1" size="10%" class='validate[custom[integer]]'>
</td>
<td>7-
<input type= text id="heightFloorpillerbracketToRoofSingle7" size="15%" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>2-
<input type= text id="heightFloorpillerbracketToRoofSingle2" size="10%" class='validate[custom[integer]]'>
</td>
<td>8-
<input type= text id="heightFloorpillerbracketToRoofSingle8" size="15%" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>3-
<input type= text id="heightFloorpillerbracketToRoofSingle3" size="10%" class='validate[custom[integer]]'>
</td>
<td>9-
<input type= text id="heightFloorpillerbracketToRoofSingle9" size="15%" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>4-
<input type= text id="heightFloorpillerbracketToRoofSingle4" size="10%" class='validate[custom[integer]]'>
</td>
<td>10-
<input type= text id="heightFloorpillerbracketToRoofSingle10" size="15%" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>5-
<input type= text id="heightFloorpillerbracketToRoofSingle5" size="10%" class='validate[custom[integer]]'>
</td>
<td>11-
<input type= text id="heightFloorpillerbracketToRoofSingle11" size="15%" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>6-
<input type= text id="heightFloorpillerbracketToRoofSingle6" size="10%" class='validate[custom[integer]]'>
</td>

</tr>
<tr>
<td colspan="2" rowspan="6">
Cabin-2625+-6
(NPP end to PP end)
</td>
<td>1-
<input type= text id="heightFloorpillerbracketToRoofCabin1" size="10%" class='validate[custom[integer]]'>
</td>
<td>7-
<input type= text id="heightFloorpillerbracketToRoofCabin7"size="15%" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>2-
<input type= text id="heightFloorpillerbracketToRoofCabin2" size="10%" class='validate[custom[integer]]'>
</td>
<td>8-
<input type= text id="heightFloorpillerbracketToRoofCabin8" size="15%" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>3-
<input type= text id="heightFloorpillerbracketToRoofCabin3" size="10%" class='validate[custom[integer]]'>
</td>
<td>9-
<input type= text id="heightFloorpillerbracketToRoofCabin9" size="15%" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>4-
<input type= text id="heightFloorpillerbracketToRoofCabin4" size="10%" class='validate[custom[integer]]'>
</td>
<td>10-
<input type= text id="heightFloorpillerbracketToRoofCabin10" size="15%" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>5-
<input type= text id="heightFloorpillerbracketToRoofCabin5" size="10%" class='validate[custom[integer]]'>
</td>
<td>11-
<input type= text id="heightFloorpillerbracketToRoofCabin11" size="15%" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>6-
<input type= text id="heightFloorpillerbracketToRoofCabin6" size="10%" class='validate[custom[integer]]'>
</td>
</tr>

<tr>
<td rowspan="2">
21
</td>
<td rowspan="2" colspan="2">
Sliding door height
(LPC,LDSLR)
</td>
<td colspan="2" rowspan="2">
1867+4/-2
</td>
<td>
LH Side
</td>
<td>
<input type= text id="slidingDoorHeightLh" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
RH Side
</td>
<td>
<input type= text id="slidingDoorHeightRh" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td rowspan="2">
22
</td>
<td rowspan="2" colspan="2">
Sliding door width
(LpC,LDSLR)
</td>
<td colspan="2" rowspan="2">
1500(+4#)
</td>
<td>
LH Side
</td>
<td>
<input type= text id="slidingDoorWidthLh" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
RH Side
</td>
<td>
<input type= text id="slidingDoorWidthRh" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td rowspan="2">
23
</td>
<td rowspan="2" colspan="2">
Distance between roof and end wall
</td>
<td colspan="2" rowspan="2">
2940+2#
</td>
<td>
PP Side
</td>
<td>
<input type= text id="distanceRoofEndwallPp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
NPP Side
</td>
<td>
<input type= text id="distanceRoofEndwallNpp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td rowspan="2">
24
</td>
<td rowspan="2" colspan="2">
Roof element shell RMPU socket hole die
</td>
<td colspan="2" rowspan="2">
37
</td>
<td>
PP Side
</td>
<td>
<input type= text id="roofElementShellSocketHoleDiePp" class='validate[custom[integer]]'>
</td>
</tr>
<tr>
<td>
NPP Side
</td>
<td>
<input type= text id="roofElementShellSocketHoleDieNpp" class='validate[custom[integer]]'> 
</td>
</tr>
<tr>
<td rowspan="2">
25
</td>
<td rowspan="2" colspan="2">
Roof element stud diagonal for RMPU
</td>
<td colspan="2" rowspan="2">
should be equal
</td>
<td>
PP Side
</td>
<td>
<input type= text id="roofElementStudDiagonalPp">
</td>
</tr>
<tr>
<td>
NPP Side
</td>
<td>
<input type= text id="roofElementStudDiagonalNpp">
</td>
</tr>
</table>
<table>
<tr><td>3.9 Checked Dimensions Remarks</td><td> <input type=text id="checkedDimenRemarks"></td></tr>
<tr><td>3.10 Alignment of side wall body pillars with roof arch and trough sheet pillar mounting BKT(L2T,L3T,LWFAC)</td><td> <input type=radio id="alignmentSidewallRoofarchFlag" value="ok">OK &nbsp<input type=radio id="alignmentSidewallRoofarchFlag" value="notok">NOT OK &nbsp<input type= radio id="alignmentSidewallRoofarchFlag" value="na"> NA</td></tr>
<tr><td>3.11 Welding of pillars of side wall and Lav. side wall with sole bar from inside as per Drg.</td><td> <input type=radio id="weldingSidewallLavsidewallFlag" value="ok">OK &nbsp<input type=radio id="weldingSidewallLavsidewallFlag" value="notok">NOT OK &nbsp<input type= radio id="weldingSidewallLavsidewallFlag" value="na"> NA</td></tr>
<tr><td>3.12 Welding the roof arch with side wall car line from inside as per Drg.</td><td> <input type=radio id="weldingRoofarchSidewallCarlineFlag" value="ok">OK &nbsp<input type=radio id="weldingRoofarchSidewallCarlineFlag" value="notok">NOT OK &nbsp<input type= radio id="weldingRoofarchSidewallCarlineFlag" value="na"> NA</td></tr>
<tr><td>3.13 Welding complete door frame and door cut out complete with side wall assembly and Lav. side wall assembly</td><td> <input type=radio id="weldingCompletedoorframeFlag" value="ok">OK &nbsp<input type=radio id="weldingCompletedoorframeFlag" value="notok">NOT OK &nbsp<input type= radio id="weldingCompletedoorframeFlag" value="na"> NA</td></tr>
<tr><td>3.14  Welding complete end wall and final roof elements from inside and outside as per Drg.</td><td> <input type=radio id="weldingCompleteendwallFinalroofelementFlag" value="ok">OK &nbsp<input type=radio id="weldingCompleteendwallFinalroofelementFlag" value="notok">NOT OK &nbsp<input type= radio id="weldingCompleteendwallFinalroofelementFlag" value="na"> NA</td></tr>
<tr><td>3.15 Welding roof with side wall car line by tractor welding from outside as per Drg.</td><td> <input type=radio id="weldingRoofSidewallCarlineFlag" value="ok">OK &nbsp<input type=radio id="weldingRoofSidewallCarlineFlag" value="notok">NOT OK &nbsp<input type= radio id="weldingRoofSidewallCarlineFlag" value="na"> NA</td></tr>
<tr><td>3.16 Grind all the horizontal & vertical welding joints for proper outer finish</td><td> <input type=radio id="grindHorizontalVerticalJointFlag" value="ok">OK &nbsp<input type=radio id="grindHorizontalVerticalJointFlag" value="notok">NOT OK &nbsp<input type= radio id="grindHorizontalVerticalJointFlag"value="na"> NA</td></tr>
<tr><td>3.17 Alignment of both side wall with underframe center line(find out center line of both side wall & underframe all three center line should be aligned)</td><td> <input type=radio id="alignmentBothSidewallUnderframeFlag" value="ok">OK &nbsp<input type=radio id="alignmentBothSidewallUnderframeFlag" value="notok">NOT OK &nbsp<input type= radio id="alignmentBothSidewallUnderframeFlag" value="na"> NA</td></tr>
</table>

<b>4.Details:</b>
<table>
<tr><td>4.1 Details of modification carried out(if any):</td><td><input type=text id="detailsOfModification" class='validate[required]'></td></tr>
<tr><td>4.2 Details of trial items fitted(if any) </td><td><input type=text id="detailsOfTrial" class='validate[required]'></td></tr>
<tr><td>4.3 Remarks(if any)</td><td><input type=text id="remarks" class='validate[required]'></td></tr>
</table>

<b>5.Final Decision</b>
<table>
<tr><td></td><td> <input type=radio id="stage1TestingStatus" value="conforming">Conforming <input type=radio id="stage1TestingStatus" value="notconforming">Not Conforming</td></tr>
</table>

</form>
 </div>
    
    
    <div id="Stage2" style="height:150%; width:200%; display:none;z-index: 9;" >
    <form name="shellsipStage2">
    <table style="width:100%;border:1px solid black">
<tr>
<td></td><td class="b" rowspan="2" align="center">MODERN COACH FACTORY RAEBARELI</td>
<th>DOC NO:</th><th><input type="text" id="stage2SipDocNo" class='validate[required]'></th>
</tr>
</table>

<h3 align="center">SELF INSPECTION PROFORMA</h3>
<h2 align="center">SHELL ASSEMBLY STAGE-2</h2>

<table style="width:100%;border:1px solid black">
<tr>
<th class="b">SHIFT-<select name="" id="stage2SipShift" class='validate[required]'>
<option value="">Select</option>
<option value="general">General</option>
<option value="morning">Shift-I</option>
<option value="evening">Shift-II</option>
<option value="night">Shift-III</option>
</select></th>
<th class="b">Shell assembly Stage-2 Work done by<input type="text" id="stage2WorkBy" class='validate[required]'></th>
<th class="b">SHELL TYPE<input type="text" id="stage2ShellType"></th>
<th class="b">SHELL NO<input type="text" id="stage2ShellNo"></th>
<th class="b">Date<input type="text" id="stage2SipDate" class='validate[required]'></th>
</tr>
</table>
data from shell transaction
<table style="width:100%;border:1px solid black">
<tr>
<th class="b">jig no.</th>
<th class="b">Shell assembly by</th>
<th class="b">U/Frame Make & No</th>
<th class="b">Roof Make & No</th>
<th class="b">End Wall Make & No</th>
<th class="b">Side Wall Make & No</th>
</tr>
<tr>
<td rowspan="2" class="b"><input type="text" id="stage2JigNo"></td>
<td rowspan="2" class="b"><input type="text" id="stage2ShellAssemblyBy"></td>
<td rowspan="2" class="b"><input type="text" id="stage2UnderframeMake"></td>
<td rowspan="2" class="b"><input type="text" id="stage2RoofMake"></td>
<td class="b">PP &nbsp;<input type="text" id="stage2EndWallMakePP"></td>
<td class="b">LH &nbsp;<input type="text" id="stage2SideWallMakeLH"></td>
</tr>
<tr>
<td class="b">NPP &nbsp;<input type="text" id="stage2EndWallMakeNPP"></td>
<td class="b">RH &nbsp;<input type="text" id="stage2SideWallMakeRH"></td>
</tr>
</table>
end here
<table>
<tr><th align="left">1.Applicability:</th></tr>
<tr><td>1.1 Applicable Drawing No:</td><td><input type="text" id="stage2DrawingNo"></td></tr>
<tr><td>1.2 Applicable W.I No(If Any):</td><td><input type="text" id="stage2WiNo"></tr>
</table>

<table>
<tr><th align="left">2.Observation</th></tr>
<tr>
<td>2.1 Items fitted as per Drawing</td>
<td></td>
<td>
<input type="radio" id="itemFittedAsDrawingFlag" name="itemFittedAsDrawingFlag" value="OK">OK
<input type="radio" id="itemFittedAsDrawingFlag" name="itemFittedAsDrawingFlag"  value="NOT OK">NOT OK
<input type="radio" id="itemFittedAsDrawingFlag" name="itemFittedAsDrawingFlag"  value="NA">NA
</td>
</tr>
<tr>
<td>2.2 Compliance of applicable W.I</td>
<td></td>
<td>
<input type="radio" id="complianceWiFlag" name="complianceWiFlag" value="OK">OK
<input type="radio" id="complianceWiFlag" name="complianceWiFlag" value="NOT OK">NOT OK
<input type="radio" id="complianceWiFlag" name="complianceWiFlag"  value="NA">NA
</td>
</tr>
<tr>
<td>2.3 Welding joint throat & length as per drawing.</td>
<td></td>
<td>
<input type="radio" id="weldingThroatLengthFlag" name="weldingThroatLengthFlag"  value="OK">OK
<input type="radio" id="weldingThroatLengthFlag" name="weldingThroatLengthFlag" value="NOT OK">NOT OK
<input type="radio" id="weldingThroatLengthFlag" name="weldingThroatLengthFlag" value="NA">NA
</td>
</tr>
<tr>
<td>2.4 Welding joint of end wall both end as per drawing.</td>
<td></td>
<td>
<input type="radio" id="weldingEndwallFlag" name="weldingEndwallFlag" value="OK">OK
<input type="radio" id="weldingEndwallFlag" name="weldingEndwallFlag" value="NOT OK">NOT OK
<input type="radio" id="weldingEndwallFlag"  name="weldingEndwallFlag" value="NA">NA
</td>
</tr>
<tr>
<td>2.5 Welding joint of side wall with sole bar outside both ends as per Drawing.(Tractor welding/manual welding)</td>
<td></td>
<td>
<input type="radio" id="weldingSidewallSolebarFlag" name="weldingSidewallSolebarFlag" value="OK">OK
<input type="radio" id="weldingSidewallSolebarFlag" name="weldingSidewallSolebarFlag" value="NOT OK">NOT OK
<input type="radio" id="weldingSidewallSolebarFlag" name="weldingSidewallSolebarFlag" value="NA">NA
</td>
</tr>
<tr>
<td>2.6 Inside & Outside Grinding/Cleaning at all welding joints.</td>
<td></td>
<td>
<input type="radio" id="insideOutsideGrindingFlag" name="insideOutsideGrindingFlag" value="OK">OK
<input type="radio" id="insideOutsideGrindingFlag" name="insideOutsideGrindingFlag" value="NOT OK">NOT OK
<input type="radio" id="insideOutsideGrindingFlag" name="insideOutsideGrindingFlag" value="NA">NA
</td>
</tr>
<tr>
<td>2.7 Grind the up-lifted marks of spot welding on Side wall assemblies</td>
<td></td>
<td>
<input type="radio" id="grindSpotweldingSidewallFlag" name="grindSpotweldingSidewallFlag" value="OK">OK
<input type="radio" id="grindSpotweldingSidewallFlag" name="grindSpotweldingSidewallFlag" value="NOT OK">NOT OK
<input type="radio" id="grindSpotweldingSidewallFlag" name="grindSpotweldingSidewallFlag" value="NA">NA
</td>
</tr>
<tr>
<td>2.8 Fit & weld back piece for fixing partition frame(LGS,LSCN)<br>& Back piece for luggage rack.</td>
<td></td>
<td>
<input type="radio" id="fitWeldPartitionframeFlag" name="fitWeldPartitionframeFlag" value="OK">OK
<input type="radio" id="fitWeldPartitionframeFlag" name="fitWeldPartitionframeFlag" value="NOT OK">NOT OK
<input type="radio" id="fitWeldPartitionframeFlag" name="fitWeldPartitionframeFlag" value="NA">NA
</td>
</tr>
</table>
<br>
<table>
<tr><td>3.1 Details of modification carried out(if any):</td><td><input type="text" id="detailsOfModification"></td></tr>
<tr><td>3.2 Details of trial items fitted(if any):</td><td><input type="text" id="detailsOfTrial"></td></tr>
<tr><td>3.3 Remarks(if any):</td><td><input type="text" id="remarks"></td></tr>
</table>
<p>Testing status</p><p><input type="radio" id="stage2TestingStatus" name="stage2TestingStatus" value="Conforming">Conforming
						<input type="radio" id="stage2TestingStatus"  name="stage2TestingStatus" value="Non Conforming">Non Conforming</p>
</form>
    
 </div> 



<div id="Stage3" style="height:150%; width:200%; display:none;z-index: 9;">
 <form name="shellsipStage3">
 <table class="c">
<tr>
<td class="b" rowspan="2" align="center">MODERN COACH FACTORY RAEBARELI</td>
<th>DOC NO:</th><th><input type="text" id="stage3SipDocNo" class='validate[required]'></th>
</tr>
<tr><th>Drawing No</th><th><input type="text" id="stage3DrawingNo" class='validate[required]'></th>
</table>
<h3 align="center">SELF INSPECTION PROFORMA</h3>
<h2 align="center">SHELL ASSEMBLY STAGE-3</h2>
<table class="c">
<tr>
<th class="b">SHIFT-SHIFT-<select name="" id="stage3SipShift" class='validate[required]'>
<option value="">Select</option>
<option value="general">General</option>
<option value="morning">Shift-I</option>
<option value="evening">Shift-II</option>
<option value="night">Shift-III</option>
</select></th>
<th class="b">Shell assembly Stage-2 Work done by<input type="text" id="stage3WorkBy" class='validate[required]'></th>
<th class="b">SHELL TYPE<input type="text" id="Stage3ShellType" class='validate[required]'></th>
<th class="b">SHELL NO<input type="text" id="Stage3ShellNo" class='validate[required]'></th>
<th class="b">Date<input type="text" id="stage3SipDate" class='validate[required]'></th>
</tr>
</table>
<table class="c">
<tr>
<th class="b">Shell assembly by</th><th>No./jig no.</th>
<th class="b">U/Frame Make & No</th>
<th class="b">Roof Make & No</th>
<th class="b">End/Wall Make & No</th>
<th class="b">Side Wall Make & No</th>
</tr>
<tr>
<td rowspan="2"class="b"><select id="stage3ShellAssemblyBy">
   <option value="" selected>Select</option>
    <option value="InHouse">In House</option>
     <option value="FromTrade">From Trade</option>
    <option value="Manual">Manual</option>
    <option value="KUKA">Kuka Line</option>
    <option value="SIS">SIS Line</option>
   
</select></td>
<td rowspan="2"class="b"><input type="text" id="stage3JigNo"></td>
<td rowspan="2"class="b"><input type="text" id="stage3UnderFrameMake"></td>
<td rowspan="2"class="b"><input type="text" id="stage3RoofMake"></td>
<td class="b">PP &nbsp;<input type="text" id="endwallMakePp"></td>
<td class="b">LH &nbsp;<input type="text" id="sideWallMakeLh"></td>
</tr>
<tr>
<td class="b">NPP &nbsp;<input type="text" id="endwallMakeNpp"></td>
<td class="b">RH &nbsp;<input type="text" id="sideWallMakeRh"></td>
</tr>
</table>
<table class="d">
<tr><th align="left">Specified value of CONCAVITY & CONVEXITY:</th></tr>
<tr><td>(a)0.5mm to 1.0mm in a length of 300mm to 1000mm(Side wall area)</td><th>For LHB</th></tr>
<tr><td>(b)1.0mm to 1.5mm in a length of 300mm to 1000mm(Above S/Wall & E/Wall font area)</td><th>For LHB</th></tr>
<tr><td>(c)1.5mm to 3.0mm in a length of 300mm to 1000mm(End Wall area)</td><th>For LHB</th></tr>
</table>
<h4>Observation:</h4>
<h4>1.Undulation</h4>
<table border="1" class="c">
<tr><th>Window No.</th>
<th>Observation above Window</th>
<th>Observation below Window</th>
<th>Window No.</th>
<th>Observation above Window</th>
<th>Observation below Window</th></tr>
<tr><td>1.</td><td><input type="text" id="undulationAboveWindow1" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow1" class='validate[custom[number]]'></td><td>22.</td><td><input type="text" id="undulationAboveWindow22" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow22" class='validate[custom[number]]'></td></tr>
<tr><td>2.</td><td><input type="text" id="undulationAboveWindow2" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow2" class='validate[custom[number]]'></td><td>23.</td><td><input type="text" id="undulationAboveWindow23" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow23" class='validate[custom[number]]'></td></tr>
<tr><td>3.</td><td><input type="text" id="undulationAboveWindow3" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow3" class='validate[custom[number]]'></td><td>24.</td><td><input type="text" id="undulationAboveWindow24" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow24" class='validate[custom[number]]'></td></tr>
<tr><td>4.</td><td><input type="text" id="undulationAboveWindow4" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow4" class='validate[custom[number]]'></td><td>25.</td><td><input type="text" id="undulationAboveWindow25" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow25" class='validate[custom[number]]'></td></tr>
<tr><td>5.</td><td><input type="text" id="undulationAboveWindow5" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow5" class='validate[custom[number]]'></td><td>26.</td><td><input type="text" id="undulationAboveWindow26" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow26" class='validate[custom[number]]'></td></tr>
<tr><td>6.</td><td><input type="text" id="undulationAboveWindow6" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow6" class='validate[custom[number]]'></td><td>27.</td><td><input type="text" id="undulationAboveWindow27" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow27" class='validate[custom[number]]'></td></tr>
<tr><td>7.</td><td><input type="text" id="undulationAboveWindow7" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow7" class='validate[custom[number]]'></td><td>28.</td><td><input type="text" id="undulationAboveWindow28" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow28" class='validate[custom[number]]'></td></tr>
<tr><td>8.</td><td><input type="text" id="undulationAboveWindow8" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow8" class='validate[custom[number]]'></td><td>29.</td><td><input type="text" id="undulationAboveWindow29" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow29" class='validate[custom[number]]'></td></tr>
<tr><td>9.</td><td><input type="text" id="undulationAboveWindow9" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow9" class='validate[custom[number]]'></td><td>30.</td><td><input type="text" id="undulationAboveWindow30" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow30" class='validate[custom[number]]'></td></tr>
<tr><td>10.</td><td><input type="text" id="undulationAboveWindow10" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow10" class='validate[custom[number]]'></td><td>31.</td><td><input type="text" id="undulationAboveWindow31" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow31" class='validate[custom[number]]'></td></tr>
<tr><td>11.</td><td><input type="text" id="undulationAboveWindow11" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow11" class='validate[custom[number]]'></td><td>32.</td><td><input type="text" id="undulationAboveWindow32" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow32" class='validate[custom[number]]'></td></tr>
<tr><td>12.</td><td><input type="text" id="undulationAboveWindow12" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow12" class='validate[custom[number]]'></td><td>33.</td><td><input type="text" id="undulationAboveWindow33" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow33" class='validate[custom[number]]'></td></tr>
<tr><td>13.</td><td><input type="text" id="undulationAboveWindow13" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow13" class='validate[custom[number]]'></td><td>34.</td><td><input type="text" id="undulationAboveWindow34" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow34" class='validate[custom[number]]'></td></tr>
<tr><td>14.</td><td><input type="text" id="undulationAboveWindow14" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow14" class='validate[custom[number]]'></td><td>35.</td><td><input type="text" id="undulationAboveWindow35" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow35" class='validate[custom[number]]'></td></tr>
<tr><td>15.</td><td><input type="text" id="undulationAboveWindow15" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow15" class='validate[custom[number]]'></td><td>36.</td><td><input type="text" id="undulationAboveWindow36" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow36" class='validate[custom[number]]'></td></tr>
<tr><td>16.</td><td><input type="text" id="undulationAboveWindow16" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow16" class='validate[custom[number]]'></td><td>37.</td><td><input type="text" id="undulationAboveWindow37" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow37" class='validate[custom[number]]'></td></tr>
<tr><td>17.</td><td><input type="text" id="undulationAboveWindow17" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow17" class='validate[custom[number]]'></td><td>38.</td><td><input type="text" id="undulationAboveWindow38" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow38" class='validate[custom[number]]'></td></tr>
<tr><td>18.</td><td><input type="text" id="undulationAboveWindow18" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow18" class='validate[custom[number]]'></td><td>39.</td><td><input type="text" id="undulationAboveWindow39" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow39" class='validate[custom[number]]'></td></tr>
<tr><td>19.</td><td><input type="text" id="undulationAboveWindow19" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow19" class='validate[custom[number]]'></td><td>40.</td><td><input type="text" id="undulationAboveWindow40" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow40" class='validate[custom[number]]'></td></tr>
<tr><td>20.</td><td><input type="text" id="undulationAboveWindow20" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow20" class='validate[custom[number]]'></td><td>41.</td><td><input type="text" id="undulationAboveWindow41" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow41" class='validate[custom[number]]'></td></tr>
<tr><td>21.</td><td><input type="text" id="undulationAboveWindow21" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow21" class='validate[custom[number]]'></td><td>42.</td><td><input type="text" id="undulationAboveWindow42" class='validate[custom[number]]'></td><td><input type="text" id="undulationBelowWindow42" class='validate[custom[number]]'></td></tr>
</table>
<table border="1" class="d">
<tr><th colspan="5">END WALL(1.5 mm to 3.0 mm in a length of 300 mm to 1000 mm(End Wall area))</th></tr>
<tr><th colspan="3">END WALL PP</th><th colspan="2">END WALL NPP</th></tr>
<tr><th rowspan="2">Above</th><th>Center LH side</th><th>Center RH side</th><th>Center LH side</th><th>Center RH side</th></tr>
<tr>
<th><input type="text" id="endwallPpAboveCenterLh"></th>
<th><input type="text" id="endwallPpAboveCenterRh"></th>
<th><input type="text" id="endwallNppAboveCenterLh"></th>
<th><input type="text" id="endwallNppAboveCenterRh"></th>
</tr>
<tr>
<th>Middle</th>
<th><input type="text" id="endwallPpMiddleCenterLh"></th>
<th><input type="text" id="endwallPpMiddleCenterRh"></th>
<th><input type="text" id="endwallNppMiddleCenterLh"></th>
<th><input type="text" id="endwallNppMiddleCenterRh"></th>
</tr>
<tr>
<th>Bottom</th>
<th><input type="text" id="endwallPpBottomCenterLh"></th>
<th><input type="text" id="endwallPpBottomCenterRh"></th>
<th><input type="text" id="endwallNppBottomCenterLh"></th>
<th><input type="text" id="endwallNppBottomCenterRh"></th>
</tr>
</table>
<table class="d">
<tr><td>2.1 Dent reduced side wall & end wall before flame heating </td><td><input type="radio" id="dentReduceSidewallEndwallFlag" name="dentReduceSidewallEndwallFlag" value="OK">OK<input type="radio" id="dentReduceSidewallEndwallFlag" name="dentReduceSidewallEndwallFlag" value="NOT OK">NOT OK<input type="radio" id="dentReduceSidewallEndwallFlag" name="dentReduceSidewallEndwallFlag" value="NA">NA</td></tr>
<tr><td>2.2 Skin tensioning work done as per WI</td><td><input type="radio" id="skinTensioningWiFlag" name="skinTensioningWiFlag" value="OK">OK<input type="radio" id="skinTensioningWiFlag" name="skinTensioningWiFlag" value="NOT OK">NOT OK<input type="radio" id="skinTensioningWiFlag" name="skinTensioningWiFlag" value="NA">NA</td></tr>
<tr><td>2.3 Skin tensioning of both side wall,<br>end wall & lavatory side wall with the help of magnet pre-drilled hole plate and multi head torch</td><td><input type="radio" id="skinTensioningSidewallEndwallLavFlag" name="skinTensioningSidewallEndwallLavFlag" value="OK">OK<input type="radio" id="skinTensioningSidewallEndwallLavFlag" name="skinTensioningSidewallEndwallLavFlag" value="NOT OK">NOT OK<input type="radio" id="skinTensioningSidewallEndwallLavFlag" name="skinTensioningSidewallEndwallLavFlag" value="NA">NA</td></tr>
<tr><td>2.4 Heated spot matched with shade card</td><td><input type="radio" id="heatedSpotFlag" name="heatedSpotFlag" value="OK">OK<input type="radio" id="heatedSpotFlag" name="heatedSpotFlag" value="NOT OK">NOT OK<input type="radio" id="heatedSpotFlag" name="heatedSpotFlag" value="NA">NA</td></tr>
<tr><td>2.5 Weld the rain water gutter above all doorways as per drawing.</td><td><input type="radio" id="weldRainWaterFlag" name="weldRainWaterFlag" value="OK">OK<input type="radio" id="weldRainWaterFlag" name="weldRainWaterFlag" value="NOT OK">NOT OK<input type="radio" id="weldRainWaterFlag" name="weldRainWaterFlag" value="NA">NA</td></tr>
<tr><td>2.6 Insulating welding pins on roof assembly on roof bearer as per drawing.</td><td><input type="radio" id="insulatingWeldingPinFlag"  name="insulatingWeldingPinFlag" value="OK">OK<input type="radio" id="insulatingWeldingPinFlag" name="insulatingWeldingPinFlag" value="NOT OK">NOT OK<input type="radio" id="insulatingWeldingPinFlag" value="NA">NA</td></tr>
<tr><td>2.7 Fitment & welding destination board on both side walls as per drawing.</td><td><input type="radio" id="fitmentWeldingSidewallFlag" value="ok">ok<input type="radio" id="fitmentWeldingSidewallFlag" value="not ok">not ok<input type="radio" id="fitmentWeldingSidewallFlag" value="na">na</td></tr>
<tr><td>2.8 Fitment & welding bracket arrangement for mounting number plate as per drawing </td><td><input type="radio" id="fitmentWeldingBracketarrangementFlag" name="fitmentWeldingBracketarrangementFlag" value="OK">OK<input type="radio" id="fitmentWeldingBracketarrangementFlag" name="fitmentWeldingBracketarrangementFlag" value="NOT OK">NOT OK<input type="radio" id="fitmentWeldingBracketarrangementFlag" name="fitmentWeldingBracketarrangementFlag" value="NA">NA</td></tr>
<tr><td>2.9 Ensure the level of rain water gutter</td><td><input type="radio" id="levelRainWaterGutterFlag" name="levelRainWaterGutterFlag" value="OK">OK<input type="radio" id="levelRainWaterGutterFlag" name="levelRainWaterGutterFlag" value="NOT OK">NOT OK<input type="radio" id="levelRainWaterGutterFlag" name="levelRainWaterGutterFlag" value="NA">NA</td></tr>
<tr><td>2.10 Fitment & welding of window bars as per Drg.(LGS,LSN)</td><td><input type="radio" id="fitmentWeldingWindowbarFlag" name="fitmentWeldingWindowbarFlag" value="OK">OK<input type="radio" id="fitmentWeldingWindowbarFlag" name="fitmentWeldingWindowbarFlag" value="NOT OK">NOT OK<input type="radio" id="fitmentWeldingWindowbarFlag" name="fitmentWeldingWindowbarFlag" value="NA">NA</td></tr>
<tr><td>2.11 Fitment & welding bracket for fixing Lavatory Module.(L3T,L2T)<br>Specified value:837(+/-)3mm</td><td><input type="radio" id="fitmentWeldingBracketLavatoryFlag" name="fitmentWeldingBracketLavatoryFlag" value="OK">OK<input type="radio" id="fitmentWeldingBracketLavatoryFlag" name="fitmentWeldingBracketLavatoryFlag" value="NOT OK">NOT OK<input type="radio" id="fitmentWeldingBracketLavatoryFlag" name="fitmentWeldingBracketLavatoryFlag" value="NA">NA</td></tr>
</table>
<table class="d">
<tr><td>3.1 Details of modification carried out(if any):</td><td><input type="text" id="detailsOfM"></td></tr>
<tr><td>3.2 Details of trail items fitted(if any):</td><td><input type="text" id="detailsOfT"></td></tr>
<tr><td>3.3 Remarks(if any):</td><td><input type="text" id="remark"></td></tr>
<tr><td> Test Status</td><td><input type="radio" id="stage3TestingStatus" name="stage3TestingStatus" value="conforming">Conforming<input type="radio" id="stage3TestingStatus" name="stage3TestingStatus"  value="NOT Conforming">Not Conforming</td></tr>
</table>
</form>
 </div>


<div id="ShellStage4SIPDialog" style="height:150%; width:200%; display:none;z-index: 9;" >
<h3 align="center">SELF INSPECTION PROFARMA</h3>
<form name="Stage4">
<p><b>DOC NO.</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=text id="stage4SipDocNo" name="shellAssemblystage4DocNo" style="width:250px;"/></p>
<table border="1" style="width:'115%'; cellspacing:'0';" >
<tr>
	<td colspan=2><b>SHELL ASSEMBLY STAGE 4</b>
	</td>
	<td><b>SHELL TYPE </b>&nbsp;<input type=text id="shellTypeStage4" readonly/>
	</td>
	<td colspan=2><b>SHELL NO</b> &nbsp;<input type=text id="shellNumberStage4" readonly/>
	</td>
</tr>
<tr>
	<td><b>SHIFT</b> &nbsp;
		<select name="ShellAssemblyStage4ShiftSelect" id="stage4SipShift" >
		<option value="none">Select</option>
		<option value="general">General</option>
		<option value="shift-I">Shift-I</option>
		<option value="Shift-II">Shift-II</option>
		<option value="Shift-III">Shift-III</option>
		</select>
	</td>	
	<td colspan=2><b>Shell assembly Stage-4 work done by</b> &nbsp;<input type= text id="stage4WorkBy" /></td>
	<td colspan=2><b>Date of Testing</b> &nbsp;<input type=date id="stage4SipDate" /></td>
</tr>
</table>
<br>
<table  border='1' style="width:'115%'; cellspacing:'0';">
	<tr>
		<td>Shell assembly by & no</td>
		<td>jig no.</td>
		<td>Underframe make</td>
		<td>Underframe no.</td>
		<td>Roof make and no.</td>
		<td colspan=2>Endwall make and no.</td>
		<td colspan=2>Sidewall make and no.</td>
	</tr>
	<tr>
		<td rowspan=2><input type=text id="shellAssembledBy4" /></td>
		<td rowspan=2><input type=text id="jigNo4" /></td>
		<td rowspan=2><input type=text id="underframeCompleteMake4" /></td>
		<td rowspan=2><input type=text id="underFrameNumber4" /></td>
		<td rowspan=2><input type=text id="roofMake4" /></td>
		<td>PP</td>
		<td><input type=text id="endwallMakePp4" /></td>
		<td>LH</td>
		<td><input type=text id="sideWallMakeNoPp4" /></td>
	
	</tr>
	<tr>
		<td>NPP</td>
		<td><input type=text id="endwallMakeNpp4" /></td>
		<td>RH</td>
		<td><input type=text id="sideWallMakeNoNpp4" /></td>
	</tr>
</table>
1.Applicability
<table>
<tr>
	<td>&nbsp; &nbsp; &nbsp;1.1 Applicable Drawing No.</td>
	<td><input type=text id="stage4DrawingNo"   placeholder="enter value" /></td>
</tr>
<tr>
	<td> &nbsp; &nbsp; &nbsp;1.2 Applicable W.I No(if any) </td>
	<td><input type=text id="stage4WiNo"  placeholder="enter value"/></td>
</tr>
</table>
2.Observations: Shell dimension as per table
<table border=1 style=" width:'115%'; cellspacing:'0';">
<tr>
	<td>SNO.</td>
	<td colspan=2>Parameter</td>
	<td>Specified</td>
	<td colspan=2>Observed</td>
	<td>Remarks</td>
</tr>
<tr>
	<td rowspan=2>1</td>
	<td rowspan=2 colspan=2>Distance between two consecutive partition frame(inner tube to inner tube)(LSCN)<br>
	Distance between two consecutive partition frame(inner tube to inner tube)<br>
	Distance between two consecutive partition frame(inner tube to inner tube)(in passenger compartment)<br>
	Distance between two consecutive partition frame(inner tube to inner tube)(LDSLR)(in disabled compt)
	</td>
	<td rowspan=2>LSCN-1780x10<br>
	LGS-1682x5<br>
	LDSLR-1682x3<br>
	LDSLR-2236
	</td>
	<td>Single side/LH</td>
	<td ><input type=text id="distancePartitionFrameSingleLh" placeholder="enter value" class='validate[required]' ></td>
	<td rowspan=46><input type=text id="shellAssembly4ObervationRmk" placeholder="enter value"></td>
</tr>
<tr>
	<td>Cabin side/RH</td>
	<td><input type=text id="distancePartitionFrameCabinRh" placeholder="enter value" class='validate[required]' ></td>
</tr>
<tr>
	<td>2</td>
	<td colspan=2>Width of corridor area between partition frames(LSCN)</td>
	<td>594x11</td>
	<td colspan=2><input type=text id="widthCorridorPartitionFrame" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>3</td>
	<td colspan=2>Distance from door cut out to sliding door T-stopper(LDSLR)</td>
	<td>1370</td>
	<td colspan=2><input type=text id="distanceDoorcutoutSlidingdoor" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>4</td>
	<td colspan=2>Distance between middle door center & pull box bkt center in tranverse side (LH/RH)(LGS)</td>
	<td>1698,1702x4</td>
	<td colspan=2><input type=text id="distanceMiddleDoorPullboxbkt" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td rowspan=2>5</td>
	<td rowspan=2>Distance between pull box bkt from center line of side wall(LSCN)</td>
	<td>PP Side</td>
	<td>1156,1645x4</td>
	<td colspan=2><input type=text id="distancePullboxbktCenterlinePp" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>NPP Side</td>
	<td>489,1645x4</td>
	<td colspan=2><input type=text id="distancePullboxbktCenterlineNpp" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>6</td>
	<td colspan=2>Fitment of 30 Ltr. water tank bracket as per drg. Both side(L3T,L2T,LWFAC)</td>
	<td>620+-3</td>
	<td colspan=2><input type=text id="fitmentWatertankbracketBothside" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>7</td>
	<td colspan=2>Height of channel complete for fixing chair angle(LGS)</td>
	<td>192</td>
	<td colspan=2><input type=text id="heightChannelcomplete" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>8</td>
	<td colspan=2>Distance between sidewall to partition pillar(LGS/LSCN)(traverse side/longitudnal side)<br>
	Distance between sidewall to partition pillar(LDSLR)(LH/RH side)(Passenger/Diasbled compartment)
	 </td>
	<td>1990/1877 645<br>1990,1162/2062,1054
	</td>
	<td colspan=2><input type=text id="distanceSidewallPartitionpillar" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>9</td>
	<td colspan=2>Height of back piece for luggage rack(LGS)</td>
	<td>1665</td>
	<td colspan=2><input type=text id="heightBackpieceLuggageracke" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>10</td>
	<td colspan=2>Distance between destination board and coach no. bkt<br>Distance between destination board in(LDSLR)&(LPC)
	</td>
	<td>1230/should be equal at window edge<br>1232+-2</td>
	<td colspan=2><input type=text id="distanceDestinationBoard" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>11</td>
	<td colspan=2>Distance between side wall pillar to PRT member (in door way & generator compartment)(for power car)</td>
	<td>2026+-4 mm</td>
	<td colspan=2><input type=text id="diatanceSidewallpillarPrtmember" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>12</td>
	<td colspan=2>Height from roof flange to frame part complete(LPC)</td>
	<td>180 mm</td>
	<td colspan=2><input type=text id="heightRoofflangeFramepart" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>13</td>
	<td colspan=2>Duct Internal Longitudanl and lateral distance</td>
	<td>1256 mm x 1300 mm</td>
	<td colspan=2><input type=text id="ductInternallogitudinalLateral" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>14</td>
	<td colspan=2>Door way distance in crew compartment and generator room </td>
	<td>684.5 mm</td>
	<td colspan=2><input type=text id="distanceDoorwayCrewcompGenroom" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>15</td>
	<td colspan=2>Auxiliary water tank bkt. Centre to centre distance</td>
	<td>533</td>
	<td colspan=2><input type=text id="distanceAuxWatertankbktCentre" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>16</td>
	<td colspan=2>Disable Lav. in  LDSLR(LXW)</td>
	<td>2104x1888</td>
	<td colspan=2><input type=text id="disableLavDoor" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>17</td>
	<td colspan=2>Disable Lav. Door width in LDSLR</td>
	<td>1144</td>
	<td colspan=2><input type=text id="disableLavDoorWidth" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>18</td>
	<td colspan=2>Height from bottom of roof to Cross braces bottom (L2T,LBC,TRC,TRS/L3T,LWFAC)</td>
	<td>301//319+-2</td>
	<td colspan=2><input type=text id="heightBottomroofCrossbracesbottom" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>19</td>
	<td colspan=2>Passenger Lav. area in LDSLR(LxW) </td>
	<td>1228x11217</td>
	<td colspan=2><input type=text id="passengerLavArea" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>20</td>
	<td colspan=2>Distance between Lav. PRT frame to end(LSCN&LGS)</td>
	<td>1332+-4</td>
	<td colspan=2><input type=text id="distanceLavPrtframeEnd" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>21</td>
	<td colspan=2>Distance between Lav. PRT frame to Lav. PRT frame(gangway between distance)(LSCN&LGS)</td>
	<td>802+-3</td>
	<td colspan=2><input type=text id="distanceLavPrtframeLavPrtframe" placeholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
<td rowspan=6>22</td>
<th>Description</th>
<th colspan=2>Specified value</th>
<th colspan=2>Observed</th>
</tr>
<tr>
<th>Lower(LH)</th>
<th colspan=2><p>L2T - 307mm<br>L3T - 307mm<br>LSCN - 222mm<br></p></th>
<td colspan=2><input class="txt" type="text" name="observed lower LH " id="berthbktLowerLh" class='validate[custom[integer]]' placeholder="Lower LH"></td>
</tr>
<tr>
<th>Middle(LH)</th>
<th colspan=2><p>L3T - 1078mm<br>LSCN - 984mm</p></th>
<td colspan=2><input class="txt" type="text" name="observed middle LH" id="berthbktMiddleLh" class='validate[custom[integer]]' placeholder="Middle LH"></td>
</tr>
<tr>
<th>Upper(LH)</th>
<th colspan=2><p>L2T - 1377mm<br>L3T - 1744mm<br>LSCN - 1659mm</p></th>
<td colspan=2><input class="txt" type="text" name="observed upper LH" id="berthbktUpperLh" class='validate[custom[integer]]' placeholder="Upper LH"></td>
</tr>
<tr>
<th>Lower(RH)</th>
<th colspan=2><p>L2T - 307mm<br>L3T - 307mm<br>LSCN - 222mm</p></th>
<td colspan=2><input class="txt" type="text" name="observed lower RH" id="berthbktLowerRh" class='validate[custom[integer]]' placeholder="Lower RH"></td>
</tr>
<tr>
<th>Upper(RH)</th>
<th colspan=2><p>L2T - 1362mm<br>L3T - 1372mm<br>LSCN - 1470mm</p></th>
<td colspan=2><input class="txt" type="text" name="observed upper RH" id="berthbktUpperRh" class='validate[custom[integer]]' placeholder="Upper LH"></td>
</tr>
<tr>
	<td>23</td>
	<td colspan=2>Dog box area in LDSLR(LxW)</td>
	<td colspan=2>1247x863</td>
	<td><input type=text id="dogBoxArea" palceholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>24</td>
	<td colspan=2>Control room area in LDSLR(LxW)</td>
	<td colspan=2>3269x3141</td>
	<td><input type=text id="controlRoomArea" palceholder="enter value" class='validate[required]' ></td>
</tr>
<tr>
	<td>25</td>
	<td colspan=2>Stretcher room area in LDSLR(LxW)</td>
	<td colspan=2>581x870</td>
	<td><input type=text id="stretcherRoomArea" palceholder="enter value" class='validate[required]' ></td>
	
</tr>

<tr>
	<td>26</td>
	<td colspan=2>Distance between sliding door stopper in LPC</td>
	<td colspan=2>1271</td>
	<td><input type=text id="distanceSlidingDoorStopper" palceholder="enter value" class='validate[required]' ></td>
	
</tr>

<tr>
	<td>27</td>
	<td colspan=2>Distance between Lav. module mounting bkt in LPC </td>
	<td colspan=2>837</td>
	<td><input type=text id="distanceLavMountingbkt" palceholder="enter value" class='validate[required]' ></td>
	
</tr>

<tr>
	<td>28</td>
	<td colspan=2>Distance between Auxiliary water tank bkt in LPC</td>
	<td colspan=2>533</td>
	<td><input type=text id="distanceAuxWatertankbkt" palceholder="enter value" class='validate[required]' ></td>
	
</tr>

<tr>
	<td>29</td>
	<td colspan=2>BKT complete height for roof flange in staff room in LPC</td>
	<td colspan=2>153.5</td>
	<td><input type=text id="heightBktcompleteRoofflange" palceholder="enter value" class='validate[required]' ></td>
	
</tr>

<tr>
	<td>30</td>
	<td colspan=2>Power panel mounting bkt distance from centre line and endwall in LBC</td>
	<td colspan=2>515 & 525</td>
	<td><input type=text id="distancePowerpanelmountingCenterline" palceholder="enter value" class='validate[required]' ></td>
	
</tr>

<tr>
	<td>31</td>
	<td colspan=2>Distance between coach centre line to auxiliary bkt in LBC<br>Distance between coach center line to auxiliary bkt in TRC </td>
	<td colspan=2>2248,2921<br>1433,3430/673 bkt between distance</td>
	<td><input type=text id="distanceCoachcenterlineAuxiliarybkt" palceholder="enter value" class='validate[required]' ></td>
	
</tr>

<tr>
	<td rowspan=2>32</td>
	<td colspan=2 rowspan=2>Height of lower berth and upper berth in TRS/TRC</td>
	<td colspan=2>307,1393.5,1389</td>
	<td rowspan=2><input type=text id="heightLowerberthUpperberth" palceholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>307,1046 bkt bottom</td>
</tr>
<tr>
	<td>33</td>
	<td colspan=2>Distance from pull box to pull box in TRS</td>
	<td colspan=2>1041,2248.5,2233,2233</td>
	<td><input type=text id="distancePullboxPullbox" palceholder="enter value" class='validate[required]' ></td>
	
</tr>

<tr>
	<td>34</td>
	<td colspan=2>Distance from luggage rack mounting bkt to roof flange top in LWSCZ(Non AC)</td>
	<td colspan=2>64</td>
	<td><input type=text id="distanceLuggagerackRoofflangetop" palceholder="enter value" class='validate[required]' ></td>
	
</tr>

<tr>
	<td>35</td>
	<td colspan=2>Distance from door attachment bkt</td>
	<td colspan=2>140,684,1402</td>
	<td><input type=text id="distanceDoorAttachmentbkt" palceholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>36</td>
	<td colspan=2>Distance from pull box to car line arch in TRC </td>
	<td colspan=2>164,164</td>
	<td><input type=text id="distancePullboxCarlinearch" palceholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
	<td>37</td>
	<td colspan=2>Cross braces height from roof flange in LBC,TRC,TRS,L2T</td>
	<td colspan=2>355</td>
	<td><input type=text id="heightCrossbraceRoofflange" palceholder="enter value" class='validate[required]' ></td>
	
</tr>

<tr>
	<td>38</td>
	<td colspan=2>Mounting angle for lower luggage rack bkt height from bottom of side wall(in LGS Without PRT)</td>
	<td colspan=2>1333</td>
	<td><input type=text id="mountingangleLowerluggagerackBottomsidewall" palceholder="enter value" class='validate[required]' ></td>
	
</tr>
<tr>
<td rowspan=6>39</td>
<th>Description</th>
<th colspan=2>Specified value</th>
<th colspan=3>Observed</th>
</tr>
<tr>
<th>Lower(LH)</th>
<th colspan=2><p>LWACCW - 307<br>LWACCN - 307<br>LWFAC - 307<br>LWFACC - 307</p></th>
<td colspan=3><input type="text" id="distanceBerthchannelVerticalchannelLowerLh" class='validate[custom[integer]]' placeholder="Lower LH"></td>
</tr>
<tr>
<th>Middle(LH)</th>
<th colspan=2><p>LWACCN - 1078</p></th>
<td colspan=3><input type="text" id="distanceBerthchannelVerticalchannelMiddleLh" class='validate[custom[integer]]' placeholder="Middle LH"></td>
</tr>
<tr>
<th>Upper(LH)</th>
<th colspan=2><p>LWACCW - 1377<br>LWACCN - 1744<br>LWFAC - 1340/1840<br>LWFACC - 1362,1768</p></th>
<td colspan=3><input type="text" id="distanceBerthchannelVerticalchannelUpperLh" class='validate[custom[integer]]' placeholder="Upper LH"></td>
</tr>
<tr>
<th>Lower(RH)</th>
<th colspan=2><p>LWACCW - 307<br>LWACCN - 307<br>LWFAC - <br>LWAFACC - 307</p></th>
<td colspan=3><input type="text" id="distanceBerthchannelVerticalchannelLowerRh" class='validate[custom[integer]]' placeholder="Lower RH"></td>
</tr>
<tr>
<th>Upper(RH)</th>
<th colspan=2><p>LWACCW - 1362<br>LWACCN - 1372<br>LWFAC - <br>LWAFACC - 1362</p></th>
<td colspan=3><input type="text"  id="distanceBerthchannelVerticalchannelUpperRh" class='validate[custom[integer]]' placeholder="Upper LH"></td>
</tr>
</table>
<table>
<tr>
	<td>2.1 Fitment of cross braces as per drg.(L2T,L3T,TRC,TRS,LBC,LPC,LWFAC)</td>
	<td><input type=radio id="fitmentCrossBraces" name="shellAssemblyFitCrossdrg" value="OK" >OK <input type=radio id="fitmentCrossBraces name="shellAssemblyFitCrossdrg" value="NOT OK">NOT OK <input type=radio id="fitmentCrossBraces name="shellAssemblyFitCrossdrg" value="NA">NA</td>
</tr>
	<td>2.2 Fitment of stiffening plate both side</td>
	<td><input type=radio id="fitmentStiffeningPlate" name="shellAssemblyFitStiffPlate" value="OK" >OK <input type=radio id="fitmentStiffeningPlate" name="shellAssemblyFitStiffPlate" value="NOT OK" >NOT OK <input type=radio id="fitmentStiffeningPlate" name="shellAssemblyFitStiffPlate" value="NA" >NA</td>
<tr>
	<td>2.3Fitment of power panel frames as per drg</td>
	<td><input type=radio id="fitmentPowerPanelFrame" name="shellAssemblyFitPowerPanel" value="OK" >OK <input type=radio id="fitmentPowerPanelFrame" name="shellAssemblyFitPowerPanel" value="NOT OK" >NOT OK <input type=radio id="fitmentPowerPanelFrame" name="shellAssemblyFitPowerPanel"  value="NA">NA</td>
</tr>
	<td>2.4 Fitment  and welding of LL Partition frames as per drg</td>
	<td><input type=radio id="fitmentWeldingPartitionFrame" name="shellAssemblyFitWeldPart" value="OK" >OK <input type=radio id="fitmentWeldingPartitionFrame" name="shellAssemblyFitWeldPart" value="NOT OK" >NOT OK <input type=radio id="fitmentWeldingPartitionFrame" name="shellAssemblyFitWeldPart" value="NA"  >NA</td>
<tr>
	<td>2.5 Roof bkt for wire clamping </td>
	<td><input type=radio id="roofbktWireclamping" name="shellAssemblyRoofBktWire" value="Provided" >Provided <input type=radio id="roofbktWireclamping" name="shellAssemblyRoofBktWire" value="NOT Provided" >NOT Provided </td>
</tr>
<tr>
	<td>3.1 Details of modifiaction carried out</td>
	<td><input type=text id="detailsModification" name="shellAssemblyStage4DtlOfModf"></td>
</tr>
<tr>
	<td>3.2 Details of trial items fitted(if any)</td>
	<td><input type=text id="detailsTrialItem" name="shellAssemblyStage4DtlTrialItem"></td>
</tr>
<tr>
	<td>3.3 Remarks(if any)</td>
	<td><input type=text id="remarks4" name="shellAssemblyStage4Rmk"></td>
</tr>

</table>
<p align=center><input type= radio id="stage4TestingStatus" name="stage4remarks" value="Conforming" >Conforming<input type=radio id="stage4TestingStatus" name="stage4remarks" value="Non Conforming" >Non Conforming</p>
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
	    $('#stage1SipDate').datepicker({
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
		$('#stage2SipDate').datepicker({
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
		$('#stage3SipDate').datepicker({
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
             // stage-1 sip toolbar 
                   {
                	   
                	   icon: '<%=contextpath%>/images/rs_out.png',
                       text: 'Shell Assembly Stage-1',
                       click: function () {
                       	
                       	
                       	
                       	 var $selectedRows = $('#ShellProductionTableContainer').jtable('selectedRows');
                   	 	 if ($selectedRows.length<1)
                   		 alert("Please select a row for which you want enter Stahe-I inspection");
                   	 	 else{
                   	 		var record;
                   	 		$selectedRows.each(function () {
                                   record = $(this).data('record');
                                   });
								//setting min value
							$.ajax({
								url:"showExistingShellStage",  //action-name as defined in struts.xml
								dataType:'json',
								type:'POST',
								async:false,
								data:{
								shellAssetId:record.shellAssetId,	
								},
								success:function(data)
								{
									$('#date').val(data.dateStage1);
									$('#stage1SipDocNo').val(data.docNoStage1);
									$('#shellNumber').val(data.shellNo);
									$('#shellType').val(data.shellType);
									$('#shellAssembledBy').val(data.shellAssembledBy);
									$('#jigNo').val(data.jigNo);
									$('#underframeCompleteMake').val(data.underframeCompleteMake);
									$('#roofMake').val(data.roofMake);
									$('#endwallMakePp').val(data.endwallMakePp);
									$('#sideWallMakeNoPp').val(data.sidewallMakeLh);
									$('#endwallMakeNpp').val(data.endwallMakeNpp);
									$('#sideWallMakeNoNpp').val(data.sidewallMakeRh);
								}
									
								});
								//end of code
							
								if(record.stage1SipFlag==1)
								{
									var cfm=confirm("Data for Stage-I Inspection is already updated. Do you want to verify data?");
		                          	if(cfm==false){return false;}		
								
								$.ajax({
									url:"showSaveDataShellStage1", //action-name as defined in struts.xml
									dataType:'json',
									type:'POST',
									async:false,
									data:{
									shellAssetId:record.shellAssetId,	
									},
									
									success:function(data)
									{
										//$('#shellType').val(data.shellTran.shellType);
							
										$('#stage1SipShift').val(data.shellStage1SipTran.stage1SipShift);
									    $('#stage1WorkBy').val(data.shellStage1SipTran.stage1WorkBy);
									    var stage1Date=(data.shellStage1SipTran.stage1SipDate).substring(0,10);
										 var stage1DateArray=stage1Date.split("-");
										$('#stage1SipDate').datepicker("setDate",new Date(stage1DateArray[0],stage1DateArray[1]-1,stage1DateArray[2])); 
										
										$('#stage1DrawingNo').val(data.shellStage1SipTran.stage1DrawingNo);
									    $('#stage1WiNo').val(data.shellStage1SipTran.stage1WiNo);
										$('#sideDoorMakeNoLeft').val(data.shellTran.sideDoorMakeNoLeft);
										$('#sideDoorMakeNoRight').val(data.shellTran.sideDoorMakeNoRight);
										$('#roofAcAssemblyMakeNoPp').val(data.shellTran.roofAcAssemblyMakeNoPp);
										$('#roofAcAssemblyMakeNoNpp').val(data.shellTran.roofAcAssemblyMakeNoNpp);
										$('#wtccMakeNoPp').val(data.shellTran.wtccMakeNoPp);
										$('#wtccMakeNoNpp').val(data.shellTran.wtccMakeNoNpp);
										$('#slidingDoorMakeNoLeft').val(data.shellTran.slidingDoorMakeNoLeft);
										$('#slidingDoorMakeNoRight').val(data.shellTran.slidingDoorMakeNoRight);
										$('[id="itemAsPerDrawingFlag"]').val([data.shellStage1SipTran.itemAsPerDrawingFlag]);
										$('[id="complianceWiFlag"]').val([data.shellStage1SipTran.complianceWiFlag]);
							         	$('[id="weldingThroatLengthFlag"]').val([data.shellStage1SipTran.weldingThroatLengthFlag]);
									    $('[id="levelingCenteringUnderframeFlag"]').val([data.shellStage1SipTran.levelingCenteringUnderframeFlag]);
								        $('#noOfLevelTrestle').val(data.shellStage1SipTran.noOfLevelTrestle);
								        $('[id="grindingCleaningSolebarFlag"]').val([data.shellStage1SipTran.grindingCleaningSolebarFlag]);
								        $('[id="weildablePrimerSolebarFlag"]').val([data.shellStage1SipTran.weildablePrimerSolebarFlag]);
								        $('#lengthOverBodyLh').val(data.shellStage1SipTran.lengthOverBodyLh);
										$('#lengthOverBodyRh').val(data.shellStage1SipTran.lengthOverBodyRh);
										$('#sidewallSheetLengthLh').val(data.shellSideWallSipTran.sidewallSheetLengthLh);
										$('#sidewallSheetLengthRh').val(data.shellSideWallSipTran.sidewallSheetLengthRh);
										$('#sidewallSheetWidth').val(data.shellSideWallSipTran.sidewallSheetWidth);
									   $('#sidewallHeightVerticalmemberRoofflange').val(data.shellSideWallSipTran.sidewallHeightVerticalmemberRoofflange);
										$('#shellWidthPp').val(data.shellStage1SipTran.shellWidthPp);
										$('#shellWidthNpp').val(data.shellStage1SipTran.shellWidthNpp);
										$('#shellWidthCenter').val(data.shellStage1SipTran.shellWidthCenter);
										$('#endwallWidthPp').val(data.shellEndwallSipTran.endwallWidthPp);
										$('#endwallWidthNpp').val(data.shellEndwallSipTran.endwallWidthNpp);
										$('#lateralWidthAcTroughPp').val(data.shellStage1SipTran.lateralWidthAcTroughPp);
										$('#lateralWidthAcTroughNpp').val(data.shellStage1SipTran.lateralWidthAcTroughNpp);
										$('#longitudinalWidthAcTroughPp').val(data.shellStage1SipTran.longitudinalWidthAcTroughPp);
										$('#longitudinalWidthAcTroughNpp').val(data.shellStage1SipTran.longitudinalWidthAcTroughNpp);
										$('#distanceVestibuleUchannelPp').val(data.shellEndwallSipTran.distanceVestibuleUchannelPp);
										$('#distanceVestibuleUchannelNpp').val(data.shellEndwallSipTran.distanceVestibuleUchannelNpp);
										$('#diagonalWidthEntranceDoor1').val(data.shellStage1SipTran.diagonalWidthEntranceDoor1);
										$('#diagonalWidthEntranceDoor2').val(data.shellStage1SipTran.diagonalWidthEntranceDoor2);
										$('#diagonalWidthEntranceDoor3').val(data.shellStage1SipTran.diagonalWidthEntranceDoor3);
										$('#diagonalWidthEntranceDoor4').val(data.shellStage1SipTran.diagonalWidthEntranceDoor4);
										$('#diagonalWidthEntranceDoor5').val(data.shellStage1SipTran.diagonalWidthEntranceDoor5);
										$('#diagonalWidthEntranceDoor6').val(data.shellStage1SipTran.diagonalWidthEntranceDoor6);
										$('#heightEntranceDoor1').val(data.shellStage1SipTran.heightEntranceDoor1);
										$('#heightEntranceDoor2').val(data.shellStage1SipTran.heightEntranceDoor2);
										$('#heightEntranceDoor3').val(data.shellStage1SipTran.heightEntranceDoor3);
										$('#heightEntranceDoor4').val(data.shellStage1SipTran.heightEntranceDoor4);
										$('#heightEntranceDoor5').val(data.shellStage1SipTran.heightEntranceDoor5);
										$('#heightEntranceDoor6').val(data.shellStage1SipTran.heightEntranceDoor6);
										$('#widthEntranceDoor1').val(data.shellStage1SipTran.widthEntranceDoor1);
										$('#widthEntranceDoor2').val(data.shellStage1SipTran.widthEntranceDoor2);
										$('#widthEntranceDoor3').val(data.shellStage1SipTran.widthEntranceDoor3);
										$('#widthEntranceDoor4').val(data.shellStage1SipTran.widthEntranceDoor4);
										$('#widthEntranceDoor5').val(data.shellStage1SipTran.widthEntranceDoor5);
										$('#widthEntranceDoor6').val(data.shellStage1SipTran.widthEntranceDoor6);	
										$('#heightTopTroughfloorToRoofsheetBottomPp').val(data.shellStage1SipTran.heightTopTroughfloorToRoofsheetBottomPp);
										$('#heightTopTroughfloorToRoofsheetBottomNpp').val(data.shellStage1SipTran.heightTopTroughfloorToRoofsheetBottomNpp);
										$('#heightTopPillarsupportToBottomCrossbraceSingleside1').val(data.shellStage1SipTran.heightTopPillarsupportToBottomCrossbraceSingleside1);
										$('#heightTopPillarsupportToBottomCrossbraceCabinside1').val(data.shellStage1SipTran.heightTopPillarsupportToBottomCrossbraceCabinside1);
										$('#heightTopPillarsupportToBottomCrossbraceSingleside2').val(data.shellStage1SipTran.heightTopPillarsupportToBottomCrossbraceSingleside2);
										$('#heightTopPillarsupportToBottomCrossbraceCabinside2').val(data.shellStage1SipTran.heightTopPillarsupportToBottomCrossbraceCabinside2);
										$('#heightTopPillarsupportToBottomCrossbraceSingleside3').val(data.shellStage1SipTran.heightTopPillarsupportToBottomCrossbraceSingleside3);
										$('#heightTopPillarsupportToBottomCrossbraceCabinside3').val(data.shellStage1SipTran.heightTopPillarsupportToBottomCrossbraceCabinside3);
										$('#heightTopPillarsupportToBottomCrossbraceSingleside4').val(data.shellStage1SipTran.heightTopPillarsupportToBottomCrossbraceSingleside4);
										$('#heightTopPillarsupportToBottomCrossbraceCabinside4').val(data.shellStage1SipTran.heightTopPillarsupportToBottomCrossbraceCabinside4);
										$('#heightTopPillarsupportToBottomCrossbraceSingleside5').val(data.shellStage1SipTran.heightTopPillarsupportToBottomCrossbraceSingleside5);
										$('#heightTopPillarsupportToBottomCrossbraceCabinside5').val(data.shellStage1SipTran.heightTopPillarsupportToBottomCrossbraceCabinside5);
										$('#heightTopPillarsupportToBottomCrossbraceSingleside6').val(data.shellStage1SipTran.heightTopPillarsupportToBottomCrossbraceSingleside6);
										$('#heightTopPillarsupportToBottomCrossbraceCabinside6').val(data.shellStage1SipTran.heightTopPillarsupportToBottomCrossbraceCabinside6);
										$('#heightCrossbracePartitionpillerSingelside1').val(data.shellStage1SipTran.heightCrossbracePartitionpillerSingelside1);
										$('#heightCrossbracePartitionpillerCabinside1').val(data.shellStage1SipTran.heightCrossbracePartitionpillerCabinside1);
										$('#heightCrossbracePartitionpillerSingelside2').val(data.shellStage1SipTran.heightCrossbracePartitionpillerSingelside2);
										$('#heightCrossbracePartitionpillerCabinside2').val(data.shellStage1SipTran.heightCrossbracePartitionpillerCabinside2);
										$('#heightCrossbracePartitionpillerSingelside3').val(data.shellStage1SipTran.heightCrossbracePartitionpillerSingelside3);
										$('#heightCrossbracePartitionpillerCabinside3').val(data.shellStage1SipTran.heightCrossbracePartitionpillerCabinside3);
										$('#heightCrossbracePartitionpillerSingelside4').val(data.shellStage1SipTran.heightCrossbracePartitionpillerSingelside4);
										$('#heightCrossbracePartitionpillerCabinside4').val(data.shellStage1SipTran.heightCrossbracePartitionpillerCabinside4);
										$('#heightCrossbracePartitionpillerSingelside5').val(data.shellStage1SipTran.heightCrossbracePartitionpillerSingelside5);
										$('#heightCrossbracePartitionpillerCabinside5').val(data.shellStage1SipTran.heightCrossbracePartitionpillerCabinside5);
										$('#heightCrossbracePartitionpillerSingelside6').val(data.shellStage1SipTran.heightCrossbracePartitionpillerSingelside6);
										$('#heightCrossbracePartitionpillerCabinside6').val(data.shellStage1SipTran.heightCrossbracePartitionpillerCabinside6);
							            $('#heightVestibuleplateEndwallPp').val(data.shellEndwallSipTran.heightVestibuleplateEndwallPp);
							    		$('#heightVestibuleplateEndwallNpp').val(data.shellEndwallSipTran.heightVestibuleplateEndwallNpp);
							    		$('#heightWtccPp').val(data.shellStage1SipTran.heightWtccPp);
										$('#heightWtccNpp').val(data.shellStage1SipTran.heightWtccNpp);
										$('#widthWtccPp').val(data.shellStage1SipTran.widthWtccPp);
										$('#widthWtccNpp').val(data.shellStage1SipTran.widthWtccNpp);																						
										$('#heightTopThroughfloorBottomRoofArchPp').val(data.shellStage1SipTran.heightTopThroughfloorBottomRoofArchPp);
										$('#heightTopThroughfloorBottomRoofArchNpp').val(data.shellStage1SipTran.heightTopThroughfloorBottomRoofArchNpp);
										$('#heightFloorpillerbracketToRoofSingle1').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofSingle1);
										$('#heightFloorpillerbracketToRoofSingle7').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofSingle7);
										$('#heightFloorpillerbracketToRoofSingle2').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofSingle2);
										$('#heightFloorpillerbracketToRoofSingle8').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofSingle8);
										$('#heightFloorpillerbracketToRoofSingle3').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofSingle3);
										$('#heightFloorpillerbracketToRoofSingle9').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofSingle9);
										$('#heightFloorpillerbracketToRoofSingle4').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofSingle4);
										$('#heightFloorpillerbracketToRoofSingle10').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofSingle10);
										$('#heightFloorpillerbracketToRoofSingle5').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofSingle5);
										$('#heightFloorpillerbracketToRoofSingle11').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofSingle11);
										$('#heightFloorpillerbracketToRoofSingle6').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofSingle6);
										$('#heightFloorpillerbracketToRoofCabin1').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofCabin1);
										$('#heightFloorpillerbracketToRoofCabin7').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofCabin7);
										$('#heightFloorpillerbracketToRoofCabin2').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofCabin2);
										$('#heightFloorpillerbracketToRoofCabin8').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofCabin8);
										$('#heightFloorpillerbracketToRoofCabin3').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofCabin3);
										$('#heightFloorpillerbracketToRoofCabin9').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofCabin9);
										$('#heightFloorpillerbracketToRoofCabin4').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofCabin4);
										$('#heightFloorpillerbracketToRoofCabin10').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofCabin10);
										$('#heightFloorpillerbracketToRoofCabin5').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofCabin5);
										$('#heightFloorpillerbracketToRoofCabin11').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofCabin11);
										$('#heightFloorpillerbracketToRoofCabin6').val(data.shellStage1SipTran.heightFloorpillerbracketToRoofCabin6);
										$('#slidingDoorHeightLh').val(data.shellStage1SipTran.slidingDoorHeightLh);
										$('#slidingDoorHeightRh').val(data.shellStage1SipTran.slidingDoorHeightRh);
										$('#slidingDoorWidthLh').val(data.shellStage1SipTran.slidingDoorWidthLh);
										$('#slidingDoorWidthRh').val(data.shellStage1SipTran.slidingDoorWidthRh);
										$('#distanceRoofEndwallPp').val(data.shellStage1SipTran.distanceRoofEndwallPp);
										$('#distanceRoofEndwallNpp').val(data.shellStage1SipTran.distanceRoofEndwallNpp);
										$('#roofElementShellSocketHoleDiePp').val(data.shellStage1SipTran.roofElementShellSocketHoleDiePp);
										$('#roofElementShellSocketHoleDieNpp').val(data.shellStage1SipTran.roofElementShellSocketHoleDieNpp);
										$('#roofElementStudDiagonalPp').val(data.shellStage1SipTran.roofElementStudDiagonalPp);
										$('#roofElementStudDiagonalNpp').val(data.shellStage1SipTran.roofElementStudDiagonalNpp);
										$('#checkedDimenRemarks').val(data.shellStage1SipTran.checkedDimenRemarks);
										 $('[id="alignmentSidewallRoofarchFlag"]').val([data.shellStage1SipTran.alignmentSidewallRoofarchFlag]);
										 $('[id="weldingSidewallLavsidewallFlag"]').val([data.shellStage1SipTran.weldingSidewallLavsidewallFlag]);
										 $('[id="weldingRoofarchSidewallCarlineFlag"]').val([data.shellStage1SipTran.weldingRoofarchSidewallCarlineFlag]);
										 $('[id="weldingCompletedoorframeFlag"]').val([data.shellStage1SipTran.weldingCompletedoorframeFlag]);	
                                        $('[id="weldingCompleteendwallFinalroofelementFlag"]').val([data.shellStage1SipTran.weldingCompleteendwallFinalroofelementFlag]);
                                        $('[id="weldingRoofSidewallCarlineFlag"]').val([data.shellStage1SipTran.weldingRoofSidewallCarlineFlag]);
                                        $('[id="grindHorizontalVerticalJointFlag"]').val([data.shellStage1SipTran.grindHorizontalVerticalJointFlag]);
                                        $('[id="alignmentBothSidewallUnderframeFlag"]').val([data.shellStage1SipTran.alignmentBothSidewallUnderframeFlag]);
                                        $('#detailsOfModification').val(data.shellStage1SipTran.detailsOfModification);
										$('#detailsOfTrial').val(data.shellStage1SipTran.detailsOfTrial);
										$('#remarks').val(data.shellStage1SipTran.remarks);
										$('[id="stage1TestingStatus"]').val([data.shellStage1SipTran.stage1TestingStatus]);
										
									}
										
									});
								
								}
								
								
								
								$('#stage1SipDate').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
								
           					
                   	 	 	$("#shellAssemblyStage1Dialog").dialog({
                   	 	 		title : 'Exit for  '+record.shellTransactionId + 'from Stage- <%=stageID%>',    
                   	 	 		width:'80%',
                   	 	 		close: function (e, u) {
                   	 	 		$('form[name="shellAssemblyStage1"]')[0].reset();
             	 		          	$("#shellAssemblyStage1Dialog").validationEngine('hideAll');
          	 		          	//$('#shellAssemblyStage1Dialog').find('form[name="shellAssemblyStage1"]')[0].reset();
             	 		          },
               	 		 	
		 							buttons: {
	                                    Submit: {
	                                       text: "Submit",
	                                        id: "my-button-submit",
	                                        click:function () {
	                                    		
	                                    	
	                            	 		//alert("error");
	                                    	if ($('#stage1SipDocNo').validationEngine('validate')) {
				                                        	return false;
				                                  }
                                           if ($('#noOfLevelTrestle').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#lengthOverBodyLh').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#lengthOverBodyRh').validationEngine('validate')) {
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
	                                    	if ($('#shellWidthPp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#shellWidthNpp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#shellWidthCenter').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#endwallWidthPp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#endwallWidthNpp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#lateralWidthAcTroughPp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#lateralWidthAcTroughNpp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#longitudinalWidthAcTroughPp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#longitudinalWidthAcTroughNpp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#distanceVestibuleUchannelPp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#distanceVestibuleUchannelNpp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                   if ($('#diagonalWidthEntranceDoor1').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#diagonalWidthEntranceDoor2').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#diagonalWidthEntranceDoor3').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#diagonalWidthEntranceDoor4').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#diagonalWidthEntranceDoor5').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#diagonalWidthEntranceDoor6').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                   if ($('#heightEntranceDoor1').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightEntranceDoor2').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightEntranceDoor3').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightEntranceDoor4').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightEntranceDoor5').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightEntranceDoor6').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#widthEntranceDoor1').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#widthEntranceDoor2').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#widthEntranceDoor3').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#widthEntranceDoor4').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#widthEntranceDoor5').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#widthEntranceDoor6').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                   if ($('#heightTopTroughfloorToRoofsheetBottomPp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightTopTroughfloorToRoofsheetBottomNpp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightTopPillarsupportToBottomCrossbraceSingleside1').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightTopPillarsupportToBottomCrossbraceCabinside1').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightTopPillarsupportToBottomCrossbraceSingleside2').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightTopPillarsupportToBottomCrossbraceCabinside2').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightTopPillarsupportToBottomCrossbraceSingleside3').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightTopPillarsupportToBottomCrossbraceCabinside3').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightTopPillarsupportToBottomCrossbraceSingleside4').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightTopPillarsupportToBottomCrossbraceCabinside4').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightTopPillarsupportToBottomCrossbraceSingleside5').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightTopPillarsupportToBottomCrossbraceCabinside5').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightTopPillarsupportToBottomCrossbraceSingleside6').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightTopPillarsupportToBottomCrossbraceCabinside6').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                   if ($('#heightCrossbracePartitionpillerSingelside1').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightCrossbracePartitionpillerCabinside1').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightCrossbracePartitionpillerSingelside2').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightCrossbracePartitionpillerCabinside2').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightCrossbracePartitionpillerSingelside3').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightCrossbracePartitionpillerCabinside3').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightCrossbracePartitionpillerSingelside4').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightCrossbracePartitionpillerCabinside4').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightCrossbracePartitionpillerSingelside5').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightCrossbracePartitionpillerCabinside5').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightCrossbracePartitionpillerSingelside6').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightCrossbracePartitionpillerCabinside6').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                   if ($('#heightVestibuleplateEndwallPp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightVestibuleplateEndwallNpp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightWtccPp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightWtccNpp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#widthWtccPp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#widthWtccNpp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightTopThroughfloorBottomRoofArchPp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightTopThroughfloorBottomRoofArchNpp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofSingle1').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofSingle7').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofSingle2').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofSingle8').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofSingle3').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofSingle9').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofSingle4').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofSingle10').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofSingle5').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofSingle11').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofSingle6').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofCabin1').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofCabin7').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofCabin2').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofCabin8').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofCabin3').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofCabin9').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofCabin4').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofCabin10').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofCabin5').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofCabin11').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#heightFloorpillerbracketToRoofCabin6').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    if ($('#slidingDoorHeightLh').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#slidingDoorHeightRh').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#slidingDoorWidthLh').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#slidingDoorWidthRh').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#distanceRoofEndwallPp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#distanceRoofEndwallNpp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                    	if ($('#roofElementShellSocketHoleDiePp').validationEngine('validate')) {
	                                        	return false;
	                                  }
	                                   	if ($('#roofElementShellSocketHoleDieNpp').validationEngine('validate')) {
	                                    		return false;
	                                  }
	                                               	
	                                    	var c=confirm("Verify data before submit,submit data");
	                                    	if(c==false){return false;}
                                         //   if ($('#underFrameNumber').validationEngine('validate')) {
	                                        	
	                                       //     return false;
	                                      //  }
	                                    		    	   
	                                    	$.ajax({
	                                    		//saving of data    	   
		                    						url : "saveShellAssemblyStage1SIP",  //action-name as defined in struts.xml
		                    						dataType: 'json', 
		                    						data : {
		                    							shellAssetId: record.shellAssetId,                   							
		                    							
		                    							
		                    							stage1SipDocNo:$('#stage1SipDocNo').val(),              							
		                    							shellType:$('#shellType').val(),
		                    							shellNumber:$('#shellNumber').val(),
		                    							stage1SipShift: $('#stage1SipShift').val(),  
		                    							stage1WorkBy:$('#stage1WorkBy').val(),
		                    							stage1SipDate:$('#stage1SipDate').val(),
		                    							shellAssembledBy:$('#shellAssembledBy').val(),
		                    							jigNo:$('#jigNo').val(),
		                    							underframeCompleteMake: $('#underframeCompleteMake').val(),                   			
		                    							roofMake:$('#roofMake').val(),
		                    							endwallMakePp:$('#endwallMakePp').val(),
		                    							sideWallMakeNoPp:$('#sideWallMakeNoPp').val(),
		                    							endwallMakeNpp:$('#endwallMakeNpp').val(),
		                    							sideWallMakeNoNpp:$('#sideWallMakeNoNpp').val(),
		                    							stage1DrawingNo:$('#stage1DrawingNo').val(),
		                    							stage1WiNo:$('#stage1WiNo').val(),
		                    							sideDoorMakeNoLeft:$('#sideDoorMakeNoLeft').val(),
		                    							sideDoorMakeNoRight:$('#sideDoorMakeNoRight').val(),
		                    							roofAcAssemblyMakeNoPp:$('#roofAcAssemblyMakeNoPp').val(),
		                    							roofAcAssemblyMakeNoNpp:$('#roofAcAssemblyMakeNoNpp').val(),
		                    							wtccMakeNoPp:$('#wtccMakeNoPp').val(),
		                    							wtccMakeNoNpp:$('#wtccMakeNoNpp').val(),
		                    							slidingDoorMakeNoLeft:$('#slidingDoorMakeNoLeft').val(),
		                    							slidingDoorMakeNoRight:$('#slidingDoorMakeNoRight').val(),
		                    							itemAsPerDrawingFlag:$("input[id='itemAsPerDrawingFlag']:checked").val(),
		                    							complianceWiFlag:$("input[id='complianceWiFlag']:checked").val(),
		                    							weldingThroatLengthFlag:$("input[id='weldingThroatLengthFlag']:checked").val(),
		                    							levelingCenteringUnderframeFlag:$("input[id='levelingCenteringUnderframeFlag']:checked").val(),
		                    							noOfLevelTrestle:$('#noOfLevelTrestle').val(),
		                    							grindingCleaningSolebarFlag:$("input[id='grindingCleaningSolebarFlag']:checked").val(),
		                    							weildablePrimerSolebarFlag: $("input[id='weildablePrimerSolebarFlag']:checked").val(),                   							
		                    							lengthOverBodyLh:$('#lengthOverBodyLh').val(),
		                    							lengthOverBodyRh:$('#lengthOverBodyRh').val(),
		                    							sidewallSheetLengthLh:$('#sidewallSheetLengthLh').val(),
		                    							sidewallSheetLengthRh:$('#sidewallSheetLengthRh').val(),
		                    							sidewallSheetWidth:$('#sidewallSheetWidth').val(),
		                    							sidewallHeightVerticalmemberRoofflange:$('#sidewallHeightVerticalmemberRoofflange').val(),
		                    							shellWidthPp:$('#shellWidthPp').val(),
		                    							shellWidthNpp:$('#shellWidthNpp').val(),
		                    							shellWidthCenter:$('#shellWidthCenter').val(),
		                    							endwallWidthPp:$('#endwallWidthPp').val(),
		                    							endwallWidthNpp:$('#endwallWidthNpp').val(),
		                    							lateralWidthAcTroughPp:$('#lateralWidthAcTroughPp').val(),
		                    							lateralWidthAcTroughNpp:$('#lateralWidthAcTroughNpp').val(),
		                    							longitudinalWidthAcTroughPp:$('#longitudinalWidthAcTroughPp').val(),
		                    							longitudinalWidthAcTroughNpp:$('#longitudinalWidthAcTroughNpp').val(),
		                    							distanceVestibuleUchannelPp:$('#distanceVestibuleUchannelPp').val(),
		                    							distanceVestibuleUchannelNpp:$('#distanceVestibuleUchannelNpp').val(),  							
		                    							diagonalWidthEntranceDoor1:$('#diagonalWidthEntranceDoor1').val(),
		                    							diagonalWidthEntranceDoor2:$('#diagonalWidthEntranceDoor2').val(),
		                    							diagonalWidthEntranceDoor3:$('#diagonalWidthEntranceDoor3').val(),
		                    							diagonalWidthEntranceDoor4:$('#diagonalWidthEntranceDoor4').val(),
		                    							diagonalWidthEntranceDoor5:$('#diagonalWidthEntranceDoor5').val(),
		                    							diagonalWidthEntranceDoor6:$('#diagonalWidthEntranceDoor6').val(),
		                    							heightEntranceDoor1:$('#heightEntranceDoor1').val(),
		                    							heightEntranceDoor2:$('#heightEntranceDoor2').val(),
		                    							heightEntranceDoor3:$('#heightEntranceDoor3').val(),
		                    							heightEntranceDoor4:$('#heightEntranceDoor4').val(),
		                    							heightEntranceDoor5:$('#heightEntranceDoor5').val(),
		                    							heightEntranceDoor6:$('#heightEntranceDoor6').val(),
		                    							widthEntranceDoor1:$('#widthEntranceDoor1').val(),
		                    							widthEntranceDoor2:$('#widthEntranceDoor2').val(),
		                    							widthEntranceDoor3:$('#widthEntranceDoor3').val(),
		                    							widthEntranceDoor4:$('#widthEntranceDoor4').val(),
		                    							widthEntranceDoor5:$('#widthEntranceDoor5').val(),
		                    							widthEntranceDoor6:$('#widthEntranceDoor6').val(),
		                    							heightTopTroughfloorToRoofsheetBottomPp:$('#heightTopTroughfloorToRoofsheetBottomPp').val(),
		                    							heightTopTroughfloorToRoofsheetBottomNpp:$('#heightTopTroughfloorToRoofsheetBottomNpp').val(),
		                    							heightTopPillarsupportToBottomCrossbraceSingleside1:$('#heightTopPillarsupportToBottomCrossbraceSingleside1').val(),
		                    						    //fittmentLstiffener:$("input[id='fittmentLstiffener']:checked").val(),
		                    							heightTopPillarsupportToBottomCrossbraceCabinside1:$('#heightTopPillarsupportToBottomCrossbraceCabinside1').val(),
		                    							heightTopPillarsupportToBottomCrossbraceSingleside2:$('#heightTopPillarsupportToBottomCrossbraceSingleside2').val(),
		                    							heightTopPillarsupportToBottomCrossbraceCabinside2:$('#heightTopPillarsupportToBottomCrossbraceCabinside2').val(),
		                    							heightTopPillarsupportToBottomCrossbraceSingleside3:$('#heightTopPillarsupportToBottomCrossbraceSingleside3').val(),
		                    							heightTopPillarsupportToBottomCrossbraceCabinside3:$('#heightTopPillarsupportToBottomCrossbraceCabinside3').val(),
		                    							heightTopPillarsupportToBottomCrossbraceSingleside4:$('#heightTopPillarsupportToBottomCrossbraceSingleside4').val(),
		                    							heightTopPillarsupportToBottomCrossbraceCabinside4:$('#heightTopPillarsupportToBottomCrossbraceCabinside4').val(),
		                    							heightTopPillarsupportToBottomCrossbraceSingleside5:$('#heightTopPillarsupportToBottomCrossbraceSingleside5').val(),
		                    							heightTopPillarsupportToBottomCrossbraceCabinside5:$('#heightTopPillarsupportToBottomCrossbraceCabinside5').val(),
		                    							heightTopPillarsupportToBottomCrossbraceSingleside6:$('#heightTopPillarsupportToBottomCrossbraceSingleside6').val(),
		                    							heightTopPillarsupportToBottomCrossbraceCabinside6:$('#heightTopPillarsupportToBottomCrossbraceCabinside6').val(),
		                    							heightCrossbracePartitionpillerSingelside1:$('#heightCrossbracePartitionpillerSingelside1').val(),
		                    							heightCrossbracePartitionpillerCabinside1:$('#heightCrossbracePartitionpillerCabinside1').val(),
		                    							heightCrossbracePartitionpillerSingelside2:$('#heightCrossbracePartitionpillerSingelside2').val(),
		                    							heightCrossbracePartitionpillerCabinside2:$('#heightCrossbracePartitionpillerCabinside2').val(),
		                    							heightCrossbracePartitionpillerSingelside3:$('#heightCrossbracePartitionpillerSingelside3').val(),
		                    							heightCrossbracePartitionpillerCabinside3:$('#heightCrossbracePartitionpillerCabinside3').val(),
		                    							heightCrossbracePartitionpillerSingelside4:$('#heightCrossbracePartitionpillerSingelside4').val(),
		                    							heightCrossbracePartitionpillerCabinside4:$('#heightCrossbracePartitionpillerCabinside4').val(),
		                    							heightCrossbracePartitionpillerSingelside5:$('#heightCrossbracePartitionpillerSingelside5').val(),
		                    							heightCrossbracePartitionpillerCabinside5:$('#heightCrossbracePartitionpillerCabinside5').val(),
		                    							heightCrossbracePartitionpillerSingelside6:$('#heightCrossbracePartitionpillerSingelside6').val(),
		                    							heightCrossbracePartitionpillerCabinside6:$('#heightCrossbracePartitionpillerCabinside6').val(),
		                    							heightVestibuleplateEndwallPp:$('#heightVestibuleplateEndwallPp').val(),
		                    							heightVestibuleplateEndwallNpp:$('#heightVestibuleplateEndwallNpp').val(),
		                    							heightWtccPp:$('#heightWtccPp').val(),
		                    							heightWtccNpp:$('#heightWtccNpp').val(),
		                    							widthWtccPp:$('#widthWtccPp').val(),
		                    							widthWtccNpp:$('#widthWtccNpp').val(),
		                    							heightTopThroughfloorBottomRoofArchPp:$('#heightTopThroughfloorBottomRoofArchPp').val(),
		                    							heightTopThroughfloorBottomRoofArchNpp:$('#heightTopThroughfloorBottomRoofArchNpp').val(),
		                    							heightFloorpillerbracketToRoofSingle1:$('#heightFloorpillerbracketToRoofSingle1').val(),
		                    							heightFloorpillerbracketToRoofSingle7:$('#heightFloorpillerbracketToRoofSingle7').val(),
		                    							heightFloorpillerbracketToRoofSingle2:$('#heightFloorpillerbracketToRoofSingle2').val(),
		                    							heightFloorpillerbracketToRoofSingle8:$('#heightFloorpillerbracketToRoofSingle8').val(),
		                    							heightFloorpillerbracketToRoofSingle3:$('#heightFloorpillerbracketToRoofSingle3').val(),
		                    							heightFloorpillerbracketToRoofSingle9:$('#heightFloorpillerbracketToRoofSingle9').val(),
		                    							heightFloorpillerbracketToRoofSingle4:$('#heightFloorpillerbracketToRoofSingle4').val(),
		                    							heightFloorpillerbracketToRoofSingle10:$('#heightFloorpillerbracketToRoofSingle10').val(),
		                    							heightFloorpillerbracketToRoofSingle5:$('#heightFloorpillerbracketToRoofSingle5').val(),
		                    							heightFloorpillerbracketToRoofSingle11:$('#heightFloorpillerbracketToRoofSingle11').val(),
		                    							heightFloorpillerbracketToRoofSingle6:$('#heightFloorpillerbracketToRoofSingle6').val(),
		                    							heightFloorpillerbracketToRoofCabin1:$('#heightFloorpillerbracketToRoofCabin1').val(),
		                    							heightFloorpillerbracketToRoofCabin7:$('#heightFloorpillerbracketToRoofCabin7').val(),
		                    							heightFloorpillerbracketToRoofCabin2:$('#heightFloorpillerbracketToRoofCabin2').val(),
		                    							heightFloorpillerbracketToRoofCabin8:$('#heightFloorpillerbracketToRoofCabin8').val(),
		                    							heightFloorpillerbracketToRoofCabin3:$('#heightFloorpillerbracketToRoofCabin3').val(),
		                    							heightFloorpillerbracketToRoofCabin9:$('#heightFloorpillerbracketToRoofCabin9').val(),
		                    							heightFloorpillerbracketToRoofCabin4:$('#heightFloorpillerbracketToRoofCabin4').val(),
		                    							heightFloorpillerbracketToRoofCabin10:$('#heightFloorpillerbracketToRoofCabin10').val(),
		                    							heightFloorpillerbracketToRoofCabin5:$('#heightFloorpillerbracketToRoofCabin5').val(),
		                    							heightFloorpillerbracketToRoofCabin11:$('#heightFloorpillerbracketToRoofCabin11').val(),
		                    							heightFloorpillerbracketToRoofCabin6:$('#heightFloorpillerbracketToRoofCabin6').val(),
		                    							slidingDoorHeightLh:$('#slidingDoorHeightLh').val(),
		                    							slidingDoorHeightRh:$('#slidingDoorHeightRh').val(),
		                    							slidingDoorWidthLh:$('#slidingDoorWidthLh').val(),
		                    							slidingDoorWidthRh:$('#slidingDoorWidthRh').val(),
		                    							distanceRoofEndwallPp:$('#distanceRoofEndwallPp').val(),
		                    							distanceRoofEndwallNpp:$('#distanceRoofEndwallNpp').val(),
		                    							roofElementShellSocketHoleDiePp:$('#roofElementShellSocketHoleDiePp').val(),
		                    							roofElementShellSocketHoleDieNpp:$('#roofElementShellSocketHoleDieNpp').val(),
		                    							roofElementStudDiagonalPp:$('#roofElementStudDiagonalPp').val(),
		                    							roofElementStudDiagonalNpp:$('#roofElementStudDiagonalNpp').val(),
		                    							checkedDimenRemarks:$('#checkedDimenRemarks').val(),
		                    							alignmentSidewallRoofarchFlag:$("input[id='alignmentSidewallRoofarchFlag']:checked").val(),              							
		                    							weldingSidewallLavsidewallFlag:$("input[id='weldingSidewallLavsidewallFlag']:checked").val(),              							
		                    							weldingRoofarchSidewallCarlineFlag:$("input[id='weldingRoofarchSidewallCarlineFlag']:checked").val(),              							
		                    							weldingCompletedoorframeFlag:$("input[id='weldingCompletedoorframeFlag']:checked").val(),              							
		                    							weldingCompleteendwallFinalroofelementFlag:$("input[id='weldingCompleteendwallFinalroofelementFlag']:checked").val(),              							
		                    							weldingRoofSidewallCarlineFlag:$("input[id='weldingRoofSidewallCarlineFlag']:checked").val(),              							
		                    							grindHorizontalVerticalJointFlag:$("input[id='grindHorizontalVerticalJointFlag']:checked").val(),              							
		                    							alignmentBothSidewallUnderframeFlag:$("input[id='alignmentBothSidewallUnderframeFlag']:checked").val(),              							
		                    							detailsOfModification:$('#detailsOfModification').val(),
		                    							detailsOfTrial:$('#detailsOfTrial').val(),
		                    							remarks:$('#remarks').val(),
		                    							stage1TestingStatus:$("input[id='stage1TestingStatus']:checked").val(),
		                    						},
		                    						
		                    						   
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							$('#shellAssetId').val(''), 
	                    							$('#stage1SipDocNo').val(''),
	                    							$('#shellType').val('');
	                    							$('#shellNumber').val('');
	                    							$('#stage1SipShift').val('');
	                    							$('#stage1WorkBy').val(''),
	                    						    $('#stage1SipDate').val(''),
	                    						    $('#shellAssembledBy').val(''),
	                    							$('#jigNo').val(''),
	                    							$('#underframeCompleteMake').val(''),
	                    							$('#roofMake').val('');
	                    							$('#endwallMakePp').val('');
	                    							$('#sideWallMakeNoPp').val(''),
	                    						    $('#endwallMakeNpp').val(''),
	                    						    $('#sideWallMakeNoNpp').val(''),
	                    							$('#stage1DrawingNo').val(''),
	                    							$('#stage1WiNo').val('');
	                    							$('#sideDoorMakeNoLeft').val('');
	                    							$('#sideDoorMakeNoRight').val(''),
	                    						    $('#roofAcAssemblyMakeNoPp').val(''),
	                    							$('#roofAcAssemblyMakeNoNpp').val(''),
	                    							$('#wtccMakeNoPp').val(''),
	                    							$('#wtccMakeNoNpp').val('');
	                    							$('#slidingDoorMakeNoLeft').val('');
	                    							$('#slidingDoorMakeNoRight').val(''),
	                    						    $('#itemAsPerDrawingFlag').val(''),
	                    							$('#complianceWiFlag').val(''),
	                    							$('#weldingThroatLengthFlag').val(''),
	                    							$('#levelingCenteringUnderframeFlag').val('');
	                    							$('#noOfLevelTrestle').val('');
	                    							$('#grindingCleaningSolebarFlag').val(''),
	                    						    $('#weildablePrimerSolebarFlag').val(''),
	                    						    $('#lengthOverBodyLh').val(''),
	                    							$('#lengthOverBodyRh').val(''),
	                    							$('#sidewallSheetLengthLh').val('');
	                    							$('#sidewallSheetLengthRh').val('');
	                    							$('#sidewallSheetWidth').val(''),
	                    						    $('#sidewallHeightVerticalmemberRoofflange').val(''),
	                    							$('#shellWidthPp').val(''),
	                    							$('#shellWidthNpp').val(''),
	                    							$('#shellWidthCenter').val('');
	                    							$('#endwallWidthPp').val('');
	                    							$('#endwallWidthNpp').val(''),
	                    						    $('#lateralWidthAcTroughPp').val(''),
	                    							$('#lateralWidthAcTroughNpp').val(''),
	                    							$('#longitudinalWidthAcTroughPp').val(''),
	                    							$('#longitudinalWidthAcTroughNpp').val('');
	                    							$('#distanceVestibuleUchannelPp').val('');
	                    							$('#distanceVestibuleUchannelNpp').val(''),
	                    							$('#diagonalWidthEntranceDoor1').val(''),
	                    							$('#diagonalWidthEntranceDoor2').val(''),
	                    							$('#diagonalWidthEntranceDoor3').val(''),
	                    							$('#diagonalWidthEntranceDoor4').val('');
	                    							$('#diagonalWidthEntranceDoor5').val('');
	                    							$('#diagonalWidthEntranceDoor6').val(''),
	                    						    $('#heightEntranceDoor1').val(''),
	                    							$('#heightEntranceDoor2').val(''),
	                    							$('#heightEntranceDoor3').val(''),
	                    							$('#heightEntranceDoor4').val('');
	                    							$('#heightEntranceDoor5').val('');
	                    							$('#heightEntranceDoor6').val(''),
	                    							$('#widthEntranceDoor1').val(''),
	                    							$('#widthEntranceDoor2').val(''),
	                    							$('#widthEntranceDoor3').val(''),
	                    							$('#widthEntranceDoor4').val('');
	                    							$('#widthEntranceDoor5').val('');
	                    							$('#widthEntranceDoor6').val(''),
	                    						    $('#heightTopTroughfloorToRoofsheetBottomPp').val(''),
	                    							$('#heightTopTroughfloorToRoofsheetBottomNpp').val(''),
	                    							$('#heightTopPillarsupportToBottomCrossbraceSingleside1').val(''),
	                    							$('#heightTopPillarsupportToBottomCrossbraceCabinside1').val('');
	                    							$('#heightTopPillarsupportToBottomCrossbraceSingleside2').val('');
	                    							$('#heightTopPillarsupportToBottomCrossbraceCabinside2').val(''),
	                    						    $('#heightTopPillarsupportToBottomCrossbraceSingleside3').val(''),
	                    						    $('#heightTopPillarsupportToBottomCrossbraceCabinside3').val(''),
	                    							$('#heightTopPillarsupportToBottomCrossbraceSingleside4').val(''),
	                    							$('#heightTopPillarsupportToBottomCrossbraceCabinside4').val('');
	                    							$('#heightTopPillarsupportToBottomCrossbraceSingleside5').val('');
	                    							$('#heightTopPillarsupportToBottomCrossbraceCabinside5').val(''),
	                    						    $('#heightTopPillarsupportToBottomCrossbraceSingleside6').val(''),
	                    							$('#heightTopPillarsupportToBottomCrossbraceCabinside6').val(''),
	                    							$('#heightCrossbracePartitionpillerSingelside1').val(''),
	                    							$('#heightCrossbracePartitionpillerCabinside1').val('');
	                    							$('#heightCrossbracePartitionpillerSingelside2').val('');
	                    							$('#heightCrossbracePartitionpillerCabinside2').val(''),
	                    						    $('#heightCrossbracePartitionpillerSingelside3').val(''),
	                    							$('#heightCrossbracePartitionpillerCabinside3').val(''),
	                    							$('#heightCrossbracePartitionpillerSingelside4').val(''),
	                    							$('#heightCrossbracePartitionpillerCabinside4').val('');
	                    							$('#heightCrossbracePartitionpillerSingelside5').val('');
	                    							$('#heightCrossbracePartitionpillerCabinside5').val(''),
	                    						    $('#heightCrossbracePartitionpillerSingelside6').val(''),
	                    							$('#heightCrossbracePartitionpillerCabinside6').val(''),
	                    							$('#heightVestibuleplateEndwallPp').val(''),
	                    							$('#heightVestibuleplateEndwallNpp').val('');
	                    							$('#heightWtccPp').val('');
	                    							$('#heightWtccNpp').val(''),
	                    						    $('#widthWtccPp').val(''),
	                    							$('#widthWtccNpp').val(''),
	                    							$('#heightTopThroughfloorBottomRoofArchPp').val(''),
	                    							$('#heightTopThroughfloorBottomRoofArchNpp').val('');
	                    							$('#heightFloorpillerbracketToRoofSingle1').val('');
	                    							$('#heightFloorpillerbracketToRoofSingle7').val(''),
	                    						    $('#heightFloorpillerbracketToRoofSingle2').val(''),
	                    							$('#heightFloorpillerbracketToRoofSingle8').val(''),
	                    							$('#heightFloorpillerbracketToRoofSingle3').val(''),
	                    				            $('#heightFloorpillerbracketToRoofSingle9').val('');
	                    							$('#heightFloorpillerbracketToRoofSingle4').val('');
	                    							$('#heightFloorpillerbracketToRoofSingle10').val(''),
	                    						    $('#heightFloorpillerbracketToRoofSingle5').val(''),
	                    							$('#heightFloorpillerbracketToRoofSingle11').val(''),
	                    							$('#heightFloorpillerbracketToRoofSingle6').val(''),
	                    							$('#heightFloorpillerbracketToRoofCabin1').val('');
	                    							$('#heightFloorpillerbracketToRoofCabin7').val('');
	                    							$('#heightFloorpillerbracketToRoofCabin2').val(''),
	                    						    $('#heightFloorpillerbracketToRoofCabin8').val(''),
	                    							$('#heightFloorpillerbracketToRoofCabin3').val(''),
	                    							$('#heightFloorpillerbracketToRoofCabin9').val(''),
	                    							$('#heightFloorpillerbracketToRoofCabin4').val('');
	                    							$('#heightFloorpillerbracketToRoofCabin10').val('');
	                    							$('#heightFloorpillerbracketToRoofCabin5').val(''),
	                    						    $('#heightFloorpillerbracketToRoofCabin11').val(''),
	                    							$('#heightFloorpillerbracketToRoofCabin6').val(''),
	                    							$('#slidingDoorHeightLh').val(''),
	                    							$('#slidingDoorHeightRh').val('');
	                    							$('#slidingDoorWidthLh').val('');
	                    							$('#slidingDoorWidthRh').val(''),
	                    						    $('#distanceRoofEndwallPp').val(''),
	                    							$('#distanceRoofEndwallNpp').val(''),
	                    							$('#roofElementShellSocketHoleDiePp').val(''),
	                    							$('#roofElementShellSocketHoleDieNpp').val('');
	                    							$('#roofElementStudDiagonalPp').val('');
	                    							$('#roofElementStudDiagonalNpp').val(''),
	                    						    $('#checkedDimenRemarks').val(''),
	                    							$('#alignmentSidewallRoofarchFlag').val(''),
	                    							
	                    							$('#weldingSidewallLavsidewallFlag').val(''),
	                    							$('#weldingRoofarchSidewallCarlineFlag').val('');
	                    							$('#weldingCompletedoorframeFlag').val('');
	                    							$('#weldingCompleteendwallFinalroofelementFlag').val(''),
	                    						    $('#weldingRoofSidewallCarlineFlag').val(''),
	                    							$('#grindHorizontalVerticalJointFlag').val(''),
	                    							$('#alignmentBothSidewallUnderframeFlag').val(''),
	                    							$('#detailsOfModification').val('');
	                    							$('#detailsOfTrial').val('');
	                    							$('#remarks').val(''),
	                    						    $('#stage1TestingStatus').val('');
		                    							
	                    							$('#shellAssemblyStage1Dialog').dialog('close');
	                    							$('form[name="shellAssemblyStage1"]')[0].reset();
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
				                        	$('form[name="shellAssemblyStage1"]')[0].reset();
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
                        text: 'Stage2',
                        click: function () {
                        	 var $selectedRows = $('#ShellProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you want to Inspect");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
                    	 		
                    	 		
                    	 		//show pre existing data
                    	 		$.ajax({
    								url:"showExistingShellStage", //action-name as defined in struts.xml
    								dataType:'json',
    								type:'POST',
    								async:false,
    								data:{
    								shellAssetId:record.shellAssetId,	
    								},
    								success:function(data)
    								{
    									$('#stage2SipDocNo').val(data.stage2DocNo);
    									$('#stage2SipShift').val(data.stage2Shift);
    									$('#stage2ShellNo').val(data.shellNo);
    									$('#stage2ShellType').val(data.shellType);
    									$('#stage2SideWallMakeLH').val(data.sidewallMakeLh);
										$('#stage2SideWallMakeRH').val(data.sidewallMakeRh);
    								}
    									
    								});
                    	 		
                    	 		
                    	 		if(record.stage2SipFlag==1)
								{
								
								$.ajax({
									url:"showSaveDataStage2", //action-name as defined in struts.xml
									dataType:'json',
									type:'POST',
									async:false,
									data:{
									shellAssetId:record.shellAssetId,	
									},
									success:function(data)
									{
										
										
										var stage2Date=(data.shellStage2.stage2SipDate).substring(0,10);
										var stage2DateArray=stage2Date.split("-");
										//var sideWallD= new Date(sideWallDateArray[0],sideWallDateArray[1]-1,sideWallDateArray[2]);
										$('#stage2SipDate').datepicker("setDate", new Date(stage2DateArray[0],stage2DateArray[1]-1,stage2DateArray[2]));
										$('#stage2WorkBy').val(data.shellStage2.stage2WorkBy);
										$('#stage2DrawingNo').val(data.shellStage2.stage2DrawingNo);
										$('#stage2WiNo').val(data.shellStage2.stage2WiNo);
										$('[id="itemFittedAsDrawingFlag"]').val([data.shellStage2.itemFittedAsDrawingFlag]);
										$('[id="complianceWiFlag"]').val([data.shellStage2.complianceWiFlag]);
										$('[id="weldingThroatLengthFlag"]').val([data.shellStage2.weldingThroatLengthFlag]);
										$('[id="weldingEndwallFlag"]').val([data.shellStage2.weldingEndwallFlag]);
										$('[id="weldingSidewallSolebarFlag"]').val([data.shellStage2.weldingSidewallSolebarFlag]);
										$('[id="insideOutsideGrindingFlag"]').val([data.shellStage2.insideOutsideGrindingFlag]);
										$('[id="grindSpotweldingSidewallFlag"]').val([data.shellStage2.grindSpotweldingSidewallFlag]);
										$('[id="fitWeldPartitionframeFlag"]').val([data.shellStage2.fitWeldPartitionframeFlag]);
										$('[id="stage2TestingStatus"]').val([data.shellStage2.stage2TestingStatus]);
										$('#detailsOfModification').val(data.shellStage2.detailsOfModification);
										$('#detailsOfTrial').val(data.shellStage2.detailsOfTrial);
										$('#remarks').val(data.shellStage2.remarks);

										//retriving from shell trans
										$('#stage2JigNo').val(data.shellTran.jigNo);
										$('#stage2ShellAssemblyBy').val(data.shellTran.shellAssembledBy);
										$('#stage2UnderframeMake').val(data.shellTran.underframeCompleteMake);
										$('#stage2RoofMake').val(data.shellTran.roofMake);
										$('#stage2EndWallMakePP').val(data.shellTran.endwallMakePp);
										$('#stage2EndWallMakeNPP').val(data.shellTran.endwallMakeNpp);
										//retriving from sidewall
										
										
																			
									}
										
									});
								}

								//setting min value
								
								$('#stage2SipDate').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
								
            					
                    	 	 	$("#Stage2").dialog({
                    	 	 		title : 'Shell Assembly Stage-2'+record.shellTransactionId + 'from Stage- <%=stageID%>', 
                    	 	 		width:'80%',
                    	 	 		close: function (e, u) {
                    	 	 			$('#Stage2').find('form[name="shellsipStage2"]')[0].reset();
              	 		          	$("#Stage2").validationEngine('hideAll');
              	 		          },
                	 		 	
 		 							buttons: {
	                                    Submit: {
	                                       text: "Submit",
	                                        id: "my-button-submit",
	                                        click:function () {
	                                    		
	                                    	
	                            	 		
	                                    	 if ($('#stage2SipDocNo').validationEngine('validate')) {
				                                        	//alert(!$("#dialog").validationEngine('validate'));
				                                            return false;
				                                        }
                                              if ($('#stage2SipShift').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
  	                                        
	                                    	if ($('#stage2WorkBy').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
	                                    	
											if ($('#stage2SipDate').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											
	                                    	var c=confirm("Do you want submit the SIP Form");
	                                    	if(c==false){return false;}
                                          //   if ($('#underFrameNumber').validationEngine('validate')) {
	                                        	
	                                       //     return false;
	                                      //  }
	                                    		    	   
	                                    	$.ajax({
	                    						url : "saveStage2",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						data : {
	                    							shellAssetId: record.shellAssetId,
	                    							stageId: '<%=stageID%>',
	                    							stage2SipDocNo:$('#stage2SipDocNo').val(),                   							
	                    						    stage2SipShift:$('#stage2SipShift').val(),              							
	                    							stage2WorkBy:$('#stage2WorkBy').val(),
	                    							stage2ShellType:$('#stage2ShellType').val(),
	                    							stage2ShellNo:$('#stage2ShellNo').val(),
	                    							stage2SipDate:$('#stage2SipDate').val(),
	                    							stage2JigNo:$('#stage2JigNo').val(),
	                    							stage2ShellAssemblyBy:$('#stage2ShellAssemblyBy').val(),
	                    							stage2UnderframeMake:$('#stage2UnderframeMake').val(),
	                    							stage2RoofMake:$('#stage2RoofMake').val(),
	                    							stage2EndWallMakePP:$('#stage2EndWallMakePP').val(),
	                    							stage2SideWallMakeLH:$('#stage2SideWallMakeLH').val(),
	                    							stage2EndWallMakeNPP:$('#stage2EndWallMakeNPP').val(),
	                    							stage2SideWallMakeRH:$('#stage2SideWallMakeRH').val(),
	                    							stage2DrawingNo:$('#stage2DrawingNo').val(),
	                    							stage2WiNo:$('#stage2WiNo').val(),
	                    							itemFittedAsDrawingFlag:$("input[id='itemFittedAsDrawingFlag']:checked").val(),
	                    							complianceWiFlag:$("input[id='complianceWiFlag']:checked").val(),
	                    							weldingThroatLengthFlag:$("input[id='weldingThroatLengthFlag']:checked").val(),
	                    							weldingEndwallFlag:$("input[id='weldingEndwallFlag']:checked").val(),
	                    							weldingSidewallSolebarFlag:$("input[id='weldingSidewallSolebarFlag']:checked").val(),
	                    							insideOutsideGrindingFlag:$("input[id='insideOutsideGrindingFlag']:checked").val(),
	                    							grindSpotweldingSidewallFlag:$("input[id='grindSpotweldingSidewallFlag']:checked").val(),
	                    							fitWeldPartitionframeFlag:$("input[id='fitWeldPartitionframeFlag']:checked").val(),
	                    							stage2TestingStatus:$("input[id='stage2TestingStatus']:checked").val(),
	                    							detailsOfModification:$('#detailsOfModification').val(),
	                    							detailsOfTrial:$('#detailsOfTrial').val(),
	                    							remarks:$('#remarks').val(),
	                    		
	                    						},
	                    						
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							
	                    							
	                    							 $('#stage2SipDocNo').val(''),                   							
	                    						    $('#stage2SipShift').val(''),              							
	                    							$('#stage2WorkBy').val(''),
	                    							$('#stage2ShellType').val(''),
	                    							$('#stage2ShellNo').val(''),
	                    							$('#stage2SipDate').val(''),
	                    							$('#stage2JigNo').val(''),
	                    							$('#stage2ShellAssemblyBy').val(''),
	                    							$('#stage2UnderframeMake').val(''),
	                    							$('#stage2RoofMake').val(''),
	                    							$('#stage2EndWallMakePP').val(''),
	                    							$('#stage2SideWallMakeLH').val(''),
	                    							$('#stage2EndWallMakeNPP').val(''),
	                    							$('#stage2SideWallMakeRH').val(''),
	                    							$('#stage2DrawingNo').val(''),
													$('#stage2WiNo').val(''),
													$("input[id='itemFittedAsDrawingFlag']:checked").val(''),
	                    							$("input[id='complianceWiFlag']:checked").val(''),
	                    							$("input[id='weldingThroatLengthFlag']:checked").val(''),
	                    							$("input[id='weldingEndwallFlag']:checked").val(''),
	                    							$("input[id='weldingSidewallSolebarFlag']:checked").val(''),
	                    							$("input[id='insideOutsideGrindingFlag']:checked").val(''),
	                    							$("input[id='grindSpotweldingSidewallFlag']:checked").val(''),
	                    							$("input[id='fitWeldPartitionframeFlag']:checked").val(''),
	                    							$("input[id='stage2TestingStatus']:checked").val(''),
	                    							$('#detailsOfModification').val(''),
	                    							$('#detailsOfTrial').val(''),
	                    							$('#remarks').val(''),
	                    							
	                    							$('#Stage2').dialog('close');
	                    							
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
				                        	$('#Stage2').find('form[name="shellsipStage2"]')[0].reset();
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
                       text: 'Stage3',
                       click: function () {
                       	 var $selectedRows = $('#ShellProductionTableContainer').jtable('selectedRows');
                   	 	 if ($selectedRows.length<1)
                   		 alert("Please select a row for which you want to Inspect");
                   	 	 else{
                   	 		var record;
                   	 		$selectedRows.each(function () {
                                   record = $(this).data('record');
                                   });
                   	 		
                   	 		
                   	 		//show pre existing data
                   	 			$.ajax({
   								url:"showExistingShellStage", //action-name as defined in struts.xml
   								dataType:'json',
   								type:'POST',
   								async:false,
   								data:{
   								shellAssetId:record.shellAssetId,	
   								},
   								success:function(data)
   								{
   									$('#stage3SipDocNo').val(data.stage3DocNo);
   									$('#stage3SipShift').val(data.stage3Shift);
   									$('#Stage3ShellNo').val(data.shellNo);
   									$('#Stage3ShellType').val(data.shellType);

   								}
   									
   								}); 
                   	 		
                   	 			if(record.stage3SipFlag==1)
   								{
   								
   								$.ajax({
   									url:"showSaveDataStage3", //action-name as defined in struts.xml
   									dataType:'json',
   									type:'POST',
   									async:false,
   									data:{
   									shellAssetId:record.shellAssetId,	
   									},
   									success:function(data)
   									{

   										var stage3Date=(data.shellStage3Sip.stage3SipDate).substring(0,10);
   										var stage3DateArray=stage3Date.split("-");
   										//var sideWallD= new Date(sideWallDateArray[0],sideWallDateArray[1]-1,sideWallDateArray[2]);
   										$('#stage3SipDate').datepicker("setDate", new Date(stage3DateArray[0],stage3DateArray[1]-1,stage3DateArray[2]));
   										$('#stage3WorkBy').val(data.shellStage3Sip.stage3WorkBy);
   										$('#stage3SipShift').val(data.shellStage3Sip.stage3SipShift);
   										$('#stage3DrawingNo').val(data.shellStage3Sip.stage3DrawingNo);
   										$('#undulationAboveWindow1').val(data.shellStage3Sip.undulationAboveWindow1);
   										$('#undulationBelowWindow1').val(data.shellStage3Sip.undulationBelowWindow1);
   										$('#undulationAboveWindow2').val(data.shellStage3Sip.undulationAboveWindow2);
   										$('#undulationBelowWindow2').val(data.shellStage3Sip.undulationBelowWindow2);
   										$('#undulationAboveWindow3').val(data.shellStage3Sip.undulationAboveWindow3);
   										$('#undulationBelowWindow3').val(data.shellStage3Sip.undulationBelowWindow3);
   										$('#undulationAboveWindow4').val(data.shellStage3Sip.undulationAboveWindow4);
   										$('#undulationBelowWindow4').val(data.shellStage3Sip.undulationBelowWindow4);
   										$('#undulationAboveWindow5').val(data.shellStage3Sip.undulationAboveWindow5);
   										$('#undulationBelowWindow5').val(data.shellStage3Sip.undulationBelowWindow5);
   										$('#undulationAboveWindow6').val(data.shellStage3Sip.undulationAboveWindow6);
   										$('#undulationBelowWindow6').val(data.shellStage3Sip.undulationBelowWindow6);
   										$('#undulationAboveWindow7').val(data.shellStage3Sip.undulationAboveWindow7);
   										$('#undulationBelowWindow7').val(data.shellStage3Sip.undulationBelowWindow7);
   										$('#undulationAboveWindow8').val(data.shellStage3Sip.undulationAboveWindow8);
   										$('#undulationBelowWindow8').val(data.shellStage3Sip.undulationBelowWindow8);
   										$('#undulationAboveWindow9').val(data.shellStage3Sip.undulationAboveWindow9);
   										$('#undulationBelowWindow9').val(data.shellStage3Sip.undulationBelowWindow9);
   										$('#undulationAboveWindow10').val(data.shellStage3Sip.undulationAboveWindow10);
   										$('#undulationBelowWindow10').val(data.shellStage3Sip.undulationBelowWindow10);
   										$('#undulationAboveWindow11').val(data.shellStage3Sip.undulationAboveWindow11);
   										$('#undulationBelowWindow11').val(data.shellStage3Sip.undulationBelowWindow11);
   										$('#undulationAboveWindow12').val(data.shellStage3Sip.undulationAboveWindow12);
   										$('#undulationBelowWindow12').val(data.shellStage3Sip.undulationBelowWindow12);
   										$('#undulationAboveWindow13').val(data.shellStage3Sip.undulationAboveWindow13);
   										$('#undulationBelowWindow13').val(data.shellStage3Sip.undulationBelowWindow13);
   										$('#undulationAboveWindow14').val(data.shellStage3Sip.undulationAboveWindow14);
   										$('#undulationBelowWindow14').val(data.shellStage3Sip.undulationBelowWindow14);
   										$('#undulationAboveWindow15').val(data.shellStage3Sip.undulationAboveWindow15);
   										$('#undulationBelowWindow15').val(data.shellStage3Sip.undulationBelowWindow15);
   										$('#undulationAboveWindow16').val(data.shellStage3Sip.undulationAboveWindow16);
   										$('#undulationBelowWindow16').val(data.shellStage3Sip.undulationBelowWindow16);
   										$('#undulationAboveWindow17').val(data.shellStage3Sip.undulationAboveWindow17);
   										$('#undulationBelowWindow17').val(data.shellStage3Sip.undulationBelowWindow17);
   										$('#undulationAboveWindow18').val(data.shellStage3Sip.undulationAboveWindow18);
   										$('#undulationBelowWindow18').val(data.shellStage3Sip.undulationBelowWindow18);
   										$('#undulationAboveWindow19').val(data.shellStage3Sip.undulationAboveWindow19);
   										$('#undulationBelowWindow19').val(data.shellStage3Sip.undulationBelowWindow19);
   										$('#undulationAboveWindow20').val(data.shellStage3Sip.undulationAboveWindow20);
   										$('#undulationBelowWindow20').val(data.shellStage3Sip.undulationBelowWindow20);
   										$('#undulationAboveWindow21').val(data.shellStage3Sip.undulationAboveWindow21);
   										$('#undulationBelowWindow21').val(data.shellStage3Sip.undulationBelowWindow21);
   										$('#undulationAboveWindow22').val(data.shellStage3Sip.undulationAboveWindow22);
   										$('#undulationBelowWindow22').val(data.shellStage3Sip.undulationBelowWindow22);
   										$('#undulationAboveWindow23').val(data.shellStage3Sip.undulationAboveWindow23);
   										$('#undulationBelowWindow23').val(data.shellStage3Sip.undulationBelowWindow23);
   										$('#undulationAboveWindow24').val(data.shellStage3Sip.undulationAboveWindow24);
   										$('#undulationBelowWindow24').val(data.shellStage3Sip.undulationBelowWindow24);
   										$('#undulationAboveWindow25').val(data.shellStage3Sip.undulationAboveWindow25);
   										$('#undulationBelowWindow25').val(data.shellStage3Sip.undulationBelowWindow25);
   										$('#undulationAboveWindow26').val(data.shellStage3Sip.undulationAboveWindow26);
   										$('#undulationBelowWindow26').val(data.shellStage3Sip.undulationBelowWindow26);
   										$('#undulationAboveWindow27').val(data.shellStage3Sip.undulationAboveWindow27);
   										$('#undulationBelowWindow27').val(data.shellStage3Sip.undulationBelowWindow27);
   										$('#undulationAboveWindow28').val(data.shellStage3Sip.undulationAboveWindow28);
   										$('#undulationBelowWindow28').val(data.shellStage3Sip.undulationBelowWindow28);
   										$('#undulationAboveWindow29').val(data.shellStage3Sip.undulationAboveWindow29);
   										$('#undulationBelowWindow29').val(data.shellStage3Sip.undulationBelowWindow29);
   										$('#undulationAboveWindow30').val(data.shellStage3Sip.undulationAboveWindow30);
   										$('#undulationBelowWindow30').val(data.shellStage3Sip.undulationBelowWindow30);
   										$('#undulationAboveWindow31').val(data.shellStage3Sip.undulationAboveWindow31);
   										$('#undulationBelowWindow31').val(data.shellStage3Sip.undulationBelowWindow31);
   										$('#undulationAboveWindow32').val(data.shellStage3Sip.undulationAboveWindow32);
   										$('#undulationBelowWindow32').val(data.shellStage3Sip.undulationBelowWindow32);
   										$('#undulationAboveWindow33').val(data.shellStage3Sip.undulationAboveWindow33);
   										$('#undulationBelowWindow33').val(data.shellStage3Sip.undulationBelowWindow33);
   										$('#undulationAboveWindow34').val(data.shellStage3Sip.undulationAboveWindow34);
   										$('#undulationBelowWindow34').val(data.shellStage3Sip.undulationBelowWindow34);
   										$('#undulationAboveWindow35').val(data.shellStage3Sip.undulationAboveWindow35);
   										$('#undulationBelowWindow35').val(data.shellStage3Sip.undulationBelowWindow35);
   										$('#undulationAboveWindow36').val(data.shellStage3Sip.undulationAboveWindow36);
   										$('#undulationBelowWindow36').val(data.shellStage3Sip.undulationBelowWindow36);
   										$('#undulationAboveWindow37').val(data.shellStage3Sip.undulationAboveWindow37);
   										$('#undulationBelowWindow37').val(data.shellStage3Sip.undulationBelowWindow37);
   										$('#undulationAboveWindow38').val(data.shellStage3Sip.undulationAboveWindow38);
   										$('#undulationBelowWindow38').val(data.shellStage3Sip.undulationBelowWindow38);
   										$('#undulationAboveWindow39').val(data.shellStage3Sip.undulationAboveWindow39);
   										$('#undulationBelowWindow39').val(data.shellStage3Sip.undulationBelowWindow39);
   										$('#undulationAboveWindow40').val(data.shellStage3Sip.undulationAboveWindow40);
   										$('#undulationBelowWindow40').val(data.shellStage3Sip.undulationBelowWindow40);
   										$('#undulationAboveWindow41').val(data.shellStage3Sip.undulationAboveWindow41);
   										$('#undulationBelowWindow41').val(data.shellStage3Sip.undulationBelowWindow41);
   										$('#undulationAboveWindow42').val(data.shellStage3Sip.undulationAboveWindow42);
   										$('#undulationBelowWindow42').val(data.shellStage3Sip.undulationBelowWindow42);
   										$('#endwallPpAboveCenterLh').val(data.shellStage3Sip.endwallPpAboveCenterLh);
   										$('#endwallPpAboveCenterRh').val(data.shellStage3Sip.endwallPpAboveCenterRh);
   										$('#endwallNppAboveCenterLh').val(data.shellStage3Sip.endwallNppAboveCenterLh);
   										$('#endwallNppAboveCenterRh').val(data.shellStage3Sip.endwallNppAboveCenterRh);
   										$('#endwallPpMiddleCenterLh').val(data.shellStage3Sip.endwallPpMiddleCenterLh);
   										$('#endwallPpMiddleCenterRh').val(data.shellStage3Sip.endwallPpMiddleCenterRh);
   										$('#endwallNppMiddleCenterLh').val(data.shellStage3Sip.endwallNppMiddleCenterLh);
   										$('#endwallNppMiddleCenterRh').val(data.shellStage3Sip.endwallNppMiddleCenterRh);
   										$('#endwallPpBottomCenterLh').val(data.shellStage3Sip.endwallPpBottomCenterLh);
   										$('#endwallPpBottomCenterRh').val(data.shellStage3Sip.endwallPpBottomCenterRh);
   										$('#endwallNppBottomCenterLh').val(data.shellStage3Sip.endwallNppBottomCenterLh);
   										$('#endwallNppBottomCenterRh').val(data.shellStage3Sip.endwallNppBottomCenterRh);
   										$('[id="dentReduceSidewallEndwallFlag"]').val([data.shellStage3Sip.dentReduceSidewallEndwallFlag]);
   										$('[id="skinTensioningWiFlag"]').val([data.shellStage3Sip.skinTensioningWiFlag]);
   										$('[id="skinTensioningSidewallEndwallLavFlag"]').val([data.shellStage3Sip.skinTensioningSidewallEndwallLavFlag]);
   										$('[id="heatedSpotFlag"]').val([data.shellStage3Sip.heatedSpotFlag]);
   										$('[id="weldRainWaterFlag"]').val([data.shellStage3Sip.weldRainWaterFlag]);
   										$('[id="insulatingWeldingPinFlag"]').val([data.shellStage3Sip.insulatingWeldingPinFlag]);
   										$('[id="fitmentWeldingSidewallFlag"]').val([data.shellStage3Sip.fitmentWeldingSidewallFlag]);
   										$('[id="fitmentWeldingBracketarrangementFlag"]').val([data.shellStage3Sip.fitmentWeldingBracketarrangementFlag]);
   										$('[id="levelRainWaterGutterFlag"]').val([data.shellStage3Sip.levelRainWaterGutterFlag]);
   										$('[id="fitmentWeldingWindowbarFlag"]').val([data.shellStage3Sip.fitmentWeldingWindowbarFlag]);
   										$('[id="fitmentWeldingBracketLavatoryFlag"]').val([data.shellStage3Sip.fitmentWeldingBracketLavatoryFlag]);
   										$('[id="stage3TestingStatus"]').val([data.shellStage3Sip.stage3TestingStatus]);
   										$('#detailsOfM').val(data.shellStage3Sip.detailsOfM);
   										$('#detailsOfT').val(data.shellStage3Sip.detailsOfT);
   										$('#remark').val(data.shellStage3Sip.remark);
   										
											//shell trans
											$('#stage3JigNo').val(data.shellTran.jigNo);
											$('#stage3ShellAssemblyBy').val(data.shellTran.shellAssembledBy);
											$('#stage3UnderFrameMake').val(data.shellTran.underframeCompleteMake);
											$('#stage3RoofMake').val(data.shellTran.roofMake);
											$('#endwallMakePp').val(data.shellTran.endwallMakePp);
											$('#endwallMakeNpp').val(data.shellTran.endwallMakeNpp);
											$('#sideWallMakeLh').val(data.shellTran.sideWallMakeNoPp);
											$('#sideWallMakeRh').val(data.shellTran.sideWallMakeNoNpp);
									
										}
										
									});
								}							
								

								//setting min value
								
								$('#stage3SipDate').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
								
           					
                   	 	 	$("#Stage3").dialog({
                   	 	 		title : 'Shell Assembly Stage-3'+record.shellTransactionId + 'from Stage- <%=stageID%>', 
                   	 	 		width:'80%',
                   	 	 		close: function (e, u) {
             	 		              //$(".formError").remove();
                   	 	 			$('#Stage3').find('form[name="shellsipStage3"]')[0].reset();
             	 		          	$("#Stage3").validationEngine('hideAll');
             	 		          },
               	 		 	
		 							buttons: {
	                                    Submit: {
	                                       text: "Submit",
	                                        id: "my-button-submit",
	                                        click:function () {
	                                    		
	                                    	
	                            	 		
	                                     if ($('#stage3SipDocNo').validationEngine('validate')) {
				                                        	//alert(!$("#dialog").validationEngine('validate'));
				                                            return false;
				                                        }
                                           if ($('#stage3DrawingNo').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
 	                                        
	                                    	if ($('#stage3SipShift').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
	                                    	
											if ($('#stage3WorkBy').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }  
											
											if ($('#Stage3ShellType').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }  
											if ($('#Stage3ShellNo').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
   										if ($('#stage3SipDate').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
   										if ($('#undulationAboveWindow1').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
										    if ($('#undulationBelowWindow1').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow2').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow2').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow3').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow3').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow4').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow4').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow5').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow5').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow6').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow6').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow7').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow7').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow8').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow8').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
											if ($('#undulationAboveWindow9').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow9').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow10').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow10').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow11').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow11').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow12').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow12').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow13').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow13').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow14').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow14').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow15').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow15').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow16').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow16').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow17').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow17').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow18').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow18').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow19').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow19').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow20').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow20').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow21').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow21').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow22').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow22').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow23').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow23').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow24').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow24').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow25').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow25').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow26').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow26').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
											if ($('#undulationAboveWindow27').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow27').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow28').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow28').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow29').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow29').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow30').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow30').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow31').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow31').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow32').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow32').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow33').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow33').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow34').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow34').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow35').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow35').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow36').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow36').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow37').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow37').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow38').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow38').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow39').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow39').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow40').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow40').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow41').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow41').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationAboveWindow42').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        } 
											if ($('#undulationBelowWindow42').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }  
											
											
											 
	                                    	var c=confirm("Do you want submit the SIP Form");
	                                    	if(c==false){return false;}
                                         
	                                    		    	   
	                                    	 $.ajax({
	                    						url : "saveStage3",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						data : {
	                    							shellAssetId: record.shellAssetId,
	                    							stageId: '<%=stageID%>',
	                    							stage3DrawingNo:$('#stage3DrawingNo').val(),
	                    							stage3SipShift:$('#stage3SipShift').val(),              							
	                    							stage3WorkBy:$('#stage3WorkBy').val(),
	                    							Stage3ShellType:$('#Stage3ShellType').val(),
	                    							Stage3ShellNo:$('#Stage3ShellNo').val(),
	                    							stage3SipDate:$('#stage3SipDate').val(),
	                    							stage3JigNo:$('#stage3JigNo').val(),
	                    							stage3ShellAssemblyBy:$('#stage3ShellAssemblyBy').val(),
	                    							stage3UnderFrameMake:$('#stage3UnderFrameMake').val(),
	                    							stage3RoofMake:$('#stage3RoofMake').val(),
	                    							endwallMakePp:$('#endwallMakePp').val(),
	                    							sideWallMakeLh:$('#sideWallMakeLh').val(),
	                    							endwallMakeNpp:$('#endwallMakeNpp').val(),
	                    							sideWallMakeRh:$('#sideWallMakeRh').val(),
	                    							undulationAboveWindow1:$('#undulationAboveWindow1').val(),
	                    							undulationBelowWindow1:$('#undulationBelowWindow1').val(),
	                    							undulationAboveWindow2:$('#undulationAboveWindow2').val(),
	                    							undulationBelowWindow2:$('#undulationBelowWindow2').val(),
	                    							undulationAboveWindow3:$('#undulationAboveWindow3').val(),
	                    							undulationBelowWindow3:$('#undulationBelowWindow3').val(),
	                    							undulationAboveWindow4:$('#undulationAboveWindow4').val(),
	                    							undulationBelowWindow4:$('#undulationBelowWindow4').val(),
	                    							undulationAboveWindow5:$('#undulationAboveWindow5').val(),
	                    							undulationBelowWindow5:$('#undulationBelowWindow5').val(),
	                    							undulationAboveWindow6:$('#undulationAboveWindow6').val(),
	                    							undulationBelowWindow6:$('#undulationBelowWindow6').val(),
	                    							undulationAboveWindow7:$('#undulationAboveWindow7').val(),
	                    							undulationBelowWindow7:$('#undulationBelowWindow7').val(),
	                    							undulationAboveWindow8:$('#undulationAboveWindow8').val(),
	                    							undulationBelowWindow8:$('#undulationBelowWindow8').val(),
	                    							undulationAboveWindow9:$('#undulationAboveWindow9').val(),
	                    							undulationBelowWindow9:$('#undulationBelowWindow9').val(),
	                    							undulationAboveWindow10:$('#undulationAboveWindow10').val(),
	                    							undulationBelowWindow10:$('#undulationBelowWindow10').val(),
	                    							undulationAboveWindow11:$('#undulationAboveWindow11').val(),
	                    							undulationBelowWindow11:$('#undulationBelowWindow11').val(),
	                    							undulationAboveWindow12:$('#undulationAboveWindow12').val(),
	                    							undulationBelowWindow12:$('#undulationBelowWindow12').val(),
	                    							undulationAboveWindow13:$('#undulationAboveWindow13').val(),
	                    							undulationBelowWindow13:$('#undulationBelowWindow13').val(),
	                    							undulationAboveWindow14:$('#undulationAboveWindow14').val(),
	                    							undulationBelowWindow14:$('#undulationBelowWindow14').val(),
	                    							undulationAboveWindow15:$('#undulationAboveWindow15').val(),
	                    							undulationBelowWindow15:$('#undulationBelowWindow15').val(),
	                    							undulationAboveWindow16:$('#undulationAboveWindow16').val(),
	                    							undulationBelowWindow16:$('#undulationBelowWindow16').val(),
	                    							undulationAboveWindow17:$('#undulationAboveWindow17').val(),
	                    							undulationBelowWindow17:$('#undulationBelowWindow17').val(),
	                    							undulationAboveWindow18:$('#undulationAboveWindow18').val(),
	                    							undulationBelowWindow18:$('#undulationBelowWindow18').val(),
	                    							undulationAboveWindow19:$('#undulationAboveWindow19').val(),
	                    							undulationBelowWindow19:$('#undulationBelowWindow19').val(),
	                    							undulationAboveWindow20:$('#undulationAboveWindow20').val(),
	                    							undulationBelowWindow20:$('#undulationBelowWindow20').val(),
	                    							undulationAboveWindow21:$('#undulationAboveWindow21').val(),
	                    							undulationBelowWindow21:$('#undulationBelowWindow21').val(),
	                    							undulationAboveWindow22:$('#undulationAboveWindow22').val(),
	                    							undulationBelowWindow22:$('#undulationBelowWindow22').val(),
	                    							undulationAboveWindow23:$('#undulationAboveWindow23').val(),
	                    							undulationBelowWindow23:$('#undulationBelowWindow23').val(),
	                    							undulationAboveWindow24:$('#undulationAboveWindow24').val(),
	                    							undulationBelowWindow24:$('#undulationBelowWindow24').val(),
	                    							undulationAboveWindow25:$('#undulationAboveWindow25').val(),
	                    							undulationBelowWindow25:$('#undulationBelowWindow25').val(),
	                    							undulationAboveWindow26:$('#undulationAboveWindow26').val(),
	                    							undulationBelowWindow26:$('#undulationBelowWindow26').val(),
	                    							undulationAboveWindow27:$('#undulationAboveWindow27').val(),
	                    							undulationBelowWindow27:$('#undulationBelowWindow27').val(),
	                    							undulationAboveWindow28:$('#undulationAboveWindow28').val(),
	                    							undulationBelowWindow28:$('#undulationBelowWindow28').val(),
	                    							undulationAboveWindow29:$('#undulationAboveWindow29').val(),
	                    							undulationBelowWindow29:$('#undulationBelowWindow29').val(),
	                    							undulationAboveWindow30:$('#undulationAboveWindow30').val(),
	                    							undulationBelowWindow30:$('#undulationBelowWindow30').val(),
	                    							undulationAboveWindow31:$('#undulationAboveWindow31').val(),
	                    							undulationBelowWindow31:$('#undulationBelowWindow31').val(),
	                    							undulationAboveWindow32:$('#undulationAboveWindow32').val(),
	                    							undulationBelowWindow32:$('#undulationBelowWindow32').val(),
	                    							undulationAboveWindow33:$('#undulationAboveWindow33').val(),
	                    							undulationBelowWindow33:$('#undulationBelowWindow33').val(),
	                    							undulationAboveWindow34:$('#undulationAboveWindow34').val(),
	                    							undulationBelowWindow34:$('#undulationBelowWindow34').val(),
	                    							undulationAboveWindow35:$('#undulationAboveWindow35').val(),
	                    							undulationBelowWindow35:$('#undulationBelowWindow35').val(),
	                    							undulationAboveWindow36:$('#undulationAboveWindow36').val(),
	                    							undulationBelowWindow36:$('#undulationBelowWindow36').val(),
	                    							undulationAboveWindow37:$('#undulationAboveWindow37').val(),
	                    							undulationBelowWindow37:$('#undulationBelowWindow37').val(),
	                    							undulationAboveWindow38:$('#undulationAboveWindow38').val(),
	                    							undulationBelowWindow38:$('#undulationBelowWindow38').val(),
	                    							undulationAboveWindow39:$('#undulationAboveWindow39').val(),
	                    							undulationBelowWindow39:$('#undulationBelowWindow39').val(),
	                    							undulationAboveWindow40:$('#undulationAboveWindow40').val(),
	                    							undulationBelowWindow40:$('#undulationBelowWindow40').val(),
	                    							undulationAboveWindow41:$('#undulationAboveWindow41').val(),
	                    							undulationBelowWindow41:$('#undulationBelowWindow41').val(),
	                    							undulationAboveWindow42:$('#undulationAboveWindow42').val(),
	                    							undulationBelowWindow42:$('#undulationBelowWindow42').val(),
	                    							endwallPpAboveCenterLh:$('#endwallPpAboveCenterLh').val(),
	                    							endwallPpAboveCenterRh:$('#endwallPpAboveCenterRh').val(),
	                    							endwallNppAboveCenterLh:$('#endwallNppAboveCenterLh').val(),
	                    							endwallNppAboveCenterRh:$('#endwallNppAboveCenterRh').val(),
	                    							endwallPpMiddleCenterLh:$('#endwallPpMiddleCenterLh').val(),
	                    							endwallPpMiddleCenterRh:$('#endwallPpMiddleCenterRh').val(),
	                    							endwallNppMiddleCenterLh:$('#endwallNppMiddleCenterLh').val(),
	                    							endwallNppMiddleCenterRh:$('#endwallNppMiddleCenterRh').val(),
	                    							endwallPpBottomCenterLh:$('#endwallPpBottomCenterLh').val(),
	                    							endwallPpBottomCenterRh:$('#endwallPpBottomCenterRh').val(),
	                    							endwallNppBottomCenterLh:$('#endwallNppBottomCenterLh').val(),
	                    							endwallNppBottomCenterRh:$('#endwallNppBottomCenterRh').val(),
	                    							dentReduceSidewallEndwallFlag:$("input[id='dentReduceSidewallEndwallFlag']:checked").val(),
	                    							skinTensioningWiFlag:$("input[id='skinTensioningWiFlag']:checked").val(),
	                    							skinTensioningSidewallEndwallLavFlag:$("input[id='skinTensioningSidewallEndwallLavFlag']:checked").val(),
	                    							heatedSpotFlag:$("input[id='heatedSpotFlag']:checked").val(),
	                    							weldRainWaterFlag:$("input[id='weldRainWaterFlag']:checked").val(),
	                    							insulatingWeldingPinFlag:$("input[id='insulatingWeldingPinFlag']:checked").val(),
	                    							fitmentWeldingSidewallFlag:$("input[id='fitmentWeldingSidewallFlag']:checked").val(),
	                    							fitmentWeldingBracketarrangementFlag:$("input[id='fitmentWeldingBracketarrangementFlag']:checked").val(),
	                    							levelRainWaterGutterFlag:$("input[id='levelRainWaterGutterFlag']:checked").val(),
	                    							fitmentWeldingWindowbarFlag:$("input[id='fitmentWeldingWindowbarFlag']:checked").val(),
	                    							fitmentWeldingBracketLavatoryFlag:$("input[id='fitmentWeldingBracketLavatoryFlag']:checked").val(),
	                    							stage3TestingStatus:$("input[id='stage3TestingStatus']:checked").val(),
	                    							detailsOfModification:$('#detailsOfM').val(),
	                    							detailsOfTrial:$('#detailsOfT').val(),
	                    							remarks:$('#remark').val(),
	                    						
	                    						}, 
	                    						
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							
	                    						
	                    							$('#stage3DrawingNo').val(''),
	                    							$('#stage3SipShift').val(''),              							
	                    							$('#stage3WorkBy').val(''),
	                    							$('#Stage3ShellType').val(''),
	                    							$('#Stage3ShellNo').val(''),
	                    							$('#stage3SipDate').val(''),
	                    							$('#stage3JigNo').val(''),
	                    							$('#stage3ShellAssemblyBy').val(''),
	                    							$('#stage3UnderFrameMake').val(''),
	                    							$('#stage3RoofMake').val(''),
	                    							$('#endwallMakePp').val(''),
	                    							$('#sideWallMakeLh').val(''),
	                    							$('#endwallMakeNpp').val(''),
	                    							$('#sideWallMakeRh').val(''),
	                    							$('#undulationAboveWindow1').val(''),
	                    							$('#undulationBelowWindow1').val(''),
	                    							$('#undulationAboveWindow2').val(''),
	                    							$('#undulationBelowWindow2').val(''),
	                    							$('#undulationAboveWindow3').val(''),
	                    							$('#undulationBelowWindow3').val(''),
	                    							$('#undulationAboveWindow4').val(''),
	                    							$('#undulationBelowWindow4').val(''),
	                    							$('#undulationAboveWindow5').val(''),
	                    							$('#undulationBelowWindow5').val(''),
	                    							$('#undulationAboveWindow6').val(''),
	                    							$('#undulationBelowWindow6').val(''),
	                    							$('#undulationAboveWindow7').val(''),
	                    							$('#undulationBelowWindow7').val(''),
	                    							$('#undulationAboveWindow8').val(''),
	                    							$('#undulationBelowWindow8').val(''),
	                    							$('#undulationAboveWindow9').val(''),
	                    							$('#undulationBelowWindow9').val(''),
	                    							$('#undulationAboveWindow10').val(''),
	                    							$('#undulationBelowWindow10').val(''),
	                    							$('#undulationAboveWindow11').val(''),
	                    							$('#undulationBelowWindow11').val(''),
	                    							$('#undulationAboveWindow12').val(''),
	                    							$('#undulationBelowWindow12').val(''),
	                    							$('#undulationAboveWindow13').val(''),
	                    							$('#undulationBelowWindow13').val(''),
	                    							$('#undulationAboveWindow14').val(''),
	                    							$('#undulationBelowWindow14').val(''),
	                    							$('#undulationAboveWindow15').val(''),
	                    							$('#undulationBelowWindow15').val(''),
	                    							$('#undulationAboveWindow16').val(''),
	                    							$('#undulationBelowWindow16').val(''),
	                    							$('#undulationAboveWindow17').val(''),
	                    							$('#undulationBelowWindow17').val(''),
	                    							$('#undulationAboveWindow18').val(''),
	                    							$('#undulationBelowWindow18').val(''),
	                    							$('#undulationAboveWindow19').val(''),
	                    							$('#undulationBelowWindow19').val(''),
	                    							$('#undulationAboveWindow20').val(''),
	                    							$('#undulationBelowWindow20').val(''),
	                    							$('#undulationAboveWindow21').val(''),
	                    							$('#undulationBelowWindow21').val(''),
	                    							$('#undulationAboveWindow22').val(''),
	                    							$('#undulationBelowWindow22').val(''),
	                    							$('#undulationAboveWindow23').val(''),
	                    							$('#undulationBelowWindow23').val(''),
	                    							$('#undulationAboveWindow24').val(''),
	                    							$('#undulationBelowWindow24').val(''),
	                    							$('#undulationAboveWindow25').val(''),
	                    							$('#undulationBelowWindow25').val(''),
	                    							$('#undulationAboveWindow26').val(''),
	                    							$('#undulationBelowWindow26').val(''),
	                    							$('#undulationAboveWindow27').val(''),
	                    							$('#undulationBelowWindow27').val(''),
	                    							$('#undulationAboveWindow28').val(''),
	                    							$('#undulationBelowWindow28').val(''),
	                    							$('#undulationAboveWindow29').val(''),
	                    							$('#undulationBelowWindow29').val(''),
	                    							$('#undulationAboveWindow30').val(''),
	                    							$('#undulationBelowWindow30').val(''),
	                    							$('#undulationAboveWindow31').val(''),
	                    							$('#undulationBelowWindow31').val(''),
	                    							$('#undulationAboveWindow32').val(''),
	                    							$('#undulationBelowWindow32').val(''),
	                    							$('#undulationAboveWindow33').val(''),
	                    							$('#undulationBelowWindow33').val(''),
	                    							$('#undulationAboveWindow34').val(''),
	                    							$('#undulationBelowWindow34').val(''),
	                    							$('#undulationAboveWindow35').val(''),
	                    							$('#undulationBelowWindow35').val(''),
	                    							$('#undulationAboveWindow36').val(''),
	                    							$('#undulationBelowWindow36').val(''),
	                    							$('#undulationAboveWindow37').val(''),
	                    							$('#undulationBelowWindow37').val(''),
	                    							$('#undulationAboveWindow38').val(''),
	                    							$('#undulationBelowWindow38').val(''),
	                    							$('#undulationAboveWindow39').val(''),
	                    							$('#undulationBelowWindow39').val(''),
	                    							$('#undulationAboveWindow40').val(''),
	                    							$('#undulationBelowWindow40').val(''),
	                    							$('#undulationAboveWindow41').val(''),
	                    							$('#undulationBelowWindow41').val(''),
	                    							$('#undulationAboveWindow42').val(''),
	                    							$('#undulationBelowWindow42').val(''),
	                    							$('#endwallPpAboveCenterLh').val(''),
	                    							$('#endwallPpAboveCenterRh').val(''),
	                    							$('#endwallNppAboveCenterLh').val(''),
	                    							$('#endwallNppAboveCenterRh').val(''),
	                    							$('#endwallPpMiddleCenterLh').val(''),
	                    							$('#endwallPpMiddleCenterRh').val(''),
	                    							$('#endwallNppMiddleCenterLh').val(''),
	                    							$('#endwallNppMiddleCenterRh').val(''),
	                    							$('#endwallPpBottomCenterLh').val(''),
	                    							$('#endwallPpBottomCenterRh').val(''),
	                    							$('#endwallNppBottomCenterLh').val(''),
	                    							$('#endwallNppBottomCenterRh').val(''),
	                    							$("input[id='dentReduceSidewallEndwallFlag']:checked").val(''),
	                    							$("input[id='skinTensioningWiFlag']:checked").val(''),
	                    							$("input[id='skinTensioningSidewallEndwallLavFlag']:checked").val(''),
	                    							$("input[id='heatedSpotFlag']:checked").val(''),
	                    							$("input[id='weldRainWaterFlag']:checked").val(''),
	                    							$("input[id='insulatingWeldingPinFlag']:checked").val(''),
	                    							$("input[id='fitmentWeldingSidewallFlag']:checked").val(''),
	                    							$("input[id='fitmentWeldingBracketarrangementFlag']:checked").val(''),
	                    							$("input[id='levelRainWaterGutterFlag']:checked").val(''),
	                    							$("input[id='fitmentWeldingWindowbarFlag']:checked").val(''),
	                    							$("input[id='fitmentWeldingBracketLavatoryFlag']:checked").val(''),
	                    							$("input[id='stage3TestingStatus']:checked").val(''),
	                    							$('#detailsOfM').val(''),
	                    							$('#detailsOfT').val(''),
	                    							$('#remark').val(''), 
	                    							
	                    							$('#Stage3').dialog('close');
	                    							
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
				                        	$('#Stage3').find('form[name="shellsipStage3"]')[0].reset();
				                                        $(this).dialog('close');
				                                    }
	                                    },
	                    	        modal: true
   	    });
                   	 	 	return true;
                   	 	 }
                       }
                   },
                   
               
                   {
                   	icon: '<%=contextpath%>/images/rs_out.png',
                       text: 'ShellStage4 SIP',
                       click: function () {
                       	 var $selectedRows = $('#ShellProductionTableContainer').jtable('selectedRows');
                   	 	 if ($selectedRows.length<1)
                   		 alert("Please select a row for which you want to Inspect");
                   	 	 else{
                   	 		var record;
                   	 		$selectedRows.each(function () {
                                   record = $(this).data('record');
                                   });
                   	 		
                   	 		
                   	 		//show pre existing data
                   	 		 $.ajax({
   								url:"showExistingShellStage", //action-name as defined in struts.xml
   								dataType:'json',
   								type:'POST',
   								async:false,
   								data:{
   								shellAssetId:record.shellAssetId,	
   								},
   								success:function(data)
   								{
   									$('#stage4SipDocNo').val(data.docnoshellstage4);
   									$('#shellTypeStage4').val(data.shellType);
   									$('#shellNumberStage4').val(data.shellNo);
   									$('#shellAssembledBy4').val(data.shellAssembledBy);
   									$('#jigNo4').val(data.jigNo);
   									$('#underframeCompleteMake4').val(data.underframeCompleteMake);
   									$('#underFrameNumber4').val(data.underframeNo);
   									$('#roofMake4').val(data.roofMake);
   									$('#endwallMakePp4').val(data.endwallMakePp);
   									$('#endwallMakeNpp4').val(data.endwallMakeNpp);
   									$('#sideWallMakeNoPp4').val(data.sidewallMakeLh);
   									$('#sideWallMakeNoNpp4').val(data.sidewallMakeRh);
   										
   								}
   									
   								});
                   	 		
                   	 		
                   	 		if(record.stage4SipFlag==1)
								{
								
								$.ajax({
									url:"showSaveDataStage4", //action-name as defined in struts.xml
									dataType:'json',
									type:'POST',
									async:false,
									data:{
									shellAssetId:record.shellAssetId,	
									},
									success:function(data)
									{
										
										
										$('#stage4SipShift').val(data.shellStage4SipTran.stage4SipShift);
										var stage4SipDate=(data.shellStage4SipTran.stage4SipDate).substring(0,10);
										var Stage4dateArray=stage4SipDate.split("-");
										$('#stage4SipDate').datepicker("setDate",new Date(Stage4dateArray[0],Stage4dateArray[1]-1,Stage4dateArray[2]));
										$('#stage4WorkBy').val(data.shellStage4SipTran.stage4WorkBy);
										$('#stage4DrawingNo').val(data.shellStage4SipTran.stage4DrawingNo);
										$('#stage4WiNo').val(data.shellStage4SipTran.stage4WiNo);
										$('#distancePartitionFrameSingleLh').val(data.shellStage4SipTran.distancePartitionFrameSingleLh);
										$('#shellAssembly4ObervationRmk').val(data.shellStage4SipTran.shellAssembly4ObervationRmk);
										$('#distancePartitionFrameCabinRh').val(data.shellStage4SipTran.distancePartitionFrameCabinRh);
										$('#widthCorridorPartitionFrame').val(data.shellStage4SipTran.widthCorridorPartitionFrame);
										$('#distanceDoorcutoutSlidingdoor').val(data.shellStage4SipTran.distanceDoorcutoutSlidingdoor);
										$('#distanceMiddleDoorPullboxbkt').val(data.shellStage4SipTran.distanceMiddleDoorPullboxbkt);
										$('#distancePullboxbktCenterlinePp').val(data.shellStage4SipTran.distancePullboxbktCenterlinePp);
										$('#distancePullboxbktCenterlineNpp').val(data.shellStage4SipTran.distancePullboxbktCenterlineNpp);
										$('#fitmentWatertankbracketBothside').val(data.shellStage4SipTran.fitmentWatertankbracketBothside);
										$('#heightChannelcomplete').val(data.shellStage4SipTran.heightChannelcomplete);
										$('#distanceSidewallPartitionpillar').val(data.shellStage4SipTran.distanceSidewallPartitionpillar);
										$('#heightBackpieceLuggageracke').val(data.shellStage4SipTran.heightBackpieceLuggageracke);
										$('#distanceDestinationBoard').val(data.shellStage4SipTran.distanceDestinationBoard);
										$('#diatanceSidewallpillarPrtmember').val(data.shellStage4SipTran.diatanceSidewallpillarPrtmember);
										$('#heightRoofflangeFramepart').val(data.shellStage4SipTran.heightRoofflangeFramepart);
										$('#ductInternallogitudinalLateral').val(data.shellStage4SipTran.ductInternallogitudinalLateral);
										$('#distanceDoorwayCrewcompGenroom').val(data.shellStage4SipTran.distanceDoorwayCrewcompGenroom);
										$('#distanceAuxWatertankbktCentre').val(data.shellStage4SipTran.distanceAuxWatertankbktCentre);
										$('#disableLavDoor').val(data.shellStage4SipTran.disableLavDoor);
										$('#disableLavDoorWidth').val(data.shellStage4SipTran.disableLavDoorWidth);
										$('#heightBottomroofCrossbracesbottom').val(data.shellStage4SipTran.heightBottomroofCrossbracesbottom);
										$('#passengerLavArea').val(data.shellStage4SipTran.passengerLavArea);
										$('#distanceLavPrtframeEnd').val(data.shellStage4SipTran.distanceLavPrtframeEnd);
										$('#distanceLavPrtframeLavPrtframe').val(data.shellStage4SipTran.distanceLavPrtframeLavPrtframe);
										$('#berthbktLowerLh').val(data.shellStage4SipTran.berthbktLowerLh);
										$('#berthbktMiddleLh').val(data.shellStage4SipTran.berthbktMiddleLh);
										$('#berthbktUpperLh').val(data.shellStage4SipTran.berthbktUpperLh);
										$('#berthbktLowerRh').val(data.shellStage4SipTran.berthbktLowerRh);
										$('#berthbktUpperRh').val(data.shellStage4SipTran.berthbktUpperRh);
										$('#dogBoxArea').val(data.shellStage4SipTran.dogBoxArea);
										$('#controlRoomArea').val(data.shellStage4SipTran.controlRoomArea);
										$('#stretcherRoomArea').val(data.shellStage4SipTran.stretcherRoomArea);
										$('#distanceSlidingDoorStopper').val(data.shellStage4SipTran.distanceSlidingDoorStopper);
										$('#distanceLavMountingbkt').val(data.shellStage4SipTran.distanceLavMountingbkt);
										$('#distanceAuxWatertankbkt').val(data.shellStage4SipTran.distanceAuxWatertankbkt);
										$('#heightBktcompleteRoofflange').val(data.shellStage4SipTran.heightBktcompleteRoofflange);
										$('#distancePowerpanelmountingCenterline').val(data.shellStage4SipTran.distancePowerpanelmountingCenterline);
										$('#distanceCoachcenterlineAuxiliarybkt').val(data.shellStage4SipTran.distanceCoachcenterlineAuxiliarybkt);
										$('#heightLowerberthUpperberth').val(data.shellStage4SipTran.heightLowerberthUpperberth);
										$('#distancePullboxPullbox').val(data.shellStage4SipTran.distancePullboxPullbox);
										$('#distanceLuggagerackRoofflangetop').val(data.shellStage4SipTran.distanceLuggagerackRoofflangetop);
										$('#distanceDoorAttachmentbkt').val(data.shellStage4SipTran.distanceDoorAttachmentbkt);
										$('#distancePullboxCarlinearch').val(data.shellStage4SipTran.distancePullboxCarlinearch);
										$('#heightCrossbraceRoofflange').val(data.shellStage4SipTran.heightCrossbraceRoofflange);
										$('#mountingangleLowerluggagerackBottomsidewall').val(data.shellStage4SipTran.mountingangleLowerluggagerackBottomsidewall);
										$('[id="fitmentCrossBraces"]').val([data.shellStage4SipTran.fitmentCrossBraces]);
										$('[id="fitmentStiffeningPlate"]').val([data.shellStage4SipTran.fitmentStiffeningPlate]);
										$('[id="fitmentPowerPanelFrame"]').val([data.shellStage4SipTran.fitmentPowerPanelFrame]);
										$('[id="fitmentWeldingPartitionFrame"]').val([data.shellStage4SipTran.fitmentWeldingPartitionFrame]);
										$('[id="roofbktWireclamping"]').val([data.shellStage4SipTran.roofbktWireclamping]);
										$('#detailsModification').val(data.shellStage4SipTran.detailsModification);
										$('#detailsTrialItem').val(data.shellStage4SipTran.detailsTrialItem);
										$('#remarks4').val(data.shellStage4SipTran.remarks);
										$('#stage4TestingStatus').val(data.shellStage4SipTran.stage4TestingStatus);
										$('#distanceBerthchannelVerticalchannelLowerLh').val(data.shellSideWallSipTran.distanceBerthchannelVerticalchannelLowerLh);
										$('#distanceBerthchannelVerticalchannelMiddleLh').val(data.shellSideWallSipTran.distanceBerthchannelVerticalchannelMiddleLh);
										$('#distanceBerthchannelVerticalchannelUpperLh').val(data.shellSideWallSipTran.distanceBerthchannelVerticalchannelUpperLh);
										$('#distanceBerthchannelVerticalchannelLowerRh').val(data.shellSideWallSipTran.distanceBerthchannelVerticalchannelLowerRh);
										$('#distanceBerthchannelVerticalchannelUpperRh').val(data.shellSideWallSipTran.distanceBerthchannelVerticalchannelUpperRh);
										
									
									}
										
									});
								}

								
								
								$('#stage4SipDate').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
								
           					
                   	 	 	$("#ShellStage4SIPDialog").dialog({
                   	 	 		title : 'Shell Stage-4'+record.shellTransactionId + 'from Stage- <%=stageID%>', 
                   	 	 		width:'80%',
                   	 	 		close: function (e, u) {
             	 		             
                   	 	 			$('#ShellStage4SIPDialog').find('form[name="Stage4"]')[0].reset();
             	 		          	$("#ShellStage4SIPDialog").validationEngine('hideAll');
             	 		          },
               	 		 	 
		 							buttons: {
	                                    Submit: {
	                                       text: "Submit",
	                                        id: "my-button-submit",
	                                        click:function () {
	                                    		
	                                    	
	                            	 		
	                                        	 if ($('#distancePartitionFrameSingleLh').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distancePartitionFrameCabinRh').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#widthCorridorPartitionFrame').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distanceDoorcutoutSlidingdoor').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distanceMiddleDoorPullboxbkt').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distancePullboxbktCenterlinePp').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distancePullboxbktCenterlineNpp').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#fitmentWatertankbracketBothside').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#heightChannelcomplete').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distanceSidewallPartitionpillar').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#heightBackpieceLuggageracke').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distanceDestinationBoard').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#diatanceSidewallpillarPrtmember').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#heightRoofflangeFramepart').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#ductInternallogitudinalLateral').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distanceDoorwayCrewcompGenroom').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distanceAuxWatertankbktCentre').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#disableLavDoor').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#disableLavDoorWidth').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#heightBottomroofCrossbracesbottom').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#passengerLavArea').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distanceLavPrtframeEnd').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distanceLavPrtframeLavPrtframe').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												
												if ($('#berthbktLowerLh').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#berthbktMiddleLh').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#berthbktUpperLh').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#berthbktLowerRh').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#berthbktUpperRh').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
			
												
												if ($('#dogBoxArea').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#controlRoomArea').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#stretcherRoomArea').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distanceSlidingDoorStopper').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distanceLavMountingbkt').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distanceAuxWatertankbkt').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#heightBktcompleteRoofflange').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distancePowerpanelmountingCenterline').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distanceCoachcenterlineAuxiliarybkt').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#heightLowerberthUpperberth').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distancePullboxPullbox').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distanceLuggagerackRoofflangetop').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distanceDoorAttachmentbkt').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distancePullboxCarlinearch').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#heightCrossbraceRoofflange').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#mountingangleLowerluggagerackBottomsidewall').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												
												if ($('#fitmentCrossBraces').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#fitmentStiffeningPlate').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#fitmentPowerPanelFrame').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#fitmentWeldingPartitionFrame').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#roofbktWireclamping').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												
												if ($('#distanceBerthchannelVerticalchannelLowerLh').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distanceBerthchannelVerticalchannelMiddleLh').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distanceBerthchannelVerticalchannelUpperLh').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distanceBerthchannelVerticalchannelLowerRh').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
												if ($('#distanceBerthchannelVerticalchannelUpperRh').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        } 
		                 
											
	                                    	var c=confirm("Do you want submit the SIP Form");
	                                    	if(c==false){return false;}
        
	                                    		    	   
	                                    	  $.ajax({
	                    						url : "saveShellStage4SIP",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						data : {
	                    							
	                    							shellAssetId: record.shellAssetId,
	                    							stageId: '<%=stageID%>',
	                    							stage4SipDocNo:$('#stage4SipDocNo').val(),
	                    							stage4SipShift:$('#stage4SipShift').val(),
	                    							stage4SipDate:$('#stage4SipDate').val(),
	                    							stage4WorkBy:$('#stage4WorkBy').val(),
	                    							shellAssembledBy:$('#shellAssembledBy4').val(),
	                    							jigNo:$('#jigNo4').val(),
	                    							underframeCompleteMake:$('#underframeCompleteMake4').val(),
	                    							underFrameNumber:$('#underFrameNumber4').val(),
	                    							roofMake:$('#roofMake4').val(),
	                    							endwallMakePp:$('#endwallMakePp4').val(),
	                    							sideWallMakeNoPp:$('#sideWallMakeNoPp4').val(),
	                    							endwallMakeNpp:$('#endwallMakeNpp4').val(),
	                    							sideWallMakeNoNpp4:$('#sideWallMakeNoNpp4').val(),
	                    							stage4DrawingNo:$('#stage4DrawingNo').val(),
	                    							stage4WiNo:$('#stage4WiNo').val(),
	                    							distancePartitionFrameSingleLh:$('#distancePartitionFrameSingleLh').val(),
	                    							shellAssembly4ObervationRmk:$('#shellAssembly4ObervationRmk').val(),
	                    							distancePartitionFrameCabinRh:$('#distancePartitionFrameCabinRh').val(),
	                    							widthCorridorPartitionFrame:$('#widthCorridorPartitionFrame').val(),
	                    							distanceDoorcutoutSlidingdoor:$('#distanceDoorcutoutSlidingdoor').val(),
	                    							distanceMiddleDoorPullboxbkt:$('#distanceMiddleDoorPullboxbkt').val(),
	                    							distancePullboxbktCenterlinePp:$('#distancePullboxbktCenterlinePp').val(),
	                    							distancePullboxbktCenterlineNpp:$('#distancePullboxbktCenterlineNpp').val(),
	                    							fitmentWatertankbracketBothside:$('#fitmentWatertankbracketBothside').val(),
	                    							heightChannelcomplete:$('#heightChannelcomplete').val(),
	                    							distanceSidewallPartitionpillar:$('#distanceSidewallPartitionpillar').val(),
	                    							heightBackpieceLuggageracke:$('#heightBackpieceLuggageracke').val(),
	                    							distanceDestinationBoard:$('#distanceDestinationBoard').val(),
	                    							diatanceSidewallpillarPrtmember:$('#diatanceSidewallpillarPrtmember').val(),
	                    							heightRoofflangeFramepart:$('#heightRoofflangeFramepart').val(),
	                    							ductInternallogitudinalLateral:$('#ductInternallogitudinalLateral').val(),
	                    							distanceDoorwayCrewcompGenroom:$('#distanceDoorwayCrewcompGenroom').val(),
	                    							distanceAuxWatertankbktCentre:$('#distanceAuxWatertankbktCentre').val(),
	                    							disableLavDoor:$('#disableLavDoor').val(),
	                    							disableLavDoorWidth:$('#disableLavDoorWidth').val(),
	                    							heightBottomroofCrossbracesbottom:$('#heightBottomroofCrossbracesbottom').val(),
	                    							passengerLavArea:$('#passengerLavArea').val(),
	                    							distanceLavPrtframeEnd:$('#distanceLavPrtframeEnd').val(),
	                    							distanceLavPrtframeLavPrtframe:$('#distanceLavPrtframeLavPrtframe').val(),
	                    							berthbktLowerLh:$('#berthbktLowerLh').val(),
	                    							berthbktMiddleLh:$('#berthbktMiddleLh').val(),
	                    							berthbktUpperLh:$('#berthbktUpperLh').val(),
	                    							berthbktLowerRh:$('#berthbktLowerRh').val(),
	                    							berthbktUpperRh:$('#berthbktUpperRh').val(),
	      											dogBoxArea:$('#dogBoxArea').val(),
	                    							controlRoomArea:$('#controlRoomArea').val(),
	                    							stretcherRoomArea:$('#stretcherRoomArea').val(),
	                    							distanceSlidingDoorStopper:$('#distanceSlidingDoorStopper').val(),
	                    							distanceLavMountingbkt:$('#distanceLavMountingbkt').val(),
	                    							distanceAuxWatertankbkt:$('#distanceAuxWatertankbkt').val(),
	                    							heightBktcompleteRoofflange:$('#heightBktcompleteRoofflange').val(),
	                    							distancePowerpanelmountingCenterline:$('#distancePowerpanelmountingCenterline').val(),
	                    							distanceCoachcenterlineAuxiliarybkt:$('#distanceCoachcenterlineAuxiliarybkt').val(),
	                    							heightLowerberthUpperberth:$('#heightLowerberthUpperberth').val(),
	                    							distancePullboxPullbox:$('#distancePullboxPullbox').val(),
	                    							distanceLuggagerackRoofflangetop:$('#distanceLuggagerackRoofflangetop').val(),
	                    							distanceDoorAttachmentbkt:$('#distanceDoorAttachmentbkt').val(),
	                    							distancePullboxCarlinearch:$('#distancePullboxCarlinearch').val(),
	                    							heightCrossbraceRoofflange:$('#heightCrossbraceRoofflange').val(),
	                    							mountingangleLowerluggagerackBottomsidewall:$('#mountingangleLowerluggagerackBottomsidewall').val(),
	                    							distanceBerthchannelVerticalchannelLowerLh:$('#distanceBerthchannelVerticalchannelLowerLh').val(),
	                    							distanceBerthchannelVerticalchannelMiddleLh:$('#distanceBerthchannelVerticalchannelMiddleLh').val(),
	                    							distanceBerthchannelVerticalchannelUpperLh:$('#distanceBerthchannelVerticalchannelUpperLh').val(),
	                    							distanceBerthchannelVerticalchannelLowerRh:$('#distanceBerthchannelVerticalchannelLowerRh').val(),
	                    							distanceBerthchannelVerticalchannelUpperRh:$('#distanceBerthchannelVerticalchannelUpperRh').val(),
	                    							fitmentCrossBraces:$("input[id='fitmentCrossBraces']:checked").val(),
	                    							fitmentStiffeningPlate:$("input[id='fitmentStiffeningPlate']:checked").val(),
	                    							fitmentPowerPanelFrame:$("input[id='fitmentPowerPanelFrame']:checked").val(),
	                    							fitmentWeldingPartitionFrame:$("input[id='fitmentWeldingPartitionFrame']:checked").val(),
	                    							roofbktWireclamping:$("input[id='roofbktWireclamping']:checked").val(),
	                    							stage4TestingStatus:$("input[id='stage4TestingStatus']:checked").val(),
	                    							detailsModification:$('#detailsModification').val(),
	                    							detailsTrialItem:$('#detailsTrialItem').val(),
	                    							remarks:$('#remarks4').val(),
	                    							entryBy:$('#entryBy').val(),
	                    							entryTime:$('#entryTime').val()
	                    					
	                    						},
	                    						
	                    						type : 'POST',
	                    						async : false,
	                            	 		}) 
	                    						.done(function( msg ) {
	                    							
	                    							
	                    							$('#stage4SipDocNo').val(''),  
	                    							$('#stage4SipShift').val(''),   
	                    							$('#stage4SipDate').val(''),
	                    							$('#stage4WorkBy').val(''),
	                    							$('#shellAssembledBy4').val(''),
	                    							$('#jigNo4').val(''),
	                    							$('#underframeCompleteMake4').val(''),
	                    							$('#underFrameNumber4').val(''),
	                    							$('#roofMake4').val(''),
	                    							$('#endwallMakePp4').val(''),
	                    							$('#sideWallMakeNoPp4').val(''),
	                    							$('#endwallMakeNpp4').val(''),
	                    							$('#sideWallMakeNoNpp4').val(''),
	                    							$('#stage4DrawingNo').val(''),
	                    							$('#stage4WiNo').val(''),
	                    							$('#distancePartitionFrameSingleLh').val(''),
	                    							$('#shellAssembly4ObervationRmk').val(''),
	                    							$('#distancePartitionFrameCabinRh').val(''),
	                    							$('#widthCorridorPartitionFrame').val(''),
	                    							$('#distanceDoorcutoutSlidingdoor').val(''),
	                    							$('#distanceMiddleDoorPullboxbkt').val(''),
	                    							$('#distancePullboxbktCenterlinePp').val(''),
	                    							$('#distancePullboxbktCenterlineNpp').val(''),
	                    							$('#fitmentWatertankbracketBothside').val(''),
	                    							$('#heightChannelcomplete').val(''),
	                    							$('#distanceSidewallPartitionpillar').val(''),
	                    							$('#heightBackpieceLuggageracke').val(''),
	                    							$('#distanceDestinationBoard').val(''),
	                    							$('#diatanceSidewallpillarPrtmember').val(''),
	                    							$('#heightRoofflangeFramepart').val(''),
	                    							$('#ductInternallogitudinalLateral').val(''),
	                    							$('#distanceDoorwayCrewcompGenroom').val(''),
	                    							$('#distanceAuxWatertankbktCentre').val(''),
	                    							$('#disableLavDoor').val(''),
	                    							$('#disableLavDoorWidth').val(''),
	                    							$('#heightBottomroofCrossbracesbottom').val(''),
	                    							$('#passengerLavArea').val(''),
	                    							$('#distanceLavPrtframeEnd').val(''),
	                    							$('#distanceLavPrtframeLavPrtframe').val(''),
	                    							$('#berthbktLowerLh').val(''),
	                    							$('#berthbktMiddleLh').val(''),
	                    							$('#berthbktUpperLh').val(''),
	                    							$('#berthbktLowerRh').val(''),
	                    							$('#berthbktUpperRh').val(''),
	                    							$('#dogBoxArea').val(''),
	                    							$('#controlRoomArea').val(''),
	                    							$('#stretcherRoomArea').val(''),
	                    							$('#distanceSlidingDoorStopper').val(''),
	                    							$('#distanceLavMountingbkt').val(''),
	                    							$('#distanceAuxWatertankbkt').val(''),
	                    							$('#heightBktcompleteRoofflange').val(''),
	                    							$('#distancePowerpanelmountingCenterline').val(''),
	                    							$('#distanceCoachcenterlineAuxiliarybkt').val(''),
	                    							$('#heightLowerberthUpperberth').val(''),
	                    							$('#distancePullboxPullbox').val(''),
	                    							$('#distanceLuggagerackRoofflangetop').val(''),
	                    							$('#distanceDoorAttachmentbkt').val(''),
	                    							$('#distancePullboxCarlinearch').val(''),
	                    							$('#heightCrossbraceRoofflange').val(''),
	                    							$('#mountingangleLowerluggagerackBottomsidewall').val(''),
	                    							$('#distanceBerthchannelVerticalchannelLowerLh').val(''),
	                    							$('#distanceBerthchannelVerticalchannelMiddleLh').val(''),
	                    							$('#distanceBerthchannelVerticalchannelUpperLh').val(''),
	                    							$('#distanceBerthchannelVerticalchannelLowerRh').val(''),
	                    							$('#distanceBerthchannelVerticalchannelUpperRh').val(''),
	                    							$('#fitmentCrossBraces').val(''),
	                    							$('#fitmentStiffeningPlate').val(''),
	                    							$('#fitmentPowerPanelFrame').val(''),
	                    							$('#fitmentWeldingPartitionFrame').val(''),
	                    							$('#roofbktWireclamping').val(''),
	                    							$('#detailsModification').val(''),
	                    							$('#detailsTrialItem').val(''),
	                    							$('#remarks4').val(''),
	                    							$('#stage4TestingStatus').val(''),
	                    							$('#entryBy').val(''),
	                    							$('#entryTime').val(''),
	                 
	                    							
	                    							 
	                    							
	                    							
	                    							
	                    							$('#ShellStage4SIPDialog').dialog('close');
	                    							
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
				                        	$('#ShellStage4SIPDialog').find('form[name="Stage4"]')[0].reset();
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
              
                   
                   
                   
            ]
            },
         
			actions : {
			
 	
 			listAction: 'listSIPStageShellAction?stageID=<%=stageID%>'
 			
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
				lavsidewallSipFlag:
				{
			title: 'Lav. Sidewall Report',
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
			var shellAssetId=data.record.shellAssetId ;
			
    //var URL="open-final-bogie-SIP-report?bogieAssetId="+bogieAssetId;
    var URL="open-lavsidewall-shell-SIP-report?shellAssetId="+shellAssetId;			
var diagtitle="Final SIP Report";
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
				
				sidewallSipFlag:
				{
			title: 'Sidewall Report',
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
			var shellAssetId=data.record.shellAssetId ;
			
    //var URL="open-final-bogie-SIP-report?bogieAssetId="+bogieAssetId;
    var URL="open-sidewall-shell-SIP-report?shellAssetId="+shellAssetId;			
var diagtitle="Final SIP Report";
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
				
				
				endwallSipFlag:
				{
			title: 'Endwall Report',
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
			var shellAssetId=data.record.shellAssetId ;
			
    //var URL="open-final-bogie-SIP-report?bogieAssetId="+bogieAssetId;
    var URL="open-endwall-shell-SIP-report?shellAssetId="+shellAssetId;			
var diagtitle="Final SIP Report";
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
		      
				roofSipFlag:
				{
			title: 'Roof SIP Report',
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
			var shellAssetId=data.record.shellAssetId ;
			
    //var URL="open-final-bogie-SIP-report?bogieAssetId="+bogieAssetId;
    var URL="open-roof-shell-SIP-report?shellAssetId="+shellAssetId;			
var diagtitle="Final SIP Report";
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
				
				underframeSipFlag:
				{
			title: 'Underframe SIP Report',
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
			var shellAssetId=data.record.shellAssetId ;
			
    //var URL="open-final-bogie-SIP-report?bogieAssetId="+bogieAssetId;
    var URL="open-underframe-shell-SIP-report?shellAssetId="+shellAssetId;			
var diagtitle="Final SIP Report";
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
	 
	