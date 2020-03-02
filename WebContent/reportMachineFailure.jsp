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
<link href="<%=contextpath %>/css/metro/blue/jtable.css" rel="stylesheet" type="text/css"/>
<link href="<%=contextpath %>/css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css"/>


<script src="<%=contextpath %>/js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/jquery.jtable.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/moment.js" type="text/javascript"></script>

<link href="<%=contextpath %>/js/validationEngine/validationEngine.jquery.css" rel="stylesheet"type="text/css" />

<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine-en.js" type="text/javascript"></script>
<link href="<%=contextpath %>/js/datetimepicker-master/jquery.datetimepicker.css" rel="stylesheet" type="text/css"/>
<script src="<%=contextpath %>/js/datetimepicker-master/build/jquery.datetimepicker.full.js" type="text/javascript"></script>
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
<div id="filter">
<form>
<b>Select Shop</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<select id="shopList" ></select>&nbsp;&nbsp;&nbsp;<button type="submit" id="LoadRecordsButton">Load records</button>
</form>
</div>
<div id="MachineMasterTableContainer"></div>
  <div id="reportBreakdown" style="height:150%; width:200%; display:none;z-index: 9;" >
             Enter Breakdown Date: <br>
		     <input type="Text" id="dateOfBreakDown" class='validate[required]'/>
		     
		     
		     <br>
             <br>
             Enter Failure Category: <br>
		     <input type="Text" id="failureCategoryLabel" class='validate[required]'/>
		     <input type="hidden" id="failureCategoryValue"/>
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
			
			$('#dateOfBreakDown').datetimepicker({
		        //inline: true,
		        format: 'd-m-Y H:i',
		        changeMonth: true,
		        changeYear: true,
		        yearRange: '-1:+1',
		        maxDate:new Date(),
		        constrainInput: true,
		        duration: '',
		        gotoCurrent: true,
		       

		    }).datepicker("setDate", new Date());	
		    //retrieve shop in drop down for filter
		       $("#shopList").append('<option value="All" selected>All</option>');
					
					<c:forEach var="a" items="${workingShop}">
					
					var o = new Option("${a.shopName}", "${a.shopId}");
					
					$("#shopList").append(o);
					
					
			    </c:forEach>

			
       //retrieve machine type
       var i=1;
			var machineTypes=[];
			machineTypes[0]={ Value:null, DisplayText: "Select" };
			<c:forEach var="a" items="${machineType}">
			
			machineTypes[i]={ Value: "${a.key}", DisplayText: "${a.value}" };
		i++;
	    </c:forEach>
	
	   // end of code for machine type
	   
	    //retrieve supplier code
	    var j=1;
			var suppliers=[];
			suppliers[0]={ Value:null, DisplayText: "Select" };
			<c:forEach var="a" items="${supplier}">
			
			suppliers[j]={ Value: "${a.key}", DisplayText: "${a.value}" };
		j++;
	    </c:forEach>
	
	   // end of code for supplier
	   
	   
	    //retrieve amc agency 
	    var k=1;
			var amcAgencies=[];
			amcAgencies[0]={ Value:null, DisplayText: "Select" };
			<c:forEach var="a" items="${amcAgency}">
			
			amcAgencies[k]={ Value: "${a.key}", DisplayText: "${a.value}" };
		k++;
	    </c:forEach>
	
	   // end of code for amc agency
		
	   //start: retrieving maintainence shop in dropdown option
		    var maintainenceShops=[]; 

			var l=1;
			maintainenceShops[0]={ Value:null, DisplayText: "Select" };
			<c:forEach var="b" items="${maintainenceShop}">
			maintainenceShops[l]={ Value: "${b.key}", DisplayText: "${b.value}" };
				l++;
			    </c:forEach>
			  //end: retrieving maintainence shop in dropdown option
	
			//retrieve working shop
			
			var workingShops=[], m=1;
			workingShops[0]={ Value:null, DisplayText: "Select" };
			<c:forEach var="a" items="${workingShop}">
			
			workingShops[m]={ Value: "${a.shopId}", DisplayText: "${a.shopName}" };
		m++;
	    </c:forEach>
	
	   // end of code for working shop
		//retrieve amc agency 
	    var n=1;
			var failureCategories=[];
			failureCategories[0]={ value:null, label: "Select" };
			<c:forEach var="a" items="${failureCategory}">
			
			failureCategories[n]={ value: "${a.key}", label: "${a.value}" };
		n++;
	    </c:forEach>
	
	   // end of code for failure category
	   $("#failureCategoryLabel").autocomplete({
         source:failureCategories,
         minLenght:4,
         open: function() {
   		  $(".ui-autocomplete").width( $(this).innerWidth() );
   		$(".ui-autocomplete").css('z-index', 999999999999);
           },
         select:function (event, ui)
         {
             
             $("#failureCategoryLabel").val(ui.item.label);
             $("#failureCategoryValue").val(ui.item.value);
             return false;
         }
	   });
	   
		  
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
                                  $('#dateOfBreakDown').datetimepicker('option', 'maxDate', new Date());
                    	 		
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
	                    							amcAgencyId:record.amcAgencyId,
	                    							purchasedBy:record.purchasedBy,
	                    							machineDescription:record.machineDescription,
	                    							dateOfBreakDown: $('#dateOfBreakDown').val(),
	                    							breakdownDetails:$('#breakdownDetails').val(),
	                    							
	                    							remarks:$('#remarks').val(),
	                    							failureCategoryValue:$('#failureCategoryValue').val(),
	                    						
	                    						},
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							
	                    							$('#dateOfBreakDown').val(''),
	                    							$('#breakdownDetails').val(''),
	                    							$('#failureCategoryValue').val(''),
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
				
 		  // createAction : 'createMachineMasterAction',
 			listAction: 'listMachineMasterAction'
 			//updateAction:'updateMachineMasterAction'
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
											options: suppliers,
// 											display:function(data){
												
// 												 if (data.record.purchasedBy != null) {
																 
// 												return (findObjectByKey(suppliers, 'Value', data.record.purchasedBy)).DisplayText;
// 												 }
// 											},
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
										poDate : {
											title : 'Purchase Date',
											width: '8%',
											type : 'date',
											displayFormat: 'dd-mm-yy',
											display:function(data){
				        						//alert(data.record.id.hodyCode)	;				 
				        						return ((data.record.poDate!=null) && (data.record.poDate!="") ) ? moment(data.record.poDate).format('DD-MM-YYYY') : "";
				        											},
											list : true,
											edit : true,
											create : true				
											},	
											machineCost:
												{
												title : 'Machine Cost (Lakh)',
												width: '8%',
												inputClass: 'validate[custom[number]]',
												list:false,
												edit:true,
												create:true,
												},
												machineLife:
												{
												title : 'Machine Life(Yr)',
												width: '8%',
												inputClass: 'validate[custom[number]]',
												list:false,
												edit:true,
												create:true,
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
							amcAgencyId : {
								title : 'AMC Agency',
								width: '10%',
								
								//inputClass: 'validate[required]',
								options: amcAgencies,
								edit : true,
								create : true				
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
	 $('#LoadRecordsButton').click(function (e) {
         e.preventDefault();
		
$('#MachineMasterTableContainer').jtable('load', {shopFilter: $('#shopList').val()});

	    });
	       $('#LoadRecordsButton').click();
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