<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Asset master</title>
<% String contextpath=request.getContextPath();%>
<script src="<%=contextpath %>/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/jquery-ui-1.11.4.custom/jquery-ui.js" type="text/javascript"></script>
<link href="<%=contextpath %>/css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />


<link rel="stylesheet" href="<%=contextpath%>/js/jquery-ui-1.11.4.custom/jquery-ui.css">
<script src="<%=contextpath %>/js/jquery.jtable.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/moment.js" type="text/javascript"></script>
<link href="<%=contextpath%>/js/validationEngine/validationEngine.jquery.css" rel="stylesheet"type="text/css" />

<script src="<%=contextpath%>/js/validationEngine/jquery.validationEngine.js" type="text/javascript"></script>
<script src="<%=contextpath%>/js/validationEngine/jquery.validationEngine-en.js" type="text/javascript"></script>
<script>

$(document).ready(function() {
	var srno;
	
	var workingShops=[], i=1;
	workingShops[0]={Value:'', DisplayText:"Select"}
	<c:forEach var="a" items= "${workingShop}">
	workingShops[i]={Value:"${a.shopId}", DisplayText:"${a.shopName}"};
	i++;
	</c:forEach>
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
	$('#JobmasterTableContainer').jtable({

		//create toolbar for receipt of bogie 12.02.18
		toolbar: {
			  items: [     //create toolbar items
	//toolbar code
	   {
                	icon: '<%=contextpath%>/images/rs_out.png',
                    text: 'Job Completion',
                    click: function () {
                    	
                    	 var $selectedRows = $('#JobmasterTableContainer').jtable('selectedRows');
                	 	 if ($selectedRows.length<1)
                		 alert("Please select Job which you want to complete");
                	 	 
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
                              if(record.status=='completed')
                              { alert("The selected job is already completed");}
                              else{
                             var startDate=(record.startDate).substring(0,10);
                                  
                                  
                                  var num = startDate.match(/\d+/g); 
                          		
                          		var date = new Date(num[0], num[1]-1, num[2]);
                             
                                  $('#datepickerExit').datepicker('option', 'minDate', date);
                                  
                	 	 	$("#jobCompletionDialog").dialog({
                	 	 		title : 'Job Completed for Job Description:  '+record.jobDescription+'',                     	 	 		
                	 	 		close: function (e, u) {
          	 		              //$(".formError").remove();
          	 		          	$("#jobCompletionDialog").validationEngine('hideAll');
          	 		          },
            	 		 	
		 							buttons: {
                                    Submit: function () {
                                    		
                                    	//alert("$('#qtyDispatched').val()->"+$('#qtyDispatched').val());
                                    	//alert("record.balanceQtyToDispatch->"+record.balanceQtyToDispatch);
                            	 		
                                    	if ($('#datepickerExit').validationEngine('validate')) {
			                                        	
			                                            return false;
			                                        }
                                    	if ($('#status').validationEngine('validate')) {
                                        	
                                            return false;
                                        }	    	   
                                    	$.ajax({
                    						//url : "transfer_retiredEmployee",  //action-name as defined in struts.xml
                    						url: "jobCompletionAction",
                    						dataType: 'json', 
                    						data : {
                    							jobSeqNo: record.jobSeqNo,
                    							//subSection:record.subSection,
                    							//fromDate:record.validFrom,
                    							status:$('#status').val(),      							
                    							completionDate:$('#datepickerExit').val(),
                    							remarks:$('#remarks').val(),               							
                    				
                    						},
                    						
                    						type : 'POST',
                    						async : false,
                            	 		})
                    						.done(function( msg ) {
                    							$('#datepickerExit').val(''),  
                    							$('#status').val(''),
                    							$('#remarks').val(''),
                    							$('#jobCompletionDialog').dialog('close');
                    							
                    							$('#JobmasterTableContainer').jtable('load');
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
                	 	 }        	 		

        			    	   return true;
                	 		    
                	 			  
                	 		  }//ending else               	  
                	  // ajax call ends here				
						 
                    }
                }
	
	
	//toolbar code
				  
				  
				  
				  ]     //end toolbar items
			
		},
		
		
		//end of toolbar code



		
		title : 'Job List',
		paging:true,
		sorting: true,
		defaultSorting: 'jobId ASC',
		selecting: true, //Enable selecting
        multiselect: false,
		actions : {
			listAction : 'listJobAction',
			createAction: 'createJobAction',
			updateAction: 'updateJobAction',
			deleteAction: 'deleteJobAction'
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
			jobSeqNo : {
				title : '',
				width : '0%',
				edit :false,
				list: false,
				create: false,
				key: true
			},
			jobId:{
              title: 'Job Id',
              width:'8%',
              edit: true,
              create:true,
              list:true
				},
			
		
			jobDescription : {
				title : 'Job Description',
				width : '10%',
				inputClass: 'validate[required]',
				list: true,
				type:'textarea',
				edit : true,
				create: true
				
			},
			
			shop: {
				title : 'Shop',
				width : '10%',
				//options:workingShops,
				options:{'':'Select','Wheel':'Wheel Shop','Bogie':'Bogie Shop', 'Shell':'Shell Shop'},
				edit : true,
				list:true
				
			},
			section : {
				title : 'Section',
				dependsOn:'shop',
				inputClass: 'validate[required]',
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
				inputClass: 'validate[required]',
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
                create:true,
              
            },
            activityId : {
            	title : 'Activity Type',
				dependsOn: 'subSection',
				inputClass: 'validate[required]',
				options: function (data) {
                   var optionField=[];
                   $.ajax({
                	  url:'getActivityBysubSection',
                	  type:'post',
                	  async:false,
                	  dataType:'json',
                	  data:{
                		  shop:data.dependedValues.subSection
                	  }
                   })
                   .done(function(msg)
                		   {
                	   if(msg.activityList!=null)
                		   {
                		   for(i=0;i<msg.activityList.length;i++)
                			   {
                			   optionField[i]={Value:msg.activityList[i].jobActivityId, DisplayText:msg.activityList[i].jobActivityDescription};
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
                create:true,
              
            },
            qty:
                {
                title:'Qty',
                width:'10%',
                inputClass: 'validate[custom[number]]',
                edit:true,
                list:true
                },
            unit: {
				title : 'Unit',
				width : '10%',
				options:{'':'Select','ltr':'ltr','kl':'Kilo Litre', 'kg':'kg', 'no':'number','ton':'Ton'},
				edit : true,
				list:true
				
			},
            startDate: {
				title :'Start Date',
				width: '8%',
				inputClass: 'validate[required]',

				display:function(data){
					//alert(data.record.id.hodyCode)	;				 
					return ((data.record.startDate!=null) && (data.record.startDate!="") ) ? moment(data.record.startDate).format('DD-MM-YYYY') : "";
										},
										list: true,
										create: true,
										edit: false
														
										},
			expectedCompletionDate: {
			title :'Expected Completion Date',
			width: '8%',
											

			display:function(data){
												//alert(data.record.id.hodyCode)	;				 
			return ((data.record.expectedCompletionDate!=null) && (data.record.expectedCompletionDate!="") ) ? moment(data.record.expectedCompletionDate).format('DD-MM-YYYY') : "";
						},
			list: true,
			create: true,
			edit: false
																					
			},
			 status:
             {
             title:'Status',
             display:function(data){
                 if(data.record.status=='completed') {return  'Completed';}
                 else if(data.record.status=='under_progress') {return  'Under Progress';}
                 else return data.record.status;
             },
             width:'10%',
             create: false,
             edit:true,
             list:true
             },
             machineId:
             {
             title: 'Machine Description',
             dependsOn: 'shop',
             width : '0%',
             options: function (data) {
                 var optionField=[];
                 $.ajax({
              	 // url:'getActivityBysubSection',
              	 url:'getMachineByShop',
              	  type:'post',
              	  async:false,
              	  dataType:'json',
              	  data:{
              		  shop:data.dependedValues.shop
              	  }
                 })
                 .done(function(msg)
              		   {
              	   if(msg.machineList!=null)
              		   {
              		   for(i=0;i<msg.machineList.length;i++)
              			   {
              			   optionField[i]={Value:msg.machineList[i].machineId, DisplayText:msg.machineList[i].machineDescription};
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



               //  options: getMachineId,
           //  display:function(data){
					
				//	 if (data.record.machineId != null) {
									 
				//	return (findObjectByKey(getMachineId, 'Value', data.record.machineId)).DisplayText;
				//	 }
            // },
				edit :true,
				list: true,
				create: true
				
             },			
										 
	},
	formCreated: function(event, data)
	{
		 $('[name=startDate]').datepicker({
				
				dateFormat: 'dd-mm-yy',
			    onSelect: function(selected) {
			      $('[name=expectedCompletionDate]').datepicker("option","minDate", selected)

			    }
			}).datepicker("option", "maxDate", new Date);;

			$('[name=expectedCompletionDate]').datepicker({ 
				
				dateFormat: 'dd-mm-yy',
			    onSelect: function(selected) {
			        $('[name=startDate]').datepicker("option","maxDate", selected)

			    }
			}); 
	},
	rowInserted:function(event,data)
	{
		if(data.record.status=='completed')
		{
		//alert("inside resolved");
		//data.row.find('.jtable-edit-button').css("opacity",1);
		//data.row.find('.jtable-edit-button').off("click");
		data.row.find('.jtable-edit-command-button').hide();
		data.row.find('.jtable-delete-command-button').hide();
		}
	else
		{
		data.row.find('.jtable-edit-command-button').show();
		data.row.find('.jtable-delete-command-button').show();
		}
	},
	loadingRecords: function(event,data)
	{
		srno=0;
	},
	formSubmitting: function (event, data) {
		//alert("submitting form");
    return data.form.validationEngine('validate');
             
            },

//Dispose validation logic when form is closed
	formClosed: function (event, data) {
                data.form.validationEngine('hide');
                data.form.validationEngine('detach');
            },
	recordDeleted: function(event,data)
	{
		srno=0;
		$('#JobmasterTableContainer').jtable('load');
	},
	
	recordUpdated: function(event,data)
	{
		srno=0;
		//return data.form.validationEngine('validate');
		$('#JobmasterTableContainer').jtable('load');
	},
		
	});
	
	$('#JobmasterTableContainer').jtable('load');

}); 



function findObjectByKey(array, key, value) {
    for (var i = 0; i < array.length; i++) {
        if (array[i][key] == value) {
            return array[i];
        }
    }
    return null;
}
</script>
</head>
<body>
	<div
		style="width: 80%; margin-right: 10%; margin-left: 10%; text-align: center;">
		
		<div id="JobmasterTableContainer"></div>
		<div id="jobCompletionDialog" style="height:150%; width:200%; display:none;z-index: 9;">
Reason: <br>
		    <select id="status" class='validate[required]'>
		    <option value="">Select</option>
		     <option value="completed">Completed</option>
		     <option value="under_progress">Under Progress</option>
		    </select>
		     <br>
 
 Enter Completion Date: <br>
		    <input type="Text" id="datepickerExit" class='validate[required]' />
		     <br>
Enter Remarks: <br>
		    <textarea id="remarks" ></textarea>
		     <br>	     
</div>
	</div>
</body>
</html>