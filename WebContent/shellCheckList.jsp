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
.t{
	margin:20px;
}
</style>

<body>
<div id="ShellProductionTableContainer"></div>
     <div id="detailDialog" style="height: 200%; width:50%; display:none;z-index: 9;" ></div>
  <div class="t" id="shellCheckListSip" style="height:150%; width:200%; display:none;z-index: 9;">
 		<form name="form2">
		<table border="1">
			<tr>
				<th>S.NO.</th>
				<th>PARAMETERS</th>
				<th>QUANTITY</th>
				<th>OK/NOT OK</th>
			</tr>
			
			<tr>
				<td>1.</td>
				<td>WATER TANK BRACKETS</td>
				<td>8 NOS</td>
				<td><input type="radio" id="waterTankBracket" name="waterTankBracket" value="Ok">Ok <input type="radio" id="waterTankBracket" name="waterTankBracket" value="Not Ok">Not Ok <input type="radio" id="waterTankBracket" name="waterTankBracket" value="N/A">N/A</td>
			</tr>
			
			<tr>
				<td>2.</td>
				<td>CROSS BRACE LWACCW/LWACCA</td>
				<td>11 NOS/9 NOS</td>
				<td><input type="radio" id="crossBrace" name="crossBrace" value="Ok">Ok <input type="radio" id="crossBrace" name="crossBrace" value="Not Ok">Not Ok <input type="radio" id="crossBrace" name="crossBrace" value="N/A">N/A</td>
			</tr>
			
			<tr>
				<td>3.</td>
				<td>SIDE WALL CHANNEL ASSEMBLY</td>
				<td></td>
				<td><input type="radio" id="sidewallAssembly" name="sidewallAssembly" value="Provided">Provided <input type="radio" id="sidewallAssembly" name="sidewallAssembly" value="Not Provided">Not Provided <input type="radio" id="sidewallAssembly" name="sidewallAssembly" value="N/A">N/A</td>
			</tr>
			
			<tr>
				<td>4.</td>
				<td>STIFFING PLATE</td>
				<td></td>
				<td><input type="radio" id="stiffingPlate" name="stiffingPlate" value="Ok">Ok <input type="radio" id="stiffingPlate" name="stiffingPlate" value="Not Ok">Not Ok <input type="radio" id="stiffingPlate" name="stiffingPlate" value="N/A">N/A</td>
			</tr>
			
			<tr>
				<td>5.</td>
				<td>LORO PIPE BRACKET</td>
				<td></td>
				<td><input type="radio" id="loroPipeBracket" name="loroPipeBracket" value="Provided">Provided <input type="radio" id="loroPipeBracket" name="loroPipeBracket" value="Not Provided">Not Provided <input type="radio" id="loroPipeBracket" name="loroPipeBracket" value="N/A">N/A</td>
			</tr>
			
			<tr>
				<td>6.</td>
				<td>FOOT STEP BRACKET</td>
				<td>8 NOS</td>
				<td><input type="radio" id="footStepBracket" name="footStepBracket" value="Ok">Ok <input type="radio" id="footStepBracket" name="footStepBracket" value="Not Ok">Not Ok <input type="radio" id="footStepBracket" name="footStepBracket" value="N/A">N/A</td>
			</tr>
			
			<tr>
				<td>7.</td>
				<td>LIFTING PAD</td>
				<td>8 NOS</td>
				<td><input type="radio" id="liftingPad" name="liftingPad" value="Ok">Ok <input type="radio" id="liftingPad" name="liftingPad" value="Not Ok">Not Ok <input type="radio" id="liftingPad" name="liftingPad" value="N/A">N/A</td>
			</tr>
			
			<tr>
				<td>8.</td>
				<td>CURVE ROLL BRACKET</td>
				<td>4 NOS</td>
				<td><input type="radio" id="curveRollBracket" name="curveRollBracket" value="Ok">Ok <input type="radio" id="curveRollBracket" name="curveRollBracket" value="Not Ok">Not Ok <input type="radio" id="curveRollBracket" name="curveRollBracket" value="N/A">N/A</td>
			</tr>
			
			<tr>
				<td>9.</td>
				<td>WATER TANK LINER</td>
				<td></td>
				<td><input type="radio" id="waterTankLiner" name="waterTankLiner" value="Provided">Provided <input type="radio" id="waterTankLiner" name="waterTankLiner" value="Not Provided">Not Provided <input type="radio" id="waterTankLiner" name="waterTankLiner" value="N/A">N/A</td>
			</tr>
			
			<tr>
				<td>10.</td>
				<td>BOTH SIDE LAVATORY MOUNTING BRACKET</td>
				<td></td>
				<td><input type="radio" id="sideLavMountingBracket" name="sideLavMountingBracket" value="Ok">Ok <input type="radio" id="sideLavMountingBracket" name="sideLavMountingBracket" value="Not Ok">Not Ok <input type="radio" id="sideLavMountingBracket" name="sideLavMountingBracket" value="N/A">N/A</td>
			</tr>
			
			<tr>
				<td>11.</td>
				<td>BOTH SIDE HOSE COUPLING BRACKET</td>
				<td></td>
				<td><input type="radio" id="sideHoseCouplingBracket" name="sideHoseCouplingBracket" value="Ok">Ok <input type="radio" id="sideHoseCouplingBracket" name="sideHoseCouplingBracket" value="Not Ok">Not Ok <input type="radio" id="sideHoseCouplingBracket" name="sideHoseCouplingBracket" value="N/A">N/A</td>
			</tr>
			
			<tr>
				<td>12.</td>
				<td>GROUNDING FLAP BRACKET</td>
				<td></td>
				<td><input type="radio" id="groundingFlapBracket" name="groundingFlapBracket" value="Ok">Ok <input type="radio" id="groundingFlapBracket" name="groundingFlapBracket" value="Not Ok">Not Ok <input type="radio" id="groundingFlapBracket" name="groundingFlapBracket" value="N/A">N/A</td>
			</tr>
			
			<tr>
				<td>13.</td>
				<td>POWER PANEL BRACKET</td>
				<td>1 NOS</td>
				<td><input type="radio" id="powerPanelBracket" name="powerPanelBracket" value="Ok">Ok <input type="radio" id="powerPanelBracket" name="powerPanelBracket" value="Not Ok">Not Ok <input type="radio" id="powerPanelBracket" name="powerPanelBracket" value="N/A">N/A</td>
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
                 text: 'ShellCheckListSip',
                 click: function () {
                 	
                 	
                 	
                 	 var $selectedRows = $('#ShellProductionTableContainer').jtable('selectedRows');
             	 	 if ($selectedRows.length<1)
             		 alert("Please select a row for which you want to sent for Bogie Shop");
             	 	 else{
             	 		var record;
             	 		$selectedRows.each(function () {
                             record = $(this).data('record');
                             });
							//setting min value
							
							
							  if(record.checkListFlag==1)
								{
									var cfm=confirm("Data for Shell Check List is already updated. Do you want to verify data?");
		                          	if(cfm==false){return false;}	
								$.ajax({
         						url : "showExistingDataOfShellCheckListSip",  //action-name as defined in struts.xml
         						dataType: 'json', 
         						async:false,
         						data : {
         							shellAssetId: record.shellAssetId,
         						},
         						success:function(data)
         						{
         							$('[id="waterTankBracket"]').val([data.shellCheckListSip.waterTankBracket]);
         							$('[id="crossBrace"]').val([data.shellCheckListSip.crossBrace]);
         							$('[id="sidewallAssembly"]').val([data.shellCheckListSip.sidewallAssembly]);
         							$('[id="stiffingPlate"]').val([data.shellCheckListSip.stiffingPlate]);
         							$('[id="loroPipeBracket"]').val([data.shellCheckListSip.loroPipeBracket]);
         							$('[id="footStepBracket"]').val([data.shellCheckListSip.footStepBracket]);
         							$('[id="liftingPad"]').val([data.shellCheckListSip.liftingPad]);
         							$('[id="curveRollBracket"]').val([data.shellCheckListSip.curveRollBracket]);
         							$('[id="waterTankLiner"]').val([data.shellCheckListSip.waterTankLiner]);
         							$('[id="sideLavMountingBracket"]').val([data.shellCheckListSip.sideLavMountingBracket]);
         							$('[id="sideHoseCouplingBracket"]').val([data.shellCheckListSip.sideHoseCouplingBracket]);
         							$('[id="groundingFlapBracket"]').val([data.shellCheckListSip.groundingFlapBracket]);
         							$('[id="powerPanelBracket"]').val([data.shellCheckListSip.powerPanelBracket]);
         					
         									
         						}
					                });
								}   
							
							
							
     					
             	 	 	$("#shellCheckListSip").dialog({
             	 	 		title : 'Exit for  '+record.shellTransactionId + 'from Stage- <%=stageID%>',
             	 	 		width:'60%',
             	 	 		close: function (e, u) {
             	 	 			
       	 		              
       	 		          	$("#shellCheckListSip").validationEngine('hideAll');
       	 		         $('#shellCheckListSip').find('form[name="form2"]')[0].reset();
       	 		          },
         	 		 	
	 							buttons: {
                                 Submit: {
                                    text: "Submit",
                                     id: "my-button-submit",
                                     click:function () {
                                 		
                                 	
                                 	var c=confirm("Do you want to submit data!!");
                                 	if(c==false){return false;}
                                  
                                 		    	   
                                 	$.ajax({
                 						url : "saveShellCheckListSip",  //action-name as defined in struts.xml
                 						dataType: 'json', 
                 						data : {
                 							shellAssetId: record.shellAssetId,
                 							waterTankBracket: $("input[id='waterTankBracket']:checked").val(),
                 							crossBrace: $("input[id='crossBrace']:checked").val(),
                 							sidewallAssembly: $("input[id='sidewallAssembly']:checked").val(),
                 							stiffingPlate: $("input[id='stiffingPlate']:checked").val(),
                 							loroPipeBracket: $("input[id='loroPipeBracket']:checked").val(),
                 							footStepBracket: $("input[id='footStepBracket']:checked").val(),
                 							liftingPad: $("input[id='liftingPad']:checked").val(),
                 							curveRollBracket: $("input[id='curveRollBracket']:checked").val(),
                 							waterTankLiner: $("input[id='waterTankLiner']:checked").val(),
                 							sideLavMountingBracket: $("input[id='sideLavMountingBracket']:checked").val(),
                 							sideHoseCouplingBracket: $("input[id='sideHoseCouplingBracket']:checked").val(),
                 							groundingFlapBracket: $("input[id='groundingFlapBracket']:checked").val(),
                 							powerPanelBracket: $("input[id='powerPanelBracket']:checked").val(),
                 							
                 							
                 						
                 						},
                 						
                 						type : 'POST',
                 						async : false,
                         	 		})
                 						.done(function( msg ) {
                 							
                 							$("input[id='waterTankBracket']:checked").val(''),
                 							$("input[id='crossBrace']:checked").val(''),
                 							$("input[id='sidewallAssembly']:checked").val(''),
                 							$("input[id='stiffingPlate']:checked").val(''),
                 							$("input[id='loroPipeBracket']:checked").val(''),
                 							$("input[id='footStepBracket']:checked").val(''),
                 							$("input[id='liftingPad']:checked").val(''),
                 							$("input[id='curveRollBracket']:checked").val(''),
                 							$("input[id='waterTankLiner']:checked").val(''),
                 							$("input[id='sideLavMountingBracket']:checked").val(''),
                 							$("input[id='sideHoseCouplingBracket']:checked").val(''),
                 							$("input[id='groundingFlapBracket']:checked").val(''),
                 							$("input[id='powerPanelBracket']:checked").val(''),
                 							
                 						
                 							$('#shellCheckListSip').dialog('close'),
                 							
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
			                        	$('#shellCheckListSip').find('form[name="form2"]')[0].reset();
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
			
 	
 			listAction: 'checkListFormShellAction?stageID=<%=stageID%>'
 			
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
			title: 'Assembly SIP',
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
				
				finalIspectionReportFlag:
				{
			title: 'Final SIP',
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
    var URL="open-final-shell-SIP-report?shellAssetId="+shellAssetId;			
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