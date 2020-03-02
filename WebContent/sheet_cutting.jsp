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
//out.print("StageID: "+stageID);
 Session session1=HibernateConfig.getSession();
 Criteria cr1=session1.createCriteria(SubStagesMaster.class);
 cr1.add(Restrictions.eq("substageId", stageID));
 SubStagesMaster subStagesMaster =(SubStagesMaster)cr1.list().get(0);
String stageDescription=subStagesMaster.getSubstageDescription();
String substages=subStagesMaster.getSubstages();
String substage_display=substages;
if(stageID.equals("2")) {substages="Wheel";}
if(stageID.equals("4")) {substages="Shell";}
if(stageID.equals("5")||stageID.equals("6")||stageID.equals("8")) {substages="Coach";}
String lowercase_Substages=substages.toLowerCase();
String previousStage=subStagesMaster.getPreviousstageId();   //return either START or some value. Create option only applicable for where the value is START

//out.print("Previous Stage: "+previousStage);

 String nextStages=subStagesMaster.getNextStageId();
 session1.close();
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
</style>
<body>
<div id="SheetCuttingTableContainer"></div>
    <div id="exitDialog" style="height:150%; width:200%; display:none;z-index: 9;" >
  <br>
			  <br>
			 Enter Exit Date: <br>
		     <input type="Text" id="datepickerExit" class='validate[required]' />
		     <br>
		      <br>
		      Remarks: <br>
		     <input type="Text" id="exitRemarks" /> 
		     <br>
		    
		     <br>
		     <% 
		    
		     if(stageID.equals("2"))
		     { %>
		     
		      Bogie No.: <br>
		     <input type="Text" id="bogieNumber" /> 
		     <% }
		     if(stageID.equals("5"))
		     { %>
		      Coach No.: <br>
		     <input type="Text" id="coachNumber" /> 
		     <% }
		     %>
 </div>
 <div id="detailDialog" style="height:150%; width:200%; display:none;z-index: 9;" ></div>
