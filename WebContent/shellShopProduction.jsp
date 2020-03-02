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
    var shellNumber = $('#shellNumber').val();
    var url = "existShell.jsp?shellNumber="+shellNumber; 
    xmlhttp.onreadystatechange = function(){
        if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
          
         
  if(xmlhttp.responseText=="false"){
        		
                document.getElementById("isE").style.color = "red";
                document.getElementById("isE").innerHTML="Shell Number already exist";
                $("#my-button-submit").attr("disabled", true);
                $("#my-button-submit").addClass('disable');
        	}
            else
            	{
            document.getElementById("isE").style.color = "green";
            document.getElementById("isE").innerHTML = xmlhttp.responseText;
            $("#my-button-submit").attr("disabled", false);
            $("#my-button-submit").removeClass('disable');
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
<div id="ShellProductionTableContainer"></div>
    <div id="exitDialog" style="height:150%; width:200%; display:none;z-index: 9;" >
  <br>
  
			  <br>
			 Enter Completion Date: <br>
		     <input type="Text" id="datepickerCompletion" placeholder="Enter Shell Completion Date" class='validate[required]' onchange="setMinDate()"/>
		     <br>
		      <br>
		      Enter Dispatch Date: <br>
		     <input type="Text" id="datepickerExit" placeholder="Enter Dispatch Date" class='validate[required]' />
		     <br>
		      <br>
		   
		      Shell No.: <br>
		       <input type="Text" id="shellNumber" name="shellNumber" class='validate[required]' placeholder="Enter Shell No." onblur="checkExist()" style='text-transform:uppercase'/><span id="isE"></span>
		  <br>
		  <br>
<!-- 		    Under Frame No.: <br> -->
<!-- 		       <input type="Text" id="underFrameNumber" name="underFrameNumber" class='validate[required]'> -->
<!-- 		      <br> -->
<!-- 		      <br> -->
		      Remarks: <br>
		     <textarea id="exitRemarks" placeholder="Enter Remark"></textarea>
		     <br>
		    Delay, if any: <br>
		     <textarea id="delayReason" > </textarea>
		     <br>
		    
		      
		    
		     
 </div>
 <div id="detailDialog" style="height:150%; width:200%; display:none;z-index: 9;" ></div>
 </body>




<script type="text/javascript">
		$(document).ready(function() {
		
			var srno,i=1;
			var shelltypes=[];
			shelltypes[0]={ Value: "", DisplayText: "Select" };
			
			<c:forEach var="a" items="${shellType}">
			var o = new Option("${a}", "${a}");
			/// jquerify the DOM object 'o' so we can use the html method
			$(o).html("${a}");
			$("#shellType").append(o);
			shelltypes[i]={ Value: "${a}", DisplayText: "${a}" };
		i++;
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
	$('#ShellProductionTableContainer').jtable({
			
			title : 'Shell Shop Production',
			
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
                        text: 'Add Activity For Wheel Production',
                        click: function () {
                        	
                        	 var $selectedRows = $('#ShellProductionTableContainer').jtable('selectedRows');
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
                			var shellNumber=record.shellNumber;
                			var shellType=record.shellType;
                			var substageId='<%=stageID%>';
                				
                					var URL="add_activity_for_shell_stage?shellNumber="+shellNumber+"&substageId="+substageId+"&shellType="+shellType;
                					var diagtitle="Add Activity For Shell No ="+shellNumber+" and Substage= Sheet Cutting";
                					
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
                        	
                        	
                        	
                        	 var $selectedRows = $('#ShellProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you want to sent for Bogie Shop");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
								//setting min value
								
								$('#datepickerCompletion').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
								
            					
                    	 	 	$("#exitDialog").dialog({
                    	 	 		title : 'Exit for  '+record.shellTransactionId + 'from Stage- <%=stageID%>',                     	 	 		
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
	                                    	if ($('#shellNumber').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                          //   if ($('#underFrameNumber').validationEngine('validate')) {
	                                        	
	                                       //     return false;
	                                      //  }
	                                    		    	   
	                                    	$.ajax({
	                    						url : "exitShell",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						data : {
	                    							shellAssetId: record.shellAssetId,
	                    							shellType:record.shellType,
	                    							stageId: '<%=stageID%>',
	                    						    assemblyEndDate: $('#datepickerCompletion').val(),                   							
	                    							exitDate:$('#datepickerExit').val(),              							
	                    							shellNumber:$('#shellNumber').val(),
	                    						//	underFrameNumber:$('#underFrameNumber').val(),
	                    							exitRemarks:$('#exitRemarks').val(),
	                    							lateReason:$('#delayReason').val(),
	                    							
	                    						
	                    						},
	                    						
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							
	                    							$('#datepickerCompletion').val(''),
	                    							$('#datepickerExit').val('');
	                    							$('#exitRemarks').val('');
	                    							$('#shellNumber').val(''),
	                    						//	$('#underFrameNumber').val(''),
	                    							$('#delayReason').val(''),
	                    							$('#exitDialog').dialog('close');
	                    							
	                    							$('#ShellProductionTableContainer').jtable('load');
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
				
 		createAction : 'createShellAction?stageID=<%=stageID%>',
 			listAction: 'listShellAction?stageID=<%=stageID%>',
 			updateAction:'updateShellAction?stageID=<%=stageID%>'
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
				
				shellAssetId : {
					title : 'shellAssetId',
					width: '8%',
					key: true,
					list : false,
					edit : false,
					create : false
									
					},
					shellTransactionId : {
						title : 'Shell Production Id',
						width: '8%',
						
						list : true,
						edit : false,
						create : true,
						inputClass: 'validate[required]'				
						},
					
						assemblyStartDate: {
							title :'Jig Entry Date',
							width: '8%',
							inputClass: 'validate[required]',
							display:function(data){
										 
								return ((data.record.assemblyStartDate!=null) && (data.record.assemblyStartDate!="") ) ? moment(data.record.assemblyStartDate).format('DD-MM-YYYY') : "";
													}, 
												
											
	                     				     	
							list: true,
							create: true,
							edit: false
											
							},
						
							
				
				
							expectedExitDate : {
					title : 'Expected Dispatch Date',

					display:function(data){
					 
						return ((data.record.expectedExitDate!=null) && (data.record.expectedExitDate!="") ) ? moment(data.record.expectedExitDate).format('DD-MM-YYYY') : "";
											}, 

					inputClass: 'validate[required]',
					edit : false,
					create : true
					
				},
				shellType: {
					title: 'Shell Type',
					width: '20%',
					options: shelltypes,
					width : '20%',
					list: true,
					edit : true
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
	
				  if (prevStage!='START'){
					 
				     $('#ShellProductionTableContainer').find('.jtable-toolbar-item.jtable-toolbar-item-add-record').remove();
				  }
				  
				},
				formCreated: function (event, data) {
					data.form.find('textarea[name="remarks"]').attr('placeholder','Enter Remarks');
					data.form.find('input[name="assemblyStartDate"]').attr('placeholder','Enter Jig Entry Date');
					data.form.find('input[name="expectedExitDate"]').attr('placeholder','Enter Expected dispatch Date');

						
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
					
					$('[name=assemblyStartDate]').datepicker({
						
						dateFormat: 'dd-mm-yy',
					    onSelect: function(selected) {
					      $('[name=expectedExitDate]').datepicker("option","minDate", selected)
     // $('[name=assemblyStartDate]').val(moment(selected).format('DD-MM-YYYY'));
					      //$('[name=assemblyStartDate]').datepicker('hide');
					    }
					}).datepicker("option", "maxDate", new Date);;

					$('[name=expectedExitDate]').datepicker({ 
						
						dateFormat: 'dd-mm-yy',
					    onSelect: function(selected) {
					        $('[name=assemblyStartDate]').datepicker("option","maxDate", selected)
  //	$('[name=expectedExitDate]').val(moment(selected).format('DD-MM-YYYY'));
					     //   $(this).datepicker('hide');
 					    }
 					}); 
			
					data.form.validationEngine();
	               	            },
	            recordDeleted: function(event,data)
	    		{
	    			srno=0;
	    			$('#ShellProductionTableContainer').jtable('load');
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
	$('#ShellProductionTableContainer').jtable('load');
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