<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Calendar" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page import= "org.apache.struts2.ServletActionContext" %>    
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
<%@ page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page import="java.util.Map"%>
<html>
<head>

<%String contextpath=request.getContextPath(); %>

<%
HttpSession session_http = ServletActionContext.getRequest().getSession(true);
String username = (String) session_http.getAttribute("userid");

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



<style>

.jtable-child-table-container{
margin-left: 100px;
border:2px solid red;
}

div.jtable-column-header-container {
	height: auto !important;
}

#jtable-create-form {
	display: block;
	width: 650px;
	-moz-column-gap: 40px;
	/* Firefox */
	-webkit-column-gap: 40px;
	/* Safari and Chrome */
	column-gap: 40px;
	-moz-column-count: 2;
	/* Firefox */
	-webkit-column-count: 2;
	/* Safari and Chrome */
	column-count: 2;
}
#jtable-edit-form {
	display: block;
	width: 650px;
	-moz-column-gap: 40px;
	/* Firefox */
	-webkit-column-gap: 40px;
	/* Safari and Chrome */
	column-gap: 40px;
	-moz-column-count: 2;
	/* Firefox */
	-webkit-column-count: 2;
	/* Safari and Chrome */
	column-count: 2;
}

 .jtable-input-readonly{
    background-color:lightgray;}
</style>



