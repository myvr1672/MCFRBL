<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Calendar" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@page import="java.util.List" %>
<%@page import="org.hibernate.Criteria" %>
<%@page import="org.hibernate.criterion.Criterion" %>
<%@page import="org.hibernate.criterion.Projections" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="hibernateConnect.HibernateConfig" %>
<%@page import="model.SubStagesMaster" %>
<%@page import="common.SentEmail" %>
<%@page import="model.User" %>
<html>
<head>

<% String contextpath=request.getContextPath();
String stageID= request.getParameter("stageId");

 
%>

<script src="<%=contextpath %>/js/jquery-2.1.4.min.js" type="text/javascript"></script>

<link href="<%=contextpath %>/css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css" />


<script src="<%=contextpath %>/js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/jquery.jtable.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/moment.js" type="text/javascript"></script>

<link href="<%=contextpath %>/js/validationEngine/validationEngine.jquery.css" rel="stylesheet"type="text/css" />

<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine-en.js" type="text/javascript"></script>
<link href="<%=contextpath %>/css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<style>
div.jtable-main-container table.jtable tbody > tr > td {
    padding: 3px 3px 3px 3px;
     
}
 
th.jtable-command-column-header {
    min-width:18px;
   
}
 
table.jtable thead tr:first-child th:last-child {
    border-right:12px solid #f0f0f0;
    
}
 
table.jtable tbody,
table.jtable thead { display: block; width: 100%; }
 
table.jtable tbody {
    height:600px;  /* set hight of display body */
    overflow-y: auto;
    overflow-x: hidden;
   
}
 
.demo-jtable-div {
    width: 100%;
    margin-left:5px;
    margin-right:3px;
    height:100%;
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
        top: 10%;
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
#jtable-create-form{
display: block;
width: 500px;
-moz-column-gap:60px;
/*Firefox*/
-webkit-column-gap:60px;
/* Safari and Chrome */
column-gap:60px;
-moz-column-count:2;
/* Firefox */
-webkit-column-count:2;
/* Safari and Chrome */
column-count:2;
}

