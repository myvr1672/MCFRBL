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
<div id="CoachOutTableContainer"></div>
    <div id="exitDialog" style="height:150%; width:200%; display:none;z-index: 9;" >
  <br>
  
			  <br>
			 Enter Dispatch Date: <br>
		     <input type="Text" id="datepickerCompletion" class='validate[required]' onchange="setMinDate()"/>
		     <br>
		      <br>
		      Enter Commission Date: <br>
		     <input type="Text" id="datepickerExit" class='validate[required]' />
		     <br>
		      <br>

		      Remarks: <br>
		     <textarea id="remarks" > </textarea>
		     <br>
		    
		     <br>
		     Dispatched Railway :<br>
		    <select id="railway" class='validate[required]'></select>
		      
		    
		     
 </div>
 <div id="detailDialog" style="height:150%; width:200%; display:none;z-index: 9;" ></div>
 </body>




<script type="text/javascript">
		$(document).ready(function() {
		
			var srno,i=1;
			//var railways=[];
			//railways[0]={ Value: "", DisplayText: "Select" };
			//i=1;
			
						var first = new Option("select", "" );
			/// jquerify the DOM object 'o' so we can use the html method
			//$(first).html("");
			$("#railway").append(first);
			<c:forEach var="entry" items="${railway}">
			var o = new Option("${entry.value}", "${entry.key}" );
			/// jquerify the DOM object 'o' so we can use the html method
			//$(o).html("${entry.key}");
			$("#railway").append(o);
			
			//railways[i]={ Value: "${entry.key}", DisplayText: "${entry.value}" };
			
			// i++;
			</c:forEach>
			
			
			
		

  
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
	$('#CoachOutTableContainer').jtable({
			
			title : 'Coach out for Railways',
			
			
            sorting: true,
            defaultSorting: 'rackId ASC',
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
      //Create toolbat
            toolbar: {
                items: [
                	//First Toolbar item for Exit/ Turnout
                    {
                    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'Coach sent to Railway',
                        click: function () {
                        	
                        	
                        	
                        	 var $selectedRows = $('#CoachOutTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you want to turnout to Railway");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
								//setting min value
								
								$('#datepickerCompletion').datepicker('option', 'minDate', new Date(record.rackFormationDate));
								
            					
                    	 	 	$("#exitDialog").dialog({
                    	 	 		title : 'GateOut to Railways for   '+record.coachNumbers + 'from MCF',                     	 	 		
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
				                                        	
				                                            return false;
				                                        }
	                                    	if ($('#datepickerCompletion').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }	    	   
	                                    	$.ajax({
	                    						url : "exitCoachForRailway",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						data : {
	                    							coachOutID: record.coachOutID,
	                    							coachNumbers:record.coachNumbers,
	                    							
	                    						    dispatchDate: $('#datepickerCompletion').val(),                   							
	                    							commissionDate:$('#datepickerExit').val(),              							
	                    							remarks:$('#remarks').val(),
	                    							railway:$('#railway').val(),
	                    							
	                    						},
	                    						
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							
	                    							$('#datepickerCompletion').val(''),
	                    							$('#datepickerExit').val('');
	                    							$('#remarks').val('');
	                    							$('#shellNumber').val(''),
	                    							$('#railway').val(''),
	                    							$('#exitDialog').dialog('close');
	                    							
	                    							$('#CoachOutTableContainer').jtable('load');
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
				
 		  
 			listAction: 'listCoachAction',
 		//	updateAction:'updateShellAction'
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
				
				coachOutID : {
					title : 'coachOutID',
					width: '8%',
					key: true,
					list : false,
					edit : false,
					create : false
									
					},
					
						rackId : {
							title : 'Rack Id',
							width: '15%',
							
							list : true,
							edit : false,
							create : false
											
							},
						coachNumbers : {
								title : 'Coaches in Racks',
								width: '25%',
								list : true,
								edit : false,
								create : false				
								},
						rackFormationDate: {
							title :'Rack Formation Date',
							width: '8%',
							inputClass: 'validate[required]',
							display:function(data){
										 
								return ((data.record.rackFormationDate!=null) && (data.record.rackFormationDate!="") ) ? moment(data.record.rackFormationDate).format('DD-MM-YYYY') : "";
													}, 
												
				     	
							list: true,
							create: false,
							edit: false
											
							},
			
				
			},
			loadingRecords: function(event,data)
			{
				srno=0;
			},
			recordsLoaded: function(event, data) {
	
				  
				  
				},
				formCreated: function (event, data) {
						
					data.form.validationEngine();
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
	$('#CoachOutTableContainer').jtable('load');
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