<script type="text/javascript">
	$(document).ready(function() {
		
		var srno;
		//retrieve machine type
	      var i=1;
			var machineTypes=[];
			machineTypes[0]={ Value:null, DisplayText: "Select" };
			<c:forEach var="a" items="${machineType}">
			
			machineTypes[i]={ Value: "${a.key}", DisplayText: "${a.value}" };
		i++;
	    </c:forEach>
		
		   // end of code for machine type
		   
		
				//retrieve working shop
			
			var workingShops=[], m=1;
			workingShops[0]={ Value:null, DisplayText: "Select" };
			<c:forEach var="a" items="${workingShop}">
			
			workingShops[m]={ Value: "${a.shopId}", DisplayText: "${a.shopName}" };
		m++;
	    </c:forEach>
	
	   // end of code for working shop
		
		
						var record1, count=1;
						
						 $('#AssemblyMasterTableContainer').jtable({
							
							title : 'Machine Assembly (Spare)',
							paging: true,
							pageSize : 10,
							pageSizes :  [10, 25,50,100,500],
				            sorting: true,
				            defaultSorting: 'machineId ASC',
				            selecting: true, //Enable selecting
				            multiselect: false, 
				
				            animationsEnabled : true,
					
			actions : {
				listAction : 'listForAssemblyMachineMasterAction'
				
		
			},
			fields : {
				
				 sno : {
					title : 'SNo',
					width : '2%',
					list :true,
					display: function(data) {
				    	return count++;
				    	
				    }
				}, 
				
				machineId : {
					title : 'machineId',
					
					key: true,
					list : false,
					edit : false,
					create : false
									
					},
					 machineType : {
						title : 'Machine Type',
						width: '4%',
						options: machineTypes,
						edit : true,
						create : true				
						}, 
						machineSrNo : {
							title : 'Machine Sr. No.',
							width: '5%',
							
							list : true,
							edit : false,
							create : false				
							},
							
							machineDescription : {
								title : 'Machine Name',
								width: '10%',
								
								list : true,
								edit : true,
								create : true				
								},
								
										 workingShop : {
											title : 'Working Shop',
											width: '7%',
											//inputClass: 'validate[required]',
											options: workingShops,
											
											edit : true,
											create : true				
											},	 
				/* equipmentNo : {
					title : 'Equipment No',
					width : '5%',
					key : true,
					list :true,
					edit : true,
					input: function (data) {
				        if (data.value) {
				            return '<input type="text" readonly class="jtable-input-readonly" name="equipmentNo" value="' + data.value + '"/>';
				        } else {
				            //nothing to worry about here for your situation, data.value is undefined so the else is for the create/add new record user interaction, create is false for your usage so this else is not needed but shown just so you know when it would be entered
				        }
				    },
				    display: function(data) {
				    	return data.record.equipmentNo;
				    }
					
				}, */
				

				/* objectType : {
					title : 'Object Type',
					width : '10%',
					edit : true,
					input: function (data) {
				        if (data.value) {
				            return '<input type="text" readonly class="jtable-input-readonly" name="objectType" value="' + data.value + '"/>';
				        } else {
				            //nothing to worry about here for your situation, data.value is undefined so the else is for the create/add new record user interaction, create is false for your usage so this else is not needed but shown just so you know when it would be entered
				        }
				    },
						},
						objectSubType : {
							title : 'object SubType',
							width : '10%',
							//type : 'hidden',
							options :function(data){
								var options=[];
							
					            	
					            	$.ajax({
					            		url:"objectSubType_from_objectType",
					            		async:false,
					            		dataType:'json',
					            		data : {
											
											  objectType: data.record.objectType,
											  equipmentNo: data.record.equipmentNo
											  	  },
					            		success:function(data){
					            			options=data.objectSubTypeList;
					            	
					            		
					            		}
					            			            		
					            	});
					            	return options;
					            },
						 	
								},
						validToDate : {
							title : 'Valid ToDate',
							width : '10%',
							type: 'date',
							edit : true,
							display:function(data){
								 return ((data.record.validToDate!=null) && (data.record.validToDate!="") ) ? moment(data.record.validToDate).format('DD-MM-YYYY') : "";
					
								},
							displayFormat: 'dd-mm-yy',
							input: function (data) {
						        if (data.value) {
						            return '<input type="text" readonly class="jtable-input-readonly" name="validToDate" value="' + data.value + '"/>';
						        } else {
						            //nothing to worry about here for your situation, data.value is undefined so the else is for the create/add new record user interaction, create is false for your usage so this else is not needed but shown just so you know when it would be entered
						        }
						    },
								}, 
								sequipmentNo : {
							title : 'Sup EquipmentNo',
							width : '10%',
							edit : true,
							input: function (data) {
						        
								if (data.value) {
						            return '<input type="text" readonly class="jtable-input-readonly" name="sequipmentNo" value="' + data.value + '"/>';
						        } else {
						        	//return '<input type="text" readonly class="jtable-input-readonly" name="sequipmentNo" value=" "/>';
						        }
						      
						            
						        
						    },
								},  
								
								
								assetNo : {
									title : 'Asset No',
									width : '10%',
									edit : true,
									
										},  
										
										
										constMonth : {
											title : 'constMonth',
											width : '10%',
											edit : true,
											inputClass: 'validate[custom[integer],min[1], max[12]]'
										
												},  
								
												constYear : {
													title : 'Const Year',
													width : '10%',
													edit : true,
													inputClass: 'validate[custom[integer],min[1900], max[9999]]'
												
														},
														guaranteeStartDate : {
															title : 'guarantee StartDate',
															width : '10%',
															type: 'date',
															edit : true,
															display:function(data){
																 return ((data.record.guaranteeStartDate!=null) && (data.record.guaranteeStartDate!="") ) ? moment(data.record.guaranteeStartDate).format('DD-MM-YYYY') : "";
													
																}, 
																displayFormat: 'dd/mm/yy',
										                    edit : true,
															//inputClass: 'validate[required, custom[dateIndianFormat]]'
														
																},
																warrantyEndDsate : {
																	title : 'warranty EndDsate',
																	width : '10%',
																	type: 'date',
																	edit : true,
																	display:function(data){
																		 return ((data.record.warrantyEndDsate!=null) && (data.record.warrantyEndDsate!="") ) ? moment(data.record.warrantyEndDsate).format('DD-MM-YYYY') : "";
															
																		}, 
																		displayFormat: 'dd/mm/yy',
												                    edit : true,
																	//inputClass: 'validate[required, custom[dateIndianFormat]]'
																
																		},
																		
																				manufacturer : {
																					title : 'manufacturer',
																					width : '10%',
																					//type: 'date',
																					edit : true,
																					
																				
																						},
																						plNo : {
																							title : 'pl No',
																							width : '10%',
																							//type: 'date',
																							edit : true,
																							
																						
																								},
																								slNo : {
																									title : 'sl No',
																									width : '10%',
																									//type: 'date',
																									edit : true,
																									
																								
																										},     */
						
				//CHILD TABLE DEFINITION FOR ASSEMBLY"
						child: {
		                    title: 'Assembly',
		                    width: '5%',
		                    sorting: false,
		                    
		                    edit: false,
		                    create: false,
		                    display: function (firstChild) {
		                        //Create an image that will be used to open child table
		                        var parentForchildId1= firstChild.record.machineId;
		                        var machineDescription=firstChild.record.machineDescription;
		                        var $img = $('<span style="color:red;font-weight:bold">'+ parentForchildId1+'</span><img src="<%=contextpath%>/images/subassembly_icon.png" title="Sub Assembly" ></img>');
		                        //Open child table when user clicks the image
		                        $img.click(function () {
		                        //	alert(parentForchildId1)
		                        	//var listaction= 'listIssueAuditTrailAction?uid=' + issueData.record.uid ;
		                        	//alert(listaction);
		                        	//$('.jtable-row-selected').removeClass('jtable-row-selected');
		                            $('#AssemblyMasterTableContainer').jtable('openChildTable',
		                                    $img.closest('tr'), //Parent row
		                                    {
		                                    title: machineDescription + ' - Sub Assemblies',
		                                    paging: false,
		                        			pageSize : 10,
		                        			pageSizes :  [10, 25, 50,100],
		                                    sorting: true,
		                                    selecting: true,
		                                    defaultSorting: 'spareId ASC',
		                                    
		                                  //toolbar Build Rake button and related ajax
		        				/*             toolbar: {
		        				    items: [{
		        				        icon: '/images/excel.png',
		        				        text: 'Dismantle Assembly',
		        				        click: function () {
		        				        	var $selectedRows = $('#AssemblyMasterTableContainer>.jtable-main-container>.jtable>tbody>.jtable-child-row .jtable-row-selected');
		        				        	// var $selectedRows = $('#AssemblyMasterTableContainer').jtable('selectedRows');
		                            	 	 if ($selectedRows.length<1)
		                            		 alert("Please select atleast one Assembly!");
		                            	 	 else{
			                            	 	 var record1;
				                    	  		$selectedRows.each(function () 
			                    			  			{
				                    	  				record1= $(this).data('record');
					                    		         
					                    		        // alert(record1.equipmentNo);
							                              //alert("position nos: selected"+record.positionNo);
											                              //selectedWgnMaintenanceNos[i] =   record.maintenanceNo;
											                              //alert("positions[i]"+selectedWgnPositions[i]);
											                             // i++;
									                    	  			}
				                    	  					);
	                    	  					if((record1.objectSubType==null)||(record1.objectSubType==""))
			                    	  					{
		                    	  							alert("Please update Object Sub Type before dismantling!");
		                    	  							return;
			                    	  					}
		                            		  	   var i=0;
		                            		  	 //var record1;
		        		                    	 // var selectedWgnMaintenanceNos=[];
		        		                    	 
		        		                    	  	//$("#AssemblyMasterTableContainer").css('opacity', '0.6');
		        		                    	  	//$("#overlay").show();
		        		                    	  	$("#dialog").dialog({
						                    	  		
						                                buttons: {
						                                    Submit: function () {
									                                           $('#dialog').dialog('close');
										                 			    	   //alert($('#datetimepickerdispatch').val());
										                 			    	   
										                 			    	   $.ajax({                    
										                 							  url: 'DismantleAssemblyAction2',     
										                 							  type: 'post', // performing a POST request
										                 							  async: true,
										                 							  traditional: true,
										                 							  dataType: 'json', 
										                 							  data : {
										                 								 eqNo:record1.equipmentNo,
										                 								  workCentre:$("#workCentre").val(),
										                 								  reasonCode:$("#reasonCode").val()
										                 								  	  }
										                 							                    
										                 							 })
										                 								.done(function( msg ) {
										                 									
										                 								    alert( "Selected assembly dismantled!" );
										                 								   $('#AssemblyMasterTableContainer').jtable('load');												
										                 								  })
										                 								.error(function (msg){
										                 									//$('#dialog').dialog('close');
										                 									alert("Error Saving Data");
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
	                    	 return false;
						                    	  		          
		        		                    	  		                    	                      	    
		        		                    	    
		                            	 	 }			                    	  
		        				                    	  // ajax call ends here		
		        				        }
		        				    },

		        				    ]
		        				}, */
		                    // toolbar ends here  
		                                    actions : {
		                        				listAction : 'listChildAssemblyAction?parentId=' + parentForchildId1+'&childLevel=1' ,
		                        				createAction : 'createChildAssemblyAction?childLevel=1' ,
		                        				updateAction : 'updateChildAssemblyAction?childLevel=1'
		                        				//deleteAction : 'deleteWagonStageAction'
		                        			},
		                        			fields: {
		                        				
		                        				parentId: {
	                                                type: 'hidden',
	                                                defaultValue: parentForchildId1
	                                                 },
		                        				spareId:{
		                        					title : 'Spare Description',
		                        					width : '5%',
		                        					key : true,
		                        					list :true,
		                        					edit : false,
		                        					create:true,
		                        					options: function(data)
		                        					{
		                        						var options=[];
		                        			            $.ajax({
		                        			            url: "optionforAssemblyDropdown",
		                        			            async:false,
		                        			            dataType:'json',
		                        			            data:
		                        			            	{
		                        			            	parentId:parentForchildId1
		                        			            	},
		                        			            success:function(data)
		                        			            {
		                        			            	if(data.spareList!=null)
		                        			            		{
		                        			            		 for(i=0;i<data.spareList.length;i++)
                                                                 {
                                                                     
                                                                         options[i]={ Value: data.spareList[i].spareId, DisplayText: data.spareList[i].spareDescription };
                                                                         
                                                                 }
		                        			            		}
		                        			            }
		                        			            });
		                        			            return options;
		                        					},
		                        				},
		                        				childLevel:
		                        					{
		                        					title: 'Child Level',
		                        					width:'3%',
		                        					key:true,
		                        					create:false,
		                        					edit:false,
		                        					list:true
		                        					
		                        					},
		                        				qty:
		                        					{
		                        					title : 'Qty',
		                        					width : '5%',
		                                            create:true,
		                        					list :true,
		                        					edit : true
		                        					},     						
		                        						child : {
		                        		                    title: 'Sub-Assembly',
		                        		                    width: '5%',
		                        		                    sorting: false,
		                        		                    edit: false,
		                        		                    create: false,
		                        		                    display: function (secondChild) {
		                        		                        //Create an image that will be used to open child table
		                        		                       var parentForchildId2= secondChild.record.spareId;
		                                                         //alert(parentForchildId2)
		                        		                        var $img = $('<img src="<%=contextpath%>/images/subassembly_icon.png" title="Sub Assembly" > </img>');
		                        		                        //Open child table when user clicks the image
		                        		                        $img.click(function () {
		                        		                        	//var listaction= 'listIssueAuditTrailAction?uid=' + issueData.record.uid ;
		                        		                        	//alert(listaction);
		                        		                            $('#AssemblyMasterTableContainer').jtable('openChildTable',
		                        		                            		 $img.closest('tr'), //Parent row
		                        			                                    {
		                        			                                    title: machineDescription + ' - Sub Assemblies',
		                        			                                    paging: false,
		                        			                        			pageSize : 10,
		                        			                        			pageSizes :  [10, 25],
		                        			                                    sorting: true,
		                        			                                    selecting: true,
		                        			                                    defaultSorting: 'spareId ASC',
		                        		                            		
		                        		                                 
		                        		                                    actions : {
		                        		                                    	listAction : 'listChildAssemblyAction?parentId=' +parentForchildId2+'&childLevel=2' ,
		                        		                        				createAction : 'createChildAssemblyAction?childLevel=2' ,
		                        		                        				updateAction : 'updateChildAssemblyAction?childLevel=2'
		                        		                        				
		                        		                        			},
		                        		                        			fields : {
		                        		                        				parentId: {
		                        	                                                type: 'hidden',
		                        	                                                defaultValue:parentForchildId2
		                        	                                                 },
		                        		                        				spareId: {
		                        		                        					title : 'Spare Description',
		                        		                        					width : '5%',
		                        		                        					key : true,
		                        		                        					list :true,
		                        		                        					edit : false,
		                        		                        					create:true,
		                        		                        					options: function(data)
		                        		                        					{
		                        		                        						var options=[];
		                        		                        			            $.ajax({
		                        		                        			            url: "optionforAssemblyDropdown",
		                        		                        			            async:false,
		                        		                        			            dataType:'json',
		                        		                        			            data:
		                        		                        			            	{
		                        		                        			            	parentId:parentForchildId1
		                        		                        			            	},
		                        		                        			            success:function(data)
		                        		                        			            {
		                        		                        			            	if(data.spareList!=null)
		                        		                        			            		{
		                        		                        			            		 for(i=0; i<data.spareList.length; i++)
		                                                                                         {
		                                                                                             
		                                                                                                 options[i]={Value: data.spareList[i].spareId, DisplayText: data.spareList[i].spareDescription };
		                                                                                                 
		                                                                                         }
		                        		                        			            		}
		                        		                        			            }
		                        		                        			            });
		                        		                        			            return options;
		                        		                        					},
		                        		                        				},
		                        		                        				childLevel:
		                    		                        					{
		                    		                        					title: 'Child Level',
		                    		                        					width:'3%',
		                    		                        					key:true,
		                    		                        					create:false,
		                    		                        					edit:false,
		                    		                        					list:true
		                    		                        					
		                    		                        					},
		                        		                        				qty:
		                        		                        					{
		                        		                        					title : 'Qty',
		                        		                        					width : '5%',
		                        		                                            create:true,
		                        		                        					list :true,
		                        		                        					edit : true
		                        		                        					},  
		                        		                        								
		                        		                        			},						
		                        		                                    formCreated: function (event, data) 
		                        		                                    {
		                        		                      
		                        		                                        data.form.validationEngine();
		                        		                            
		                        		                                    },
		                        		                                   
		                        		                        			//Validate form when it is being submitted
		                        		                                    formSubmitting: function (event, data) {
		                        		                        								                //alert('validating form');
		                        		                        								                
		                        		                        								            	return data.form.validationEngine('validate');
		                        		                        								            	
		                        		                        								                
		                        		                        								            },
		                        		                                  
		                        		                                    formClosed: function (event, data) {
		                        		                        								                data.form.validationEngine('hide');
		                        		                        								                data.form.validationEngine('detach');
		                        		                                    
		                        		                                }
		                        		                                }, function (data) { //opened handler
		                        		                                    data.childTable.jtable('load').css({'margin-left':'3%','border':'1px solid red'});
		                        		                                });
		                        		                        });
		                        		                        //Return image to show on the person row
		                        		                        return $img;
		                        		                    }
		                        		                    
		                        					
		                        		                },
		                        						
		                        						
		                        							
		                        			},						
		                        			formCreated: function (event, data) 
		                                    {
		                        				
		                                    	
		                                        data.form.validationEngine();
		                                    	
//			                              
		                                    	
		                                    },
		                        			//Validate form when it is being submitted
		                                    formSubmitting: function (event, data) {
		                        								                //alert('validating form');
		                        								                
		                        								            	return data.form.validationEngine('validate');
		                        								            	
		                        								                
		                        								            },
		                                    //Dispose validation logic when form is closed
		                                    formClosed: function (event, data) {
		                        								                data.form.validationEngine('hide');
		                        								                data.form.validationEngine('detach');
		                                    
		                                }
		                                }, 
		                                function (data) { //opened handler
		                                    data.childTable.jtable('load').css({'margin-left':'3%', 'border':'1px solid red'});
		                                });
		                        });
		                        //Return image to show on the person row
		                        return $img;
		                    }
		                    
					
		                },
						
						
				},
				formCreated: function (event, data) 
                {
					
				
                    data.form.validationEngine();
                	

                },
                loadingRecords: function(event,data)
    			{
    				count=1;
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
 
        //Load student list from server
        $('#AssemblyMasterTableContainer').jtable('load');
        
        
    });

	</script>
		</head>                        
<body>
	<div id="AssemblyMasterTableContainer" style="overflow-y: auto; height: 85%"></div>
</body>
