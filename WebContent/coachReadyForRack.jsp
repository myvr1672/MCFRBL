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
<% String contextpath=request.getContextPath();%>
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
</style>
<body>
<div id="ReadyCoachProductionTableContainer"></div>
<div id="receiptDialog" style="height:150%; width:200%; display:none;z-index: 9;">
Enter Rack Id: <br>
		     <input type="Text" id="rackID" class='validate[required]' />
		     <br>
Enter Rack Formation Date: <br>
		     <input type="Text" id="datepickerExit" class='validate[required]' />
		     <br>
</div>   
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
			



	$('#ReadyCoachProductionTableContainer').jtable({
			
		//create toolbar for receipt of wheel 12.02.18
		toolbar: {
			  items: [     //create toolbar items
	//toolbar code
	   {
                	icon: '<%=contextpath%>/images/rs_out.png',
                    text: 'Create Rack for Dispatch',
                    click: function () {
                    	
                    	 var $selectedRows = $('#ReadyCoachProductionTableContainer').jtable('selectedRows');
                    	
                	 	 if ($selectedRows.length<1)
                		 alert("Please select a row for which you want to create Rack");
                	 	 else{
                	 		var coachNumberArr=[], manufacturedDateArr=[], i=0;
                	 		var record;
                	 		//ArrayList<String> dateVariable = new ArrayList<String>(); 
                	 		$selectedRows.each(function () {
                                record = $(this).data('record');
                                coachNumberArr[i]=record.coachNumber;
                                //alert("Hi navin");
                                manufacturedDateArr.push(record.coachManufacturedDate);        //how to retrieve recent date from list of date?
                               
                        		i++;
                        		
                	 		
                	 		});

                	 		//var maxDate=new Date(Math.max.apply(null,manufacturedDateArr));
                	 		var maxDate = manufacturedDateArr.reduce(function (a, b) { return a > b ? a : b; });
                	 		//alert(maxDate);
                	 		 var from=maxDate.substring(0, 10);
                             
                  		    var numbers = from.match(/\d+/g); 
                     		
                      		var date = new Date(numbers[0], numbers[1]-1, numbers[2]);
                     		
                     		$('#datepickerExit').datepicker('option', 'minDate', date);
                	 		alert(coachNumberArr);
                	 		
                	 	 	$("#receiptDialog").dialog({
                	 	 		title : 'Receipt for   '+record.coachNumber+'',                     	 	 		
                	 	 		close: function (e, u) {
          	 		              //$(".formError").remove();
          	 		          	$("#receiptDialog").validationEngine('hideAll');
          	 		          },
            	 		 	
		 							buttons: {
                                    Submit: function () {
                                    		
                                    	//alert("$('#qtyDispatched').val()->"+$('#qtyDispatched').val());
                                    	//alert("record.balanceQtyToDispatch->"+record.balanceQtyToDispatch);
                            	 		
                                    	if ($('#datepickerExit').validationEngine('validate')) {
			                                        	//alert(!$("#dialog").validationEngine('validate'));
			                                            return false;
			                                        }
                                    		    	   
                                    	$.ajax({
                    						url : "rackFormation",  //action-name as defined in struts.xml
                    						dataType: 'json', 
                    						
                    						data : {
                    							coachNumberJson: JSON.stringify(coachNumberArr),          							
                    						rackFormationDate:$('#datepickerExit').val(), 
                    						rackID: $('#rackID').val(),
                    						
                    							
                    							
                    						
                    						},
                    						
                    						type : 'POST',
                    						async : false,
                            	 		})
                    						.done(function( msg ) {
                    							$('#datepickerExit').val(),  
                    							$('#rackID').val(),
                    							$('#receiptDialog').dialog('close');
                    							
                    							$('#ReadyCoachProductionTableContainer').jtable('load');
         								  })
         								.error(function (msg){
         									//$('#dialog').dialog('close');
         									alert("Error Fetching Data");
         								})
         								  ;
				                 			    	   return true;
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
	
	
	//toolbar code
				  
				  
				  
				  ]     //end toolbar items
			
		},
		
		
		//end of toolbar code
		
		
		
		
		title : 'Coach Ready for Rack formation',
			
			
            sorting: true,
            defaultSorting: 'coachNumber ASC',
            selecting: true, //Enable selecting
            multiselect: true, 
            multiSorting: true,
            animationsEnabled : true,
     
	actions : {
 			listAction: 'listCoachTurnoutAction',
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
				coachNumber : {
					title : 'Coach Number',
					width: '8%',
					key: true,
					list : true,
					edit : false,
					create : false
									
					},
					coachType: {
					title: 'Coach Type',
					width: '10%',
					list: true,
					edit: false,
					create: false,
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
								
								coachManufacturedDate: {
									   title: 'Coach Manufactured Date',
									   width : '10%',
									   type: 'date',
									  displayFormat: 'dd-mm-yy',
										edit : false,
										create: false 
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
				}
	              
			});
	$('#ReadyCoachProductionTableContainer').jtable('load');
		});
		
		
	</script>
	 
	