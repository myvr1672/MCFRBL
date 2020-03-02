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
.toUperCase{
text-transform:uppercase;
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
<script>

function myFunction() {
	
	if(document.getElementById("status").value=="Resolved")
		{
	
		  document.getElementById("datepickerCompletion").disabled = false;
		  $('#datepickerCompletion').addClass("validate[required]");
		}
	else
		{
	
		 document.getElementById("datepickerCompletion").disabled = true;	
	document.getElementById("datepickerCompletion").value="";
	 $('#datepickerCompletion').removeClass("validate[required]");
		}
}
function spareAddFunction() {
	
	if(document.getElementById("spareReplaced").value=="Yes")
		{
		 $("#spare-add-button").show();
		 
		}
	else
		{
		 $("#spare-add-button").hide();
	
		}
}

</script>
<body>
<%
java.util.Date date=new java.util.Date(); 
Long x=date.getTime();
%>
 <div id="MachineFailedTableContainer"></div><br><br> 
 <div id="performAction" style="height:250px; width:500px; display:none;z-index: 9;" >
  <br>

			  <br>
			 Enter Action To be Performed: <br>
		     <textarea  id="actionPerformed" class='validate[required]' ></textarea>
		     <br>
		      <br>
		      Remarks: <br>
		     <textarea id="remarks" ></textarea>
		     
		     <br>
		      Status: <br>
		     <select id="status" onchange="myFunction()">
		    <option value="">Select</option>
             <option value="Under Progress">Under Progress</option>
              <option value="Resolved">Resolved</option>
		     </select>
	<br>
	<br>
	 Enter Completion Date: <br>
		     <input type="Text" id="datepickerCompletion"  placeholder="Enter Completion Date" disabled/>
		     <br>
            
              Is Spare replace?&nbsp;&nbsp;&nbsp;&nbsp;  <select id="spareReplaced" onchange="spareAddFunction()">
		    <option value="">Select</option>
             <option value="No">No</option>
              <option value="Yes">Yes</option>
		     </select>
		     <br>
		      <span id="spare-add-button">
             <input type="button" class="add-row" value="Add Spare">&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" class="delete-row" value="Delete Spare">
            
             <br>
             <table class="spare" id="spareTable">
                <tr>
                <th>No</th>
               <th>Spare Description</th>
                <th>Sr No.</th>
               </tr>
              <tbody></tbody>
              </table>
               </span>
 </div>
</body>
<script type="text/javascript">
		$(document).ready(function() {
			
			// add row code by using java script
			 $("#spare-add-button").hide();
			 $(".add-row").click(function() {
            	//alert(optionField);
            	var srno = document.getElementById('spareTable').rows.length;
            	//var srno=rowCount;
            	//alert(srno);
            	//var componentType=document.getElementById('componentType').value;
            	//alert(componentType);
            	//var date=document.getElementById('dateField').value;
               //alert("hi");
                var markup="<tr><td>" +srno+ "</td>"+
                "<td><input type='text' class='toUperCase' name='spareDescription'  id='spareDescription'></input></td>"+
                "<td><input type='text' class='toUperCase' name='spareSrNo' id= 'spareSrNo'></input></td>"+
                 "</tr>";
               alert(markup);
                $('#spareTable >tbody:last').append(markup);
            });

            $(".delete-row").click(function(){
             
   $('#spareTable tr:last').remove();
                });
                	
			
			
			
			// end of add row code
$('#datepickerCompletion').datepicker({
		        
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
	
	$('#MachineFailedTableContainer').jtable({
			
		
		
		
		title : 'Failed Machine',
		    sorting: true,
            defaultSorting: 'machineId ASC',
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
    		// TOOLBAR BUTTON STARTS HERE
       	 toolbar: {
                       items: [
                           {
                           	icon: '<%=contextpath%>/images/rs_out.png',
                               text: 'Perform Action',
                               click: function () {
                               	
                               	 var $selectedRows = $('#MachineFailedTableContainer').jtable('selectedRows');
                           	 	 if ($selectedRows.length<1)
                           		 alert("Please select a Failed Machine for which you want to perform action");
                           	 	 else{
                           	 		var record;
                           	 		$selectedRows.each(function () {
                                           record = $(this).data('record');
                                           });
                           	 		
                           	 	$('#datepickerCompletion').datepicker('option', 'minDate', new Date(record.dispatchDateForRepair));
                           	 	 	$("#performAction").dialog({
                           	 	 		title : 'Action taken for '+record.machineDescription,                     	 	 		
                           	 	 		close: function (e, u) {
                     	 		              //$(".formError").remove();
                     	 		          	$("#performAction").validationEngine('hideAll');
                     	 		          },
                       	 		 	
        		 							buttons: {
       	                                    Submit: function () {
       	                                    		
       	                                    	//alert("$('#qtyDispatched').val()->"+$('#qtyDispatched').val());
       	                                    	//alert("record.balanceQtyToDispatch->"+record.balanceQtyToDispatch);
       	                            	 		
       	                                    	if ($('#performAction').validationEngine('validate')) {
       				                                        	//alert(!$("#dialog").validationEngine('validate'));
       				                                            return false;
       				                                        }
       	                                    		    	   
       	                                    	$.ajax({
       	                    						url : "actionForMachineFailure",
       	                    						dataType: 'json', 
       	                    						data : {
       	                    							
       	                    							machineId: record.machineId,
       	                    							breakdownId: record.breakdownId,
       	                    							actionPerformed:$('#actionPerformed').val(),
       	                    							remarks:$('#remarks').val(),
       	                    							status: $('#status').val(),
       	                    							rectificationDate: $('#datepickerCompletion').val(),
       	                    						},
       	                    						
       	                    						type : 'POST',
       	                    						async : false,
       	                            	 		})
       	                    						.done(function( msg ) {
       	                    							
       	                    							
       	                    							$('#actionPerformed').val('');
       	                    							$('#remarks').val('');
       	                    							$('#status').val('');
       	                    							$('#datepickerCompletion').val('');
       	                    							$('#actionDialog').dialog('close');
//        	                    							if(msg.res==true)
//        	                    								{
//        	                    								$('#status').html("Action Performed Saved Successfully");
//        	                    									//alert("Action/Remarks assigned successfully for the selected Abnormality");
//        	                    								}
//        	                    							else
//        	                    								{ alert("Action/Remarks is already assigned for the selected Machine");
       	                    								
//        	                    								}
       	                    									$('#MachineFailedTableContainer').jtable('load');
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
                           
                   ]
                   },	
            
            
            
	actions : {
 			listAction: 'listReleasemachineFailed',
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
				breakdownId:{
					title : 'breakdownId',
					width: '8%',
					key: true,
					list : false,
					edit : false,
					create : false	
				},
				
				machineId : {
						title : 'machineId',
						
					    list : false,
						edit : false,
						create : false				
						},
						machineSrNo : {
							title : 'Machine Sr No.',
							width: '8%',
						    list : true,
							edit : false,
							create : false				
							},
							machineDescription : {
								title : 'Machine Description',
								width: '15%',
							    list : true,
								edit : false,
								create : false				
								},
						breakdownDate: {
							title : 'Breakdown Date',
							width: '10%',
							type: 'date',
							displayFormat: 'dd-mm-yy',
						    list : true,
							edit : false,
							create : false		
						},
						breakdownDetails:
							{
							title : 'Breakdown Details',
							type: 'textarea',
						    list : true,
							edit : false,
							create : false		
							},
							remarks:
							{
							title : 'Breakdown Remarks',
							type: 'textarea',
						    list : true,
							edit : false,
							create : false		
							},
							dispatchDateForRepair:
							{
							title : 'dispatchDateForRepair',
							type: 'hidden',
						    list : false,
							edit : false,
							create : false		
							},
							
							
							
								machineType: {
									title : 'Machine Type',
									width: '15%',
								    list : false,
									edit : false,
									create : false	
								},
								
								make:{
									title : 'Machine Make',
									width: '15%',
								    list : false,
									edit : false,
									create : false	
								},
								model:{
									title : 'Machine Model',
									width: '15%',
								    list : false,
									edit : false,
									create : false	
								},
								purchasedBy:{
									title : 'Purchase By',
									width: '15%',
								    list : false,
									edit : false,
									create : false	
								},
								purchaseNo:{
									title : 'Purchase No.',
									
								    list : false,
									edit : false,
									create : false	
								},
								
								workingShop : {
									title : 'Working Shop',
									width: '15%',
								    list : false,
									edit : false,
									create : false				
									},
									maintenanceShopId : {
										title : 'Maintenance Shop Id',
										width: '15%',
									    list : false,
										edit : false,
										create : false				
										},
										
											dateOfComissioned : {
										title : 'Comissioning Date',
										width: '10%',
										type: 'date',
										displayFormat: 'dd-mm-yy',
									    list : true,
										edit : false,
										create : false				
									},
						
								

                        
			},
			rowInserted: function(event,data)
			{
				if(data.record)
					{
					data.row.css("background", "red");
					
				//	var y= Date.parse(data.record.scheduleDate);
					
					
					//if(currentDate>y)  {data.row.css("background", "yellow");}
					//else if (currentDate==y) {data.row.css("background", "green");}
				//	else {data.row.css("background", "red");}
					}
			},
			loadingRecords: function(event,data)
			{
				srno=0;
			},
			
				
	           
	    		
 
					//Validate form when it is being submitted
				formSubmitting: function (event, data) {
			   // return data.form.validationEngine('validate');
			             
			            },
			    
				//Dispose validation logic when form is closed
				formClosed: function (event, data) {
			            //    data.form.validationEngine('hide');
			            //    data.form.validationEngine('detach');
				}
	              
			});
	
		
	
	
	$('#MachineFailedTableContainer').jtable('load');
	//$('#MachineFailedTableContainer').jtable('load');
		});
		
		
	</script>
	 
	