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
    var axleNumber = $('#axleNumber').val();
    var url = "exist.jsp?axleNumber=" +axleNumber; 
    xmlhttp.onreadystatechange = function(){
        if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
          
         
  if(xmlhttp.responseText=="false"){
        		
                document.getElementById("isE").style.color = "red";
                document.getElementById("isE").innerHTML="Axle Number already exist";
                
                //$("#my-button-submit").attr("disabled", true);
               // $("#my-button-submit").addClass('disable');
        	}
            else
            	{
            document.getElementById("isE").style.color = "green";
            document.getElementById("isE").innerHTML = xmlhttp.responseText;
           // $("#my-button-submit").attr("disabled", false);
           // $("#my-button-submit").removeClass('disable');
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
<div id="WheelsetProductionTableContainer"></div>
    <div id="exitDialog" style="height:150%; width:200%; display:none;z-index: 9;" >
  <br>
  
<!-- 			  <br> -->
<!-- 			 Enter Completion Date: <br> -->
<!-- 		     <input type="Text" id="datepickerCompletion" class='validate[required]' onchange="setMinDate()"/> -->
<!-- 		     <br> -->
<!-- 		      <br> -->
		      Enter Dispatch Date: <br>
		     <input type="Text" id="datepickerExit" class='validate[required]' />
		     <br>
		      <br>
		   
<!-- 		      Axle Cast No.: <br> -->
<!-- 		       <input type="Text" id="axleNumber" name="axleNumber" class='validate[required]' onblur="checkExist()"/><span id="isE"></span> -->
<!-- 		  	 <br> -->
<!-- 		  	 Axle Make: <br> -->
<!-- 		       <input type="Text" id="axleMake" name="axleMake" /> -->
<!-- 		  	 <br> -->
		      Dispatch To:
		      <select name="dispatch" id="dispatch" class='validate[required]' onchange="myFunction()">
		     <option value="">Select</option>
		    <option value="bogie">Bogie Shop</option>
		    <option value="rsp">RSP</option>
		    </select>
		    <br> <br>
		    Customer/ Railways:
		     <select id="railway" disabled="disabled"></select>
		    <br> <br>
		      
		      Remarks: <br>
		     <textarea id="exitRemarks" placeholder="Enter Remark"></textarea>
		     <br>
<!-- 		    Delay, if any: <br> -->
<!-- 		     <textarea id="delayReason" > </textarea> -->
<!-- 		     <br> -->
		    
	
 </div>
 <div id="detailDialog" style="height:150%; width:200%; display:none;z-index: 9;" ></div>
</body>
<script type="text/javascript">
function myFunction() {
	
	if(document.getElementById("dispatch").value =="rsp")
		{
	
		  document.getElementById("railway").disabled = false;
		  $('#railway').addClass("validate[required]");
		}
	else
		{
		 document.getElementById("railway").disabled = true;	
	document.getElementById("railway").value="";
	 $('#railway').removeClass("validate[required]");
		}
}
</script>



<script type="text/javascript">
		$(document).ready(function() {

			

			 //retrieve railway 
		       $("#railway").append('<option value="">Select</option>');
					var railways=[], j=0;
					//railways[0]={ Value:null, DisplayText: "Select" };
					<c:forEach var="a" items="${railway}">
					
					var o = new Option("${a}", "${a}");
					/// jquerify the DOM object 'o' so we can use the html method
					//$(o).html("${a}");
					$("#railway").append(o);
					
					//railways[j]={ Value: "${a}", DisplayText: "${a}" };
				//j++;
			    </c:forEach>
			    
			    
			   // end of code for bogie type

			
			var prevStage='<%=previousStage%>';
		
			var srno,i=0;
			var wheeltypes=[];
			
			<c:forEach var="a" items="${wheelType}">
			wheeltypes[i]={ Value: "${a}", DisplayText: "${a}" };
		i++;
	    </c:forEach>

  
// for date picker in dialog box
			$('#datepickerExit').datepicker({
		        //inline: true,
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
			
			//Date picker code end here
		//start code
			/*
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

		    }).datepicker("setDate", new Date());  */
			//end code
	$('#WheelsetProductionTableContainer').jtable({
			
			title : '<%=substage_display%> Shop Production',
			
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
                        	
                        	 var $selectedRows = $('#WheelsetProductionTableContainer').jtable('selectedRows');
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
                			var wheelsetAssetId=record.wheelsetAssetId;
                			var shellNumber=record.<%=lowercase_Substages%>Number;
                			var shellType=record.shellType;
                			var substageId='<%=stageID%>';
                				
                					var URL="add_activity_for_shell_stage?assetId="+wheelsetAssetId+"&substageId="+substageId;
                					var diagtitle="Add Activity For Shell No ="+shellNumber+" and Substage= Wheel";
                					
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
                        	
                        	
                        	
                        	 var $selectedRows = $('#WheelsetProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you want to sent for Bogie Shop");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
								//setting min value
								
							//	$('#datepickerCompletion').datepicker('option', 'minDate', new Date(record.assemblyStartDate));
								
            					
                    	 	 	$("#exitDialog").dialog({
                    	 	 		title : 'Exit for  <%=substages%> No. '+record.wheelsetTransactionId + 'from Stage- <%=stageID%>',                     	 	 		
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
	                                    	if ($('#exitRemarks').validationEngine('validate')) {
	                                        	//alert(!$("#dialog").validationEngine('validate'));
	                                            return false;
	                                        }
	                                    		    	   
	                                    	$.ajax({
	                    						url : "exitWheel",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						data : {
	                    							wheelsetAssetId: record.wheelsetAssetId,
	                    							axleNumber: record.axleNumber,
	                    							stageId: '<%=stageID%>',
	                    						   // assemblyEndDate: $('#datepickerCompletion').val(),                   							
	                    							exitDate:$('#datepickerExit').val(),              							
	                    							// axleNumber:$('#axleNumber').val(),
	                    							exitRemarks:$('#exitRemarks').val(),
	                    							dispatchTo: $('#dispatch').val(),
	                    							railway:$('#railway').val()
	                    						//	lateReason:$('#delayReason').val(),
	                    						//	axleMake:$('#axleMake').val(),
	                    						
	                    						},
	                    						
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							
	                    						//	$('#datepickerCompletion').val(''),
	                    							$('#datepickerExit').val('');
	                    							$('#exitRemarks').val('');
	                    							$('#dispatch').val('');
	                    							$('#railway').val('');
	                    							
	                    						//	$('#axleNumber').val(''),
	                    						//	$('#delayReason').val(''),
	                    						//	$('#axleMake').val(''),
	                    							$('#exitDialog').dialog('close');
	                    							
	                    							$('#WheelsetProductionTableContainer').jtable('load');
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
				
 		    createAction : 'createWheelAction?stageID=<%=stageID%>',
 			listAction: 'listWheelAction?stageID=<%=stageID%>',
 			updateAction:'updateWheelAction?stageID=<%=stageID%>'
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
				
				wheelsetAssetId : {
					title : 'wheelsetAssetId',
					width: '8%',
					key: true,
					list : false,
					edit : false,
					create : false
									
					},
					wheelsetTransactionId : {
						title : 'Wheel RBL No.',
						width: '8%',
						
						list : true,
						edit : false,
						create : true,
						inputClass: 'validate[required]'				
						},

						assemblyStartDate: {
							title :'Mounting Date',
							width: '8%',
							inputClass: 'validate[required]',
// 							type: 'date',
// 							displayFormat: 'dd-mm-yy',
							display:function(data){
								//alert(data.record.id.hodyCode)	;				 
								return ((data.record.assemblyStartDate!=null) && (data.record.assemblyStartDate!="") ) ? moment(data.record.assemblyStartDate).format('DD-MM-YYYY') : "";
													}, 
												
											
							list: true,
							create: true,
							edit: false
											
							},
							axleMake:{
								title: 'Axle Make.',
								width: '8%',
								list : true,
								edit : true,
								create : true,
								options: {"":"select", "RWF":"RWF", "others":"others"},
								inputClass: 'validate[required]'				
								},
								axleNumber:{
									title: 'Axle No.',
									width: '8%',
									edit : true,	

								/*	input:function(data){
                             if(data.record!=null)
                                  {
                                	
                       return data.record.axleNumber;
                              }
                                   
                            else
                                    {
return '<input type="Text" id="axleNumber" name="axleNumber" value="ABC" placeholder="Enter Axle No." onblur="checkExist()"/><span id="isE">';
                                    }
										}, */
									inputClass: 'validate[required]'
													
									},		
									wheeldiscRightNo: {
										title :'Right Wheel Disc No.',
										width: '8%',
										
										list: true,
										create: true,
										edit: true
										
										},
										wheeldiscRightMake: {
											title :'Right Wheeldisc Make',
											width: '8%',
											
											list: true,
											create: true,
											edit: true,
											options: {"":"select", "ZB":"ZB", "TZ":"TZ", "VR":"VR", "SAIL":"SAIL","OTHER":"OTHER"}								
											},

											wheeldiscLeftNo: {
												title :'Left Wheel Disc No.',
												width: '8%',
												
												list: true,
												create: true,
												edit: true,
												
												},
												wheeldiscLeftMake: {
													title :'Left Wheeldisc Make',
													width: '8%',
													
													list: true,
													create: true,
													edit: true,
													options: {"":"select", "ZB":"ZB", "TZ":"TZ", "VR":"VR", "SAIL":"SAIL","OTHER":"OTHER"}					
													},
													rightBrakeDiscMake: {
														title :'Right Brake Disc Make',
														width: '8%',
														
														list: true,
														create: true,
														edit: true,
														options: {"":"select", "FV":"FV", "KBI":"KBI","KNORR":"KNORR","OTHER":"OTHER"}	
																		
														},

														leftBrakeDiscMake: {
															title :'Left Brake Disc Make',
															width: '8%',
															
															list: true,
															create: true,
															edit: true,
															options: {"":"select", "FV":"FV", "KBI":"KBI","KNORR":"KNORR","OTHER":"OTHER"}	
																			
															},

															ctrbRightMake:{
																title :'Right CTRB Make',
																width: '8%',
																options: {"":"select","Timken":"Timken", "SKF":"SKF", "NBC":"NBC","others":"others"},
																list: true,
																create: true,
																edit: true
																},	
															
																ctrbRightNo:{
																	title :'Right CTRB No.',
																	width: '8%',
																	
																	list: true,
																	create: true,
																	edit: true
																	},

																	ctrbLeftMake:{
																		title :'Left CTRB Make',
																		width: '8%',
																		options: {"":"select","Timken":"Timken", "SKF":"SKF", "NBC":"NBC", "others":"others"},
																		list: true,
																		create: true,
																		edit: true
																		},	
																	
																		ctrbLeftNo:{
																			title :'Left CTRB No.',
																			width: '8%',
																			
																			list: true,
																			create: true,
																			edit: true
																			},
														
							
						
						
					
							leftWheelDiscTon: {
								title :'Left Wheel Disc Ton',
								width: '8%',
// 								inputClass: 'validate[custom[number]]',
								list: false,
								create: false,
								edit: false
												
								},
						
							
							rightWheelDiscTon: {
								title :'Right Wheel Disc Ton',
								width: '8%',
							//inputClass: 'validate[custom[number]]',
								list: false,
								create: false,
								edit: false
												
								},
						
						
			},
			loadingRecords: function(event,data)
			{
				srno=0;
			},
			recordsLoaded: function(event, data) {
	
				  if (prevStage!='START'){
					 
				     $('#WheelsetProductionTableContainer').find('.jtable-toolbar-item.jtable-toolbar-item-add-record').remove();
				  }
				  
				},
				formCreated: function (event, data) {

					$('[name=axleNumber]').keyup(function(){
					    this.value = this.value.toUpperCase();
					});

					$('[name=wheeldiscRightNo]').keyup(function(){
					    this.value = this.value.toUpperCase();
					});
					$('[name=wheeldiscLeftNo]').keyup(function(){
					    this.value = this.value.toUpperCase();
					});
					$('[name=ctrbRightNo]').keyup(function(){
					    this.value = this.value.toUpperCase();
					});
					$('[name=ctrbLeftNo]').keyup(function(){
					    this.value = this.value.toUpperCase();
					});
					$('[name=wheelsetTransactionId]').keyup(function(){
					    this.value = this.value.toUpperCase();
					});
					data.form.find('input[name="wheelsetTransactionId"]').attr('placeholder','Enter Wheel RBL no.');
					data.form.find('input[name="assemblyStartDate"]').attr('placeholder','Enter Mounting Date');
					data.form.find('input[name="wheeldiscRightNo"]').attr('placeholder','Enter right Wheleeldisc');	
					data.form.find('input[name="axleMake"]').attr('placeholder','Enter Axle Make');
					data.form.find('input[name="axleNumber"]').attr('placeholder','Enter Axle No.');
					data.form.find('input[name="wheeldiscLeftNo"]').attr('placeholder','Enter right Wheeldisc');
					data.form.find('input[name="ctrbRightNo"]').attr('placeholder','Enter right CTRB No.');
					data.form.find('input[name="ctrbLeftNo"]').attr('placeholder','Enter left CTRB No.');
					data.form.find('input[name="leftBrakeDiscMake"]').attr('placeholder','Enter left Brake Disc make');
					data.form.find('input[name="rightBrakeDiscMake"]').attr('placeholder','Enter right Brake Disc make');
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
	    			$('#WheelsetProductionTableContainer').jtable('load');
	    		},
	    		recordUpdated:function(event,data)
				{
					srno=0;
					$('#WheelsetProductionTableContainer').jtable('load');
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
	$('#WheelsetProductionTableContainer').jtable('load');
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