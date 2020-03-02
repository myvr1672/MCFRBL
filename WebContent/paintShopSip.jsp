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
	#intrPaintSIP{
		border:1px solid black;
		padding: 20px;
	}
	th{
		font-size:20px;
		padding:10px;
	}
	.t1{
		width:100%;
	}
	table.t1 td{
		padding:10px;
	}
	.t2{
		width:100%;
	}
	.t2 td{
		padding:10px;
	}
	.t3{
		width:70%;
	}
	#intrPaintFinal{
		border:1px solid black;
		padding: 20px;
	}
	td{
		padding:10px;
	}
	th{
		font-size:20px;
		padding:10px;
	}
	table{
		width:100%;
	}
	.t4{
		width:100%;
	}
	.t5{
		width:70%;
	}
	#extrPaintSip{
		border:1px solid black;
		padding: 30px;
	}
	table.t6 td{
		padding:10px;
	}
	th{
		font-size:20px;
		padding:10px;
	}
	.t7{
		width:100%;
	}
	.t7 td{
		padding:10px;
	}
	.t8{
		width:70%;
	}
</style>

</head>
<body>
<div id="PaintProductionTableContainer"></div>
    <div id="intrPaintSip" style="height:100%; width:75%; display:none;z-index: 9;" >
    <form name="intrPaintSip">
 		<table class="t2" border="1">
			<tr><td class="t3"><h1 Style="text-align:center"><b>Modern Coach Factory, Raebareli</b></h1><br>SELF INSPECTION REPORT FOR INTERIOR PAINTING, SOUND AND HEART INSULATION OF LHB SHELL</td><td>
			Form No.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="intrPaintSipDocNo" name="intrPaintSipDocNo" class="validate[required]"><br>Version. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="intrPaintSipVersNo" name="intrPaintSipVersNo"></td></tr>
		</table>
		<br><br>
		<table>
			<tr><td>Shell Type & No: </td><td><input id="shellNoIntrSip" type="text" name="shellNoIntrSip" readonly></td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td>Date: </td><td><input id="intrPaintSipDate" type="text" name="intrPaintSipDate" class="validate[required]"></td></tr>
			<tr><td>Furnishing No: </td><td><input id="furnishingNoIntrSip" type="text" name="furnishingNoIntrSip" class="validate[required]"></td><td></tr>
		</table>
		<br>
		<table  class="t1" border="1">
			<tr><th>S No.</th><th>Painting Activities</th><th>Specified</th><th>Observation</th><th>Date of Signing</th></tr>
			<tr><td>1.</td><td>Surface cleaning/garnet Balasting and compressed Air cleaning epoxy primer</td><td>As per WI PLHB 1A Sa2.5</td><td><textarea id="intrPaintSipSurfPrimer" name="intrPaintSipSurfPrimer"></textarea></td><td><input id="intrPaintSipSurfPrimerDate" type="text" name="intrPaintSipSurfPrimerDate" class="validate[required]"></td></tr>
		    <tr><td>2.</td><td>Application of Epoxy metal primer</td><td>As per WI PLHB 1 DFT 60<span>&#181;</span>(min)</td><td><textarea id="intrPaintSipAppEpoxyPrimer" name="intrPaintSipAppEpoxyPrimer"></textarea></td><td><input id="intrPaintSipAppEpoxyPrimerDate" type="text" name="intrPaintSipAppEpoxyPrimerDate" class="validate[required]"></td></tr>
			<tr><td>3.</td><td>Application of sound insulation as per drawing</td><td>As per WI PLHB -04 Version:01 (2mm)</td><td><textarea id="intrPaintSipAppSoundDrawing" name="intrPaintSipAppSoundDrawing"></textarea></td><td><input id="intrPaintSipAppSoundDrawingDate" type="text" name="intrPaintSipAppSoundDrawingDate" class="validate[required]"></td></tr>
			<tr><td>4.</td><td>Application of 60 mm heat resistance sheet for side wall</td><td>As per WI PLHB -05 Version:01</td><td><textarea id="intrPaintSipAppHeatResistSideWall" name="intrPaintSipAppHeatResistSideWall"></textarea></td><td><input id="intrPaintSipAppHeatResistSideWallDate" type="text" name="intrPaintSipAppHeatResistSideWallDate" class="validate[required]"></td></tr>
			<tr><td>5.</td><td>Application of 30 mm heat resistance sheet for floor</td><td>As per WI PLHB -05 Version:01</td><td><textarea id="intrPaintSipAppHeatResistFloor" name="intrPaintSipAppHeatResistFloor"></textarea></td><td><input id="intrPaintSipAppHeatResistFloorDate" type="text" name="intrPaintSipAppHeatResistFloorDate" class="validate[required]"></td></tr>
			<tr><td>6.</td><td>Application of 60 mm Aluminium foiled Glass wool</td><td>As per WI PLHB -05 Version:01</td><td><textarea id="intrPaintSipAppAlumGrosWool" name="intrPaintSipAppAlumGrosWool"></textarea></td><td><input id="intrPaintSipAppAlumGrosWoolDate" type="text" name="intrPaintSipAppAlumGrosWoolDate" class="validate[required]"></td></tr> 
		</table>
		</form>
  </div> 
  
  
   <div id="intrPaintFinal" style="height:100%; width:75%; display:none;z-index: 9;">
		<form name="intrPaintFinal">
		<table class="t2" border="1">
			<tr><td class="t3"><h1 Style="text-align:center"><b>Modern Coach Factory, Raebareli</b></h1><br>FINAL INSPECTION REPORT FOR INTERIOR PAINTING, SOUND AND HEAT INSULATION OF LHB SHELL</td><td>Form No.<input type="text" id="intrPaintFinalDocNo" name="intrPaintFinalDocNo"><br>Version. &nbsp;<input type="text" id="intrPaintFinalVersNo" name="intrPaintFinalVersNo"></td></tr>
		</table>
		<br><br>
		<table>
			<tr><td>Shell Type & No: <input id="shellNoIntrFinal" type="text" name="shellNoIntrFinal"></td><td>Furnishing No: <input id="furnishingNoIntrFinal" type="text" name="furnishingNoIntrFinal"></td><td>Date: <input id="intrPaintFinalDate" type="text" name="intrPaintFinalDate" class="validate[required]"></td></tr>	
		</table>
		<br>
		<table border="1">
			<tr><th><b>S No:</b> </th><th><b>Parameter</b></th><th><b>Observation</b></th><th><b>Reasons</b></th></tr>
			<tr><td>1. </td><td>Usual eaxmination surface prepration by gamet blastime</td><td><textarea id="intrPaintFinalGarnetBlastingFlag" name="intrPaintFinalGarnetBlastingFlag"></textarea></td><td><input id="intrPaintFinalGarnetBlastingReas" type="text" name="intrPaintFinalGarnetBlastingReas"></td></tr>
		    <tr><td>2. </td><td>Application of exopy phosphate primer<br>a) Should be smooth and full coverage<br> b) DFT (60&mu; minimum)</td><td><textarea id="intrPaintFinalEpoxyPhosphateFlag" name="intrPaintFinalEpoxyPhosphateFlag"></textarea></td><td><input id="intrPaintFinalEpoxyPhosphateReas" type="text" name="intrPaintFinalEpoxyPhosphateReas"></td></tr>
			<tr><td>3. </td><td>Application of sound insulation as per drawing</td><td><textarea id="intrPaintFinalSoundInsulDrawingFlag" name="intrPaintFinalSoundInsulDrawingFlag"></textarea></td><td><input id="intrPaintFinalSoundInsulDrawingReas" type="text" name="intrPaintFinalSoundInsulDrawingReas"></td></tr> 
		</table>
		<br>
		<table>
			<tr><td>Shell No: <input type="text" id="shellNoIntrFinal1" name="shellNoIntrFinal1"> is <input id="intrPaintFinalClearFlag" type="radio" name="intrPaintFinalClearFlag" value="cleared">Cleared <input id="intrPaintFinalClearFlag" type="radio" name="intrPaintFinalClearFlag" value="notCleared">Not Cleared</td></tr>
		</table>
		</form>
	</div> 
	
	
	
	
	
	<div id="extrPaintSip" style="height:100%; width:75%; display:none;z-index: 9;">
	<form name="extrPaintSip">
	<table class="t2" border="1">
		<tr><td class="t3" Style="text-align:center"><h1 style="text-align:center"><b>Modern Coach Factory, Raebareli</b></h1><br>SELF INSPECTION FOR EXTERIOR PAINTING OF LHB SHELL</td><td>Form No.<input type="text" id="extrPaintSipDocNo" name="extrPaintSipDocNo" class="validate[required]"><br>Version. &nbsp;<input type="text" id="extrPaintSipVersNo" name="extrPaintSipVersNo"></td></tr>
	</table>
	<br><br>
	<table>
		<tr><td>Shell Type & No:</td><td><input id="shellNoExtrSip" type="text" name="shellNoExtrSip" readonly></td></tr>
		<tr><td>Furnishing No:</td><td><input id="furnishingNoExtrSip" type="text" name="furnishingNoExtrSip"></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>Date: </td><td><input id="extrPaintSipDate" type="text" name="extrPaintSipDate" class="validate[required]"></td></tr>
	</table>
	<br>
	<table class="t1" border="1">
		<tr><th><b>Paint Stage</b></th><th><b>Painting Activities</b></th><th><b>WI Reference</b></th><th><b>Make of Paint</b></th><th><b>Specified Limits</b></th><th><b>Observed Value</b></th><th><b>Date of Signing</b></th></tr>
		<tr><td rowspan=2>Stage 1</td><td>Surface Preparation & cleaning</td><td>As Per Doc No PLW 0951 Ver Nill</td><td><input id="extrPaintSipStage1SurfPrepMake" type="text" name="extrPaintSipStage1SurfPrepMake"></td><td>Surface finish</td><td><textarea id="extrPaintSipStage1SurfPrep" name="extrPaintSipStage1SurfPrep"></textarea></td><td><input id="extrPaintSipStage1SurfPrepDate" type="text" name="extrPaintSipStage1SurfPrepDate"></td></tr>
		<tr><td>Application of epoxy metal primer</td><td>As Per Doc No PLW 0952 Ver Nill</td><td><input id="extrPaintSipStage1AppPrimerMake" type="text" name="extrPaintSipStage1AppPrimerMake"></td><td>DFT 60&mu;(min)</td><td><textarea id="extrPaintSipStage1AppPrimer" name="extrPaintSipStage1AppPrimer"></textarea></td><td><input id="extrPaintSipStage1AppPrimerDate" type="text" name="extrPaintSipStage1AppPrimerDate"></td></tr>
		<tr><td rowspan=2>Stage 2</td><td>Application of Polyster Filler on joints & on side walls and end walls(two coats)</td><td>As Per Doc No PLW 0953 Ver Nill & 0954 Ver Nill</td><td><input id="extrPaintSipStage2AppWallMake" type="text" name="extrPaintSipStage2AppWallMake"></td><td rowspan=2>DFT 60&mu;(min)</td><td><textarea id="extrPaintSipStage2AppWall" name="extrPaintSipStage2AppWall"></textarea></td><td><input id="extrPaintSipStage2AppWallDate" type="text" name="extrPaintSipStage2AppWallDate"></td></tr>
		<tr><td>Rub down of polyster filler & application of fine filler</td><td>As Per Doc No PLW 0955 Ver Nill</td><td><input id="extrPaintSipStage2RubFillerMake" type="text" name="extrPaintSipStage2RubFillerMake"></td><td><textarea id="extrPaintSipStage2RubFiller" name="extrPaintSipStage2RubFiller"></textarea></td><td><input id="extrPaintSipStage2RubFillerDate" type="text" name="extrPaintSipStage2RubFillerDate"></td></tr>
		<tr><td rowspan=4>Stage 3</td><td>Application of spot putty & its rub down</td><td>As Per Doc No PLW 0957 Ver Nill</td><td><input id="extrPaintSipStage3AppRubMake" type="text" name="extrPaintSipStage3AppRubMake"></td><td>DFT 60&mu;(min)</td><td><textarea id="extrPaintSipStage3AppRub" name="extrPaintSipStage3AppRub"></textarea></td><td><input id="extrPaintSipStage3AppRubDate" type="text" name="extrPaintSipStage3AppRubDate"></td></tr>
		<tr><td>Application of PU Surface</td><td>As Per Doc No PLW 0958 Ver Nill</td><td><input id="extrPaintSipStage3AppSurfMake" type="text" name="extrPaintSipStage3AppSurfMake"></td><td>DFT 60&mu;(min)</td><td><textarea id="extrPaintSipStage3AppSurf" name="extrPaintSipStage3AppSurf"></textarea></td><td><input id="extrPaintSipStage3AppSurfDate" type="text" name="extrPaintSipStage3AppSurfDate"></td></tr>
		<tr><td>Rub down of PU Surface</td><td>As Per Doc No PLW 0959 Ver Nill</td><td><input id="extrPaintSipStage3RubSurfMake" type="text" name="extrPaintSipStage3RubSurfMake"></td><td>DFT 60&mu;(min)</td><td><textarea id="extrPaintSipStage3RubSurf" name="extrPaintSipStage3RubSurf"></textarea></td><td><input id="extrPaintSipStage3RubSurfDate" type="text" name="extrPaintSipStage3RubSurfDate"></td></tr>
		<tr><td>Application of PU Top coat Enamels</td><td>As Per Doc No PLW 0960 Ver Nill</td><td><input id="extrPaintSipStage3AppCoatMake" type="text" name="extrPaintSipStage3AppCoatMake"></td><td>DFT 40-50&mu;</td><td><textarea id="extrPaintSipStage3AppCoat" name="extrPaintSipStage3AppCoat"></textarea></td><td><input id="extrPaintSipStage3AppCoatDate" type="text" name="extrPaintSipStage3AppCoatDate"></td></tr> 
	</table>
	<br>
	<br>
	<h3><b>Gloss Value After Top Coat</b></h3>
	<table>
		<tr><td>Side Wall</td><td><input id="extrPaintSipGrosValuSideWall" type="text" name="extrPaintSipGrosValuSideWall" placeholder='0.00' class='validate[custom[number]]'></td></tr>
		<tr><td>End Wall</td><td><input id="extrPaintSipGrosValuEndWall" type="text" name="extrPaintSipGrosValuEndWall"  placeholder='0.00' class='validate[custom[number]]'></td></tr>
	</table>
	</form>
	</div>
	
	


	<div id="extrPaintFinal" style="height:100%; width:75%; display:none;z-index: 9;">
	<form name="extrPaintFinal">
	<table class="t2" border="1">
		<tr><td class="t3" style="text-align:center"><h1><b>Modern Coach Factory, Raebareli</b></h1><br>FINAL INSPECTION REPORT FOR EXTERIOR PAINTING OF SHELL</td><td>Form No.<input type="text" id="extrPaintFinalDocNo" name="extrPaintFinalDocNo"><br>Version. &nbsp;<input type="text" id="extrPaintFinalVersNo" name="extrPaintFinalVersNo"></td></tr>
	</table>
	<br><br>
	<table class="t1">
		<tr><td>1.</td><td>Shell type & No: <input id="shellNoExtrFinal" type="text" name="shellNoExtrFinal"></td><td>Furnishing No: <input id="furnishingNoExtrFinal" type="text" name="furnishingNoExtrFinal"></td><td>Date: <input id="extrPaintFinalDate" type="text" name="extrPaintFinalDate"></td></tr>
		<tr><td>2.</td><td colspan=2>Wheather painted surface reasonable free from detects: </td><td><input id="extrPaintFinalSurfDefectFreeFlag" type="radio" name="extrPaintFinalSurfDefectFreeFlag" value="Yes">Yes <input id="extrPaintFinalSurfDefectFreeFlag" type="radio" name="extrPaintFinalSurfDefectFreeFlag" value="No">No</td></tr>
		<tr><td>3.</td><td>Painting defects observed: </td></tr>
		<tr><td>A)</td><td>Side Wall:</td><td><input id="extrPaintFinalDefectObservSideWallFlag" type="radio" name="extrPaintFinalDefectObservSideWallFlag" value="Ok">Ok <input id="extrPaintFinalDefectObservSideWallFlag" type="radio" name="extrPaintFinalDefectObservSideWallFlag" value="NotOk">Not Ok</td></tr>
		<tr><td>B)</td><td>End Wall:</td><td><input id="extrPaintFinalDefectObservEndWallFlag" type="radio" name="extrPaintFinalDefectObservEndWallFlag" value="Ok">Ok <input id="extrPaintFinalDefectObservEndWallFlag" type="radio" name="extrPaintFinalDefectObservEndWallFlag" value="NotOk">Not Ok</td></tr>
		<tr><td>C)</td><td>Roof:</td><td><input id="extrPaintFinalDefectObservEndRoofFlag" type="radio" name="extrPaintFinalDefectObservEndRoofFlag" value="Ok">Ok <input id="extrPaintFinalDefectObservEndRoofFlag" type="radio" name="extrPaintFinalDefectObservEndRoofFlag" value="NotOk">Not Ok</td></tr>
	</table>
	<table class="t1">
		<tr><td>Finish & coverage of painted surface: </td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><input id="extrPaintFinalFinishSurfFlag" type="radio" name="extrPaintFinalFinishSurfFlag" value="satisfactory">Satisfactory <input type="radio" id="extrPaintFinalFinishSurfFlag" name="extrPaintFinalFinishSurfFlag" value="notSatisfactory">Not Satisfactory</td></tr>
		<tr><td>Adhesion & compatibility of painted system: </td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td><input id="extrPaintFinalAdhensionSurfFlag" type="radio" name="extrPaintFinalAdhensionSurfFlag" value="satisfactory">Satisfactory <input id="extrPaintFinalAdhensionSurfFlag" type="radio" name="extrPaintFinalAdhensionSurfFlag" value="notSatisfactory">Not Satisfactory</td></tr>
	</table>
	<br>
	
	<h4><b>Gloss Value (Min 51 at 45deg or B5 at 60deg)</b></h4>
	
	<table>
		<tr><td>a)</td><td>Side Wall</td><td><input id="extrPaintFinalGrosValuSideWall" type="text" name="extrPaintFinalGrosValuSideWall" placeholder='0.00' class='validate[custom[number]]'></td></tr><tr><td>b)</td><td>End Wall</td><td><input id="extrPaintFinalGrosValuEndWall" type="text" name="extrPaintFinalGrosValuEndWall" placeholder='0.00' class='validate[custom[number]]'></td></tr>
	</table>
	<br>
	<br>
	<br>
	<table>
	<tr><td>Remarks Shell No: <input type="text" id="shellNoExtrFinal1" name="shellNoExtrFinal1"> is <input id="extrPaintFinalClearFlag" type="radio" value="cleared" name="extrPaintFinalClearFlag">Cleared <input id="extrPaintFinalClearFlag" type="radio" value="notCleared" name="extrPaintFinalClearFlag">Not Cleared</td></tr>
	</table>
	</form>
