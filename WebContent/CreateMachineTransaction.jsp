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
<% String contextpath=request.getContextPath(); %>

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


</style>


<body>
<div id="MachineMasterTableContainer"></div>
  <div id="reportBreakdown" style="height:150%; width:200%; display:none;z-index: 9;" >
             Enter Breakdown Date: <br>
		     <input type="Text" id="dateOfBreakDown" class='validate[required]'/>
		     <br>
             <br>
		     Enter Breakdown Details<br>
		     <textarea id="breakdownDetails" class='validate[required]'></textarea>
		     <br>
		      <br>
		     
		     Remarks: <br>
		     <textarea id="remarks" > </textarea>
		     <br>
		      
 </div>
</body>
<script type="text/javascript">
		$(document).ready(function() {
			
			$('#dateOfBreakDown').datepicker({
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
			var i=1;
       //retrieve machine type
			var machineTypes=[];
			machineTypes[0]={ Value:null, DisplayText: "Select" };
			<c:forEach var="a" items="${machineType}">
			
			machineTypes[i]={ Value: "${a}", DisplayText: "${a}" };
		i++;
	    </c:forEach>
	
	   // end of code for machine type
		
	   //start: retrieving maintainence shop in dropdown option
		    var maintainenceShops=[]; 

			var j=1;
			maintainenceShops[0]={ Value:null, DisplayText: "Select" };
			<c:forEach var="b" items="${maintainenceShop}">
			maintainenceShops[j]={ Value: "${b.key}", DisplayText: "${b.value}" };
				j++;
			    </c:forEach>
			  //end: retrieving maintainence shop in dropdown option
	
			//retrieve working shop
			
			var workingShops=[], k=1;
			workingShops[0]={ Value:null, DisplayText: "Select" };
			<c:forEach var="a" items="${workingShop}">
			
			workingShops[k]={ Value: "${a.shopId}", DisplayText: "${a.shopName}" };
		k++;
	    </c:forEach>
	
	   // end of code for working shop
			  
	$('#MachineMasterTableContainer').jtable({
			
			title : 'Machine available in Shop',
			
			
            sorting: true,
            defaultSorting: 'machineId ASC',
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
          //Create toolbat
            toolbar: {
                items: [
                	{
                    
                		icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'Report Breakdown',
                        click: function () {
                        	
                        	 var $selectedRows = $('#MachineMasterTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a Machine for report a breakdown");
                    	 	
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
                              if(record.machineStatus=="F")    
                            	  {
                            	  alert("Breakdown already reported for assembly");
                            	  }
                              else {
                                  $('#dateOfBreakDown').datepicker('option', 'maxDate', new Date());
                    	 		
                    	 	 	$("#reportBreakdown").dialog({
                    	 	 		title : 'Breakdown for  '+record.machineDescription + '(Machine No:' +record.machineSrNo+ ' )',                     	 	 		
                    	 	 		close: function (e, u) {
              	 		              //$(".formError").remove();
              	 		          	$("#dateOfBreakDown").validationEngine('hideAll');
                    	 	 		    },
                	 		 	
 		 							buttons: {
 		 								Submit: {
 	                                        text: "Submit",
 	                                        id: "my-button-submit",
 	                                        click:function () {
	                                  
	                                    	if ($('#dateOfBreakDown').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                         
	                                    	if ($('#breakdownDetails').validationEngine('validate')) {
	                                        
	                                            return false;
	                                        }
	                                    		    	   
	                                    	$.ajax({
	                    						url : "breakDownEntry",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						data : {
	                    							machineId: record.machineId,
	                    							dateOfBreakDown: $('#dateOfBreakDown').val(),
	                    							breakdownDetails:$('#breakdownDetails').val(),
	                    							remarks:$('#remarks').val(),
	                    							
	                    						},
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							
	                    							$('#dateOfBreakDown').val(''),
	                    							$('#breakdownDetails').val(''),
	                    							
	                    							$('#remarks').val(''),
	                    							
	                    							$('#reportBreakdown').dialog('close');
	                    							
	                    							$('#MachineMasterTableContainer').jtable('load');
	         								  })
	         								.error(function (msg){
	         									//$('#dialog').dialog('close');
	         									alert("Error Fetching Data");
	         								})
	         								  ;
					                 			    return true;
 	                                        }    },
				                        Close: function () {
				                        	
				                                        $(this).dialog('close');
				                                    }
 		 								  },
	                                    modal: true
 		 				    	    });
 		 				                    	 		
 		 				                     		    
 		 				            			    	   return true;
                              }          	 		    
 		 				                    	 			  
 		 				                    	 		  }//ending else               	  
 		 				                    	  // ajax call ends here				
 		 				    						 
 		 				                        
                        }  	
                		
                		
                	}
            ]
            },
        //end of toolbar    
			actions : {
				
 		   createAction : 'createMachineMasterAction',
 			listAction: 'listMachineMasterAction',
 			updateAction:'updateMachineMasterAction'
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
				
				machineId : {
					title : 'machineId',
					width: '8%',
					key: true,
					list : false,
					edit : false,
					create : false
									
					},
					machineStatus: {
				
						width: '8%',
						type: 'hidden',
						defaultValue: 'OK',
						list : false,
						edit : false,
						create : false
										
						},
					   //CHILD TABLE DEFINITION FOR SCHEDULE"
	                schedule: {
	                    title: 'Add Schedule',
	                    width: '5%',
	                    sorting: true,
	                    multiSorting: true,
	                    defaultSorting:'scheduleId ASC',
	                    edit: false,
	                    create: false,
	                    display: function (data) {
	                        //Create an image that will be used to open child table
	                        var $img = $('<img src="<%=contextpath%>/images/schedule.png" title="Edit Schedule" />');
	                        //Open child table when user clicks the image
	                        $img.click(function () {
	                            $('#MachineMasterTableContainer').jtable('openChildTable',
	                                    $img.closest('tr'),
	                                    {
	                                        title: data.record.machineDescription + ' - Schedule Details',
	                                        sorting: true,
	                	                    multiSorting: true,
	                	                    defaultSorting:'scheduleId ASC',
	                                        actions: {
	                                            listAction: 'listScheduleAction?machineId=' + data.record.machineId,
	                                            updateAction: 'updateScheduleAction',
	                                            createAction: 'createScheduleAction',
	                                            deleteAction:'deleteScheduleAction'
	                                        },
	                                        fields: {
	                                        	machineId: {
	                                                type: 'hidden',
	                                                defaultValue: data.record.machineId
	                                            },
	                                            scheduleId: {
	                                                key: true,
	                                                create: false,
	                                                edit: false,
	                                                list: false
	                                            },
	                                            scheduleType: {
	                                            	title: 'Schedule Type',
	                             
	                                                create: true,
	                                                edit: true,
	                                                list: true
	                                            },
	                                            scheduleDate: {
	                                                title: 'Schedule Date',
	                                                width: '30%',
	                                                inputClass: 'validate[required]',
	                    							type : 'date',
	                    							displayFormat: 'dd-mm-yy',
	                    							display:function(data1){
	                            						//alert(data.record.id.hodyCode)	;				 
	                            						return ((data1.record.scheduleDate!=null) && (data1.record.scheduleDate!="") ) ? moment(data1.record.scheduleDate).format('DD-MM-YYYY') : "";
	                            											},
	                            					list: true,
	                            					create: true,
	                            					edit: true	   
	                                            },
	                                            scheduleCompleted: {
	                                            	title: 'Schedule Completed',
	                                            	options: { 'Y': 'Yes', 'N': 'No' },
	                                            	create: true,
	                                                
	                                                edit: true,
	                                                list: false
	                                            },
	                                            scheduleCompletedDate: {
	                                            	title: 'Schedule Completion Date',
	                                            	type : 'date',
	                    							displayFormat: 'dd-mm-yy',
	                    							display:function(data1){
	                            									 
	                            						return ((data1.record.scheduleCompletedDate!=null) && (data1.record.scheduleCompletedDate!="") ) ? moment(data1.record.scheduleCompletedDate).format('DD-MM-YYYY') : "";
	                            											},
	                                            	create: true,
	                                                
	                                                edit: true,
	                                                list: true
	                                            },     
	                                           
	                                        }
	                                    }, function (data) { //opened handler
	                                        data.childTable.jtable('load');
	                                    });
	                        });
	                        //Return image to show on the person row
	                        return $img;
	                    }
	                },
					machineType : {
						title : 'Machine Type',
						width: '10%',
						inputClass: 'validate[required]',
						options: machineTypes,
						edit : true,
						create : true				
						},
						machineSrNo : {
							title : 'Machine Sr. No.',
							width: '10%',
							inputClass: 'validate[required]',
							list : true,
							edit : false,
							create : true				
							},
							
							machineDescription : {
								title : 'Machine Name',
								width: '10%',
								inputClass: 'validate[required]',
								list : true,
								edit : true,
								create : true				
								},
								model : {
									title : 'Machine Model',
									width: '10%',
									
									list : true,
									edit : true,
									create : true				
									},
									make : {
										title : 'Machine Make',
										width: '10%',
										
										list : true,
										edit : true,
										create : true				
										},
										purchasedBy : {
											title : 'Purchase By',
											width: '10%',
											list : true,
											edit : true,
											create : true				
											},
										purchaseNo : {
										title : 'Purchase No.',
										width: '10%',
										list : true,
										edit : true,
										create : true				
										},
										workingShop : {
											title : 'Working Shop',
											width: '10%',
											inputClass: 'validate[required]',
											options: workingShops,
											edit : true,
											create : true				
											},			
						
											maintenanceShopId : {
												title : 'Maintenance Shop',
												width: '10%',
												display:function(data){
													
													 if (data.record.maintenanceShopId != null) {
																	 
													return (findObjectByKey(maintainenceShops, 'Value', data.record.maintenanceShopId)).DisplayText;
													 }
												},
												inputClass: 'validate[required]',
												options: maintainenceShops,
												edit : true,
												create : true				
												},	
									
							dateOfComissioned: {
							title :'Date of Commissioning',
							width: '8%',
							inputClass: 'validate[required]',
							type : 'date',
							displayFormat: 'dd-mm-yy',
							display:function(data){
        						//alert(data.record.id.hodyCode)	;				 
        						return ((data.record.dateOfComissioned!=null) && (data.record.dateOfComissioned!="") ) ? moment(data.record.dateOfComissioned).format('DD-MM-YYYY') : "";
        											},
							list: true,
							create: true,
							edit: false			
							},
	             
			},
			rowInserted: function(event,data)
			{
				if(data.record)
					{
					
					//var y=moment(data.record.scheduleDate).format('YYYY, MM, DD');
					var y= data.record.machineStatus;
					//alert(y);
					
					if(y=="F")  {data.row.css("background", "red");}
					
					}
			},
			loadingRecords: function(event,data)
			{
				srno=0;
			},
			recordsLoaded: function(event, data) {
	
				},
				formCreated: function (event, data) {
					
					$('[name=dateOfComissioned]').
					datepicker("option", "disabled", false ).
					val('').css('background-color' ,'').datepicker("option", "maxDate", new Date);
					$('[name=dateOfComissioned]').val(moment(data.record.dateOfComissioned).format('DD-MM-YYYY'));
				
					  data.form.validationEngine();
					
	               	            },
	            recordDeleted: function(event,data)
	    		{
	    			srno=0;
	    			$('#MachineMasterTableContainer').jtable('load');
	    		},
	    		
 
			
				formSubmitting: function (event, data) {
			   return data.form.validationEngine('validate');
			             
			            },
			    
				
				formClosed: function (event, data) {
			               data.form.validationEngine('hide');
			                data.form.validationEngine('detach');
				},
				recordUpdated:function(event,data)
				{
					srno=0;
					$('#MachineMasterTableContainer').jtable('load');
				},
	              
			});
	$('#MachineMasterTableContainer').jtable('load');
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