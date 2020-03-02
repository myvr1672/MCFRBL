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
<script>
function checkExist(){
    var xmlhttp = new XMLHttpRequest();
    var furnishingNumber = $('#furnishingNo').val();
   
    var url = "existPaint.jsp?furnishingNumber=" +furnishingNumber; 
    xmlhttp.onreadystatechange = function(){
        if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
          
         
  if(xmlhttp.responseText=="false"){
        		
                document.getElementById("isE").style.color = "red";
                document.getElementById("isE").innerHTML="Bogie Number already asigned";
                $("#my-button-submit").attr("disabled", true);
                $("#my-button-submit").addClass('disable');
                return false;
        	}
            else
            	{
            document.getElementById("isE").style.color = "green";
            document.getElementById("isE").innerHTML = xmlhttp.responseText;
            $("#my-button-submit").attr("disabled", false);
            $("#my-button-submit").removeClass('disable');
            return true;
            }
        }
        
    };
    try{
    xmlhttp.open("GET",url,true);
    xmlhttp.send();
}
    catch(e){alert("unable to connect to server");
}

}


</script>
<body>
<div id="PaintProductionTableContainer"></div>
    <div id="exitDialog" style="height:150%; width:200%; display:none;z-index: 9;" >
  <br>
  
			  <br>
			 Enter Completion Date: <br>
		     <input type="Text" id="datepickerCompletion" class='validate[required]' onchange="setMinDate()"/>
		     <br>
		      <br>
		      Enter Dispatch Date: <br>
		     <input type="Text" id="datepickerExit" class='validate[required]' />
		     <br>
		      <br>
		      Remarks: <br>
		     <textarea id="exitRemarks" > </textarea>
		     <br>
		    Delay, if any: <br>
		     <textarea id="delayReason" > </textarea>
		     <br>
		      <br>
		    Furnishing No.: <br>
		     <input type="text" id="furnishingNo" class='validate[required]'  onblur="checkExist()" style='text-transform:uppercase'/><span id="isE"></span> 
		     <br>
		      <br>
		    Coach Type: <br>
		     <select id="coachType" class='validate[required]'> </select>
		     <br>
		    
		      
		    
		     
 </div>
 <div id="detailDialog" style="height:150%; width:200%; display:none;z-index: 9;" ></div>
 </body>




<script type="text/javascript">
		$(document).ready(function() {
			//retrieve coach type 
		       $("#coachType").append('<option value="">Select</option>');
					
					
					<c:forEach var="a" items="${coachType}">
					
					var o = new Option("${a}", "${a}");
					
					$("#coachType").append(o);
				
			    </c:forEach>
//end of code

			
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
	$('#PaintProductionTableContainer').jtable({
			
			title : 'Paint Shop Production',
			
			paging:true,
            sorting: true,
            defaultSorting: 'assemblyStartDate DESC',
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
                        text: 'Add Activity For Paint Production',
                        click: function () {
                        	
                        	 var $selectedRows = $('#PaintProductionTableContainer').jtable('selectedRows');
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
                			var paintAssetId=record.paintAssetId;
                			var shellType=record.shellType;
                			var substageId='<%=stageID%>';
                				
                					var URL="add_activity_for_shell_stage?paintAssetId="+paintAssetId+"&substageId="+substageId+"&shellType="+shellType;
                					var diagtitle="Add Activity For Paint Shop ="+paintAssetId+" and Substage= Sheet Cutting";
                					
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
                        	
                        	
                        	
                        	 var $selectedRows = $('#PaintProductionTableContainer').jtable('selectedRows');
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
	                                    	if ($('#furnishingNo').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
	                                    		    	   
	                                    	$.ajax({
	                    						url : "exitPaint",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						data : {
	                    							
	                    							paintAssetId: record.paintAssetId,
	                    							//shellAssetId:record.shellAssetId,
	                    							//shellType:record.shellType,
	                    							stageId: '<%=stageID%>',
	                    						    assemblyEndDate: $('#datepickerCompletion').val(),                   							
	                    							exitDate:$('#datepickerExit').val(),              							
	                    							exitRemarks:$('#exitRemarks').val(),
	                    							lateReason:$('#delayReason').val(),
	                    							furnishingNumber:$('#furnishingNo').val(),
	                    							coachType:$('#coachType').val(),
	                    						
	                    						},
	                    						
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							
	                    							$('#datepickerCompletion').val(''),
	                    							$('#datepickerExit').val(''),
	                    							$('#exitRemarks').val(''),	
	                    							$('#delayReason').val(''),
	                    							$('#furnishingNo').val(''),
	                    							$('#coachType').val(''),
	                    							$('#exitDialog').dialog('close'),
	                    							
	                    							$('#PaintProductionTableContainer').jtable('load');
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
            // yaha se code dekhana hai... happy weekend navin.....................$$$$$$
			actions : {
				
 		
 			listAction: 'listPaintAction?stageID=<%=stageID%>',
 			updateAction:'updatePaintAction?stageID=<%=stageID%>'
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
				
				paintAssetId : {
					title : 'paintAssetId',
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
	 							  url: 'descByshellFromId',     
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
					shellType: {
						title: 'Shell Type',
						width: '20%',
						create: false,
						width : '20%',
						list: true,
						edit : false
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
					title : 'Expected Dispatch Date',
					type: 'date',
					displayFormat: 'dd-mm-yy',
					display:function(data){
					 
						return ((data.record.expectedExitDate!=null) && (data.record.expectedExitDate!="") ) ? moment(data.record.expectedExitDate).format('DD-MM-YYYY') : "";
											}, 

					inputClass: 'validate[required]',
					edit : true,
					create : false
					
				},
				colorScheme:{
                    title:'Color Scheme',
                    width:'10%',
                    options: {'HUMSAFAR':'HUMSAFAR', 'RAJDHANI':'RAJDHANI', 'DEENDAYALU':'DEENDAYALU', 'OTHERS':'OTHERS'},
                    edit:true,
                    create:true
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
	    			$('#PaintProductionTableContainer').jtable('load');
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
	$('#PaintProductionTableContainer').jtable('load');
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