</div>	 
      
      
 </body>




<script type="text/javascript">
		$(document).ready(function() {
			//retrieve coach type 
		       $("#coachType").append('<option value="">Select</option>');
					
					
					<c:forEach var="a" items="${coachType}">
					
					var o = new Option("${a}", "${a}");
					
					$("#coachType").append(o);
				
			    </c:forEach>
//end of code

			
// for date picker in dialog box

	//Date picker code end here
		//start code
			 $('#intrPaintFinalDate').datepicker({			//IntrPaintFinal
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
		    
			 $('#extrPaintSipDate').datepicker({			//ExtrPaintSip
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

			
			 $('#extrPaintSipStage1SurfPrepDate').datepicker({			
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

			 $('#extrPaintSipStage1AppPrimerDate').datepicker({			
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

			 $('#extrPaintSipStage2AppWallDate').datepicker({			//IntrPaintFinal
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

			 $('#extrPaintSipStage2RubFillerDate').datepicker({			//IntrPaintFinal
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

			 $('#extrPaintSipStage3AppRubDate').datepicker({			//IntrPaintFinal
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

			 $('#extrPaintSipStage3AppSurfDate').datepicker({			//IntrPaintFinal
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

			$('#extrPaintSipStage3RubSurfDate').datepicker({			//IntrPaintFinal
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

			$('#extrPaintSipStage3AppCoatDate').datepicker({			//IntrPaintFinal extrPaintFinalDate
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

			$('#extrPaintFinalDate').datepicker({			//IntrPaintFinal 
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

			
			
			$('#intrPaintSipDate').datepicker({             //IntrPaintSip
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

			 $('#intrPaintSipSurfPrimerDate').datepicker({             //IntrPaintSip
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
			
			 $('#intrPaintSipAppEpoxyPrimerDate').datepicker({             //IntrPaintSip
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

			$('#intrPaintSipAppSoundDrawingDate').datepicker({             //IntrPaintSip
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

			$('#intrPaintSipAppHeatResistSideWallDate').datepicker({             //IntrPaintSip
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

			$('#intrPaintSipAppHeatResistFloorDate').datepicker({             //IntrPaintSip
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

			$('#intrPaintSipAppAlumGrosWoolDate').datepicker({             //IntrPaintSip
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
	$('#PaintProductionTableContainer').jtable({
			
			title : 'Paint Shop Production',
			
			paging:true,
            sorting: true,
            defaultSorting: 'assemblyStartDate DESC',
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
      //Create toolbar
            toolbar: {
                items: [
                	// first toolbar
                	//Second Toolbar item for Exit/ Turnout
                    {
                    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'Interior Paint SIP',
                        click: function () {
                        	 var $selectedRows = $('#PaintProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you want to Enter Interior SIP");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
								//setting min value
								// set already existing data
								$.ajax({
	                    						url : "showExistingDataOfPaint",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						async:false,
	                    						data : {
	                    							paintAssetId: record.paintAssetId,
	                    						},
	                    						success:function(data)
	                    						{
	                    							$('#intrPaintSipDocNo').val(data.formNoIntrSipPaint),	
	                    							$('#intrPaintSipVersNo').val(data.formVerIntrSipPaint),
	                    							$('#shellNoIntrSip').val(data.shellNo_Type),
	                    							$('#furnishingNoIntrSip').val(data.furnishingNo)
	                    							
	                    							
	                    						}
								});
								//end of code
								if(record.intrPaintSipFlag==1)
									{
									$.ajax({
                						url : "showExistingDataOfIntrPaintSip",  //action-name as defined in struts.xml
                						dataType: 'json', 
                						async:false,
                						data : {
                							paintAssetId: record.paintAssetId,
                						},
                						success:function(data)
                						{
                							$('#intrPaintSipDocNo').val(data.intrPaintFinalSipTran.intrPaintSipDocNo);	
                							$('#intrPaintSipVersNo').val(data.intrPaintFinalSipTran.intrPaintSipVersNo);
                							$('#furnishingNoIntrSip').val(data.paintTransaction.furnishingNumber);
                							
                							// manoj code start here
                							var date1=(data.intrPaintFinalSipTran.intrPaintSipDate).substring(0,10);
                							var date1Array=date1.split("-");
                							$('#intrPaintSipDate').datepicker("setDate",new Date(date1Array[0],date1Array[1]-1,date1Array[2]));
                							
                						
                							
                							$('#intrPaintSipSurfPrimer').val(data.intrPaintFinalSipTran.intrPaintSipSurfPrimer); 
                							
                							var date2=(data.intrPaintFinalSipTran.intrPaintSipSurfPrimerDate).substring(0,10);
                							var date2Array=date2.split("-");
                							$('#intrPaintSipSurfPrimerDate').datepicker("setDate",new Date(date2Array[0],date2Array[1]-1,date2Array[2]));
                							
                							
                							
                							$('#intrPaintSipAppEpoxyPrimer').val(data.intrPaintFinalSipTran.intrPaintSipAppEpoxyPrimer);
                							
                							var date3=(data.intrPaintFinalSipTran.intrPaintSipAppEpoxyPrimerDate).substring(0,10);
                							var date3Array=date3.split("-");
                							$('#intrPaintSipAppEpoxyPrimerDate').datepicker("setDate",new Date(date3Array[0],date3Array[1]-1,date3Array[2]));
                							
                							

                							$('#intrPaintSipAppSoundDrawing').val(data.intrPaintFinalSipTran.intrPaintSipAppSoundDrawing);
                							
                							var date4=(data.intrPaintFinalSipTran.intrPaintSipAppSoundDrawingDate).substring(0,10);
                							var date4Array=date4.split("-");
                							$('#intrPaintSipAppSoundDrawingDate').datepicker("setDate",new Date(date4Array[0],date4Array[1]-1,date4Array[2]));
                							
                							
                						    $('#intrPaintSipAppHeatResistSideWall').val(data.intrPaintFinalSipTran.intrPaintSipAppHeatResistSideWall);
                						    
                						    var date5=(data.intrPaintFinalSipTran.intrPaintSipAppHeatResistSideWallDate).substring(0,10);
                							var date5Array=date5.split("-");
                							$('#intrPaintSipAppHeatResistSideWallDate').datepicker("setDate",new Date(date5Array[0],date5Array[1]-1,date5Array[2]));
                							
                						
                							
                							$('#intrPaintSipAppHeatResistFloor').val(data.intrPaintFinalSipTran.intrPaintSipAppHeatResistFloor);
                							
                							 var date6=(data.intrPaintFinalSipTran.intrPaintSipAppHeatResistFloorDate).substring(0,10);
                 							var date6Array=date6.split("-");
                 							$('#intrPaintSipAppHeatResistFloorDate').datepicker("setDate",new Date(date6Array[0],date6Array[1]-1,date6Array[2]));
                							
                						
                							$('#intrPaintSipAppAlumGrosWool').val(data.intrPaintFinalSipTran.intrPaintSipAppAlumGrosWool);
                							
                							 var date7=(data.intrPaintFinalSipTran.intrPaintSipAppAlumGrosWoolDate).substring(0,10);
                 							var date7Array=date7.split("-");
                 							$('#intrPaintSipAppAlumGrosWoolDate').datepicker("setDate",new Date(date7Array[0],date7Array[1]-1,date7Array[2]));
                							
                							 
                					
                							// manoj code end here
                							
                						}
						                });
									}
								
								
								
								$('#intrPaintSipDate').datepicker('option', 'minDate', new Date(record.assemblyEndDate));
								
								
								
                    	 	 	$("#intrPaintSip").dialog({
                    	 	 		title : 'Interior SIP for  '+record.paintAssetId,
                    	 	 		width: '60%',
                    	 	 		close: function (e, u) {
                    	 	 			 $('form[name="intrPaintSip"]')[0].reset() ;
              	 		          	$("#intrPaintSip").validationEngine('hideAll');
              	 		          },
                	 		 	
 		 							buttons: {
	                                    Submit: {
	                                       text: "Submit",
	                                        id: "my-button-submit",
	                                        click:function () {
	                                    	
	                                    	if ($('#intrPaintSipDocNo').validationEngine('validate')) {
				                                            return false;
				                                        }
	                                    	if ($('#intrPaintSipDate').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           if ($('#furnishingNoIntrSip').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           var c=confirm("Do you want to submit data");
	                                    	if(c==false){return false;}
	                                    	$.ajax({
	                    						url : "saveIntrPaintSip",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						data : {
	                    							
	                    							paintAssetId: record.paintAssetId,
	                    							intrPaintSipDocNo:$('#intrPaintSipDocNo').val(),
	                    							
	                    							intrPaintSipVersNo:$('#intrPaintSipVersNo').val(),                   							
	                    							intrPaintSipDate:$('#intrPaintSipDate').val(),              							
	                    							furnishingNoIntrSip:$('#furnishingNoIntrSip').val(),
	                    							
	                    							intrPaintSipSurfPrimer:$('#intrPaintSipSurfPrimer').val(),
	                    							intrPaintSipSurfPrimerDate:$('#intrPaintSipSurfPrimerDate').val(),
	                    							
	                    							intrPaintSipAppEpoxyPrimer:$('#intrPaintSipAppEpoxyPrimer').val(),
	                    							intrPaintSipAppEpoxyPrimerDate:$('#intrPaintSipAppEpoxyPrimerDate').val(),
	                    							
	                    							intrPaintSipAppSoundDrawing:$('#intrPaintSipAppSoundDrawing').val(),
	                    							intrPaintSipAppSoundDrawingDate:$('#intrPaintSipAppSoundDrawingDate').val(),
	                    							
	                    							intrPaintSipAppHeatResistSideWall:$('#intrPaintSipAppHeatResistSideWall').val(), 
	                    							intrPaintSipAppHeatResistSideWallDate:$('#intrPaintSipAppHeatResistSideWallDate').val(),
	                    							
	                    							intrPaintSipAppHeatResistFloor:$('#intrPaintSipAppHeatResistFloor').val(),
	                    							intrPaintSipAppHeatResistFloorDate:$('#intrPaintSipAppHeatResistFloorDate').val(),
	                    							
	                    							intrPaintSipAppAlumGrosWool:$('#intrPaintSipAppAlumGrosWool').val(),
	                    							intrPaintSipAppAlumGrosWoolDate:$('#intrPaintSipAppAlumGrosWoolDate').val(), 
	                    						},
	                    						
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							
	                    							
	                    							$('#intrPaintSipDocNo').val(''),
	                    							$('#intrPaintSipVersNo').val(''),                   							
	                    							$('#intrPaintSipDate').val(''),               							
	                    							$('#furnishingNoIntrSip').val(''),   
	                    							$('#intrPaintSipSurfPrimer').val(''),   
	                    							$('#intrPaintSipSurfPrimerDate').val(''),   
	                    						 	 $('#intrPaintSipAppEpoxyPrimer').val(''),   
	                    							$('#intrPaintSipAppEpoxyPrimerDate').val(''),   
	                    							
	                    							$('#intrPaintSipAppSoundDrawing').val(''),   
	                    							$('#intrPaintSipAppSoundDrawingDate').val(''),    
	                    							
	                    							$('#intrPaintSipAppHeatResistSideWall').val(''),   
	                    							$('#intrPaintSipAppHeatResistSideWallDate').val(''),   
	                    							
	                    							$('#intrPaintSipAppHeatResistFloor').val(''),   
	                    							$('#intrPaintSipAppHeatResistFloorDate').val(''),   
	                    							
	                    							$('#intrPaintSipAppAlumGrosWool').val(''),   
	                    							$('#intrPaintSipAppAlumGrosWoolDate').val(''),  
                     							
	                    							$('#intrPaintSip').dialog('close'),
	                    							
	                    							$('#PaintProductionTableContainer').jtable('load');
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
				                        	$('form[name="intrPaintSip"]')[0].reset() ;
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
                	
                	
                //end of first toolbar
                	
				//start of second tool bar (IntrPaintFinal)               	
                	
				 {
                    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'Interior Paint Final',
                        click: function () {
                        	 var $selectedRows = $('#PaintProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you want to Enter Interior Final");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
								//setting min value
								// set already existing data
								 $.ajax({
	                    						url : "showExistingDataOfPaint",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						async:false,
	                    						data : {
	                    							paintAssetId: record.paintAssetId,
	                    						},
	                    						success:function(data)
	                    						{
	                    							$('#intrPaintFinalDocNo').val(data.formNoIntrFinalPaint),	
	                    							$('#intrPaintFinalVersNo').val(data.formVerIntrFinalPaint),
	                    							$('#shellNoIntrFinal').val(data.shellNo_Type),
	                    							$('#furnishingNoIntrFinal').val(data.furnishingNo),
	                    							$('#shellNoIntrFinal1').val(data.shellNo)
	                    						}
								}); 
								//end of code
								 if(record.intrPaintFinalFlag==1)
									{
									$.ajax({
                						url : "showExistingDataOfIntrPaintFinal",  //action-name as defined in struts.xml
                						dataType: 'json', 
                						async:false,
                						data : {
                							paintAssetId: record.paintAssetId,
                						},
                						success:function(data)
                						{
                							$('#intrPaintFinalDocNo').val(data.intrPaintFinalSipTran.intrPaintFinalDocNo);	
                							$('#intrPaintFinalVersNo').val(data.intrPaintFinalSipTran.intrPaintFinalVersNo);
                							var date8=(data.intrPaintFinalSipTran.intrPaintFinalDate).substring(0,10);
                							var date8Array=date8.split("-");
                							$('#intrPaintFinalDate').datepicker("setDate",new Date(date8Array[0],date8Array[1]-1,date8Array[2]));
                						
                							$('#furnishingNoIntrFinal').val(data.paintTransaction.furnishingNumber);
                							
                							// manoj code start here
                							
                							$('#intrPaintFinalGarnetBlastingFlag').val(data.intrPaintFinalSipTran.intrPaintFinalGarnetBlastingFlag);                							
                							$('#intrPaintFinalGarnetBlastingReas').val(data.intrPaintFinalSipTran.intrPaintFinalGarnetBlastingReas);
                						
                							$('#intrPaintFinalEpoxyPhosphateFlag').val(data.intrPaintFinalSipTran.intrPaintFinalEpoxyPhosphateFlag);
                							$('#intrPaintFinalEpoxyPhosphateReas').val(data.intrPaintFinalSipTran.intrPaintFinalEpoxyPhosphateReas);
                							
                							$('#intrPaintFinalSoundInsulDrawingFlag').val(data.intrPaintFinalSipTran.intrPaintFinalSoundInsulDrawingFlag);
                							$('#intrPaintFinalSoundInsulDrawingReas').val(data.intrPaintFinalSipTran.intrPaintFinalSoundInsulDrawingReas);
                							
                							$('[id="intrPaintFinalClearFlag"]').val([data.intrPaintFinalSipTran.intrPaintFinalClearFlag]);
                							
                							
                					
                							// manoj code end here
                							
                						}
						                });
									} 
								
								
								
								$('#intrPaintFinalDate').datepicker('option', 'minDate', new Date(record.assemblyEndDate));
								
								
								
                    	 	 	$("#intrPaintFinal").dialog({
                    	 	 		title : 'Interior Final for  '+record.paintAssetId,      
                    	 	 		width:'60%',
                    	 	 		close: function (e, u) {
                    	 	 			$('form[name="intrPaintFinal"]')[0].reset() ;
              	 		          	$("#intrPaintFinal").validationEngine('hideAll');
              	 		          },
                	 		 	
 		 							buttons: {
	                                    Submit: {
	                                       text: "Submit",
	                                        id: "my-button-submit",
	                                        click:function () {
	                                    	
	                                    	
	                                    	if ($('#intrPaintFinalDate').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
	                                    	
	                                    	var c=confirm("Do you want to submit data");
	                                    	if(c==false){return false;}
                                              	   
	                                    	$.ajax({
	                    						url : "saveIntrPaintFinal",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						data : {
	                    							
	                    							paintAssetId: record.paintAssetId,
	                    							intrPaintFinalDocNo: $('#intrPaintFinalDocNo').val(),
	                    							intrPaintFinalVersNo: $('#intrPaintFinalVersNo').val(),
	                    							furnishingNoIntrFinal: $('#furnishingNoIntrFinal').val(),
	                    							intrPaintFinalDate: $('#intrPaintFinalDate').val(),
	                    							intrPaintFinalGarnetBlastingFlag: $('#intrPaintFinalGarnetBlastingFlag').val(),
	                    							intrPaintFinalGarnetBlastingReas: $('#intrPaintFinalGarnetBlastingReas').val(),
	                    							intrPaintFinalEpoxyPhosphateFlag: $('#intrPaintFinalEpoxyPhosphateFlag').val(),
	                    							intrPaintFinalEpoxyPhosphateReas: $('#intrPaintFinalEpoxyPhosphateReas').val(),
	                    							intrPaintFinalSoundInsulDrawingFlag: $('#intrPaintFinalSoundInsulDrawingFlag').val(),
	                    							intrPaintFinalSoundInsulDrawingReas: $('#intrPaintFinalSoundInsulDrawingReas').val(),
	                    							intrPaintFinalClearFlag: $("input[id='intrPaintFinalClearFlag']:checked").val(),
	                    							
	                    							
	                    						},
	                    						
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							
	                    							
	                    							$('#intrPaintFinalDocNo').val(''),
	                    							$('#intrPaintFinalVersNo').val(''),                   							
	                    							$('#intrPaintFinalDate').val(''),               							
	                    							$('#furnishingNoIntrFinal').val(''),   
	                    							$('#intrPaintFinalGarnetBlastingFlag').val(''),   
	                    							$('#intrPaintFinalGarnetBlastingReas').val(''),   
	                    							$('#intrPaintFinalEpoxyPhosphateFlag').val(''),   
	                    							$('#intrPaintFinalEpoxyPhosphateReas').val(''),  
	                    							$('#intrPaintFinalSoundInsulDrawingFlag').val(''),   
	                    							$('#intrPaintFinalSoundInsulDrawingReas').val(''),   
	                    							
	                    							$("input[id='intrPaintFinalClearFlag']:checked").val(''),   
	                    							
	                    							$('form[name="intrPaintFinal"]')[0].reset() ;
	                    							$('#intrPaintFinal').dialog('close'),
	                    							
	                    							$('#PaintProductionTableContainer').jtable('load');
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
				                        	$('form[name="intrPaintFinal"]')[0].reset() ;
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
                	
                	//end of second tool bar
                	
                	//start of third tool bar (ExtrPaintSip)
                		
              {
                    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'Exterior Paint SIP',
                        click: function () {
                        	 var $selectedRows = $('#PaintProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you want to Enter Exterior SIP");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
								//setting min value
								// set already existing data
								 $.ajax({
	                    						url : "showExistingDataOfPaint",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						async:false,
	                    						data : {
	                    							paintAssetId: record.paintAssetId,
	                    						},
	                    						success:function(data)
	                    						{
	                    							$('#extrPaintSipDocNo').val(data.formNoExtrSipPaint),	
	                    							$('#extrPaintSipVersNo').val(data.formVerExtrSipPaint),
	                    							$('#shellNoExtrSip').val(data.shellNo_Type),
	                    							$('#furnishingNoExtrSip').val(data.furnishingNo)
	                    						}
								}); 
								//end of code
								 if(record.extrPaintSipFlag==1)
									{
									$.ajax({
                						url : "showExistingDataOfExtrPaintSip",  //action-name as defined in struts.xml
                						dataType: 'json', 
                						async:false,
                						data : {
                							paintAssetId: record.paintAssetId,
                						},
                						success:function(data)
                						{
                							$('#extrPaintSipDocNo').val(data.extrPaintFinalSipTran.extrPaintSipDocNo);	
                							$('#extrPaintSipVersNo').val(data.extrPaintFinalSipTran.extrPaintSipVersNo);
                							$('#furnishingNoExtrSip').val(data.paintTransaction.furnishingNumber);
                							
                							
                							var date9=(data.extrPaintFinalSipTran.extrPaintSipDate).substring(0,10);
                							var date9Array=date9.split("-");
                							$('#extrPaintSipDate').datepicker("setDate",new Date(date9Array[0],date9Array[1]-1,date9Array[2]));
                							
                						
                							$('#extrPaintSipStage1SurfPrep').val(data.extrPaintFinalSipTran.extrPaintSipStage1SurfPrep);	
                							$('#extrPaintSipStage1SurfPrepMake').val(data.extrPaintFinalSipTran.extrPaintSipStage1SurfPrepMake);
                							var date10=(data.extrPaintFinalSipTran.extrPaintSipStage1SurfPrepDate).substring(0,10);
                							var date10Array=date10.split("-");
                							$('#extrPaintSipStage1SurfPrepDate').datepicker("setDate",new Date(date10Array[0],date10Array[1]-1,date10Array[2]));
                							
                							$('#extrPaintSipStage1AppPrimer').val(data.extrPaintFinalSipTran.extrPaintSipStage1AppPrimer);	
                							$('#extrPaintSipStage1AppPrimerMake').val(data.extrPaintFinalSipTran.extrPaintSipStage1AppPrimerMake);
                							var date11=(data.extrPaintFinalSipTran.extrPaintSipStage1AppPrimerDate).substring(0,10);
                							var date11Array=date11.split("-");
                							$('#extrPaintSipStage1AppPrimerDate').datepicker("setDate",new Date(date11Array[0],date11Array[1]-1,date11Array[2]));
                							
                							$('#extrPaintSipStage2AppWall').val(data.extrPaintFinalSipTran.extrPaintSipStage2AppWall);	
                							$('#extrPaintSipStage2AppWallMake').val(data.extrPaintFinalSipTran.extrPaintSipStage2AppWallMake);
                							var date12=(data.extrPaintFinalSipTran.extrPaintSipStage2AppWallDate).substring(0,10);
                							var date12Array=date12.split("-");
                							$('#extrPaintSipStage2AppWallDate').datepicker("setDate",new Date(date12Array[0],date12Array[1]-1,date12Array[2]));
                							
                							$('#extrPaintSipStage2RubFiller').val(data.extrPaintFinalSipTran.extrPaintSipStage2RubFiller);	
                							$('#extrPaintSipStage2RubFillerMake').val(data.extrPaintFinalSipTran.extrPaintSipStage2RubFillerMake);
                							var date13=(data.extrPaintFinalSipTran.extrPaintSipStage2RubFillerDate).substring(0,10);
                							var date13Array=date13.split("-");
                							$('#extrPaintSipStage2RubFillerDate').datepicker("setDate",new Date(date13Array[0],date13Array[1]-1,date13Array[2]));
                							
                							
                							$('#extrPaintSipStage3AppRub').val(data.extrPaintFinalSipTran.extrPaintSipStage3AppRub);	
                							$('#extrPaintSipStage3AppRubMake').val(data.extrPaintFinalSipTran.extrPaintSipStage3AppRubMake);
                							var date14=(data.extrPaintFinalSipTran.extrPaintSipStage3AppRubDate).substring(0,10);
                							var date14Array=date14.split("-");
                							$('#extrPaintSipStage3AppRubDate').datepicker("setDate",new Date(date14Array[0],date14Array[1]-1,date14Array[2]));
                							
                							$('#extrPaintSipStage3AppSurf').val(data.extrPaintFinalSipTran.extrPaintSipStage3AppSurf);	
                							$('#extrPaintSipStage3AppSurfMake').val(data.extrPaintFinalSipTran.extrPaintSipStage3AppSurfMake);
                							var date15=(data.extrPaintFinalSipTran.extrPaintSipStage3AppSurfDate).substring(0,10);
                							var date15Array=date15.split("-");
                							$('#extrPaintSipStage3AppSurfDate').datepicker("setDate",new Date(date15Array[0],date15Array[1]-1,date15Array[2]));
                							
                							$('#extrPaintSipStage3RubSurf').val(data.extrPaintFinalSipTran.extrPaintSipStage3RubSurf);	
                							$('#extrPaintSipStage3RubSurfMake').val(data.extrPaintFinalSipTran.extrPaintSipStage3RubSurfMake);
                							var date16=(data.extrPaintFinalSipTran.extrPaintSipStage3RubSurfDate).substring(0,10);
                							var date16Array=date16.split("-");
                							$('#extrPaintSipStage3RubSurfDate').datepicker("setDate",new Date(date16Array[0],date16Array[1]-1,date16Array[2]));
                							
                							$('#extrPaintSipStage3AppCoat').val(data.extrPaintFinalSipTran.extrPaintSipStage3AppCoat);	
                							$('#extrPaintSipStage3AppCoatMake').val(data.extrPaintFinalSipTran.extrPaintSipStage3AppCoatMake);
                							var date17=(data.extrPaintFinalSipTran.extrPaintSipStage3AppCoatDate).substring(0,10);
                							var date17Array=date17.split("-");
                							$('#extrPaintSipStage3AppCoatDate').datepicker("setDate",new Date(date17Array[0],date17Array[1]-1,date17Array[2]));
                							
                							$('#extrPaintSipGrosValuSideWall').val(Math.round((data.extrPaintFinalSipTran.extrPaintSipGrosValuSideWall)*100)/100);	
                							$('#extrPaintSipGrosValuEndWall').val(Math.round((data.extrPaintFinalSipTran.extrPaintSipGrosValuEndWall)*100)/100);	
                            				
                							
                					
                							                							 
                					
                							
                							
                						}
						                });
									} 
								
								
								
								$('#extrPaintSipDate').datepicker('option', 'minDate', new Date(record.assemblyEndDate));
								
								
								
                    	 	 	$("#extrPaintSip").dialog({
                    	 	 		title : 'Exterior SIP for  '+record.paintAssetId,
                    	 	 		width: '80%',
                    	 	 		close: function (e, u) {
                    	 	 			$('form[name="extrPaintSip"]')[0].reset() ;
              	 		          	$("#extrPaintSip").validationEngine('hideAll');
              	 		          },
                	 		 	
 		 							buttons: {
	                                    Submit: {
	                                       text: "Submit",
	                                        id: "my-button-submit",
	                                        click:function () {
	                                    	
	                                    	if ($('#extrPaintSipDocNo').validationEngine('validate')) {
				                                            return false;
				                                        }
	                                    	if ($('#extrPaintSipDate').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           if ($('#furnishingNoExtrSip').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           if ($('#extrPaintSipGrosValuSideWall').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           if ($('#extrPaintSipGrosValuEndWall').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           var c=confirm("Do you want to submit data");
	                                    	if(c==false){return false;}
	                                    	$.ajax({
	                    						url : "saveExtrPaintSip",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						data : {
	                    							
	                    							paintAssetId: record.paintAssetId,
	                    							extrPaintSipDocNo:$('#extrPaintSipDocNo').val(),
	                    							
	                    							extrPaintSipVersNo:$('#extrPaintSipVersNo').val(),                   							
	                    							extrPaintSipDate:$('#extrPaintSipDate').val(),              							
	                    							furnishingNoExtrSip:$('#furnishingNoExtrSip').val(),
	                    							
	                    							extrPaintSipStage1SurfPrep:$('#extrPaintSipStage1SurfPrep').val(),
	                    							extrPaintSipStage1SurfPrepMake:$('#extrPaintSipStage1SurfPrepMake').val(),
	                    							extrPaintSipStage1SurfPrepDate:$('#extrPaintSipStage1SurfPrepDate').val(),
	                    							
	                    							extrPaintSipStage1AppPrimer:$('#extrPaintSipStage1AppPrimer').val(),
	                    							extrPaintSipStage1AppPrimerMake:$('#extrPaintSipStage1AppPrimerMake').val(),
	                    							extrPaintSipStage1AppPrimerDate:$('#extrPaintSipStage1AppPrimerDate').val(),
	                    							
	                    							extrPaintSipStage2AppWall:$('#extrPaintSipStage2AppWall').val(),
	                    							extrPaintSipStage2AppWallMake:$('#extrPaintSipStage2AppWallMake').val(),
	                    							extrPaintSipStage2AppWallDate:$('#extrPaintSipStage2AppWallDate').val(),
	                    							
	                    							extrPaintSipStage2RubFiller:$('#extrPaintSipStage2RubFiller').val(),
	                    							extrPaintSipStage2RubFillerMake:$('#extrPaintSipStage2RubFillerMake').val(),
	                    							extrPaintSipStage2RubFillerDate:$('#extrPaintSipStage2RubFillerDate').val(),
	                    							
	                    							extrPaintSipStage3AppRub:$('#extrPaintSipStage3AppRub').val(),
	                    							extrPaintSipStage3AppRubMake:$('#extrPaintSipStage3AppRubMake').val(),
	                    							extrPaintSipStage3AppRubDate:$('#extrPaintSipStage3AppRubDate').val(),
	                    							
	                    							extrPaintSipStage3AppSurf:$('#extrPaintSipStage3AppSurf').val(),
	                    							extrPaintSipStage3AppSurfMake:$('#extrPaintSipStage3AppSurfMake').val(),
	                    							extrPaintSipStage3AppSurfDate:$('#extrPaintSipStage3AppSurfDate').val(),
	                    							
	                    							extrPaintSipStage3RubSurf:$('#extrPaintSipStage3RubSurf').val(),
	                    							extrPaintSipStage3RubSurfMake:$('#extrPaintSipStage3RubSurfMake').val(),
	                    							extrPaintSipStage3RubSurfDate:$('#extrPaintSipStage3RubSurfDate').val(),
	                    							
	                    							extrPaintSipStage3AppCoat:$('#extrPaintSipStage3AppCoat').val(),
	                    							extrPaintSipStage3AppCoatMake:$('#extrPaintSipStage3AppCoatMake').val(),
	                    							extrPaintSipStage3AppCoatDate:$('#extrPaintSipStage3AppCoatDate').val(),
	                    							
	                    							extrPaintSipGrosValuSideWall:$('#extrPaintSipGrosValuSideWall').val(),
	                    							extrPaintSipGrosValuEndWall:$('#extrPaintSipGrosValuEndWall').val(),
	                    							
	                    							
	                    					
	                    						},
	                    						
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							
	                    							
	                    							$('#extrPaintSipDocNo').val(''),
	                    							$('#extrPaintSipVersNo').val(''),                   							
	                    							$('#extrPaintSipDate').val(''),               							
	                    							$('#furnishingNoExtrSip').val(''),   
	                    							$('#extrPaintSipStage1SurfPrep').val(''),   
	                    							$('#extrPaintSipStage1SurfPrepMake').val(''),   
	                    						 	$('#extrPaintSipStage1SurfPrepDate').val(''),
	                    						 	$('#extrPaintSipStage1AppPrimer').val(''),   
	                    							$('#extrPaintSipStage1AppPrimerMake').val(''),   
	                    						 	$('#extrPaintSipStage1AppPrimerDate').val(''),
	                    						 	$('#extrPaintSipStage2AppWall').val(''),   
	                    							$('#extrPaintSipStage2AppWallMake').val(''),   
	                    						 	$('#extrPaintSipStage2AppWallDate').val(''),
	                    						 	$('#extrPaintSipStage2RubFiller').val(''),   
	                    							$('#extrPaintSipStage2RubFillerMake').val(''),   
	                    						 	$('#extrPaintSipStage2RubFillerDate').val(''),
	                    						 	$('#extrPaintSipStage3AppRub').val(''),   
	                    							$('#extrPaintSipStage3AppRubMake').val(''),   
	                    						 	$('#extrPaintSipStage3AppRubDate').val(''),
	                    						 	$('#extrPaintSipStage3AppSurf').val(''),   
	                    							$('#extrPaintSipStage3AppSurfMake').val(''),   
	                    						 	$('#extrPaintSipStage3AppSurfDate').val(''),
	                    						 	$('#extrPaintSipStage3RubSurf').val(''),   
	                    							$('#extrPaintSipStage3RubSurfMake').val(''),   
	                    						 	$('#extrPaintSipStage3RubSurfDate').val(''),
	                    						 	$('#extrPaintSipStage3AppCoat').val(''),   
	                    							$('#extrPaintSipStage3AppCoatMake').val(''),   
	                    						 	$('#extrPaintSipStage3AppCoatDate').val(''),
	                    						 	$('#extrPaintSipGrosValuSideWall').val(''),   
	                    						 	$('#extrPaintSipGrosValuEndWall').val(''),
	                    						 	$('form[name="extrPaintSip"]')[0].reset() ;
	                    							$('#extrPaintSip').dialog('close'),
	                    							
	                    							$('#PaintProductionTableContainer').jtable('load');
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
				                        	$('form[name="extrPaintSip"]')[0].reset() ;
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
                	
                	
                //end of third toolbar
                	
                	
                
                
                	//start of fourth tool bar (ExtrPaintFinal)
                		
              {
                    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'Exterior Paint Final',
                        click: function () {
                        	 var $selectedRows = $('#PaintProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you want to Enter Exterior Final");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
								//setting min value
								// set already existing data
								 $.ajax({
	                    						url : "showExistingDataOfPaint",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						async:false,
	                    						data : {
	                    							paintAssetId: record.paintAssetId,
	                    						},
	                    						success:function(data)
	                    						{
	                    							$('#extrPaintFinalDocNo').val(data.formNoExtrSipPaint),	
	                    							$('#extrPaintFinalVersNo').val(data.formVerExtrSipPaint),
	                    							$('#shellNoExtrFinal').val(data.shellNo_Type),
	                    							$('#furnishingNoExtrFinal').val(data.furnishingNo),
	                    							$('#shellNoExtrFinal1').val(data.shellNo)
	                    						}
								}); 
								//end of code
								 if(record.extrPaintFinalFlag==1)
									{
									$.ajax({
                						url : "showExistingDataOfExtrPaintFinal",  //action-name as defined in struts.xml
                						dataType: 'json', 
                						async:false,
                						data : {
                							paintAssetId: record.paintAssetId,
                						},
                						success:function(data)
                						{
                							$('#extrPaintFinalDocNo').val(data.extrPaintFinalSipTran.extrPaintFinalDocNo);	
                							$('#extrPaintFinalVersNo').val(data.extrPaintFinalSipTran.extrPaintFinalVersNo);
                							$('#furnishingNoExtrFinal').val(data.paintTransaction.furnishingNumber);
                							
                							
                							var date18=(data.extrPaintFinalSipTran.extrPaintFinalDate).substring(0,10);
                							var date18Array=date18.split("-");
                							$('#extrPaintFinalDate').datepicker("setDate",new Date(date18Array[0],date18Array[1]-1,date18Array[2]));
                							
                							$('[id="extrPaintFinalSurfDefectFreeFlag"]').val([data.extrPaintFinalSipTran.extrPaintFinalSurfDefectFreeFlag]);
                							$('[id="extrPaintFinalDefectObservSideWallFlag"]').val([data.extrPaintFinalSipTran.extrPaintFinalDefectObservSideWallFlag]);
                							$('[id="extrPaintFinalDefectObservEndWallFlag"]').val([data.extrPaintFinalSipTran.extrPaintFinalDefectObservEndWallFlag]);
                							$('[id="extrPaintFinalDefectObservEndRoofFlag"]').val([data.extrPaintFinalSipTran.extrPaintFinalDefectObservEndRoofFlag]);
                							$('[id="extrPaintFinalFinishSurfFlag"]').val([data.extrPaintFinalSipTran.extrPaintFinalFinishSurfFlag]);
                							$('[id="extrPaintFinalAdhensionSurfFlag"]').val([data.extrPaintFinalSipTran.extrPaintFinalAdhensionSurfFlag]);
                							$('#extrPaintFinalGrosValuSideWall').val(Math.round((data.extrPaintFinalSipTran.extrPaintFinalGrosValuSideWall)*100)/100);
                							$('#extrPaintFinalGrosValuEndWall').val(Math.round((data.extrPaintFinalSipTran.extrPaintFinalGrosValuEndWall)*100)/100);
                							
                							
                							
                							$('[id="extrPaintFinalClearFlag"]').val([data.extrPaintFinalSipTran.extrPaintFinalClearFlag]);

                						}
						                });
									} 
								
								
								
								$('#extrPaintFinalDate').datepicker('option', 'minDate', new Date(record.assemblyEndDate));
								
								
								
                    	 	 	$("#extrPaintFinal").dialog({
                    	 	 		title : 'Exterior Final for  '+record.paintAssetId,
                    	 	 		width: '70%',
                    	 	 		close: function (e, u) {
                    	 	 			$('form[name="extrPaintFinal"]')[0].reset() ;
              	 		          	$("#extrPaintFinal").validationEngine('hideAll');
              	 		          },
                	 		 	
 		 							buttons: {
	                                    Submit: {
	                                       text: "Submit",
	                                        id: "my-button-submit",
	                                        click:function () {
	                                    	
	                                    	if ($('#extrPaintFinalDocNo').validationEngine('validate')) {
				                                            return false;
				                                        }
	                                    	if ($('#extrPaintFinalDate').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                         
                                           if ($('#extrPaintFinalGrosValuSideWall').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           if ($('#extrPaintFinalGrosValuEndWall').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                           var c=confirm("Do you want to submit data");
	                                    	if(c==false){return false;}
	                                    	$.ajax({
	                    						url : "saveExtrPaintFinal",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						data : {
	                    							
	                    							paintAssetId: record.paintAssetId,
	                    							extrPaintFinalDocNo:$('#extrPaintFinalDocNo').val(),
	                    							
	                    							extrPaintFinalVersNo:$('#extrPaintFinalVersNo').val(),                   							
	                    							extrPaintFinalDate:$('#extrPaintFinalDate').val(),              							
	                    							furnishingNoExtrFinal:$('#furnishingNoExtrFinal').val(),
	                    							
	                    							extrPaintFinalSurfDefectFreeFlag:$("input[id='extrPaintFinalSurfDefectFreeFlag']:checked").val(),
	                    							extrPaintFinalDefectObservSideWallFlag:$("input[id='extrPaintFinalDefectObservSideWallFlag']:checked").val(),
	                    							extrPaintFinalDefectObservEndWallFlag:$("input[id='extrPaintFinalDefectObservEndWallFlag']:checked").val(),
	                    							extrPaintFinalDefectObservEndRoofFlag:$("input[id='extrPaintFinalDefectObservEndRoofFlag']:checked").val(),
	                    							extrPaintFinalFinishSurfFlag:$("input[id='extrPaintFinalFinishSurfFlag']:checked").val(),
	                    							extrPaintFinalAdhensionSurfFlag:$("input[id='extrPaintFinalAdhensionSurfFlag']:checked").val(),
	                    							extrPaintFinalGrosValuSideWall:$('#extrPaintFinalGrosValuSideWall').val(),
	                    							extrPaintFinalGrosValuEndWall:$('#extrPaintFinalGrosValuEndWall').val(),
	                    							extrPaintFinalClearFlag:$("[id='extrPaintFinalClearFlag']:checked").val(),
	                    								
	                    							
	                    							
	                    						},
	                    						
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							
	                    							
	                    							$('#extrPaintFinalDocNo').val(''),
	                    							$('#extrPaintFinalVersNo').val(''),                   							
	                    							$('#extrPaintFinalDate').val(''),               							
	                    							$('#furnishingNoExtrFinal').val(''),
	                    							$("input[id='extrPaintFinalSurfDefectFreeFlag']:checked").val(''),
	                    							$("input[id='extrPaintFinalDefectObservSideWallFlag']:checked").val(''),                   							
	                    							$("input[id='extrPaintFinalDefectObservEndWallFlag']:checked").val(''),
	                    							$("input[id='extrPaintFinalDefectObservEndRoofFlag']:checked").val(''),
	                    							$("input[id='extrPaintFinalFinishSurfFlag']:checked").val(''),                   							
	                    							$("input[id='extrPaintFinalAdhensionSurfFlag']:checked").val(''),
	                    							$('#extrPaintFinalGrosValuSideWall').val(''),
	                    							$('#extrPaintFinalGrosValuEndWall').val(''),                   							
	                    							$("input[id='extrPaintFinalClearFlag']:checked").val(''),
	                    							 
	                    							$('form[name="extrPaintFinal"]')[0].reset() ;
	                    							$('#extrPaintFinal').dialog('close'),
	                    							
	                    							$('#PaintProductionTableContainer').jtable('load');
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
				                        	$('form[name="extrPaintFinal"]')[0].reset() ;
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
                	
                	
                //end of fourth toolbar
                 
                
                
                	

            ]
            },
            // yaha se code dekhana hai... happy weekend navin.....................$$$$$$
			actions : {
				
 		
 			listAction: 'listSIPPaintAction?stageID=<%=stageID%>',
 			
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
				
				paintAssetId : {
					title : 'paintAssetId',
					width: '8%',
					key: true,
					list : false,
					edit : false,
					create : false
									
					},
					shellAssetId: {
						title: 'Shell No',
						width: '20%',
						display:function(data){
	 						var shellNo;
							
	 						$.ajax({                    
	 							  url: 'descByshellFromId',     
	 							  type: 'post', // performing a POST request
	 							  async: false,
								  
	 							  dataType: 'json',
	 								  data : {
										
	 									 shellAssetId: data.record.shellAssetId
	 								  	  }									                    
	 						})
	 								.done(function( msg ) {
	 									shellNo=msg.shellNo;
										
	 									//return msg.stageName;																			    											
	 								  })
	 								.error(function (msg){
	 									alert("Error Saving Data");
	 								})
	 								  ;
							
							
	 						return shellNo;
	 						},
						create: false,
						width : '20%',
						list: true,
						edit : false
					},
					shellType: {
						title: 'Shell Type',
						width: '20%',
						create: false,
						width : '20%',
						list: true,
						edit : false
					},
					assemblyStartDate: {
							title :'Entry Date',
							type: 'date',
							width: '8%',
							inputClass: 'validate[required]',
							displayFormat: 'dd-mm-yy',
							display:function(data){
										 
								return ((data.record.assemblyStartDate!=null) && (data.record.assemblyStartDate!="") ) ? moment(data.record.assemblyStartDate).format('DD-MM-YYYY') : "";
										}, 
									     	
							list: true,
							create: false,
							edit: false
											
							},
						
							expectedExitDate : {
					title : 'Expected Dispatch Date',
					type: 'date',
					displayFormat: 'dd-mm-yy',
					display:function(data){
					 
						return ((data.record.expectedExitDate!=null) && (data.record.expectedExitDate!="") ) ? moment(data.record.expectedExitDate).format('DD-MM-YYYY') : "";
											}, 

					inputClass: 'validate[required]',
					edit : true,
					create : false
					
				},
				colorScheme:{
                    title:'Color Scheme',
                    width:'10%',
                    options: {'HUMSAFAR':'HUMSAFAR', 'RAJDHANI':'RAJDHANI', 'DEENDAYALU':'DEENDAYALU', 'OTHERS':'OTHERS'},
                    edit:true,
                    create:true
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
			recordsLoaded: function(event, data) {
	
				  
				  
				},
				formCreated: function (event, data) {
						
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
					
					$('[name=expectedExitDate]').datepicker("option","minDate", moment(data.record.assemblyStartDate).format('DD-MM-YYYY'));
					
// 					$('[name=assemblyStartDate]').datepicker({
						
// 						dateFormat: 'dd-mm-yy',
// 					    onSelect: function(selected) {
// 					      $('[name=expectedExitDate]').datepicker("option","minDate", selected)
   
// 					    }
// 					}).datepicker("option", "maxDate", new Date);;

// 					$('[name=expectedExitDate]').datepicker({ 
						
// 						dateFormat: 'dd-mm-yy',
// 					    onSelect: function(selected) {
// 					        $('[name=assemblyStartDate]').datepicker("option","maxDate", selected)
  
//  					    }
//  					}); 
			
					data.form.validationEngine();
	               	            },
	            recordDeleted: function(event,data)
	    		{
	    			srno=0;
	    			$('#PaintProductionTableContainer').jtable('load');
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
	$('#PaintProductionTableContainer').jtable('load');
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