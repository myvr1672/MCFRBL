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
<div id="FinishingProductionTableContainer"></div>
    <div id="exitDialog" style="height:150%; width:200%; display:none;z-index: 9;" >
  <br>
  
			  <br>
			 Enter Completion Date: <br>
		     <input type="Text" id="datepickerCompletion" class='validate[required]' onchange="setMinDate()"/>
		     <br>
		      <br>
		      Enter Exit Date: <br>
		     <input type="Text" id="datepickerExit" class='validate[required]' />
		     <br>
		      <br>
		     Remarks: <br>
		     <textarea id="exitRemarks" > </textarea>
		     <br>
		     Delay, if any: <br>
		     <textarea id="delayReason" > </textarea>
		     <br>
	 
 </div>
 <div id="detailDialog" style="height:150%; width:200%; display:none;z-index: 9;" ></div>
 </body>




<script type="text/javascript">
		$(document).ready(function() {
		
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
	$('#FinishingProductionTableContainer').jtable({
			
			title : 'Finishing Shop Production',
			
			
            sorting: true,
            defaultSorting: 'finishingAssetId ASC',
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
      //Create toolbat
            toolbar: {
                items: [
                	{
                		
                	//toolbar first item
                    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'Add Activity For Finishing Shop',
                        click: function () {
                        	
                        	 var $selectedRows = $('#FinishingProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you want to add activity");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
                        	var wWidth = $(window).width();
                			var dWidth = wWidth * 0.9;
                			var wheight = $(window).height();
                			var dheight = wheight * 0.9;
                			var finishingAssetId=record.finishingAssetId;
                			var coachNumber=record.coachNumber;
                			var substageId='<%=stageID%>';
                				
                					var URL="add_activity_for_shell_stage?finishingAssetId="+finishingAssetId+"&substageId="+substageId+"&coachNumber="+coachNumber;
                					var diagtitle="Add Activity For Finishing Shop ="+finishingAssetId+" ";
                					
                					$( "#detailDialog" ).load( URL ).dialog({
                															title: diagtitle,
                															modal:true,
                															height: dheight, 
                															width: dWidth, 
                															}).prev(".ui-dialog-titlebar").css("background","blue");
                		                    	 	 }
    						 
                        }
                    },
                    //End of first toolbar item
                
                	//Second Toolbar item for Exit/ Turnout
                    {
                    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'Exit/ Turnout',
                        click: function () {
                        	
                        	
                        	
                        	 var $selectedRows = $('#FinishingProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you want to sent for Furnishing Shop");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
								//setting min value
								
								$('#datepickerCompletion').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
								
            					
                    	 	 	$("#exitDialog").dialog({
                    	 	 		title : 'Exit for  '+record.paintAssetId + 'from Stage- <%=stageID%>',                     	 	 		
                    	 	 		close: function (e, u) {
              	 		              //$(".formError").remove();
              	 		          	$("#exitDialog").validationEngine('hideAll');
              	 		          },
                	 		 	
 		 							buttons: {
	                                    Submit: {
	                                       text: "Submit",
	                                        id: "my-button-submit",
	                                        click:function () {
	                                    		
	                                    	//alert("$('#qtyDispatched').val()->"+$('#qtyDispatched').val());
	                                    	//alert("record.balanceQtyToDispatch->"+record.balanceQtyToDispatch);
	                            	 		
	                                    	if ($('#datepickerExit').validationEngine('validate')) {
				                                        	//alert(!$("#dialog").validationEngine('validate'));
				                                            return false;
				                                        }
	                                    		    	   
	                                    	$.ajax({
	                    						url : "exitFinishing",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						data : {
	                    							
	                    							finishingAssetId: record.finishingAssetId,
	                    							//shellAssetId:record.shellAssetId,
	                    							//shellType:record.shellType,
	                    							stageId: '<%=stageID%>',
	                    						    assemblyEndDate: $('#datepickerCompletion').val(),                   							
	                    							exitDate:$('#datepickerExit').val(),              							
	                    							exitRemarks:$('#exitRemarks').val(),
	                    							lateReason:$('#delayReason').val(),
	                    						
	                    						},
	                    						
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							
	                    							$('#datepickerCompletion').val(''),
	                    							$('#datepickerExit').val(''),
	                    							$('#exitRemarks').val(''),	
	                    							$('#delayReason').val(''),
	                    							$('#exitDialog').dialog('close'),
	                    							
	                    							$('#FinishingProductionTableContainer').jtable('load');
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
				
 		
 			listAction: 'listFinishingAction?stageID=<%=stageID%>',
 			updateAction:'updateFinishingAction?stageID=<%=stageID%>'
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
				
				finishingAssetId : {
					title : 'finishingAssetId',
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
	 							  url: 'descByshellFromIdinPaintShop',     
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
								coachNumber: {
									   title: 'Coach Number',
									   width : '10%',
										edit : false,
										create: false 
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
					title : 'Expted Exit Date',
					type: 'date',
					displayFormat: 'dd-mm-yy',
					display:function(data){
					 
						return ((data.record.expectedExitDate!=null) && (data.record.expectedExitDate!="") ) ? moment(data.record.expectedExitDate).format('DD-MM-YYYY') : "";
											}, 

					inputClass: 'validate[required]',
					edit : true,
					create : false
					
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
	    			$('#FinishingProductionTableContainer').jtable('load');
	    		},
	    		
	    		recordUpdated:function(event,data)
	    		{
	    			srno=0;
	    			$('#FinishingProductionTableContainer').jtable('load');
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
	$('#FinishingProductionTableContainer').jtable('load');
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