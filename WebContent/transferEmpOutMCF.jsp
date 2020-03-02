<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Asset master</title>
<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css" />
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>
<!-- <script src="js/EmpmasterTablejtable.js" type="text/javascript"></script> -->
<% String contextpath=request.getContextPath();%>
<link href="<%=contextpath %>/css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />

<script src="<%=contextpath %>/js/moment.js" type="text/javascript"></script>


<link href="<%=contextpath %>/js/validationEngine/validationEngine.jquery.css" rel="stylesheet"type="text/css" />

<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine-en.js" type="text/javascript"></script>
<script>

$(document).ready(function() {

	//date picker
	
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
	//end code for date picker
	var srno;
	$('#EmpmasterTableContainer').jtable({

		//create toolbar for receipt of bogie 12.02.18
		toolbar: {
			  items: [     //create toolbar items
	//toolbar code
	   {
                	icon: '<%=contextpath%>/images/rs_out.png',
                    text: 'Transfer/Retired Emp',
                    click: function () {
                    	
                    	 var $selectedRows = $('#EmpmasterTableContainer').jtable('selectedRows');
                	 	 if ($selectedRows.length<1)
                		 alert("Please select Employee which you want to transfer /Retired");
                	 	 else{
                	 		var record;
                	 		$selectedRows.each(function () {
                                record = $(this).data('record');
//                                 var dispatchDate = record.assemblyExitDate;
//                                 var from=dispatchDate.substring(0, 10);
                                
//                         		var numbers = from.match(/\d+/g); 
                        		
//                         		var date = new Date(numbers[0], numbers[1]-1, numbers[2]);
                        		
//                         		$('#datepickerExit').datepicker('option', 'minDate', date);
                                });

        					
                	 	 	$("#transferEmployee").dialog({
                	 	 		title : 'Retired/ Transfer for Employee  '+record.emp_no+'',                     	 	 		
                	 	 		close: function (e, u) {
          	 		              //$(".formError").remove();
          	 		          	$("#transferEmployee").validationEngine('hideAll');
          	 		          },
            	 		 	
		 							buttons: {
                                    Submit: function () {
                                    		
                                    	//alert("$('#qtyDispatched').val()->"+$('#qtyDispatched').val());
                                    	//alert("record.balanceQtyToDispatch->"+record.balanceQtyToDispatch);
                            	 		
                                    	if ($('#datepickerExit').validationEngine('validate')) {
			                                        	
			                                            return false;
			                                        }
                                    	if ($('#reason').validationEngine('validate')) {
                                        	
                                            return false;
                                        }	    	   
                                    	$.ajax({
                    						url : "transfer_retiredEmployee",  //action-name as defined in struts.xml
                    						dataType: 'json', 
                    						data : {
                    							empNumber: record.emp_no,
                    							subSection:record.subSection,
                    							fromDate:record.validFrom,
                    							status:$('#reason').val(),      							
                    							transfer_retiredDate:$('#datepickerExit').val(),              							
                    				
                    						},
                    						
                    						type : 'POST',
                    						async : false,
                            	 		})
                    						.done(function( msg ) {
                    							$('#datepickerExit').val(''),  
                    							$('#reason').val(''),
                    						
                    							$('#transferEmployee').dialog('close');
                    							
                    							$('#EmpmasterTableContainer').jtable('load');
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
		

		
		title : 'Employee List',
		paging:true,
		sorting: true,
		defaultSorting: 'emp_no ASC',
		selecting: true, //Enable selecting
        multiselect: false,
		actions : {
			listAction : 'listEmployeeAction',
			//createAction : 'createEmployeeAction',
			//updateAction : 'updateEmployeeAction',
			//deleteAction : 'deleteEmployeeAction'
		},
		

		fields : {
			
			sno:{
				title : 'SNo',
				create: false,
				edit : false,
				display: function(data)
				{
					
					srno++;
					return srno;
				}
			},
			emp_no : {
				title : 'Emp No',
				width : '10%',
				edit :false,
				list: true,
				create: true,
				key: true
			},
			
		
			emp_name : {
				title : 'Emp Name',
				width : '10%',
				list: true,
				edit : false,
				create: true
				
			},
			
			shop: {
				title : 'Shop',
				width : '10%',
				options:{'':'Select','Wheel':'Wheel Shop','Bogie':'Bogie Shop'},
				edit : true,
				list:true
				
			},
			section : {
				title : 'Section',
				dependsOn: 'shop',
				options: function (data) {
                   var optionField=[];
                   $.ajax({
                	  url:'getSectionByShop',
                	  type:'post',
                	  async:false,
                	  dataType:'json',
                	  data:{
                		  shop:data.dependedValues.shop
                	  }
                   })
                   .done(function(msg)
                		   {
                	   if(msg.sectionList!=null)
                		   {
                		  
                		   for(i=0;i<msg.sectionList.length;i++)
                			   {
                			   optionField[i]={Value:msg.sectionList[i].subsectionId, DisplayText:msg.sectionList[i].subsectionDescription};
                			   }
                		   }
                	   return optionField;
                		   })
                		   .error(function (msg)
                				   {
                			   alert("Error in retrieving data");
                				   });
                   return optionField;
                },
                edit: true,
                create:true
            },
				
			
            subSection : {
            	title : 'Sub Section',
				dependsOn: 'section',
				options: function (data) {
                   var optionField=[];
                   $.ajax({
                	  url:'getSectionByShop',
                	  type:'post',
                	  async:false,
                	  dataType:'json',
                	  data:{
                		  shop:data.dependedValues.section
                	  }
                   })
                   .done(function(msg)
                		   {
                	   if(msg.sectionList!=null)
                		   {
                		   for(i=0;i<msg.sectionList.length;i++)
                			   {
                			   optionField[i]={Value:msg.sectionList[i].subsectionId, DisplayText:msg.sectionList[i].subsectionDescription};
                			   }
                		   }
                	   return optionField;
                		   })
                		   .error(function (msg)
                				   {
                			   alert("Error in retrieving data");
                				   });
                   return optionField;
                },
                edit: true,
                create:true
            },
			validFrom : {
				title : 'Valid From',
				width : '10%',
				edit :false,
				list: false,
				create: false
				
			},
			validTo : {
				title : 'Valid To',
				width : '10%',
				edit :false,
				list: false,
				create: false,
				
			},
	},
	loadingRecords: function(event,data)
	{
		srno=0;
	},
	recordDeleted: function(event,data)
	{
		srno=0;
		$('#EmpmasterTableContainer').jtable('load');
	},
	
	recordUpdated: function(event,data)
	{
		srno=0;
		$('#EmpmasterTableContainer').jtable('load');
	},
		
	});
	
	$('#EmpmasterTableContainer').jtable('load');

}); 



</script>
</head>
<body>
	<div id="EmpmasterTableContainer" style="width: 80%; margin-right: 10%; margin-left: 10%; text-align: center;"></div>
	
	<div id="transferEmployee" style="height:150%; width:200%; display:none;z-index: 9;">
Reason: <br>
		    <select id="reason" class='validate[required]'>
		    <option value="">Select</option>
		     <option value="transfer">Transfer</option>
		     <option value="retired">Retired</option>
		     <option value="death">Death</option>
		    </select>
		     <br>
 
 Enter Transfer/Retired Date: <br>
		    <input type="Text" id="datepickerExit" class='validate[required]' />
		     <br>
</div>
</body>
</html>