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
Session session1=HibernateConfig.getSession();
 Criteria cr1=session1.createCriteria(SubStagesMaster.class);
 cr1.add(Restrictions.eq("substageId", stageID));
 SubStagesMaster subStagesMaster =(SubStagesMaster)cr1.list().get(0);

String previousStage=subStagesMaster.getPreviousstageId();   //return either START or some value. Create option only applicable for where the value is START
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
.ui-autocomplete.ui-front {
            max-height: 200px;
             overflow-y: auto; 
 
         }  
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

.disabled{
border: 1px solid #999999;
background-color: #cccccc;
color:#666666;
 }
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


//for date picker in dialog box
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
	
	$('#docNoDate').datepicker({
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

	$('#dateOfTesting').datepicker({
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
    defaultSorting: 'shellAssetId ASC',
    selecting: true, //Enable selecting
    multiselect: false, 
    multiSorting: true,
    animationsEnabled : true,
//Create toolbat
     toolbar: {
        items: [
     
            {
            	icon: '<%=contextpath%>/images/rs_out.png',
                text: 'Shell SIP Assembly',
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
						// set already existing data
						 $.ajax({
                						url : "showExistingDataOfShell",  //action-name as defined in struts.xml
                						dataType: 'json', 
                						async:false,
                						data : {
                							shellAssetId: record.shellAssetId,
                						},
                						success:function(data)
                						{
                							$('#docNo').val(data.formDocNoShellAssembly),	
                							$('#revNo').val(data.formRevNoShellAssembly),
                							$('#verNo').val(data.formVerShellAssembly),
                							$('#shellType').val(data.shellNo_Type)
                				
                							
                						}
						});  
						//end of code
						
						  if(record.assemblySipFlag==1)
							{
								var cfm=confirm("Data for Shell Assembly is already updated for selected Shell. Do you want to verify data?");
                              	if(cfm==false){return false;}	
                              	var date1,date1Array, date2, date2Array; 
							$.ajax({
        						url : "showExistingDataOfShellSIPAssembly",  //action-name as defined in struts.xml
        						dataType: 'json', 
        						
        						data : {
        							shellAssetId: record.shellAssetId,
        						},
        						type : 'POST',
          						async : false,
				                })
				               
				                .done(function(data)
        						{
        							
        							$('#docNo').val(data.shellSideRoofShellCombineSipTran.docNo),
        							$('#revNo').val(data.shellSideRoofShellCombineSipTran.revNo),
        						
        							date1=(data.shellSideRoofShellCombineSipTran.docNoDate).substring(0,10),
        							 date1Array=date1.split("-"),
        							$('#docNoDate').datepicker("setDate",new Date(date1Array[0],date1Array[1]-1,date1Array[2])),
        						
        							$('#shiftOfTesting').val(data.shellSideRoofShellCombineSipTran.shiftOfTesting),
        							 date2=(data.shellSideRoofShellCombineSipTran.dateOfTesting).substring(0,10),
        							 date2Array=date2.split("-");
        							$('#dateOfTesting').datepicker("setDate",new Date(date2Array[0],date2Array[1]-1,date2Array[2])),
        							//$('[name="fitmentAntiRollBarStatus"]').val([msg.bogieFinalSipTran.fitmentAntiRollBarStatus]);
        							$('[name="sidewallInspectionVisualHolesObser"]').val([data.shellSideRoofShellCombineSipTran.sidewallInspectionVisualHolesObser]),
        							$('[name="sidewallInspectionVisualHolesRectStatus"]').val([data.shellSideRoofShellCombineSipTran.sidewallInspectionVisualHolesRectStatus]),
        							
        							$('[name="sidewallSuspectedHolesObser"]').val([data.shellSideRoofShellCombineSipTran.sidewallSuspectedHolesObser]),
        							
        							
        							$('[name="sidewallSuspectedHolesRectStatus"]').val([data.shellSideRoofShellCombineSipTran.sidewallSuspectedHolesRectStatus]),
        							$('[name="sidewallIncompleteWeldingObser"]').val([data.shellSideRoofShellCombineSipTran.sidewallIncompleteWeldingObser]);
        							$('[name="sidewallIncompleteWeldingRectStatus"]').val([data.shellSideRoofShellCombineSipTran.sidewallIncompleteWeldingRectStatus]),
        							$('[name="sidewallLeakageTestObser"]').val([data.shellSideRoofShellCombineSipTran.sidewallLeakageTestObser]),
        							
        							$('[name="sidewallLeakageTestRectStatus"]').val([data.shellSideRoofShellCombineSipTran.sidewallLeakageTestRectStatus]),
        							
        							$('[name="roofInspectionVisualHolesObser"]').val([data.shellSideRoofShellCombineSipTran.roofInspectionVisualHolesObser]),
        							$('[name="roofInspectionVisualHolesRectStatus"]').val([data.shellSideRoofShellCombineSipTran.roofInspectionVisualHolesRectStatus]),
        							$('[name="roofSuspectedHolesObser"]').val([data.shellSideRoofShellCombineSipTran.roofSuspectedHolesObser]),
        							$('[name="roofSuspectedHolesRectStatus"]').val([data.shellSideRoofShellCombineSipTran.roofSuspectedHolesRectStatus]),
        							$('[name="roofIncompleteWeldingObser"]').val([data.shellSideRoofShellCombineSipTran.roofIncompleteWeldingObser]),
        							$('[name="roofIncompleteWeldingRectStatus"]').val([data.shellSideRoofShellCombineSipTran.roofIncompleteWeldingRectStatus]),
        							$('[name="shellInspectionVisualHolesObser"]').val([data.shellSideRoofShellCombineSipTran.shellInspectionVisualHolesObser]),
        							$('[name="shellInspectionVisualHolesRectStatus"]').val([data.shellSideRoofShellCombineSipTran.shellInspectionVisualHolesRectStatus]),
        							$('[name="shellIncompleteWeldingObser"]').val([data.shellSideRoofShellCombineSipTran.shellIncompleteWeldingObser]),
        							$('[name="shellIncompleteWeldingRectStatus"]').val([data.shellSideRoofShellCombineSipTran.shellIncompleteWeldingRectStatus]),
        							$('[name="shellInspectionHolesTroughObser"]').val([data.shellSideRoofShellCombineSipTran.shellInspectionHolesTroughObser]),
        							$('[name="shellInspectionHolesTroughRectStatus"]').val([data.shellSideRoofShellCombineSipTran.shellInspectionHolesTroughRectStatus]),
        							$('[name="shellInspectionHolesRoofObser"]').val([data.shellSideRoofShellCombineSipTran.shellInspectionHolesRoofObser]),
        							$('[name="shellInspectionHolesRoofRectStatus"]').val([data.shellSideRoofShellCombineSipTran.shellInspectionHolesRoofRectStatus]),
        							$('[name="shellSuspectedHolesObser"]').val([data.shellSideRoofShellCombineSipTran.shellSuspectedHolesObser]),
        							$('[name="shellSuspectedHolesRectStatus"]').val([data.shellSideRoofShellCombineSipTran.shellSuspectedHolesRectStatus]),
        							$('[name="shellSideRoofShellCombineTestingStatus"]').val([data.shellSideRoofShellCombineSipTran.shellSideRoofShellCombineTestingStatus]);
        							
        							
        						})
        						.error(function (data){
        								//$('#dialog').dialog('close');
        								alert("Error Fetching Bogie Testing Data");
        							});
							}   
						
						$('#docNoDate').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
			
            	 	 	$("#shellSIPAssembly").dialog({
            	 	 		title : 'Exit for  '+record.shellTransactionId + 'from Stage- <%=stageID%>',  
            	 	 		width:'60%',
            	 	 		close: function (e, u) {
      	 		              
      	 		          	$("#shellSIPAssembly").validationEngine('hideAll');
      	 		         // $('#shellSIPAssembly').find('form[name="shellAssembly"]')[0].reset();
      	 		         $('form[name="shellAssemblyForm"]')[0].reset();
      	 		       
      	 		      $('#ShellProductionTableContainer').jtable('load');
      	 		          },
        	 		 	
	 							buttons: {
                                Submit: {
                                   text: "Submit",
                                    id: "my-button-submit",
                                    click:function () {
                                		
                                	
                        	 		
                                	if ($('#docNo').validationEngine('validate')) {
		                                        	
		                                            return false;
		                                        }
                                      if ($('#revNo').validationEngine('validate')) {
                                    	
                                        return false;
                                    }
                                      
                                	if ($('#docNoDate').validationEngine('validate')) {
                                    	
                                        return false;
                                    }
									if ($('#shiftOfTesting').validationEngine('validate')) {
                                    	
                                        return false;
                                    }
									if ($('#dateOfTesting').validationEngine('validate')) {
                                    	
                                        return false;
                                    }
									
                                	var c=confirm("Do you want to submit data!!");
                                	if(c==false){return false;}
                                 
                                		    	   
                                	$.ajax({
                						url : "saveShellSIPAssembly",  //action-name as defined in struts.xml
                						dataType: 'json', 
                						data : {
                							shellAssetId: record.shellAssetId,
                							
                							docNo: $('#docNo').val(),                   							
                							revNo: $('#revNo').val(),
                							docNoDate: $('#docNoDate').val(),
                							shiftOfTesting: $('#shiftOfTesting').val(),
                							dateOfTesting: $('#dateOfTesting').val(),
                							sidewallInspectionVisualHolesObser: $("input[id='sidewallInspectionVisualHolesObser']:checked").val(),
                							sidewallInspectionVisualHolesRectStatus: $("input[id='sidewallInspectionVisualHolesRectStatus']:checked").val(),
                							sidewallSuspectedHolesObser: $("input[id='sidewallSuspectedHolesObser']:checked").val(),
                							sidewallSuspectedHolesRectStatus: $("input[id='sidewallSuspectedHolesRectStatus']:checked").val(),
                							sidewallIncompleteWeldingObser: $("input[id='sidewallIncompleteWeldingObser']:checked").val(),
                							sidewallIncompleteWeldingRectStatus: $("input[id='sidewallIncompleteWeldingRectStatus']:checked").val(),
                							sidewallLeakageTestObser: $("input[id='sidewallLeakageTestObser']:checked").val(),
                							sidewallLeakageTestRectStatus: $("input[id='sidewallLeakageTestRectStatus']:checked").val(),
                							roofInspectionVisualHolesObser: $("input[id='roofInspectionVisualHolesObser']:checked").val(),
                							roofInspectionVisualHolesRectStatus: $("input[id='roofInspectionVisualHolesRectStatus']:checked").val(),
                							roofSuspectedHolesObser: $("input[id='roofSuspectedHolesObser']:checked").val(),
                							roofSuspectedHolesRectStatus: $("input[id='roofSuspectedHolesRectStatus']:checked").val(),
                							roofIncompleteWeldingObser: $("input[id='roofIncompleteWeldingObser']:checked").val(),
                							roofIncompleteWeldingRectStatus: $("input[id='roofIncompleteWeldingRectStatus']:checked").val(),
                							shellInspectionVisualHolesObser: $("input[id='shellInspectionVisualHolesObser']:checked").val(),
                							shellInspectionVisualHolesRectStatus: $("input[id='shellInspectionVisualHolesRectStatus']:checked").val(),
                							shellIncompleteWeldingObser: $("input[id='shellIncompleteWeldingObser']:checked").val(),
                							shellIncompleteWeldingRectStatus: $("input[id='shellIncompleteWeldingRectStatus']:checked").val(),
                							shellInspectionHolesTroughObser: $("input[id='shellInspectionHolesTroughObser']:checked").val(),
                							shellInspectionHolesTroughRectStatus: $("input[id='shellInspectionHolesTroughRectStatus']:checked").val(),
                							shellInspectionHolesRoofObser: $("input[id='shellInspectionHolesRoofObser']:checked").val(),
                							shellInspectionHolesRoofRectStatus: $("input[id='shellInspectionHolesRoofRectStatus']:checked").val(),
                							shellSuspectedHolesObser: $("input[id='shellSuspectedHolesObser']:checked").val(),
                							shellSuspectedHolesRectStatus: $("input[id='shellSuspectedHolesRectStatus']:checked").val(),
                							shellSideRoofShellCombineTestingStatus: $("input[id='shellSideRoofShellCombineTestingStatus']:checked").val(),
                					
                						},
                						
                						type : 'POST',
                						async : false,
                        	 		})
                						.done(function( msg ) {
                							
                							$('#docNo').val(''),
                							$('#revNo').val(''),
                							$('#docNoDate').val(''),
                							$('#shiftOfTesting').val(''),
                							$('#dateOfTesting').val(''),
                							
                							$('#sidewallInspectionVisualHolesObser').val(''),
                							$('#sidewallInspectionVisualHolesRectStatus').val(''),
                							$('#sidewallSuspectedHolesObser').val(''),
                							$('#sidewallSuspectedHolesRectStatus').val(''),
                							$('#sidewallIncompleteWeldingObser').val(''),
                							$('#sidewallIncompleteWeldingRectStatus').val(''),
                							
                							$('#sidewallLeakageTestObser').val(''),
                							$('#sidewallLeakageTestRectStatus').val(''),
                							$('#roofInspectionVisualHolesObser').val(''),
                							$('#roofInspectionVisualHolesRectStatus').val(''),
                							$('#roofSuspectedHolesObser').val(''),
                							
                							$('#roofSuspectedHolesRectStatus').val(''),
                							$('#roofIncompleteWeldingObser').val(''),
                							$('#roofIncompleteWeldingRectStatus').val(''),
                							$('#shellInspectionVisualHolesObser').val(''),
                							$('#shellInspectionVisualHolesRectStatus').val(''),
                							
                							$('#shellIncompleteWeldingObser').val(''),
                							$('#shellIncompleteWeldingRectStatus').val(''),
                							$('#shellInspectionHolesTroughObser').val(''),
                							$('#shellInspectionHolesTroughRectStatus').val(''),
                							$('#shellInspectionHolesRoofObser').val(''),
                							
                							$('#shellInspectionHolesRoofRectStatus').val(''),
                							$('#shellSuspectedHolesObser').val(''),
                							$('#shellSuspectedHolesRectStatus').val(''),
                							$('#shellSideRoofShellCombineTestingStatus').val(''),
                							
                						  
                							$('#shellSIPAssembly').dialog('close'),
                							// $('form[name="shellAssembly"]')[0].reset();
                							// $('#shellSIPAssembly').find('form[name="shellAssembly"]')[0].reset();
                							$('form[name="shellAssemblyForm"]')[0].reset();
                           	 		       
                            	 		      $('#ShellProductionTableContainer').jtable('load');
     								  })
     								.error(function (msg){
     									
     									alert("Error Fetching Data");
     								})
     								  ;
			                 			    	   return true;
		                                    }
                                },
		                        Close: function () {
		                        
		                        	$('form[name="shellAssemblyForm"]')[0].reset();
		              	 		       
		              	 		 
		                        	// $('#shellSIPAssembly').find('form[name="shellAssembly"]')[0].reset();
		                                        $(this).dialog('close');
		                                        $('#ShellProductionTableContainer').jtable('load');
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
	

		listAction: 'listSIPFinalShellAction?stageID=<%=stageID%>'
		
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
			width: '10%',
			options: shelltypes,
			
			list: true,
			edit : true
		},
		remarks: {
		   title: 'Remarks',
		   width : '20%',
			type : 'textarea',
			edit : true,
			create: true 
		},
		
		stage1SipFlag:
		{
	title: 'Stage-1 Report',
    width: '3%',
    edit: false,
    create: false,	
    display: function (data) {
   var $img = $('<img src="<%=contextpath%>/images/schedule_form.png" title="Edit Schedule" />');	
   $img.click(function () {

	var wWidth = $(window).width();
	var dWidth = wWidth * 0.9;
	var wheight = $(window).height();
	var dheight = wheight * 0.9;
	var shellAssetId=data.record.shellAssetId;
	
//var URL="open-final-bogie-SIP-report?bogieAssetId="+bogieAssetId;
var URL="open-stage1-shell-SIP-report?shellAssetId="+shellAssetId;			
var diagtitle="Stage-1 SIP Report";
			$( "#detailDialog" ).load( URL ).dialog({
													title: diagtitle,
													modal:true,
													height:dheight, 
													width: '40%', 
													}).prev(".ui-dialog-titlebar").css("background","blue");

	
 });
    	
    	return $img;	
    }
		},
		
		stage2SipFlag:
		{
	title: 'Stage-2 Report',
    width: '3%',
    edit: false,
    create: false,	
    display: function (data) {
   var $img = $('<img src="<%=contextpath%>/images/schedule_form.png" title="Edit Schedule" />');	
   $img.click(function () {

	var wWidth = $(window).width();
	var dWidth = wWidth * 0.9;
	var wheight = $(window).height();
	var dheight = wheight * 0.9;
	var shellAssetId=data.record.shellAssetId;
	
//var URL="open-final-bogie-SIP-report?bogieAssetId="+bogieAssetId;
var URL="open-stage2-shell-SIP-report?shellAssetId="+shellAssetId;			
var diagtitle="Stage-2 SIP Report";
			$( "#detailDialog" ).load( URL ).dialog({
													title: diagtitle,
													modal:true,
													height:dheight, 
													width: '40%', 
													}).prev(".ui-dialog-titlebar").css("background","blue");

	
 });
    	
    	return $img;	
    }
		},
		
		stage3SipFlag:
		{
	title: 'Stage-3 Report',
    width: '3%',
    edit: false,
    create: false,	
    display: function (data) {
   var $img = $('<img src="<%=contextpath%>/images/schedule_form.png" title="Edit Schedule" />');	
   $img.click(function () {

	var wWidth = $(window).width();
	var dWidth = wWidth * 0.9;
	var wheight = $(window).height();
	var dheight = wheight * 0.9;
	var shellAssetId=data.record.shellAssetId;
	
//var URL="open-final-bogie-SIP-report?bogieAssetId="+bogieAssetId;
var URL="open-stage3-shell-SIP-report?shellAssetId="+shellAssetId;			
var diagtitle="Stage-3 SIP Report";
			$( "#detailDialog" ).load( URL ).dialog({
													title: diagtitle,
													modal:true,
													height:dheight, 
													width: '40%', 
													}).prev(".ui-dialog-titlebar").css("background","blue");

	
 });
    	
    	return $img;	
    }
		},
		stage4SipFlag:
		{
	title: 'Stage-4 Report',
    width: '3%',
    edit: false,
    create: false,	
    display: function (data) {
   var $img = $('<img src="<%=contextpath%>/images/schedule_form.png" title="Edit Schedule" />');	
   $img.click(function () {

	var wWidth = $(window).width();
	var dWidth = wWidth * 0.9;
	var wheight = $(window).height();
	var dheight = wheight * 0.9;
	var shellAssetId=data.record.shellAssetId;
	
//var URL="open-final-bogie-SIP-report?bogieAssetId="+bogieAssetId;
var URL="open-stage4-shell-SIP-report?shellAssetId="+shellAssetId;			
var diagtitle="Stage-4 SIP Report";
			$( "#detailDialog" ).load( URL ).dialog({
													title: diagtitle,
													modal:true,
													height:dheight, 
													width: '40%', 
													}).prev(".ui-dialog-titlebar").css("background","blue");

	
 });
    	
    	return $img;	
    }
		},
      
	},
	loadingRecords: function(event,data)
	{
		srno=0;
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
					$('#ShellProductionTableContainer').jtable('load');
				},

			//Validate form when it is being submitted
		
	    
		//Dispose validation logic when form is closed
		
	});
$('#ShellProductionTableContainer').jtable('load');
});


</script>

<body>
<div id="ShellProductionTableContainer"></div>
<div id="detailDialog" style="height: 200%; width:50%; display:none;z-index: 9;" ></div>
<div id="shellSIPAssembly" style="height:150%; width:200%; display:none;z-index: 9;" >
  
	 	<form name="shellAssemblyForm">
		<table class="t1" border="1">
			<tr>
				<td class="t3"><b>Modern Coach Factory Raebareli <br>INSPECTION PROFORMA</b></td>
				
				<td>DOC NO: <input type="text" id="docNo" class="validate[required]"><br> REV NO: <input type="text" id="revNo" class="validate[required]"> <br>DATE:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="docNoDate" class="validate[required]"></td>
			</tr>
		</table>
		<h3>Final Inspection Report of Roof Holes/Roof Bearer Holes/Holes At Joints Etc. In LHB Coaches At Side Wall Stage/Shell Assembly(At Shell JIG)</h3>
		<p>Roof/Side Wall/Shell Type and No(whichever is applicable) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="shellType" readonly></p>
		<table class="t2" border="1">
			<tr>
				<td>Shift: <select id="shiftOfTesting" class="validate[required]">
				 <option value="">Select</option>
             <option value="general">General</option>
             <option value="morning">Shift-I</option>
            <option value="evening">Shift-II</option>
               <option value="night">Shift-III</option>
				</select></td>
				<td>Date: <input type="text" id="dateOfTesting" class="validate[required]"></td>
				<td>Version: <input type="text" id="verNo"></td>		
			</tr>
		</table>
		<br>
		<br>
		
		<table>
			<tr>
				<td><b>1. Side wall Assembly: </b></td>
				<td><b>Observations Status after rectification</b></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;<b>1.1</b> Inspection of visual holes at roof bearer joints.</td>
				<td><input type="radio" name="sidewallInspectionVisualHolesObser" id="sidewallInspectionVisualHolesObser" value="Found">Found 
				  <input type="radio" name="sidewallInspectionVisualHolesObser" id="sidewallInspectionVisualHolesObser" value="Not Found">Not Found &nbsp;&nbsp;&nbsp;
				  <input type="radio" name="sidewallInspectionVisualHolesRectStatus" id="sidewallInspectionVisualHolesRectStatus" value="Ok">Ok 
				  <input type="radio" name="sidewallInspectionVisualHolesRectStatus" id="sidewallInspectionVisualHolesRectStatus" value="Not Ok">Not Ok</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;<b>1.2</b> Suspected holes may be detected by DP test.</td>
				<td><input type="radio" name="sidewallSuspectedHolesObser" id="sidewallSuspectedHolesObser" value="Found">Found 
				<input type="radio" name="sidewallSuspectedHolesObser" id="sidewallSuspectedHolesObser" value="Not Found">Not Found
				 &nbsp;&nbsp;&nbsp;<input type="radio" id="sidewallSuspectedHolesRectStatus" name="sidewallSuspectedHolesRectStatus" value="Ok">Ok
				 <input type="radio" name="sidewallSuspectedHolesRectStatus" id="sidewallSuspectedHolesRectStatus" value="Not Ok">Not Ok</td>
			</tr>
			
<!-- 			<td><input type="radio" name="fitmentLongitudinalStopStatus" id="fitmentLongitudinalStopStatus" value="OK">OK  -->
<!--           <input type="radio" name="fitmentLongitudinalStopStatus" id="fitmentLongitudinalStopStatus" value="NOT OK">NOT OK -->
<!--           <input type="radio" name="fitmentLongitudinalStopStatus" id="fitmentLongitudinalStopStatus" value="NA">NA -->
<!--           </td> -->
			
			
			
			<tr>
				<td>&nbsp;&nbsp;<b>1.3</b> Incomplete welding(if any)</td>
				<td><input type="radio" name="sidewallIncompleteWeldingObser" id="sidewallIncompleteWeldingObser" value="Found">Found 
				<input type="radio" name="sidewallIncompleteWeldingObser" id="sidewallIncompleteWeldingObser" value="Not Found">Not Found &nbsp;&nbsp;&nbsp;
				<input type="radio" name="sidewallIncompleteWeldingRectStatus" id="sidewallIncompleteWeldingRectStatus" value="Ok">Ok 
				<input type="radio" name="sidewallIncompleteWeldingRectStatus" id="sidewallIncompleteWeldingRectStatus" value="Not Ok">Not Ok</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;<b>1.4</b> Leakage test of window sealing joint(LSCN)</td>
				<td><input type="radio" name="sidewallLeakageTestObser" id="sidewallLeakageTestObser" value="Found">Found 
				<input type="radio" name="sidewallLeakageTestObser" id="sidewallLeakageTestObser" value="Not Found">Not Found &nbsp;&nbsp;&nbsp;
				<input type="radio" name="sidewallLeakageTestRectStatus" id="sidewallLeakageTestRectStatus" value="Ok">Ok 
				<input type="radio" name="sidewallLeakageTestRectStatus" id="sidewallLeakageTestRectStatus" value="Not Ok">Not Ok</td>
			</tr>
			<tr>
				<td><b>2. Roof Assembly: </b></td>
				<td></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;<b>2.1</b> Inspection of visual holes at roof.</td>
				<td><input type="radio" name="roofInspectionVisualHolesObser" id="roofInspectionVisualHolesObser" value="Found">Found 
				<input type="radio" name="roofInspectionVisualHolesObser" id="roofInspectionVisualHolesObser" value="Not Found">Not Found &nbsp;&nbsp;&nbsp;
				<input type="radio" name="roofInspectionVisualHolesRectStatus" id="roofInspectionVisualHolesRectStatus" value="Ok">Ok 
				<input type="radio" name="roofInspectionVisualHolesRectStatus" id="roofInspectionVisualHolesRectStatus" value="Not Ok">Not Ok</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;<b>2.2</b> Suspected holes may be detected by DP test.</td>
				<td><input type="radio" name="roofSuspectedHolesObser" id="roofSuspectedHolesObser" value="Found">Found 
				<input type="radio" name="roofSuspectedHolesObser" id="roofSuspectedHolesObser" value="Not Found">Not Found &nbsp;&nbsp;&nbsp;
				<input type="radio" name="roofSuspectedHolesRectStatus" id="roofSuspectedHolesRectStatus" value="Ok">Ok 
				<input type="radio" name="roofSuspectedHolesRectStatus" id="roofSuspectedHolesRectStatus" value="Not Ok">Not Ok</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;<b>2.3</b> Incomplete welding(if any)</td>
				<td><input type="radio" name="roofIncompleteWeldingObser" id="roofIncompleteWeldingObser" value="Found">Found 
				<input type="radio" name="roofIncompleteWeldingObser" id="roofIncompleteWeldingObser" value="Not Found">Not Found &nbsp;&nbsp;&nbsp;
				<input type="radio" name="roofIncompleteWeldingRectStatus" id="roofIncompleteWeldingRectStatus" value="Ok">Ok 
				<input type="radio" name="roofIncompleteWeldingRectStatus" id="roofIncompleteWeldingRectStatus" value="Not Ok">Not Ok</td>
			</tr>
			<tr>
				<td><b>3. At Shell Jig: </b></td>
				<td></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;<b>3.1</b> Inspection of visual holes at roof bearer joints.</td>
				<td><input type="radio" name="shellInspectionVisualHolesObser" id="shellInspectionVisualHolesObser" value="Found">Found 
				<input type="radio" name="shellInspectionVisualHolesObser" id="shellInspectionVisualHolesObser" value="Not Found">Not Found &nbsp;&nbsp;&nbsp;
				<input type="radio" name="shellInspectionVisualHolesRectStatus" id="shellInspectionVisualHolesRectStatus" value="Ok">Ok 
				<input type="radio" name="shellInspectionVisualHolesRectStatus" id="shellInspectionVisualHolesRectStatus" value="Not Ok">Not Ok</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;<b>3.2</b> Incomplete welding(if any)</td>
				<td><input type="radio" name="shellIncompleteWeldingObser" id="shellIncompleteWeldingObser" value="Found">Found 
				<input type="radio" name="shellIncompleteWeldingObser" id="shellIncompleteWeldingObser" value="Not Found">Not Found &nbsp;&nbsp;&nbsp;
				<input type="radio" name="shellIncompleteWeldingRectStatus" id="shellIncompleteWeldingRectStatus" value="Ok">Ok 
				<input type="radio" name="shellIncompleteWeldingRectStatus" id="shellIncompleteWeldingRectStatus" value="Not Ok">Not Ok</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;<b>3.3</b> Inspection of holes at trough joint.</td>
				<td><input type="radio" name="shellInspectionHolesTroughObser" id="shellInspectionHolesTroughObser" value="Found">Found 
				<input type="radio" name="shellInspectionHolesTroughObser" id="shellInspectionHolesTroughObser" value="Not Found">Not Found &nbsp;&nbsp;&nbsp;
				<input type="radio" name="shellInspectionHolesTroughRectStatus" id="shellInspectionHolesTroughRectStatus" value="Ok">Ok 
				<input type="radio" name="shellInspectionHolesTroughRectStatus" id="shellInspectionHolesTroughRectStatus" value="Not Ok">Not Ok</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;<b>3.4</b> Inspection of holes at roof element & its joints With roof, side wall and end wall</td>
				<td><input type="radio" name="shellInspectionHolesRoofObser" id="shellInspectionHolesRoofObser" value="Found">Found 
				<input type="radio" name="shellInspectionHolesRoofObser" id="shellInspectionHolesRoofObser" value="Not Found">Not Found &nbsp;&nbsp;&nbsp;
				<input type="radio" name="shellInspectionHolesRoofRectStatus" id="shellInspectionHolesRoofRectStatus" value="Ok">Ok 
				<input type="radio" name="shellInspectionHolesRoofRectStatus" id="shellInspectionHolesRoofRectStatus" value="Not Ok">Not Ok</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;<b>3.5</b> Suspected holes may be detected by DP test Except Roof assembly.</td>
				<td><input type="radio" name="shellSuspectedHolesObser" id="shellSuspectedHolesObser" value="Found">Found 
				<input type="radio" name="shellSuspectedHolesObser" id="shellSuspectedHolesObser" value="Not Found">Not Found &nbsp;&nbsp;&nbsp;
				<input type="radio" name="shellSuspectedHolesRectStatus" id="shellSuspectedHolesRectStatus" value="Ok">Ok 
				<input type="radio" name="shellSuspectedHolesRectStatus" id="shellSuspectedHolesRectStatus" value="Not Ok">Not Ok</td>
			</tr>
		</table>
		<br>
		<table>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Testing Status</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td><input type="radio" name="shellSideRoofShellCombineTestingStatus" id="shellSideRoofShellCombineTestingStatus" value="Conforming">Conforming 
				<input type="radio" name="shellSideRoofShellCombineTestingStatus" id="shellSideRoofShellCombineTestingStatus" value="Not Conforming">Not Conforming</td>
			</tr>
		</table>
		
		</form>
	</div>

 </body>