#jtable-edit-form{
display: block;
width: 500px;
-moz-column-gap:60px;
/*Firefox*/
-webkit-column-gap:60px;
/* Safari and Chrome */
column-gap:60px;
-moz-column-count:2;
/* Firefox */
-webkit-column-count:2;
/* Safari and Chrome */
column-count:2;
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
padding: 5px 5px 5px 5px;
width: 45%;
}
.col2
{
float:right;
padding: 5px 5px 5px 5px;
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
<script>
function checkExist(){
    var xmlhttp = new XMLHttpRequest();
    var axleNumber = $('#axleNumber').val();
    var url = "exist.jsp?axleNumber=" +axleNumber; 
    xmlhttp.onreadystatechange = function(){
        if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
          
         
  if(xmlhttp.responseText=="false"){
        		
                document.getElementById("isE").style.color = "red";
                document.getElementById("isE").innerHTML="Axle Number already exist";
                
                //$("#my-button-submit").attr("disabled", true);
               // $("#my-button-submit").addClass('disable');
        	}
            else
            	{
            document.getElementById("isE").style.color = "green";
            document.getElementById("isE").innerHTML = xmlhttp.responseText;
           // $("#my-button-submit").attr("disabled", false);
           // $("#my-button-submit").removeClass('disable');
            }
        }
        
    };
    try{
    xmlhttp.open("GET",url,true);
    xmlhttp.send();
}
    catch(e){alert("unable to connect to server");
}

}
</script>
<body>
<div id="filter">
<form>
<b>Set Mounting Date</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<i>From Date :</i><input type="text" id="datepickerfrom"/>&nbsp;&nbsp;&nbsp;
<i>To Date   :</i><input type="text" id="datepickerto"/>&nbsp;&nbsp;&nbsp;
<button type="submit" id="LoadRecordsButton">Load records</button>
</form>
</div>
<div id="WheelsetProductionTableContainer" class="demo-jtable-div"></div>
    <div id="wheelAxleSIP" style="height:150%;margin:5px;border:1px solid black;width:200%; display:none;z-index: 9;" >
            <p style="text-align: center;font-size:25px;"><b>SELF INSPECTION REPORT OF WHEEL & AXLE ASSEMBLY</b></p>
            <form name="wheelAxle">
           <table border="0" style="width:100%;">
          <tr>
          <th >DOC No.:</th><td colspan="2" style="width:20%;"><input type="text" style="width:90%;" name="docNoWheelAxle" id="docNoWheelAxle" class='validate[required]'></td>
          <th>Date:</th><td style="width:20%;"><input type="text" style="width:90%;" name="dateOfWheelAxleTesting" id="dateOfWheelAxleTesting" class='validate[required]'></td><td></td>
          <th>Shift:</th><td style="width:20%;"><select name="shiftWheelAxle" id="shiftWheelAxle">
          <option value="">Select</option>
          <option value="general">General</option>
          <option value="morning">Shift-I</option>
          <option value="evening">Shift-II</option>
           <option value="night">Shift-III</option>
          </select></td></tr>
          <tr>
          <th>Applicable drawing No:</th><td style="width:20%;"><input type="text" style="width:90%;" name="drawingNoWheelAxle" id="drawingNoWheelAxle" class='validate[required]'></td><td></td>
          <th>Applicable WI (If any):</th><td style="width:20%;"><input type="text" style="width:90%;" name="wiNoWheelAxle" id="wiNoWheelAxle"/></td><td></td>
          <th>Heat No.:</th><td style="width:20%;"><input type="text" style="width:90%;" name="heatNoWheelAxle" id="heatNoWheelAxle"/></td>
          </tr>
         
            <tr>
          <th>Wheel Disc No(left):</th><td style="width:20%;"><input type="text" style="width:90%;" name="wheelDiscLeftNoWheelAxle" id="wheelDiscLeftNoWheelAxle" class='validate[required]'></td><td></td>
          <th>Wheel Disc No(right):</th><td style="width:20%;"><input type="text" style="width:90%;" name="wheelDiscRightNoWheelAxle" id="wheelDiscRightNoWheelAxle" class='validate[required]'></td><td></td>
          <th>Wheel Disc Type:</th><td style="width:20%;"><select name="wheelTypeWheelAxle" id="wheelTypeWheelAxle">
           <option value="">Select</option>
          <option value="CAST">CAST</option>
          <option value="FORGE">FORGE</option>
          </select></td>
          </tr>
          
          <tr>
          <th>Axle No: </th><td style="width:20%;"><input type="text" style="width:90%;" name="axleNoWheelAxle" id="axleNoWheelAxle" class='validate[required]' onblur="checkExist()" style='text-transform:uppercase'><span id="isE"></span></td><td></td>
          <th>Axle Type:</th><td style="width:20%;"><input type="text" style="width:90%;" name="axleMakeWheelAxle" id="axleMakeWheelAxle" class='validate[required]'></td><td></td>
          <th>Wheel Set Type:</th><td style="width:20%;"><input type="text" style="width:90%;" name="wheelSetTypeWheelAxle" id="wheelSetTypeWheelAxle" class='validate[required]'/></td>
          </tr>
          </table>
  
  <br>
  <p><b>OBSERVATION</b></p>
  <p>&emsp;A. Dimension</p>
  <table border="1" style="width:100%;">
  <tr>
  <td colspan="2" style="width:33.4%;text-align:center;">Journal dia</td>
  <td colspan="2" style="width:33.4%;text-align:center;">Collar dia</td>
  <td colspan="2" style="width:33.4%;text-align:center;">Wheel dia</td>
  <td style="width:16.7%;text-align:center;">Distance between wheels</td><td style="width:16.7%;text-align:center;">Distance between wheel face to disc face</td>
  </tr>
  <tr>
  <td colspan="2" style="width:33.4%;text-align:center;">130+0.068/+0.043 mm</td>
  <td colspan="2" style="width:33.4%;text-align:center;">160+0.174/+0.134 mm</td>
  <td colspan="2" style="width:33.4%;text-align:center;">915+4/0 mm</td>
  <td rowspan="2" style="width:16.7%;text-align:center;">1600+/-1 mm</td>
  <td rowspan="2" style="width:16.7%;text-align:center;">175+/-0.5 mm</td>
  </tr>
  <tr>
  <td style="width:16.7%;text-align:center;">Left Side</td>
  <td style="width:16.7%;text-align:center;">Right Side</td>
  <td style="width:16.7%;text-align:center;">Left Side</td>
  <td style="width:16.7%;text-align:center;">Right Side</td>
  <td style="width:16.7%;text-align:center;">Left Side</td>
  <td style="width:16.7%;text-align:center;">Right Side</td>
  </tr>
  <tr>
  <td style="width:16.7%;"><input type="text" style="width:100%;"name="journalDiaLeft" id="journalDiaLeft" placeholder="0.00" class="validate[custom[number]]"></td>
  <td style="width:16.7%;"><input type="text" style="width:100%;" name="journalDiaRight" id="journalDiaRight" placeholder="0.00" class="validate[custom[number]]"></td>
  <td style="width:16.7%;"><input type="text" style="width:100%;" name="collarDiaLeft" id="collarDiaLeft" placeholder="0.00" class="validate[custom[number]]"></td>
  <td style="width:16.7%;"><input type="text" style="width:100%;" name="collarDiaRight" id="collarDiaRight" placeholder="0.00" class="validate[custom[number]]"></td>
  <td style="width:16.7%;"><input type="text" style="width:100%;" name="wheelDiaLeft" id="wheelDiaLeft" placeholder="0.00" class="validate[custom[number]]"></td>
  <td style="width:16.7%;"><input type="text" style="width:100%;" name="wheelDiaRight" id="wheelDiaRight" placeholder="0.00" class="validate[custom[number]]"></td>
  <td style="width:16.7%;"><input type="text" style="width:100%;" name="distanceBetweenWheel" id="distanceBetweenWheel" placeholder="0.00" class="validate[custom[number]]"></td>
  <td style="width:16.7%;"><input type="text" style="width:100%;" name="distanceBetweenWheelfaceDiscface" id="distanceBetweenWheelfaceDiscface" placeholder="0.00" class="validate[custom[number]]"></td>
  </tr>
  </table>
  
  <br><br>
  
  <p>&emsp;B. Pressing Pressure: </p>
  <table border="1" style="width:100%;">
  <tr>
  <th colspan="4" style="width:50%;text-align:center;">Pressing pressure of brake disc</th>
  <th colspan="4" style="width:50%;text-align:center;">Pressing pressure of wheel disc</th> 
  </tr>
  <tr>
  <td colspan="4" style="width:50%;text-align:center;">LHB-240-420 KN for Knorr & 139.63-498.71 KN for favely (ref: SME/B&D letter no MD24171 dtd 30.09.11)</td>
  <td colspan="4" style="width:50%;text-align:center;">LHB-680-1072 KN</td>
  </tr>
  <tr>
  <td style="width:15%;text-align:center;">Pressure <br>(Left side)</td>
  <td style="width:10%;text-align:center;">Brake disc<br>make</td>
  <td style="width:15%;text-align:center;">Pressure <br>(Right side)</td>
  <td style="width:10%;text-align:center;">Brake disc<br>make</td>
  <td style="width:15%;text-align:center;">Pressure <br>(Left side)</td>
  <td style="width:10%;text-align:center;">Wheel disc<br>make</td>
  <td style="width:15%;text-align:center;">Pressure <br>(Right side)</td>
  <td style="width:10%;text-align:center;">Wheel disc<br>make</td>
  </tr>
  <tr>
  <td style="width:15%;"><input type="text" style="width:100%;" name="brakeDiscPressureLeft" id="brakeDiscPressureLeft" placeholder="integer" class="validate[custom[integer]]"></td>
  <td style="width:10%;"><select name="leftBrakeDiscMake" id="leftBrakeDiscMake">
  <option value="">Select</option>
  <option value="FV">FV</option>
  <option value="KBI">KBI</option>
  <option value="KNORR">KNORR</option>
  <option value="OTHER">OTHER</option>
  </select></td>
  <td style="width:15%;"><input type="text" style="width:100%;" name="brakeDiscPressureRight" id="brakeDiscPressureRight" placeholder="integer" class="validate[custom[integer]]"></td>
  <td style="width:10%;"><select name="rightBrakeDiscMake" id="rightBrakeDiscMake">
  <option value="">Select</option>
  <option value="FV">FV</option>
  <option value="KBI">KBI</option>
  <option value="KNORR">KNORR</option>
  <option value="OTHER">OTHER</option>
  </select></td>
  <td style="width:15%;"><input type="text" style="width:100%;" name="wheelDiscPressureLeft" id="wheelDiscPressureLeft" placeholder="integer" class="validate[custom[integer]]"></td>
  <td style="width:10%;"><select name="wheeldiscLeftMake" id="wheeldiscLeftMake">
  <option value="">Select</option>
  <option value="SAIL">SAIL</option>
  <option value="TZ">TZ</option>
   <option value="VR">VR</option>
  <option value="ZB">ZB</option>
  <option value="OTHER">OTHER</option>
  </select></td>
  <td style="width:15%;"><input type="text" style="width:100%;" name="wheelDiscPressureRight" id="wheelDiscPressureRight" placeholder="integer" class="validate[custom[integer]]"></td>
  <td style="width:10%;"><select name="wheeldiscRightMake" id="wheeldiscRightMake">
  <option value="">Select</option>
  <option value="SAIL">SAIL</option>
  <option value="TZ">TZ</option>
   <option value="VR">VR</option>
  <option value="ZB">ZB</option>
  <option value="OTHER">OTHER</option>
  </select></td>
  </tr>
  </table>
  
  <br>
  
  <p>&emsp;C. Wheel balancing in LHB: </p>
  <table border="1" style="width:100%;">
  <tr>
  <th colspan="2" style="width:50%;text-align:center;">Weight Provided (in gm)</th><th colspan="2" style="width:50%;text-align:center;">Unbalance Wheel (in gm)</th> 
  </tr>
  <tr>
  <td style="width:25%;text-align:center;">Left side</td><td style="width:25%;text-align:center;">Right side</td><td style="width:225px;text-align:center;">Left side</td><td style="width:225px;text-align:center;">Right side</td>
  </tr>
  <tr>
  <td style="width:25%;"><input type="text" style="width:100%;" name="wheelBalancingWeightLeft" id="wheelBalancingWeightLeft" placeholder="integer" class="validate[custom[integer]]"></td>
  <td style="width:25%;"><input type="text" style="width:100%;" name="wheelBalancingWeightRight" id="wheelBalancingWeightRight" placeholder="integer" class="validate[custom[integer]]"></td>
  <td style="width:25%;"><input type="text" style="width:100%;" name="wheelUnbalanceWeightLeft" id="wheelUnbalanceWeightLeft" placeholder="integer" class="validate[custom[integer]]"></td>
  <td style="width:25%;"><input type="text" style="width:100%;" name="wheelUnbalanceWeightRight" id="wheelUnbalanceWeightRight" placeholder="integer" class="validate[custom[integer]]"></td>
  </tr>
  </table>
  
  <br><br>
  
    <p>&emsp;D. Stamp particulars:</p>
   <table border="1" style="width:100%;">
   <tr>
   <td colspan="2" style="width:50%;text-align:center;">Wheel profile as per RDSO/SK-91146</td>
   <td colspan="2" style="width:50%;text-align:center;">UT stamp (mfg)</td>
   </tr>
   <tr>
   <td style="width:25%;text-align:center;">Left side wheel</td>
   <td style="width:25%;text-align:center;">Right side wheel</td>
   <td style="width:25%;text-align:center;">Wheel</td>
   <td style="width:25%;text-align:center;">Axle</td>
   </tr>
   <tr>
   <td style="width:25%;"><select name="stampParticularsLeftWheel" id="stampParticularsLeftWheel">
   <option value="">Select</option>
   <option value="OK">OK</option>
    <option value="NOT OK">NOT OK</option>
   </select></td>
    <td style="width:25%;"><select name="stampParticularsRightWheel" id="stampParticularsRightWheel">
   <option value="">Select</option>
   <option value="OK">OK</option>
    <option value="NOT OK">NOT OK</option>
   </select></td>
   <td style="width:25%;"><select name="stampParticularsWheel" id="stampParticularsWheel">
   <option value="">Select</option>
   <option value="OK">OK</option>
    <option value="NOT OK">NOT OK</option>
   </select></td>
   <td style="width:25%;"><select name="stampParticularsAxle" id="stampParticularsAxle">
   <option value="">Select</option>
   <option value="OK">OK</option>
    <option value="NOT OK">NOT OK</option>
   </select></td>
   </tr>
   </table>
   <br>
   <table border="0" style="width:100%;">
   <tr><th style="width:10%;">&emsp;E. </th><td style="width:30%;">Details of Modification carried out if any</td><td style="width:60%;"><textarea style="width:100%;" name="modificationInWheelAxle" id="modificationInWheelAxle" cols="90"></textarea></td><tr>
   <tr><th style="width:10%;">&emsp;F. </th><td style="width:30%;">Details of trial item if any</td><td style="width:60%;"><textarea style="width:100%;" name="trialInWheelAxle" id="trialInWheelAxle" cols="90"></textarea></td><tr>
   <tr><th style="width:10%;">&emsp;G. </th><td style="width:30%;">Remarks: </td><td style="width:60%;"><textarea style="width:100%;" name="remarksInWheelAxle" id="remarksInWheelAxle" cols="90"></textarea></td><tr>
   </table>
   </form>
 </div>
 
 
 
  <div id="ctrbSIP" style="height:150%;margin:5px;border:1px solid black;width:200%;display:none;z-index: 9;">
          <p style="text-align: center;font-size:25px;">SELF INSPECTION REPORT OF CTRB Stage</p>
          <form name="ctrb">
          <table border="0" style="width:100%;">
          <tr>
          <th>DOC No.:</th><td style="width:20%;"><input type="text" style="width:90%;" name="docNoCTRB" id="docNoCTRB" class='validate[required]'></td>
          <th>Date:</th><td style="width:20%;"><input type="text" style="width:90%;" name="dateOfCTRBTesting" id="dateOfCTRBTesting" class='validate[required]'></td>
          <th>Shift:</th><td style="width:20%;"><select name="shiftCTRB" id="shiftCTRB">
          <option value="">Select</option>
          <option value="general">General</option>
          <option value="morning">Shift-I</option>
          <option value="evening">Shift-II</option>
           <option value="night">Shift-III</option>
          </select></td>
          </tr>
          <tr>
          <th>Applicable drawing No:</th><td style="width:20%;"><input type="text" style="width:90%;" name="drawingNoCTRB" id="drawingNoCTRB" class='validate[required]'></td>
          <th>Applicable WI (If any):</th><td style="width:20%;"><input type="text" style="width:90%;" name="wiNoCTRB" id="wiNoCTRB"></td>
          </tr>
      
          <tr>
          <th>Axle No: </th><td style="width:20%;text-transform:uppercase;"><input type="text" style="width:90%;" name="axleNoCTRB" id="axleNoCTRB" class='validate[required]' onblur="checkExist()"><span id="isE"></span></td>
          <th>Axle Make:</th><td style="width:20%;"><input type="text" style="width:90%;" name="axleMakeCTRB" id="axleMakeCTRB" class='validate[required]'></td>
          <th>Wheel Set Type:</th><td style="width:20%;"><input type="text" style="width:90%;" name="wheelSetTypeCTRB" id="wheelSetTypeCTRB" class='validate[required]'></td>
          </tr>
          </table>
  
  <br>
  <p><b>OBSERVATION</b></p>
  <p>&emsp;A. Dimension</p>
  <table border="1" style="width:100%;">
  <tr>
  <th style="width:10%;">S. No</th>
  <th style="width:50%;">Description</th>
  <th style="width:40%;">Observed value</th>
  </tr>
  <tr>
  <td style="width:10%;">1 </td><td style="width:50%;">Items fitted as per Drawing</td>
  <td style="width:40%;"><select name="ctrbItemAsDrawing" id="ctrbItemAsDrawing">
  <option value="">Select</option>
  <option value="OK">OK</option>
  <option value="NOT OK">NOT OK</option>
  </select>
  </td>
  </tr>
   <tr>
  <td style="width:10%;">2 </td><td style="width:50%;">Compliance of applicable W.1</td>
  <td style="width:40%;"><select name="ctrbComplianceWi" id="ctrbComplianceWi">
  <option value="">Select</option>
  <option value="OK">OK</option>
  <option value="NOT OK">NOT OK</option>
  </select>
  </td>
  </tr>
   <tr>
  <td style="width:10%;">3</td><td style="width:50%;">Filling of grease in Axle box (1.75 kg/Housing)</td>
  <td style="width:40%;"><select name="fillingGreaseAxle" id="fillingGreaseAxle">
  <option value="">Select</option>
  <option value="OK">OK</option>
  <option value="NOT OK">NOT OK</option>
  </select>
  </td>
  </tr>
   <tr>
  <td style="width:10%;">4</td><td style="width:50%;">Difference of wheel Dia. in same axle (with in 0.5mm)</td>
  <td style="width:40%;"><select name="differenceOfWheelDia" id="differenceOfWheelDia">
  <option value="">Select</option>
  <option value="OK">OK</option>
  <option value="NOT OK">NOT OK</option>
  </select>
  </td>
  </tr>
  <tr>
  <td style="width:10%;">5</td><td style="width:50%;">Check the journal & CTRB for any damage/crack</td>
  <td style="width:40%;"><select name="damageInJournalCTRB" id="damageInJournalCTRB">
  <option value="">Select</option>
  <option value="OK">OK</option>
  <option value="NOT OK">NOT OK</option>
  </select>
  </td>
  </tr>
  <tr>
  <td style="width:10%;">6</td><td style="width:50%;">Journal dia left (130+0.043/+0.068mm)</td>
  <td style="width:40%;"><input type="text" style="width:100%;" name="journalDiaLeftCTRB" id="journalDiaLeftCTRB" placeholder="integer" class="validate[custom[number]]"></td>
  </tr>
  <tr>
  <td style="width:10%;">7</td><td style="width:50%;">Journal dia right (130+0.043/+0.068mm)</td>
  <td style="width:40%;"><input type="text" style="width:100%;" name="journalDiaRightCTRB" id="journalDiaRightCTRB" placeholder="integer" class="validate[custom[number]]"></td>
  </tr>
  <tr>
  <td style="width:10%;">8</td><td style="width:50%;">Wheel dia left (915+4/0 mm)</td>
  <td style="width:40%;"><input type="text" style="width:100%;" name="wheelDiaLeftCTRB" id="wheelDiaLeftCTRB" placeholder="integer" class="validate[custom[number]]"></td>
  </tr>
  <tr>
  <td style="width:10%;">9</td><td style="width:50%;">Wheel dia right (915+4/0 mm)</td>
  <td style="width:40%;"><input type="text" style="width:100%;" name="wheelDiaRightCTRB" id="wheelDiaRightCTRB" placeholder="integer" class="validate[custom[number]]"></td>
  </tr>
  <tr>
  <td style="width:10%;">10</td><td style="width:50%;">Distance between wheel (1600+/-1 mm)</td>
  <td style="width:40%;"><input type="text" style="width:100%;" name="distanceBetweenWheelCTRB" id="distanceBetweenWheelCTRB" placeholder="integer" class="validate[custom[number]]"></td>
  </tr>
  <tr>
  <td style="width:10%;">11</td><td style="width:50%;">Tightening of Hexagonal head screws (210 Nm for LHB type Wheel)</td>
  <td style="width:40%;"><select name="tighteningHexagonalScrews" id="tighteningHexagonalScrews">
  <option value="">Select</option>
  <option value="OK">OK</option>
  <option value="NOT OK">NOT OK</option>
  </select></td>
  </tr>
  <tr>
  <td style="width:10%;">12</td><td style="width:50%;">Lateral clearance Left Side(20-389 &#956; for TIMKEN)<br>(ref. as per Timken manual) and (28-32 T for SKF)<br>(ref. SKF Letter no. PD/MCF/2017/001 dtd. 19.05.17)</td>
  <td style="width:40%;"><input type="text" style="width:100%;" name="lateralClearanceLeftCTRB" id="lateralClearanceLeftCTRB" placeholder="integer"></td>
  </tr>
  <tr>
  <tr>
  <td style="width:10%;">13</td><td style="width:50%;">Lateral clearance Right Side(20-389 &#956; for TIMKEN)<br>(ref. as per Timken manual) and (28-32 T for SKF)<br>(ref. SKF Letter no. PD/MCF/2017/001 dtd. 19.05.17)</td>
  <td style="width:40%;"><input type="text" style="width:100%;" name="lateralClearanceRightCTRB" id="lateralClearanceRightCTRB" placeholder="integer"></td>
  </tr>
  <tr>
  <td style="width:10%;">14</td><td style="width:50%;">Pressing pressure of CTRB Left(25-44 T for TIMKEN)<br>(ref. as per Timken manual) and (28-32 T for SKF)<br>(ref. SME/BD letter no. MD23141 dtd. 7/8/2012)</td>
  <td style="width:40%;"><input type="text" style="width:100%;" name="pressingPressureLeftCTRB" id="pressingPressureLeftCTRB" placeholder="integer"></td>
  </tr>
  <tr>
  <td style="width:10%;">15</td><td style="width:50%;">Pressing pressure of CTRB Right(25-44 T for TIMKEN)<br>(ref. as per Timken manual) and (28-32 T for SKF)<br>(ref. SME/BD letter no. MD23141 dtd. 7/8/2012)</td>
  <td style="width:40%;"><input type="text" style="width:100%;" name="pressingPressureRightCTRB" id="pressingPressureRightCTRB" placeholder="integer"></td>
  </tr>
  <tr>
  <td style="width:10%;">16</td><td style="width:50%;">Details of modification carried out if any</td>
  <td style="width:40%;"><input type="text" name="modificationInCTRB" id="modificationInCTRB" style="width:100%;"></td>
  </tr>
  <tr>
  <td style="width:10%;">17</td><td style="width:50%;">Detail of trial item if any: </td>
  <td style="width:40%;"><input type="text" name="trialInCTRB" id="trialInCTRB" style="width:100%;"></td>
  </tr>
  <tr>
  <td style="width:10%;">18</td><td style="width:50%;">Remarks: </td>
  <td style="width:40%;"><input type="text" name="remarksInCTRB" id="remarksInCTRB" style="width:100%;"></td>
  </tr>
  </table>
 </form> 
 
 </div>
</body>




<script type="text/javascript">
		$(document).ready(function() {
		       $("#railway").append('<option value="">Select</option>');
					var railways=[], j=0;
					//railways[0]={ Value:null, DisplayText: "Select" };
					<c:forEach var="a" items="${railway}">
					
					var o = new Option("${a}", "${a}");
					/// jquerify the DOM object 'o' so we can use the html method
					//$(o).html("${a}");
					$("#railway").append(o);
					
					//railways[j]={ Value: "${a}", DisplayText: "${a}" };
				//j++;
			    </c:forEach>
			    
			    
			   // end of code for bogie type

			
			
		
			var srno,i=0;
			var wheeltypes=[];
			
			<c:forEach var="a" items="${wheelType}">
			wheeltypes[i]={ Value: "${a}", DisplayText: "${a}" };
		i++;
	    </c:forEach>
//Holiday option



//end of code
  
// for date picker in dialog box
			$('#datepickerExit').datepicker({
		        
		        dateFormat: 'dd-mm-yy',
		        changeMonth: true,
		        changeYear: true,
		        yearRange: '-1:+1',
		        maxDate: new Date(),
		        constrainInput: true,
		        duration: '',
		        gotoCurrent: true,
		        beforeShow: function() {
		            setTimeout(function(){
		                $('.ui-datepicker').css('z-index', 99999999999999);
		            }, 0);
		        }

		    }).datepicker("setDate", new Date());

			
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
			
			

			$('#dateOfWheelAxleTesting').datepicker({
			       
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
		    });
			$('#dateOfCTRBTesting').datepicker({
			       
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
		    });
			
			$('#datepickerto').datepicker({
		        inline: true,
		        dateFormat: 'dd/mm/yy',
		        changeMonth: true,
		        changeYear: true,
		        yearRange: '-5:+5',
		        constrainInput: false,
		        duration: '',
		        gotoCurrent: true,
		        
//	 	        onSelect: function (selected) {
//	 	            $('#todoContainer').jtable('load');
//	 	            $("#datepickerr").datepicker("option", "minDate", selected)
//	 	        }
		    }).datepicker("setDate", new Date());
			
			//Date picker code end here
		//start code
			/*
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

		    }).datepicker("setDate", new Date());  */
			//end code
	$('#WheelsetProductionTableContainer').jtable({
			
			title : 'Wheel Shop Production',
			
			paging:true,
			//pageSize : 10,
			//pageSizes :[10,50,100],
            sorting: true,
            defaultSorting: 'axleNumber DESC',
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
      //Create toolbat
            toolbar: {
                items: [
                               
                	//Second Toolbar item for Exit/ Turnout
                    {
                    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'SIP for Axle Assembly',
                        click: function () {
                        	
                        	 var $selectedRows = $('#WheelsetProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you want to perform SIP");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
                    	 	// ajax call to show existing data
                    	 		$.ajax({
  						url : "showExistingDataOfWheel",  //action-name as defined in struts.xml
  						dataType: 'json', 
  						data : {
  							wheelsetAssetId: record.wheelsetAssetId,
  							             					
  						},
  						
  						type : 'POST',
  						async : false,
          	 		})
  						.done(function( msg ) {
  							$('#docNoWheelAxle').val(msg.docNoWheelAxle),
  							$('#drawingNoWheelAxle').val(msg.drawingNoWheelAxle),
  							$('#wiNoWheelAxle').val(msg.wiNoWheelAxle),
  							$('#wheelDiscLeftNoWheelAxle').val(msg.wheeldiscLeftNo),
  							$('#wheelDiscRightNoWheelAxle').val(msg.wheeldiscRightNo),
  							$('#axleNoWheelAxle').val(msg.axleNumber),
  							$('#axleMakeWheelAxle').val(msg.axleMake),
  							$('#wheelSetTypeWheelAxle').val(msg.wheelSetType),
  							$('#leftBrakeDiscMake').val(msg.leftBrakeDiscMake),
  							$('#rightBrakeDiscMake').val(msg.rightBrakeDiscMake),
  							$('#wheeldiscLeftMake').val(msg.wheeldiscLeftMake),
  							$('#wheeldiscRightMake').val(msg.wheeldiscRightMake);
  							$('#journalDiaLeft').val(msg.journalDiaLeft);
  							$('#journalDiaRight').val(msg.journalDiaRight);
  							$('#wheelDiaLeft').val(msg.wheelDiaLeft);
  							$('#wheelDiaRight').val(msg.wheelDiaRight);
  							$('#distanceBetweenWheel').val(msg.distanceBetweenWheel);
						  })
						.error(function (msg){
							//$('#dialog').dialog('close');
							alert("Error Fetching Wheel Details Data");
						})
						  ;
                    	 		if(record.sipWheelAssemblyFlag==1)
                  	 			{
                  	 		var cfm=confirm("Data for Wheel & Axle Assembly Inspection is already updated. Do you want to verify data?");
                          	if(cfm==false){return false;}	
                          	$("#dateOfWheelAxleTesting").val('');
                          	
                          	
                          	 
                          	  var dateOfWheelAxleTest,num,date;
                          	//yaha se code dekhana hai
                          	$.ajax({
          						url : "showExistingDataInSIPWheelAxle",  //action-name as defined in struts.xml  //abhi ye bhi kam nahi huwa hai
          						dataType: 'json', 
          						data : {
          							wheelsetAssetId: record.wheelsetAssetId,             					
          						},
          						
          						type : 'POST',
          						async : false,
                  	 		})
          						.done(function( msg ) {
          							if(msg.wheelSipTransaction!=null)
          								{
          							$('#docNoWheelAxle').val(msg.wheelSipTransaction.docNoWheelAxleTesting);
          						
          						   var dateOfWheelAxleTesting=(msg.wheelSipTransaction.dateOfWheelAxleTesting).substring(0,10);
                                
                                
                                var  dateWheelAxleTestingArray = dateOfWheelAxleTesting.match(/\d+/g); 
                        		
                                     var dateWheelAxleTesting = new Date(dateWheelAxleTestingArray[0], dateWheelAxleTestingArray[1]-1, dateWheelAxleTestingArray[2]);
          							$("#dateOfWheelAxleTesting").datepicker("setDate", dateWheelAxleTesting);
          							
          							$('#shiftWheelAxle').val(msg.wheelSipTransaction.shiftWheelAxleTesting);
          							$('#wiNoWheelAxle').val(msg.wheelSipTransaction.wiNoWheelAxle);
          							$('#heatNoWheelAxle').val(msg.wheelSipTransaction.heatNoWheelAxle);
          							$('#wheelTypeWheelAxle').val(msg.wheelsetTransaction.wheelDiscType);
          							$('#axleNoWheelAxle').val(msg.wheelsetTransaction.axleNumber);
          							$('#axleMakeWheelAxle').val(msg.wheelsetTransaction.axleMake);
          							$('#wheelSetTypeWheelAxle').val(msg.wheelsetTransaction.wheelSetType);
          							$('#journalDiaLeft').val(Math.round((msg.wheelsetTransaction.journalDiaLeft)*100)/100);
          							$('#journalDiaRight').val(Math.round((msg.wheelsetTransaction.journalDiaRight)*100)/100);
          							
          							$('#collarDiaLeft').val(Math.round((msg.wheelsetTransaction.collarDiaLeft)*100)/100);
          							$('#collarDiaRight').val(Math.round((msg.wheelsetTransaction.collarDiaRight)*100)/100);
          							$('#wheelDiaLeft').val(Math.round((msg.wheelsetTransaction.wheelDiaLeft)*100)/100);
          							$('#wheelDiaRight').val(Math.round((msg.wheelsetTransaction.wheelDiaRight)*100)/100);
          							$('#distanceBetweenWheel').val(Math.round((msg.wheelsetTransaction.distanceBetweenWheel)*100)/100);
          							
          							$('#distanceBetweenWheelfaceDiscface').val(Math.round((msg.wheelsetTransaction.distanceBetweenWheelfaceDiscface)*100)/100);
          							$('#brakeDiscPressureLeft').val(msg.wheelsetTransaction.brakeDiscPressureLeft);
          							$('#brakeDiscPressureRight').val(msg.wheelsetTransaction.brakeDiscPressureRight);
          							
          							$('#leftBrakeDiscMake').val(msg.wheelsetTransaction.leftBrakeDiscMake);
          							$('#rightBrakeDiscMake').val(msg.wheelsetTransaction.rightBrakeDiscMake);
          							$('#wheelDiscPressureLeft').val(msg.wheelsetTransaction.wheelDiscPressureLeft);
          							$('#wheelDiscPressureRight').val(msg.wheelsetTransaction.wheelDiscPressureRight);
          							$('#wheeldiscLeftMake').val(msg.wheelsetTransaction.wheeldiscLeftMake);
          							$('#wheeldiscRightMake').val(msg.wheelsetTransaction.wheeldiscRightMake);
          							
          							$('#wheelBalancingWeightLeft').val(msg.wheelsetTransaction.wheelBalancingWeightLeft);
          							$('#wheelBalancingWeightRight').val(msg.wheelsetTransaction.wheelBalancingWeightRight);
          							$('#wheelUnbalanceWeightLeft').val(msg.wheelsetTransaction.wheelUnbalanceWeightLeft);
          							$('#wheelUnbalanceWeightRight').val(msg.wheelsetTransaction.wheelUnbalanceWeightRight);
          							
          							
          							$('#stampParticularsLeftWheel').val(msg.wheelSipTransaction.stampParticularsLeftWheel);
          							$('#stampParticularsRightWheel').val(msg.wheelSipTransaction.stampParticularsRightWheel);
          							
          							$('#stampParticularsWheel').val(msg.wheelSipTransaction.stampParticularsWheel);
          							$('#stampParticularsAxle').val(msg.wheelSipTransaction.stampParticularsAxle);
          							
          							$('#modificationInWheelAxle').val(msg.wheelSipTransaction.modificationInWheelAxle);
          							$('#trialInWheelAxle').val(msg.wheelSipTransaction.trialInWheelAxle);
          							$('#remarksInWheelAxle').val(msg.wheelSipTransaction.remarksInWheelAxle);
          						
          								}
         
    							  })
    							.error(function (msg){
    								//$('#dialog').dialog('close');
    								alert("Error Fetching Wheel & Axle Assembly Testing Data");
    							})
    							  ;
                  	 			}
                  	 		
                  	 	 	$("#wheelAxleSIP").dialog({
                  	 	 		width: '65%',
                  	 	 
                  	 	 		title : 'Testing for Wheel and Axle Asembly' ,                     	 	 		
                  	 	 		close: function (e, u) {
                  	 	 		$('form[name="wheelAxle"]')[0].reset();
            	 		          	$("#wheelAxleSIP").validationEngine('hideAll');
            	 		           $('#WheelsetProductionTableContainer').jtable('load');
                  	 	 		    },
              	 		 	
    	 							buttons: {
    	 								Submit: {
                                           text: "Submit",
                                          
                                           click:function () {
                                        	   if ($('#docNoWheelAxle').validationEngine('validate')) {
		                                            return false;
		                                        }
                                        	   if ($('#dateOfWheelAxleTesting').validationEngine('validate')) {
		                                            return false;
		                                        }
                                        	   if ($('#drawingNoWheelAxle').validationEngine('validate')) {
		                                            return false;
		                                        }
                                        	   if ($('#wheelDiscLeftNoWheelAxle').validationEngine('validate')) {
		                                            return false;
		                                        }
                                        	   if ($('#wheelDiscRightNoWheelAxle').validationEngine('validate')) {
		                                            return false;
		                                        }
                                        	   if ($('#axleNoWheelAxle').validationEngine('validate')) {
		                                            return false;
		                                        }
                                        	   if ($('#axleMakeWheelAxle').validationEngine('validate')) {
		                                            return false;
		                                        }
                                        	   if ($('#wheelSetTypeWheelAxle').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   if ($('#journalDiaLeft').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   if ($('#journalDiaRight').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   if ($('#collarDiaLeft').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   if ($('#collarDiaRight').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   if ($('#wheelDiaLeft').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   if ($('#wheelDiaRight').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   if ($('#distanceBetweenWheel').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   if ($('#distanceBetweenWheelfaceDiscface').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   if ($('#brakeDiscPressureLeft').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   if ($('#brakeDiscPressureRight').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   if ($('#wheelDiscPressureLeft').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   if ($('#wheelDiscPressureRight').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   if ($('#wheelBalancingWeightLeft').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   if ($('#wheelBalancingWeightRight').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   if ($('#wheelUnbalanceWeightLeft').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   if ($('#wheelUnbalanceWeightRight').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                          var c=confirm("Verify data before submit, Are you sure to save data");
                                       	if(c==false){return false;}	    	   
                                       	$.ajax({
                       						url : "wheelAxleTestingAction",  //action-name as defined in struts.xml
                       						dataType: 'json', 
                       						data : {
                       							
                       							
                       							wheelsetAssetId: record.wheelsetAssetId,
                       							
                       							docNoWheelAxle:$('#docNoWheelAxle').val(),
                       							dateOfWheelAxleTesting:$('#dateOfWheelAxleTesting').val(),
                       							shiftWheelAxle:$('#shiftWheelAxle').val(),
                       							drawingNoWheelAxle:$('#drawingNoWheelAxle').val(),
                       							wiNoWheelAxle:$('#wiNoWheelAxle').val(),
                       							heatNoWheelAxle:$('#heatNoWheelAxle').val(),
                       							wheelDiscLeftNoWheelAxle:$('#wheelDiscLeftNoWheelAxle').val(),
                       							wheelDiscRightNoWheelAxle:$('#wheelDiscRightNoWheelAxle').val(),
                       							wheelTypeWheelAxle:$('#wheelTypeWheelAxle').val(),
                       							axleNoWheelAxle:$('#axleNoWheelAxle').val(),
                       							axleMakeWheelAxle:$('#axleMakeWheelAxle').val(),
                       							
                       							wheelSetTypeWheelAxle:$('#wheelSetTypeWheelAxle').val(),
                       							journalDiaLeft:$('#journalDiaLeft').val(),
                       							journalDiaRight:$('#journalDiaRight').val(),
                       							collarDiaLeft:$('#collarDiaLeft').val(),
                       							collarDiaRight:$('#collarDiaRight').val(),
                       							
                       							wheelDiaLeft:$('#wheelDiaLeft').val(),
                       							wheelDiaRight:$('#wheelDiaRight').val(),
                       							distanceBetweenWheel:$('#distanceBetweenWheel').val(),
                       							distanceBetweenWheelfaceDiscface:$('#distanceBetweenWheelfaceDiscface').val(),
                       							brakeDiscPressureLeft:$('#brakeDiscPressureLeft').val(),
                       						     
                       							leftBrakeDiscMake:$('#leftBrakeDiscMake').val(),
                       							brakeDiscPressureRight:$('#brakeDiscPressureRight').val(),
                       							rightBrakeDiscMake:$('#rightBrakeDiscMake').val(),
                       							wheelDiscPressureLeft:$('#wheelDiscPressureLeft').val(),
                       							wheeldiscLeftMake:$('#wheeldiscLeftMake').val(),
                       						    
                       							wheelDiscPressureRight:$('#wheelDiscPressureRight').val(),
                       							wheeldiscRightMake:$('#wheeldiscRightMake').val(),
                       							wheelBalancingWeightLeft:$('#wheelBalancingWeightLeft').val(),
                       							wheelBalancingWeightRight:$('#wheelBalancingWeightRight').val(),
                       							wheelUnbalanceWeightLeft:$('#wheelUnbalanceWeightLeft').val(),
                       						    
                       							wheelUnbalanceWeightRight:$('#wheelUnbalanceWeightRight').val(),
                       							stampParticularsLeftWheel:$('#stampParticularsLeftWheel').val(),
                       							stampParticularsRightWheel:$('#stampParticularsRightWheel').val(),
                       							stampParticularsWheel:$('#stampParticularsWheel').val(),
                       							stampParticularsAxle:$('#stampParticularsAxle').val(),
                       							
                       							modificationInWheelAxle:$('#modificationInWheelAxle').val(),
                       							trialInWheelAxle:$('#trialInWheelAxle').val(),
                       							remarksInWheelAxle:$('#remarksInWheelAxle').val(),
                       							
                       						},
                       						
                       						type : 'POST',
                       						async : false,
                               	 		
                       						success : function( msg ) {
                       							
                       							$('#docNoWheelAxle').val(''),
                       							$('#dateOfWheelAxleTesting').val(''),
                       							$('#shiftWheelAxle').val(''),
                       							$('#drawingNoWheelAxle').val(''),
                       							$('#wiNoWheelAxle').val(''),
                       							$('#heatNoWheelAxle').val(''),
                       							$('#wheelDiscLeftNoWheelAxle').val(''),
                       							$('#wheelDiscLeftNoWheelAxle').val(''),
                       							$('#wheelTypeWheelAxle').val(''),
                       							$('#axleNoWheelAxle').val(''),
                       							$('#axleMakeWheelAxle').val(''),
                       							
                       							$('#wheelSetTypeWheelAxle').val(''),
                       							$('#journalDiaLeft').val(''),
                       							$('#journalDiaRight').val(''),
                       							$('#collarlDiaLeft').val(''),
                       							$('#collarDiaRight').val(''),
                       							
                       							$('#wheellDiaLeft').val(''),
                       							$('#wheelDiaRight').val(''),
                       							$('#distanceBetweenWheel').val(''),
                       							$('#distanceBetweenWheelfaceDiscface').val(''),
                       							$('#brakeDiscPressureLeft').val(''),
                       						     
                       							$('#leftBrakeDiscMake').val(''),
                       							$('#brakeDiscPressureRight').val(''),
                       							$('#rightBrakeDiscMake').val(''),
                       							$('#wheelDiscPressureLeft').val(''),
                       							$('#wheeldiscLeftMake').val(''),
                       						    
                       							$('#wheelDiscPressureRight').val(''),
                       							$('#wheeldiscRightMake').val(''),
                       							$('#wheelBalancingWeightLeft').val(''),
                       							$('#wheelBalancingWeightRight').val(''),
                       							$('#wheelUnbalanceWeightLeft').val(''),
                       						    
                       							$('#wheelUnbalanceWeightRight').val(''),
                       							$('#stampParticularsLeftWheel').val(''),
                       							$('#stampParticularsRightWheel').val(''),
                       							$('#stampParticularsWheel').val(''),
                       							$('#stampParticularsAxle').val(''),
                       							
                       							$('#modificationInWheelAxle').val(''),
                       							$('#trialInWheelAxle').val(''),
                       							$('#remarksInWheelAxle').val(''),
                       							
                       							
                       							$('#wheelAxleSIP').dialog('close'),
                       							alert("saving Data");
                       							$('#WheelsetProductionTableContainer').jtable('load');
            								  },
            								error:function (msg){
            									$('#wheelAxleSIP').dialog('close');
            									//alert("Error saving Data");
            								}
                                       	}) ;
    				                 			    return true;
                                           }    
                  	 	 		    },
    			                        Close: function () {
    			                        	$('form[name="wheelAxle"]')[0].reset();
    			                                        $(this).dialog('close');
    			                                        
    			                                        $('#WheelsetProductionTableContainer').jtable('load');
    			                                    }
    	 								  },
                                       modal: true
    	 				    	    });
    	 				                    	 		
    	 			
    	 				            			    	   return true;
    	 				                    	 		    
    	 				                    	 			  
    	 				                    	 		  }//ending else               	  
    	 				                    	  // ajax call ends here				
                  		 }    						 
    	 			
                  	}  ,
                  	
                    {
                    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'SIP for CTRB',
                        click: function () {
                        	
                        	 var $selectedRows = $('#WheelsetProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you can enter SIP");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
                    	 	// ajax call to show existing data
                    	 		$.ajax({
  						url : "showExistingDataOfWheel",  //action-name as defined in struts.xml
  						dataType: 'json', 
  						data : {
  							wheelsetAssetId: record.wheelsetAssetId,             					
  						},
  						
  						type : 'POST',
  						async : false,
          	 		})
  						.done(function( msg ) {
  							$('#docNoCTRB').val(msg.docNoCTRB),
  							$('#drawingNoCTRB').val(msg.drawingNoCTRB),
  							$('#wiNoCTRB').val(msg.wiNoCTRB),
  							$('#axleNoCTRB').val(msg.axleNumber),
  							$('#axleMakeCTRB').val(msg.axleMake),
  							$('#wheelSetTypeCTRB').val(msg.wheelSetType);
  							if((msg.journalDiaLeft)!=null){
  								$('#journalDiaLeftCTRB').val(msg.journalDiaLeft.toFixed(2));	
  							}
  							if((msg.journalDiaRight)!=null){
  								$('#journalDiaRightCTRB').val(msg.journalDiaRight.toFixed(2));
  							}
  							if((msg.wheelDiaLeft)!=null){
  								$('#wheelDiaLeftCTRB').val(msg.wheelDiaLeft.toFixed(2));	
  							}
  							if((msg.wheelDiaRight)!=null){
  								$('#wheelDiaRightCTRB').val(msg.wheelDiaRight.toFixed(2));	
  							}
  							if((msg.distanceBetweenWheel)!=null){
  								$('#distanceBetweenWheelCTRB').val(msg.distanceBetweenWheel.toFixed(2));
  							}
  							
						  })
						.error(function (msg){
							//$('#dialog').dialog('close');
							alert("Error Fetching Wheel Details Data");
						})
						  ;
                    	 		if(record.sipWheelCtrbFlag==1)
                  	 			{
                  	 		var cfm=confirm("Data for CTRB Inspection is already updated. Do you want to verify data?");
                          	if(cfm==false){return false;}	
                          	$("#dateOfCTRBTesting").val('');
                          	
                          	
                          	 
                          	
                          	//yaha se code dekhana hai
                          	$.ajax({
          						url : "showExistingDataInSIPWheelAxle",  //action-name as defined in struts.xml  //abhi ye bhi kam nahi huwa hai
          						dataType: 'json', 
          						data : {
          							wheelsetAssetId: record.wheelsetAssetId,             					
          						},
          						
          						type : 'POST',
          						async : false,
                  	 		})
          						.done(function( msg ) {
          							if(msg.wheelSipTransaction!=null)
          								{
          							$('#docNoCTRB').val(msg.wheelSipTransaction.docNoCtrbTesting);
          						
          						   var dateOfCTRBTesting=(msg.wheelSipTransaction.dateOfCtrbTesting).substring(0,10);
                                
                                
                                var  dateCTRBTestingArray = dateOfCTRBTesting.match(/\d+/g); 
                        		
                                     var dateCTRBTesting = new Date(dateCTRBTestingArray[0], dateCTRBTestingArray[1]-1, dateCTRBTestingArray[2]);
          							$("#dateOfCTRBTesting").datepicker("setDate", dateCTRBTesting);
          							
          							$('#shiftCTRB').val(msg.wheelSipTransaction.shiftCtrbTesting);
          							$('#drawingNoCTRB').val(msg.wheelSipTransaction.drawingNoCtrb);
          							$('#wiNoCTRB').val(msg.wheelSipTransaction.wiNoCtrb);
          							
          							$('#axleNoCTRB').val(msg.wheelsetTransaction.axleNumber);
          							$('#axleMakeCTRB').val(msg.wheelsetTransaction.axleMake);
          							$('#wheelSetTypeCTRB').val(msg.wheelsetTransaction.wheelSetType);
          							
          							$('#ctrbItemAsDrawing').val(msg.wheelSipTransaction.ctrbItemAsDrawingFlag);
          							$('#ctrbComplianceWi').val(msg.wheelSipTransaction.ctrbComplianceWiFlag);
          							$('#fillingGreaseAxle').val(msg.wheelSipTransaction.fillingGreaseAxleFlag);
          							$('#differenceOfWheelDia').val(msg.wheelSipTransaction.differenceOfWheelDiaFlag);
          							$('#damageInJournalCTRB').val(msg.wheelSipTransaction.damageInJournalCtrb);
          							
          							$('#lateralClearanceLeftCTRB').val(msg.wheelsetTransaction.lateralClearanceLeftCTRB);
          							$('#lateralClearanceRightCTRB').val(msg.wheelsetTransaction.lateralClearanceRightCTRB);
          							$('#pressingPressureLeftCTRB').val(msg.wheelsetTransaction.pressingPressureLeftCTRB);
          							$('#pressingPressureRightCTRB').val(msg.wheelsetTransaction.pressingPressureRightCTRB);
          							
          							$('#tighteningHexagonalScrews').val(msg.wheelSipTransaction.tighteningHexagonalScrews);
          							$('#modificationInCTRB').val(msg.wheelSipTransaction.modificationInCtrb);
          							
          							$('#trialInCTRB').val(msg.wheelSipTransaction.trialInCtrb);
          							$('#remarksInCTRB').val(msg.wheelSipTransaction.remarksInCtrb);
          						
          								}
         
    							  })
    							.error(function (msg){
    								//$('#dialog').dialog('close');
    								alert("Error Fetching Wheel & Axle Assembly Testing Data");
    							})
    							  ;
                  	 			}
                  	 		
                  	 	 	$("#ctrbSIP").dialog({
                  	 	 		width: '65%',
                  	 	 
                  	 	 		title : 'Testing for CTRB Section' ,                     	 	 		
                  	 	 		close: function (e, u) {
                  	 	 		   $('form[name="ctrb"]')[0].reset();
            	 		          	$("#ctrbSIP").validationEngine('hideAll');
            	 		           $('#WheelsetProductionTableContainer').jtable('load');
                  	 	 		    },
              	 		 	
    	 							buttons: {
    	 								Submit: {
                                           text: "Submit",
                                          
                                           click:function () {
                                        	   if ($('#docNoCTRB').validationEngine('validate')) {
		                                            return false;
		                                        }
                                        	   if ($('#dateOfCTRBTesting').validationEngine('validate')) {
		                                            return false;
		                                        }
                                        	   if ($('#drawingNoCTRB').validationEngine('validate')) {
		                                            return false;
		                                        }
                                        	   if ($('#axleNoCTRB').validationEngine('validate')) {
		                                            return false;
		                                        }
                                        	   if ($('#axleMakeCTRB').validationEngine('validate')) {
		                                            return false;
		                                        }
                                        	   if ($('#wheelSetTypeCTRB').validationEngine('validate')) {
		                                            return false;
		                                        }
                                        	   if ($('#journalDiaLeftCTRB').validationEngine('validate')) {
		                                            return false;
		                                        }
                                        	   if ($('#journalDiaRightCTRB').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   if ($('#wheelDiaLeftCTRB').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   if ($('#wheelDiaRightCTRB').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   if ($('#distanceBetweenWheelCTRB').validationEngine('validate')) {
		                                            return false;
		                                        } 
                                        	   
                                          var c=confirm("Verify data before submit, Are you sure to save data");
                                       	if(c==false){return false;}	    	   
                                       	$.ajax({
                       						url : "ctrbTestingAction",  //action-name as defined in struts.xml
                       						dataType: 'json', 
                       						data : {
                       							
                       							
                       							wheelsetAssetId: record.wheelsetAssetId,
                       							
                       							docNoCtrbTesting: $('#docNoCTRB').val(),
                       							dateOfCtrbTesting:$("#dateOfCTRBTesting").val(),
                       							shiftCtrbTesting: $('#shiftCTRB').val(),
                       							drawingNoCtrb:$('#drawingNoCTRB').val(),
                       							wiNoCtrb:$('#wiNoCTRB').val(),
                       							
                       							axleNumber:$('#axleNoCTRB').val(),
                       							axleMake:$('#axleMakeCTRB').val(),
                       							wheelSetType:$('#wheelSetTypeCTRB').val(),
                       							
                       							ctrbItemAsDrawingFlag:$('#ctrbItemAsDrawing').val(),
                       							ctrbComplianceWiFlag:$('#ctrbComplianceWi').val(),
                       							fillingGreaseAxleFlag:$('#fillingGreaseAxle').val(),
                       							differenceOfWheelDiaFlag:$('#differenceOfWheelDia').val(),
                       							damageInJournalCtrb:$('#damageInJournalCTRB').val(),
                       							
                       							
                       							journalDiaLeft:$('#journalDiaLeftCTRB').val(),
                       							journalDiaRight:$('#journalDiaRightCTRB').val(),
                       							
                       						
                       							wheelDiaLeft:$('#wheelDiaLeftCTRB').val(),
                       							wheelDiaRight:$('#wheelDiaRightCTRB').val(),
                       							distanceBetweenWheel:$('#distanceBetweenWheelCTRB').val(),
                       							lateralClearanceLeftCTRB:$('#lateralClearanceLeftCTRB').val(),
                       							lateralClearanceRightCTRB:$('#lateralClearanceRightCTRB').val(),
                       							pressingPressureLeftCTRB:$('#pressingPressureLeftCTRB').val(),
                       							pressingPressureRightCTRB:$('#pressingPressureRightCTRB').val(),
                       							
                       							tighteningHexagonalScrews:$('#tighteningHexagonalScrews').val(),
                       							modificationInCtrb:$('#modificationInCTRB').val(),
                       							
                       							trialInCtrb: $('#trialInCTRB').val(),
                       							remarksInCtrb:$('#remarksInCTRB').val(),
                       						},
                       						
                       						type : 'POST',
                       						async : false,
                               	 		
                       						success : function( msg ) {
                       							
                       						   $('#docNoCTRB').val(''),
                       							$("#dateOfCTRBTesting").val(''),
                       							$('#shiftCTRB').val('')
                       							$('#drawingNoCTRB').val(''),
                       							$('#wiNoCTRB').val(''),
                       							
                       							$('#axleNoCTRB').val(''),
                       							$('#axleMakeCTRB').val(''),
                       							$('#wheelSetTypeCTRB').val(''),
                       							
                       							$('#ctrbItemAsDrawing').val(''),
                       							$('#ctrbComplianceWi').val(''),
                       							$('#fillingGreaseAxle').val(''),
                       							$('#differenceOfWheelDia').val(''),
                       							$('#damageInJournalCTRB').val(''),
                       							
                       							
                       							$('#journalDiaLeftCTRB').val(''),
                       							$('#journalDiaRightCTRB').val(''),
                       							
                       						
                       							$('#wheelDiaLeftCTRB').val(''),
                       							$('#wheelDiaRightCTRB').val(''),
                       							$('#distanceBetweenWheelCTRB').val(''),
                       							$('#lateralClearanceLeftCTRB').val(''),
                       							$('#lateralClearanceRightCTRB').val(''),
                       							$('#pressingPressureLeftCTRB').val(''),
                       							$('#pressingPressureRightCTRB').val(''),
                       							
                       							$('#tighteningHexagonalScrews').val(''),
                       							$('#modificationInCTRB').val(''),
                       							
                       							$('#trialInCTRB').val(''),
                       							$('#remarksInCTRB').val(''),
                       							
                       							
                       							$('#ctrbSIP').dialog('close'),
                       							alert("saving Data");
                       							$('#WheelsetProductionTableContainer').jtable('load');
            								  },
            								error:function (msg){
            									
            									$('#ctrbSIP').dialog('close');
            									//alert("Error saving Data");
            								}
                                       	}) ;
    				                 			    return true;
                                           }    
                  	 	 		    },
    			                        Close: function () {
    			                        	      $('form[name="ctrb"]')[0].reset();
    			                                        $(this).dialog('close');
    			                                        $('#WheelsetProductionTableContainer').jtable('load');
    			                                    }
    	 								  },
                                       modal: true
    	 				    	    });
    	 				                    	 		
    	 			
    	 				            			    	   return true;
    	 				                    	 		    
    	 				                    	 			  
    	 				                    	 		  }//ending else               	  
    	 				                    	  // ajax call ends here				
                  		 }    						 
    	 			
                  	}  ,
            ]
            },
            
			actions : {
				
 		  
 			listAction: 'listSIPWheelAction?stageID=<%=stageID%>',
 			
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
				
				wheelsetAssetId : {
					title : 'wheelsetAssetId',
					
					key: true,
					list : false,
					edit : false,
					create : false
									
					},
					
						assemblyStartDate: {
							title :'Mounting Date',
							width: '8%',
							inputClass: 'validate[required]',
// 							type: 'date',
// 							displayFormat: 'dd-mm-yy',
							display:function(data){
								//alert(data.record.id.hodyCode)	;				 
								return ((data.record.assemblyStartDate!=null) && (data.record.assemblyStartDate!="") ) ? moment(data.record.assemblyStartDate).format('DD-MM-YYYY') : "";
													}, 
												
											
							list: true,
							create: true,
							edit: false
											
							},
							axleMake:{
								title: 'Axle Make.',
								width: '8%',
								list : true,
								edit : true,
								create : true,
								options: {'':'select', "RWF":"RWF", "others":"others"},
									
								},
								axleNumber:{
									title: 'Axle No.',
									width: '8%',
									edit : true,	

								
									inputClass: 'validate[required]'
													
									},		
									wheeldiscRightNo: {
										title :'Right Wheel Disc No.',
										width: '8%',
										
										list: true,
										create: true,
										edit: true
										
										},
										wheeldiscRightMake: {
											title :'Right Wheeldisc Make',
											width: '8%',
											options: {'':'select', "ZB":"ZB", "TZ":"TZ","VR":"VR", "SAIL":"SAIL", "OTHER":"OTHER"},
											list: true,
											create: true,
											edit: true
															
											},

											wheeldiscLeftNo: {
												title :'Left Wheel Disc No.',
												width: '8%',
												
												list: true,
												create: true,
												edit: true,
												
												},
												wheeldiscLeftMake: {
													title :'Left Wheeldisc Make',
													width: '8%',
													options: {'':'select', "ZB":"ZB", "TZ":"TZ","VR":"VR", "SAIL":"SAIL", "OTHER":"OTHER"},
													list: true,
													create: true,
													edit: true
																	
													},
													rightBrakeDiscMake: {
														title :'Right Brake Disc Make',
														width: '8%',
														options: {'':'select', "FV":"FV", "KBI":"KBI","KNORR":"KNORR","OTHER":"OTHER"},
														list: true,
														create: true,
														edit: true
																		
														},

														leftBrakeDiscMake: {
															title :'Left Brake Disc Make',
															width: '8%',
															options: {'':'select', "FV":"FV", "KBI":"KBI","KNORR":"KNORR","OTHER":"OTHER"},
															list: true,
															create: true,
															edit: true
																			
															},

															ctrbRightMake:{
																title :'Right CTRB Make',
																width: '8%',
																options: {"":"select","Timken":"Timken", "SKF":"SKF", "others":"others"},
																list: true,
																create: true,
																edit: true
																},	
															
																ctrbRightNo:{
																	title :'Right CTRB No.',
																	width: '8%',
																	
																	list: true,
																	create: true,
																	edit: true
																	},

																	ctrbLeftMake:{
																		title :'Left CTRB Make',
																		width: '8%',
																		options: {"":"select","Timken":"Timken", "SKF":"SKF", "others":"others"},
																		list: true,
																		create: true,
																		edit: true
																		},	
																	
																		ctrbLeftNo:{
																			title :'Left CTRB No.',
																			width: '8%',
																			
																			list: true,
																			create: true,
																			edit: true
																			},
																			sipWheelAssemblyFlag:
																				{
																				title:'SIP for Wheel & AXLE ASSEMBLY',
																				display:function(data){
																					if(data.record.sipWheelAssemblyFlag==1)
																						{
																						return "Completed";
																						}
																					else
																						{
																						return "Not Completed";
																						}
																				}
																				},
																				sipWheelCtrbFlag:
																				{
																				title:'SIP for CTRB',
																				display:function(data){
																					if(data.record.sipWheelCtrbFlag==1)
																						{
																						return "Completed";
																						}
																					else
																						{
																						return "Not Completed";
																						}
																				}
																				},
																				
						
			},
			loadingRecords: function(event,data)
			{
				srno=0;
				// jQuery function to resize tbody widths based on width of thead
				jQuery.fn.resizeColumns = function () {
				    var $bodyCells = $(this).find('thead tr:first').children();
				    var colWidth = $bodyCells.map(function() {
				        return $(this).width();
				    }).get();
				 
				    // Set the width of thead columns
				    $(this).find('tbody tr:first').children().each(function(i, v) {
				        $(v).width(colWidth[i]);
				    });
				    return this;    // for jQuery chaining
				}
				 
				// Bind window resize handler
				$(window).resize(function() {
				    $('#WheelsetProductionTableContainer').resizeColumns();
				})

	//end of code
					
			},
			recordsLoaded: function(event, data) {
	     $(this).resizeColumns();

	 	

	     
				  if (prevStage!='START'){
					 
				     $('#WheelsetProductionTableContainer').find('.jtable-toolbar-item.jtable-toolbar-item-add-record').remove();
				  }
				  
				},
				formCreated: function (event, data) {
										
					$('[name=axleNumber]').keyup(function(){
					    this.value = this.value.toUpperCase();
					});

					$('[name=wheeldiscRightNo]').keyup(function(){
					    this.value = this.value.toUpperCase();
					});
					$('[name=wheeldiscLeftNo]').keyup(function(){
					    this.value = this.value.toUpperCase();
					});
					$('[name=ctrbRightNo]').keyup(function(){
					    this.value = this.value.toUpperCase();
					});
					$('[name=ctrbLeftNo]').keyup(function(){
					    this.value = this.value.toUpperCase();
					});
					$('[name=wheelsetTransactionId]').keyup(function(){
					    this.value = this.value.toUpperCase();
					});
					data.form.find('input[name="wheelsetTransactionId"]').attr('placeholder','Enter Wheel RBL no.');
					data.form.find('input[name="assemblyStartDate"]').attr('placeholder','Enter Mounting Date');
					data.form.find('input[name="wheeldiscRightNo"]').attr('placeholder','Enter right Wheleeldisc');	
					data.form.find('input[name="axleMake"]').attr('placeholder','Enter Axle Make');
					data.form.find('input[name="axleNumber"]').attr('placeholder','Enter Axle No.');
					data.form.find('input[name="wheeldiscLeftNo"]').attr('placeholder','Enter right Wheeldisc');
					data.form.find('input[name="ctrbRightNo"]').attr('placeholder','Enter right CTRB No.');
					data.form.find('input[name="ctrbLeftNo"]').attr('placeholder','Enter left CTRB No.');
					data.form.find('input[name="leftBrakeDiscMake"]').attr('placeholder','Enter left Brake Disc make');
					data.form.find('input[name="rightBrakeDiscMake"]').attr('placeholder','Enter right Brake Disc make');
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
					}).datepicker("option", "maxDate", new Date);

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
	    			$('#WheelsetProductionTableContainer').jtable('load');
	    		},
	    		recordUpdated:function(event,data)
				{
					srno=0;
					$('#WheelsetProductionTableContainer').jtable('load');
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
		   
		    $('#LoadRecordsButton').click(function (e) {
	            e.preventDefault();
			
	$('#WheelsetProductionTableContainer').jtable('load', {datefrom: $('#datepickerfrom').val(),dateto: $('#datepickerto').val()});

		    });
		       $('#LoadRecordsButton').click();
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