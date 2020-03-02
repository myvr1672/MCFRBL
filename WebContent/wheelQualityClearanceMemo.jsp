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
<div id="detailDialog" style="height: 200%; width:50%; display:none;z-index: 9;" ></div>
    <div id="wheelclearanceMemo" style="height:150%; width:200%; display:none;z-index: 9;" >
            <h3 style="text-align: center;">Quality Control Clearance Memo for Wheelset</h3>
            <br>
         <table>
          <tr>
          <th>DOC No.</th><td colspan="2"><input type="text"  style="width: 200px;" name="docNoQualityClearance" id="docNoQualityClearance" value="MCF/RBL/QMF 1006 Ver 11/2018" class='validate[required]'></td>
          <th>Date of Clearance</th><td><input type="text" name="testingClearanceMemoDate"    id="testingClearanceMemoDate" class='validate[required]'></td><td></td>
          </tr>
          
          <tr>
          <th>Status:</th><td><select name="testingClearanceMemoStatus" id="testingClearanceMemoStatus" class='validate[required]'>
          <option value="">Select</option>
          <option value="Cleared">Cleared</option>
          <option value="Not Cleared">Not Cleared</option>
          </select></td><td></td>
          <th>Observation (Remarks):</th><td><textarea name="testingClearanceMemoRemark" id="testingClearanceMemoRemark"></textarea></td><td></td>
          
          </tr>
         
          </table>
 </div>
 
  
</body>




<script type="text/javascript">
		$(document).ready(function() {
		       
			
			
		
		



//end of code
  
// for date picker in dialog box
			$('#testingClearanceMemoDate').datepicker({
		        
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
			

	$('#WheelsetProductionTableContainer').jtable({
			
			title : 'Wheel Shop Production',
			
			paging:true,
			//pageSize : 10,
			//pageSizes :[10,50,100],
            sorting: true,
            defaultSorting: 'assemblyStartDate DESC',
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
                        text: 'Qauality Control Clearance Memo for Wheel Set',
                        click: function () {
                        	
                        	 var $selectedRows = $('#WheelsetProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a wheelset for which you give clearance");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
                    	 	
                          
                  	 			}
                  	 		
                  	 	 	$("#wheelclearanceMemo").dialog({
                  	 	 		width: '50%',
                  	 	 
                  	 	 		title : 'Testing clearance for Axle No.: ' +record.axleNumber  ,                     	 	 		
                  	 	 		close: function (e, u) {
            	 		              //$(".formError").remove();
            	 		          	$("#wheelclearanceMemo").validationEngine('hideAll');
                  	 	 		    },
              	 		 	
    	 							buttons: {
    	 								Submit: {
                                           text: "Submit",
                                          
                                           click:function () {
                                        	   if ($('#docNoQualityClearance').validationEngine('validate')) {
		                                            return false;
		                                        }
                                        	   if ($('#testingClearanceMemoDate').validationEngine('validate')) {
		                                            return false;
		                                        }
                                        	   if ($('#testingClearanceMemoStatus').validationEngine('validate')) {
		                                            return false;
		                                        }
                                        	 
                                          var c=confirm("Verify data before submit, Are you sure to save data");
                                       	if(c==false){return false;}	    	   
                                       	$.ajax({
                       						url : "clearanceMemoEntry",  //action-name as defined in struts.xml
                       						dataType: 'json', 
                       						data : {                       							
                       							wheelsetAssetId: record.wheelsetAssetId,
                       							
                       							docNoQualityClearance:$('#docNoQualityClearance').val(),
                       							testingClearanceMemoDate:$('#testingClearanceMemoDate').val(),
                       							testingClearanceMemoStatus:$('#testingClearanceMemoStatus').val(),
                       							testingClearanceMemoRemark:$('#testingClearanceMemoRemark').val(),
                       						},
                       						
                       						type : 'POST',
                       						async : false,
                               	 		
                       						success : function( msg ) {
                       							
                       							$('#docNoQualityClearance').val(''),
                       							$('#testingClearanceMemoDate').val(''),
                       							$('#testingClearanceMemoStatus').val(''),
                       							$('#testingClearanceMemoRemark').val(''),
                       							
                       							
                       							$('#wheelclearanceMemo').dialog('close'),
                       							alert("saving Data");
                       							$('#WheelsetProductionTableContainer').jtable('load');
            								  },
            								error:function (msg){
            									$('#wheelclearanceMemo').dialog('close');
            									//alert("Error saving Data");
            								}
                                       	}) ;
    				                 			    return true;
                                           }    
                  	 	 		    },
    			                        Close: function () {
    			                        	
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
    	 			
                  	
                  	
                   
            ]
            },
            
			actions : {
				
 		  
 			listAction: 'listQualityClearanceWheelAction?stageID=<%=stageID%>',
 			
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
										

											wheeldiscLeftNo: {
												title :'Left Wheel Disc No.',
												width: '8%',
												
												list: true,
												create: true,
												edit: true,
												
												},
												
												
																ctrbRightNo:{
																	title :'Right CTRB No.',
																	width: '8%',
																	
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
																				sipWheelAssembly:
																				{
																			title: 'Wheel & Axle SIP',
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
												                			var wheelsetAssetId=data.record.wheelsetAssetId;
												                			
												        var URL="open-wheelAxleSIP-report?wheelAssetId="+wheelsetAssetId;
												         					
												        var diagtitle="Wheel & Axle SIP Report";
												                					$( "#detailDialog" ).load( URL ).dialog({
												                															title: diagtitle,
												                															modal:true,
												                															height: dheight, 
												                															width: '40%',
												                															}).prev(".ui-dialog-titlebar").css("background","blue");
												                		
												                        	
														                 });
														                    	
														                    	return $img;	
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
																				sipWheelCtrb:
																				{
																			title: 'CTRB SIP',
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
												                			var wheelsetAssetId=data.record.wheelsetAssetId;
												                			
												        var URL="open-CTRBSIP-report?wheelAssetId="+wheelsetAssetId;
												         					
												        var diagtitle="CTRB SIP Report";
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