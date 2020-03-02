<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Calendar" %>
<html>
<head>
<title></title>
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



<script type="text/javascript">
		$(document).ready(function() {
			
			
			
		
			window.alert = function(message) {
			    $('<div />').text(message).dialog({
			        modal:true,
			        title:'Message',
			        buttons: {
			            'OK':function(){
			                $(this).dialog('close');
			            }
			        },
			        close:function(){ $(this).dialog('destroy').remove(); }
			    });
			};
			
		 
			$('#datepickerlieu').datepicker({
		        //inline: true,
		        dateFormat: 'dd-mm-yy',
		        changeMonth: true,
		        changeYear: true,
		        yearRange: '-5:+5',
		        constrainInput: true,
		        duration: '',
		        gotoCurrent: true,
		        beforeShow: function() {
		            setTimeout(function(){
		                $('.ui-datepicker').css('z-index', 99999999999999);
		            }, 0);
		        }

		    }).datepicker("setDate", new Date());

	        var messages= {
	    		    serverCommunicationError: 'An error occured while communicating to the server.',
	    		    loadingMessage: 'Loading records...',
	    		    noDataAvailable: 'No Holidays maintained for Production Unit' ,
	    		    addNewRecord: 'Add New Holiday',
	    		    editRecord: 'Edit Record',
	    		    areYouSure: 'Are you sure?',
	    		    deleteConfirmation: 'This record will be deleted. Are you sure?',
	    		    save: 'Save',
	    		    saving: 'Saving',
	    		    cancel: 'Cancel',
	    		    deleteText: 'Delete',
	    		    deleting: 'Deleting',
	    		    error: 'Error',
	    		    close: 'Close',
	    		    cannotLoadOptionsFor: 'Can not load options for field {0}',
	    		    pagingInfo: 'Showing {0}-{1} of {2}',
	    		    pageSizeChangeLabel: 'Row count',
	    		    gotoPageLabel: 'Go to page',
	    		    canNotDeletedRecords: 'Can not deleted {0} of {1} records!',
	    		    deleteProggress: 'Deleted {0} of {1} records, processing...'
	    		}
			
			
	        var holiday_options=[];
			$.ajax({                    
				  url: 'getHolidayCodesAndNames',     
				  type: 'post', // performing a POST request
				  async: true,
												                    
			})
					.done(function( msg ) {
						if(msg.holidayList!=null)
			   			{
				


				   			for(i=0;i<msg.holidayList.length;i++)
							{
				   				
				   				holiday_options[i]={ Value: msg.holidayList[i].hodyCode, DisplayText: msg.holidayList[i].hodyDesc };
									
							}
								
								
							 
			   			}
																									    											
					  })
					.error(function (msg){
						alert("Error Saving Data");
					})
					  ;		
        	
			
			var srno=0;
		$('#HolidayTableContainer').jtable({
			
			title : 'Holiday List',
			
			messages: messages,
		//	paging: true,
		//	pageSize : 50,
		//	pageSizes :  [50, 100],
            sorting: true,
            defaultSorting: 'id.calHodyDate ASC',
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
//            useBootstrap: true,
          //  selectingCheckboxes: true,
            animationsEnabled : true,
            toolbar: {
                items: [
                    {
                    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'Assign Lieu Date',
                        click: function () {
                        	
                        	
                        	 var $selectedRows = $('#HolidayTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a holiday for which you want to assign e Lieu Date");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
                    	 		
                    	 		
            					
                    	 	 	$("#lieuDialog").dialog({
                    	 	 		title : 'Lieu Date for '+(findObjectByKey(holiday_options, 'Value',record.id.hodyCode)).DisplayText + '-' +moment(record.id.calHodyDate).format('DD-MM-YYYY'),                     	 	 		
                    	 	 		close: function (e, u) {
              	 		              //$(".formError").remove();
              	 		          	$("#lieuDialog").validationEngine('hideAll');
              	 		          },
                	 		 	
 		 							buttons: {
	                                    Submit: function () {
	                                    		
	                                    	//alert("$('#qtyDispatched').val()->"+$('#qtyDispatched').val());
	                                    	//alert("record.balanceQtyToDispatch->"+record.balanceQtyToDispatch);
	                            	 		
	                                    	if ($('#datepickerlieu').validationEngine('validate')) {
				                                        	//alert(!$("#dialog").validationEngine('validate'));
				                                            return false;
				                                        }
	                                    		    	   
	                                    	$.ajax({
	                    						url : "assignLieuDate",
	                    						dataType: 'json', 
	                    						data : {
	                    							
	                    							calHodyDate: moment(record.id.calHodyDate).format('DD-MM-YYYY'),
	                    							hodyCode: record.id.hodyCode,
	                    							lieuDate:$('#datepickerlieu').val(),
	                    							remarks:$('#lieuRemarks').val()
	                    							
	                    						},
	                    						
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							
	                    							
	                    							$('#datepickerlieu').val('');
	                    							$('#lieuRemarks').val('');
	                    						
	                    							$('#lieuDialog').dialog('close');
	                    							if(msg.res==true)
	                    								{
	                    									alert("Lieu Date assigned successfully for the selected Holiday");
	                    								}
	                    							else
	                    								{ alert("One Lieu Date is already assigned for the selected holiday date");
	                    								
	                    								}
	                    									$('#HolidayTableContainer').jtable('load', {year: $('#year').val()});
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
            ]
            },
            
            
            
            
			
			actions : {
 				listAction : 'listHolidayMasterAction',
 				createAction : 'createHolidayMasterAction'
 				//,
 				//deleteAction : 'deleteHolidayMasterAction',
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
				
				hodyCode : {
					title : 'Holiday Desc',
				
					display:function(data){
						
						 if (data.record.id.hodyCode != null) {
						//alert(data.record.id.hodyCode)	;				 
						return (findObjectByKey(holiday_options, 'Value',data.record.id.hodyCode)).DisplayText;
						 }
											},
					options: holiday_options,
					/*function(data){
						 var holidayCodes=[];
						 if (data.source == 'list') {
							
      
							 $.ajax({                    
								  url: 'getHolidayNameByCode',     
								  type: 'post', // performing a POST request
								  async: false,
								  dataType: 'json',
								  data : {
									  
									  holiday_code: data.record.id.hodyCode,
									  
									  
									 
								  	  }
																                    
							})
									.done(function( msg ) {
										if(msg.holidayDescList!=null)
							   			{
								


								   			for(i=0;i<msg.holidayDescList.length;i++)
											{
								   				holidayCodes[i]={ Value: msg.holidayDescList[i].hodyCode, DisplayText: msg.holidayDescList[i].hodyDesc };
								   				//holidayCodes[i]=''+msg.holidayDescList[i].hodyCode;
								   				alert(holidayCodes[i]+":"+holidayCodes[i].Value+","+ holidayCodes[i].DisplayText);
											}
												
												
											 
							   			}
										//return holidayCodes;																		    											
									  })
									.error(function (msg){
										alert("Error Saving Data");
									})
									  ;	
				            
				            
				             
				             
    					    return holidayCodes;
   						}
						 else
							 {
					
							
		            	
		            	return holiday_options;
							
		            }, */
					edit : true,
					create : true,
					
					
				},
				
				calHodyDate : {
					title : 'Holiday Date',
					type: 'date',
					display:function(data){
						//alert(data.record.id.hodyCode)	;				 
						return ((data.record.id.calHodyDate!=null) && (data.record.id.calHodyDate!="") ) ? moment(data.record.id.calHodyDate).format('DD-MM-YYYY') : "";
											}, 
					displayFormat: 'dd-mm-yy',
					edit : true,
					create : true
					
				},
				
				
				
				lieu : {
                    title: 'Lieu Dates',
                    width: '5%',
                    sorting: false,
                    edit: false,
                    create: false,
                    display: function (holidayData) {
                    	var lieuFlag;
                    	
                       	$.ajax({
    						url : "isHolidayHavingLieuDate",
    						dataType: 'json', 
    						data : {
    							
    							calHodyDate: moment(holidayData.record.id.calHodyDate).format('DD-MM-YYYY'),
    							hodyCode: holidayData.record.id.hodyCode,
    							
    							
    						},
    						
    						type : 'POST',
    						async : false,
            	 		})
    						.done(function( res ) {
    							lieuFlag=res.lieuFlag;
    							
    							
							  })
							.error(function (msg){
								//$('#dialog').dialog('close');
								alert("Error Fetching Data");
							})
							  ;
                    	
                    	if(lieuFlag=="Y")
                    	{
                        var $img = $('<img src="<%=contextpath %>/images/maintain.png" title="Lieu Date" > </img>');
                        //Open child table when user clicks the image
                        $img.click(function () {
                        	
                            $('#HolidayTableContainer').jtable('openChildTable',
                                    $img.closest('tr'), //Parent row
                                    {
                                    title: (findObjectByKey(holiday_options, 'Value',holidayData.record.id.hodyCode)).DisplayText + ' - Lieu Date',
                                    
                                    actions : {
                         				listAction : 'listLieuMasterAction?hodyCode=' + holidayData.record.id.hodyCode+'&calHodyDate=' +moment(holidayData.record.id.calHodyDate).format('DD-MM-YYYY'),
                         				createAction : 'createLieuMasterAction?hodyCode=' + holidayData.record.id.hodyCode+'&calHodyDate=' +moment(holidayData.record.id.calHodyDate).format('DD-MM-YYYY'),
                         				//updateAction : 'updateTaskListOperationMasterAction?taskListId=' + taskData.record.taskListId ,
                         				//deleteAction : 'deleteLieuMasterAction?hodyCode=' + holidayData.record.id.hodyCode+'&calHodyDate=' +moment(holidayData.record.id.calHodyDate).format('DD-MM-YYYY'),
                        			},
                        			fields : {
                        				
                        			                       				
                        				lieuDate : {
                        					title : 'Lieu Date',
                        					type: 'date',
                        					key : true,
                        					display:function(data){
                        						//alert(data.record.id.hodyCode)	;				 
                        						return ((data.record.id.lieuDate!=null) && (data.record.id.lieuDate!="") ) ? moment(data.record.id.lieuDate).format('DD-MM-YYYY') : "";
                        											}, 
                        					displayFormat: 'dd-mm-yy',
                        					edit : true,
                        					create : true,
                        					
                        					
                        				},
                        				
                        				
                        				remarks:{
                        					title : 'Remarks',
                        					width : '5%',
                        					type: 'textarea',
                        					
                        				},
                        				
                        				
                        				Delete: {
                        					title: '',
                        					create: false,
                        					width : '2%',
                        					display: function(data1){
                        					var $img = $('<img src="<%=contextpath %>/images/delete1.png" title="Delete" > </img>');
                        					
                        					
                        					
                        													$img
                        															.click(function() {
                        																//alert("Inside Delete click event");
                        																
                        																var r = confirm("Are you sure you want to delete the Lieu Date!");
                        if (r == true) {
                            
                        	$.ajax(
                        			{
                        				url : 'deleteLieuMasterAction',
                        				type : 'post', // performing a POST request
                        				async : false,
                        				traditional : true,
                        				dataType : 'json',
                        				data : {
                        					
                        					calHodyDate: moment(data1.record.id.calHodyDate).format('DD-MM-YYYY'),
                        					hodyCode: data1.record.id.hodyCode,
                        					lieuDate: moment(data1.record.id.lieuDate).format('DD-MM-YYYY'),

                        				}

                        			})
                        	.done(
                        			function(
                        					msg) {
                        				
                        				alert("Lieu deleted successfully");

                        			
                        				$(
                        						'#HolidayTableContainer')
                        						.jtable(
                        								'load');

                        			})
                        	.error(
                        			function(
                        					msg) {
                        				alert("Error Saving Data");
                        			});
                        	
                        	
                        } else {
                            return;
                        }
                        																
                        																
                        																
                        																		

                        															});
                        													return $img;
                        												}
                        											},
                        				
                        				
                        				
                        				
                        		
                        				
                        				},
                        			
                                    formCreated: function (event, data) 
                                    {
                                    	
                                    	
                                    	
                                    }
                                    
                                }, function (data) { //opened handler
                                    data.childTable.jtable('load');
                                });
                        });
                        //Return image to show on the person row
                        return $img;
                    	}
                    	else
                    		{
                    		return " ";
                    		}
                    }
                },
				
				
				
				Delete: {
					title: '',
					create: false,
					width : '2%',
					display: function(data){
					var $img = $('<img src="<%=contextpath %>/images/delete1.png" title="Delete" > </img>');
					
					
					
													$img
															.click(function() {
																//alert("Inside Delete click event");
																
																var r = confirm("Are you sure you want to delete the holiday!");
if (r == true) {
    
	$.ajax(
			{
				url : 'deleteHolidayMasterAction',
				type : 'post', // performing a POST request
				async : false,
				traditional : true,
				dataType : 'json',
				data : {
					
					calHodyDate: moment(data.record.id.calHodyDate).format('DD-MM-YYYY'),
					hodyCode: data.record.id.hodyCode
					

				}

			})
	.done(
			function(
					msg) {
				
				alert("Holiday deleted successfully");

			
				$(
						'#HolidayTableContainer')
						.jtable(
								'load');

			})
	.error(
			function(
					msg) {
				alert("Error Saving Data");
			});
	
	
} else {
    return;
}
																
																
																
																		

															});
													return $img;
												}
											},

			},
// 			recordAdded: function(event,data)
// 			{
// 				alert(data.serverResponse.message);
// 			},
			loadingRecords: function(event,data)
			{
				srno=0;
			},
				formCreated: function (event, data) {
					
				
						
					
					
	                //data.form.validationEngine();
	            },
	            recordDeleted: function(event,data)
	    		{
	    			srno=0;
	    			$('#HolidayTableContainer').jtable('load');
	    		},
	    		
// 	            recordAdded: function (event, data) {
// 	            	alert(data.serverResponse.message);
// 	            	$('#HolidayTableContainer').jtable('load', {datepickerfrom: $('#datepickerfrom').val(), datepickerto: $('#datepickerto').val(), rs_cat: $('#rs_cat').val(), maint_depot: $('#depot').val(), shop: $('#shop').val()});
// 	    //return data.form.validationEngine('validate');
	             
// 	            }, 
					//Validate form when it is being submitted
				formSubmitting: function (event, data) {
			   // return data.form.validationEngine('validate');
			             
			            },
			    
				//Dispose validation logic when form is closed
				formClosed: function (event, data) {
			            //    data.form.validationEngine('hide');
			            //    data.form.validationEngine('detach');
			            },
		            
			});
		
		$('#LoadRecordsButton').click(function (e) {
			srno=0;
		
            e.preventDefault();
            $('#HolidayTableContainer').jtable('load', {year: $('#year').val()});
        });
		srno=0;
		//$('#HolidayTableContainer').jtable('load', {year: $('#year').val()});
        //Load all records when page is first shown
        $('#LoadRecordsButton').click();

		 
//         $('#HolidayTableContainer').jtable('load');
		 
		
		 
		});
	</script>
<div class="filtering">
    <form>
    
    
    Year:
       <select id="year">
       <%
Calendar cal = Calendar.getInstance();
int year= cal.get(Calendar.YEAR);
%>
        <option value="<%=year-1%>"><%=year-1%></option>
        <option value="<%=year%>" selected><%=year%></option>
        <option value="<%=year+1%>"><%=year+1%></option>
        
    </select>

         
  
          <button type="submit" id="LoadRecordsButton">Load records</button>
         
</form>		     
		       		

      		
 </div> 
<div style="width: 90%; margin-right: 5%; margin-left: 0%; text-align: center; margin-top:2%" id="HolidayTableContainer">
</div>
    <div id="lieuDialog" style="height:150%; width:200%; display:none;z-index: 9;" >
  <br>
			  <br>
			 Enter Lieu Date: <br>
		     <input type="Text" id="datepickerlieu" class='validate[required]' />
		     <br>
		      <br>
		      Remarks: <br>
		     <input type="Text" id="lieuRemarks" /> 
 </div>
 <script>
 function findObjectByKey(array, key, value) {
	    for (var i = 0; i < array.length; i++) {
	        if (array[i][key] === value) {
	            return array[i];
	        }
	    }
	    return null;
	}
 </script>