</body>
<script type="text/javascript">
		$(document).ready(function() {
			
			var prevStage='<%=previousStage%>';
		
			var srno,i=0;
			var shelltypes=[];
			
			<c:forEach var="a" items="${shellType}">
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
	$('#SheetCuttingTableContainer').jtable({
			
			title : '<%=substage_display%> Shop Production',
			
			
            sorting: true,
            defaultSorting: '<%=lowercase_Substages%>Number ASC',
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
                        text: 'Add Activity For Sheet Cutting',
                        click: function () {
                        	
                        	 var $selectedRows = $('#SheetCuttingTableContainer').jtable('selectedRows');
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
                			var shellNumber=record.<%=lowercase_Substages%>Number;
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
                        	
                        	 var $selectedRows = $('#SheetCuttingTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you want to add activity");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });

            					
                    	 	 	$("#exitDialog").dialog({
                    	 	 		title : 'Exit for  <%=substages%> No. '+record.<%=lowercase_Substages%>Number + 'from Stage- <%=stageID%>',                     	 	 		
                    	 	 		close: function (e, u) {
              	 		              //$(".formError").remove();
              	 		          	$("#exitDialog").validationEngine('hideAll');
              	 		          },
                	 		 	
 		 							buttons: {
	                                    Submit: function () {
	                                    		
	                                    	//alert("$('#qtyDispatched').val()->"+$('#qtyDispatched').val());
	                                    	//alert("record.balanceQtyToDispatch->"+record.balanceQtyToDispatch);
	                            	 		
	                                    	if ($('#datepickerExit').validationEngine('validate')) {
				                                        	//alert(!$("#dialog").validationEngine('validate'));
				                                            return false;
				                                        }
	                                    		    	   
	                                    	$.ajax({
	                    						url : "exitStage",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						data : {
	                    							assetID: record.assetID,
	                    							stageId: '<%=stageID%>',
	                    							assetNumber: record.<%=lowercase_Substages%>Number,
	                    							                    							
	                    							exitDate:$('#datepickerExit').val(),
	                    							shellType:record.shellType,
	                    							exitRemarks:$('#exitRemarks').val(),
	                    							bogieNumber: $('#bogieNumber').val(),
	                    							coachNumber: $('#coachNumber').val(),
	                    						},
	                    						
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							
	                    							
	                    							$('#datepickerExit').val('');
	                    							$('#exitRemarks').val('');
	                    							$('#bogieNumber').val(''),
	                    							$('#coachNumber').val('');
	                    							$('#exitDialog').dialog('close');
	                    							
	                    							$('#SheetCuttingTableContainer').jtable('load');
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
				
 						createAction : 'createSheetCuttingAction?stageID=<%=stageID%>',
 						
 				
 				
 				listAction: 'listSheetCuttingAction?stageID=<%=stageID%>',
 				
 						
 				updateAction:'updateSheetCuttingAction?stageID=<%=stageID%>'
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
				
				assetID : {
					title : 'assetID',
					width: '20%',
					key: true,
					list : false,
					edit : false,
					create : false
									
					},
				<%=lowercase_Substages%>Number: {
					title :'<%=substages%> No.',
					width: '20%',
					key: true,
					list: true,
					create: true,
					edit: true
									
					},
				shellType: {
					title: '<%=substages%> Type',
					width: '20%',
					options: shelltypes,
					width : '20%',
					list: true,
					edit : true
				},
				
				entryDate : {
					title : 'Entry Date',
					type: 'date',
					displayFormat: 'dd-mm-yy',
					edit : true	,
					create : true
					
				},
				receiptDate : {
					title : 'Receipt Date',
					type: 'date',
					displayFormat: 'dd-mm-yy',
					edit : true	,
					create : true
					
				},
				
				expectedExitDate : {
					title : 'Expted Exit Date',
					type: 'date',
					displayFormat: 'dd-mm-yy',
					edit : true	,
					create : true
					
				},
				remarks: {
				   title: 'Remarks',
				   width : '25%',
					type : 'textarea',
					edit : true,
					create: true 
				},
								
// 				activity:{
//                  //   title: 'Lieu Dates',
//                     title:'Activity Performed',
//                     width: '5%',
//                     sorting: false,
//                     edit: false,
//                     create: false,
// 				}
                        
			},
			loadingRecords: function(event,data)
			{
				srno=0;
			},
			recordsLoaded: function(event, data) {
	
				  if (prevStage!='START'){
					 
				     $('#SheetCuttingTableContainer').find('.jtable-toolbar-item.jtable-toolbar-item-add-record').remove();
				  }
				  
				},
				formCreated: function (event, data) {
					//$( "#jtable-create-form .jtable-input-label:contains('Receipt Date')" ).parent().hide();
					if (prevStage=='START'){
						
						
					
						$( "#jtable-create-form .jtable-input-label:contains('Receipt Date')" ).parent().hide();
						$( "#jtable-edit-form .jtable-input-label:contains('Receipt Date')" ).parent().hide();
											$('#Edit-receiptDate').hide();
								
							
											}
										else{
											$('[name=<%=lowercase_Substages%>Number]').prop('readonly', true);
											$('[name=<%=lowercase_Substages%>Number]').addClass('jtable-input-readonly');
											$( "#jtable-edit-form .jtable-input-label:contains('Receipt Date')" ).parent().show();
											$('#Edit-receiptDate').show();
											
											$('[name=shellType] option:not(:selected)').attr('disabled', true);
											$('[name=shellType]').addClass('jtable-input-readonly');
											$('[name=shellType]').prop("disabled","disabled");
											$('[name=entryDate]').datepicker("destroy").addClass('jtable-input-readonly').prop('readonly', true);
											
											
										}
					
					
					
					
					$('[name=entryDate]').
					datepicker("option", "disabled", false ).
					val('').css('background-color' ,'').datepicker("option", "maxDate", new Date);
					$('[name=entryDate]').val(moment(data.record.entryDate).format('DD-MM-YYYY'));
						
					
					
					
	               	            },
	            recordDeleted: function(event,data)
	    		{
	    			srno=0;
	    			$('#SheetCuttingTableContainer').jtable('load');
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
	$('#SheetCuttingTableContainer').jtable('load');
		});
		
		
	</script>
	 
	