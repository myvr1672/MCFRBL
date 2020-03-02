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
            max-height: 200px;assemblyStartDate DESC
             overflow-y: auto; 
            /* prevent horizontal scrollbar */
/*             overflow-x: hidden; */
            /* add padding to account for vertical scrollbar */
/*             padding-right: 20px; */
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


function checkExist(){
    var xmlhttp = new XMLHttpRequest();
    var bogieNumber = $('#bogieNumber').val();
   
    var url = "existBogie.jsp?bogieNumber=" +bogieNumber; 
    xmlhttp.onreadystatechange = function(){
        if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
          
         
  if(xmlhttp.responseText=="false"){
        		
                document.getElementById("isE").style.color = "red";
                document.getElementById("isE").innerHTML="Bogie Number already asigned";
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
<div id="BogiesetProductionTableContainer"></div>
    <div id="exitDialog" style="height:150%; width:200%; display:none;z-index: 9;" >
             Enter Completion Date: <br>
		     <input type="Text" id="datepickerCompletion" placeholder="Enter Completion Date" class='validate[required]' onchange="setMinDate()"/>
		     <br>
             <br>
		     Enter Dispatch Date: <br>
		     <input type="Text" id="datepickerExit" placeholder="Enter Dispatch Date" class='validate[required]' />
		     <br>
		      <br>
		      
		      Dispatch To:
		      <select name="dispatch" id="dispatch" onchange="myFunction()">
		    <option value="furnishing">Furnishing Shop</option>
		    <option value="rsp">RSP</option>
		    </select>
		    <br> <br>
		    Customer/ Railways:
		     <select id="railway" disabled></select>
		    <br> <br>
		     <!--  Manufactured By:
		      <select name="manufactured" id="manufactured">
		      <option value="Contract">Contract</option>
		      <option value="MCF">MCF</option>
		      </select>
		      <br>
		      <br> -->
		      Enter Frame No.: <br>
		     <input type="Text" id="frameNo" placeholder="Enter Frame No." class='validate[required]' style='text-transform:uppercase'/>
		     <br>
		      <br>
		   Frame Manufactured By: <br>
		     <select name="frameManufacturedBy" id="frameManufacturedBy" >
		    <option value="">Select</option> 
              <option value="Contract">Contract</option>
		      <option value="MCF">MCF</option>
		     </select>
		     <br>
		      <br>
		       Enter Bolster No.: <br>
		     <input type="Text" id="bolsNo" placeholder="Enter Bolster No." class='validate[required]' style='text-transform:uppercase'/>
		     <br>
		      <br>
		    Bolster Manufactured By: <br>
		     <select name="bolsterManufacturedBy" id="bolsterManufacturedBy" >
        <option value="">Select</option>		     
            <option value="Contract">Contract</option>
		      <option value="MCF">MCF</option>
		     </select>
		     <br>
		      <br>
		     Remarks: <br>
		     <textarea id="exitRemarks" placeholder="Enter Remark"></textarea>
		     <br>
		    Delay, if any: <br>
		     <textarea id="delayReason" > </textarea>
		     <br>
		     Bogie No.: <br>
		     <input type="Text" id="bogieNumber" placeholder="Enter Bogie No." class='validate[required]'  onblur="checkExist()" style='text-transform:uppercase'/><span id="isE"></span>
		  <br><br>  Bogie Type. :<br>
		    <select name="bogie" id="bogie">
		    <option value="air_spring">Air Spring</option>
		    <option value="coil_spring">Coil Spring</option>
		    </select>
<!-- 		    <br><br>  Coach Type. :<br> -->
<!-- 		    <select id="bogieType" ></select> -->
		    
 </div>
 <div id="detailDialog" style="height:150%; width:200%; display:none;z-index: 9;" ></div>
</body>
<script type="text/javascript">
		$(document).ready(function() {
			//retrieve railway 
		        $("#railway").append('<option value="">Select</option>');
					var railways=[];
					
					<c:forEach var="a" items="${railway}">
					
					var o = new Option("${a}", "${a}");
					
					$("#railway").append(o);
					
				
			    </c:forEach>
// end of code
			
			var prevStage='<%=previousStage%>';
			var srno,i=1;


		       //retrieve bogie type
       $("#bogieType").append('<option value="">Select</option>');
			var bogietypes=[];
			bogietypes[0]={ Value:null, DisplayText: "Select" };
			<c:forEach var="a" items="${bogieType}">
			
			var o = new Option("${a}", "${a}");
			/// jquerify the DOM object 'o' so we can use the html method
			//$(o).html("${a}");
			$("#bogieType").append(o);
			
			bogietypes[i]={ Value: "${a}", DisplayText: "${a}" };
		i++;
	    </c:forEach>
	    
	    
	   // end of code for bogie type
			//start: retrieving axle number in dropdown option
		    var axleNumbers=[]; 

			var j=1;
			axleNumbers[0]={ Value:null, DisplayText: "Select" };
			<c:forEach var="b" items="${axleNumberList}">
			axleNumbers[j]={ Value: "${b.key}", DisplayText: "${b.value}" };
				j++;
			    </c:forEach>
			  //end: retrieving axle number in dropdown option
			


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

			$('#frameReceiptDate').datepicker({
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

			$('#bolsReceiptDate').datepicker({
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
			    
	$('#BogiesetProductionTableContainer').jtable({
			
			title : 'Bogie Shop Production',
			
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
                            text: 'Add Activity For Bogie Production',
                            click: function () {
                            	
                            	 var $selectedRows = $('#BogiesetProductionTableContainer').jtable('selectedRows');
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
                    			var bogieAssetId=record.bogieAssetId;
                    			var bogiesetTrxId=record.bogiesetTrxId;
                    			var substageId='<%=stageID%>';
                    				
                    					var URL="add_activity_for_shell_stage?assetId="+bogieAssetId+"&substageId="+substageId;
                    					var diagtitle="Add Activity For Bogie Production No. ="+bogiesetTrxId+" and Substage= Bogie";
                    					
                    					$( "#detailDialog" ).load( URL ).dialog({
                    															title: diagtitle,
                    															modal:true,
                    															height: dheight, 
                    															width: dWidth, 
                    															close: function () {
                 										                        	
                 							                                        $(this).dialog('close');
                 							                                    }
                 			 		 								                  				                                    	
                    															}).prev(".ui-dialog-titlebar").css("background","blue");
                    			
                            	
                            	
                            	
                            	
                            	
                        	 	 }
        						 
                            }
                        },
                    //End of first toolbar item
                	
                	 {
                		
                	//Second toolbar entry
                    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'Add Component for Bogie',
                        click: function () {
                        	
                        	 var $selectedRows = $('#BogiesetProductionTableContainer').jtable('selectedRows');
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
                			var bogieAssetId=record.bogieAssetId;
                			var bogiesetTrxId=record.bogiesetTrxId;
                				
                					var URL="add_component_for_bogie_shop?assetId="+bogieAssetId;
                					var diagtitle="Add Component for Bogie Production No ="+bogiesetTrxId+" ";
                					
                					$( "#detailDialog" ).load( URL ).dialog({
                															title: diagtitle,
                															modal:true,
                															height: dheight, 
                															width: dWidth,
                															closeOnEscape:true,
                															close: function () {
                										                        	
                							                                        $(this).dialog('close');
                							                                        //$('#BogiesetProductionTableContainer').jtable('reload');
                							                                    }
                			 		 								  
                				                                    
                															}).prev(".ui-dialog-titlebar").css("background","blue");
                		                    	 	 }
    						 
                        }
                    }, 
                	
                	//Third Toolbar item for Exit/ Turnout
                    {
                    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'Exit/ Turnout',
                        click: function () {
                        	
                        	 var $selectedRows = $('#BogiesetProductionTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a row for which you want to sent for Shell Shop");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
                                  //alert(moment(record.assemblyStartDate).format('DD-MM-YYYY'));
                                  var startDate=(record.assemblyStartDate).substring(0,10);
                                  
                                  
                                  var num = startDate.match(/\d+/g); 
                          		
                          		var date = new Date(num[0], num[1]-1, num[2]);
                             
                                  $('#datepickerCompletion').datepicker('option', 'minDate', date);
                    	 		
                    	 	 	$("#exitDialog").dialog({
                    	 	 		title : 'Exit for  '+record.bogiesetTrxId + 'from Stage- <%=stageID%>',                     	 	 		
                    	 	 		close: function (e, u) {
              	 		              //$(".formError").remove();
              	 		          	$("#exitDialog").validationEngine('hideAll');
                    	 	 		    },
                	 		 	
 		 							buttons: {
 		 								Submit: {
 	                                        text: "Submit",
 	                                        id: "my-button-submit",
 	                                        click:function () {
	                                  
	                                    	if ($('#datepickerExit').validationEngine('validate')) {
				                                        	
				                                            return false;
				                                        }
	                                    	if ($('#datepickerCompletion').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                         if ($('#frameNo').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
                                         if ($('#bolsNo').validationEngine('validate')) {
	                                        	
	                                            return false;
	                                        }
	                                    	if ($('#bogieNumber').validationEngine('validate')) {
	                                        
	                                            return false;
	                                        }
	                                    		    	   
	                                    	$.ajax({
	                    						url : "exitBogie",  //action-name as defined in struts.xml
	                    						dataType: 'json', 
	                    						data : {
	                    							bogieAssetId: record.bogieAssetId,
	                    							stageId: '<%=stageID%>',
	                    						    dispatchDate: $('#datepickerExit').val(),
	                    						    assemblyEndDate: $('#datepickerCompletion').val(),
	                    							frameNumber:$('#frameNo').val(),              							
	                    							//frameReceiptDate:$('#frameReceiptDate').val(),
	                    							bolsterNumber:$('#bolsNo').val(),
	                    							//bolsterReceiptDate:$('#bolsReceiptDate').val(),
	                    							exitRemark:$('#exitRemarks').val(),
	                    							lateReason:$('#delayReason').val(),
	                    							bogieNumber:$('#bogieNumber').val(),
	                    							//coachType:$('#bogieType').val(),
	                    							bogieType:$('#bogie').val(),
	                    							dispatchTo: $('#dispatch').val(),
	                    							railway:$('#railway').val(),
	                    							frameManufacturedBy:$('#frameManufacturedBy').val(),
	                    							bolsterManufacturedBy:$('#bolsterManufacturedBy').val(),
	                    						
	                    						},
	                    						
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							
	                    							$('#datepickerExit').val(''),
	                    							$('#datepickerCompletion').val(''),
	                    							$('#frameNo').val(''),
	                    							//$('#frameReceiptDate').val(''),
	                    							$('#bolsNo').val(''),
	                    							//$('#bolsReceiptDate').val(''),
	                    							$('#exitRemarks').val(''),
	                    							$('#delayReason').val(''),
	                    							$('#bogieNumber').val(''),
	                    							//$('#bogieType').val(''),
	                    							$('#bogie').val(''),
	                    							$('#dispatch').val(''),
	                    							$('#railway').val(''),
	                    							$('#frameManufacturedBy').val(''),
	                    							$('#bolsterManufacturedBy').val(''),
	                    							//$('#manufactured').val(''),
	                    							$('#exitDialog').dialog('close'),
	                    							
	                    							$('#BogiesetProductionTableContainer').jtable('load');
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
 		 				                    	 		    
 		 				                    	 			  
 		 				                    	 		  }//ending else               	  
 		 				                    	  // ajax call ends here				
 		 				    						 
 		 				                        
                        }      } 
 		 				            ]
 		 				            },
            
			actions : {
				
 		   createAction : 'createBogieAction?stageID=<%=stageID%>',
 			listAction: 'listBogieAction?stageID=<%=stageID%>',
 			updateAction:'updateBogieAction?stageID=<%=stageID%>'
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
				
				bogieAssetId : {
					title : 'bogieAssetId',
					width: '8%',
					key: true,
					list : false,
					edit : false,
					create : false
									
					},
					bogiesetTrxId : {
						title : 'Bogie Production Id',
						width: '8%',
						
						list : true,
						edit : false,
						create : true
										
						},
						
						assemblyStartDate: {
							title :'Assembly StartDate',
							width: '12%',
							inputClass: 'validate[required]',

							display:function(data){
												 
								return ((data.record.assemblyStartDate!=null) && (data.record.assemblyStartDate!="") ) ? moment(data.record.assemblyStartDate).format('DD-MM-YYYY') : "";
													}, 
							list: true,
							create: true,
							edit: false
											
							},
					//left wheel display purpose	
							leftWheelAssetId: {
							title :'First Wheelset Axle No.',
 					display:function(data){
	 						var axleNo;
	 						if(data.record.leftWheelAssetId!=null)
							{
	 						$.ajax({                    
	 							  url: 'descByWheelAxleId',     
	 							  type: 'post', // performing a POST request
	 							  async: false,
								  
	 							  dataType: 'json',
	 								  data : {
										
										  wheelAxleId: data.record.leftWheelAssetId
	 								  	  }									                    
	 						})
	 								.done(function( msg ) {
	 									axleNo=msg.axleNo;
										
	 									//return msg.stageName;																			    											
	 								  })
	 								.error(function (msg){
	 									alert("Error Saving Data");
	 								})
	 								  ;
							
							}
	 						return axleNo;
	 						},
							
							
							list:true,
							create: false,
							edit: false
							},
							//left wheel update and create purpose		
					  leftWheelAssetId1: {
						title :'First Wheelset Axle No.',
						width: '8%',
						options: axleNumbers,
						list: false,
						create: true,
						edit: true		
						}, 
					//right wheel display	
						rightWheelAssetId: {
							title :'Second Wheelset Axle No.',
							list:true,
							display:function(data){
		 						var axleNo;
		 						if(data.record.rightWheelAssetId!=null)
								{
		 						$.ajax({                    
		 							  url: 'descByWheelAxleId',     
		 							  type: 'post', // performing a POST request
		 							  async: false,
									  
		 							  dataType: 'json',
		 								  data : {
											
											  wheelAxleId: data.record.rightWheelAssetId
		 								  	  }									                    
		 						})
		 								.done(function( msg ) {
		 									axleNo=msg.axleNo;
											
		 									//return msg.stageName;																			    											
		 								  })
		 								.error(function (msg){
		 									alert("Error Saving Data");
		 								})
		 								  ;
								}
								
		 						return axleNo;
		 						},
							create: false,
							edit: false
							},
					//right wheel update and create purpose
 					rightWheelAssetId1: {
 					title :'Second Wheelset Axle No.',
						width: '8%',
 			          options: axleNumbers,
 						list: false,
						create: true,
 						edit: true		
							},
						
							assemblyExpectedExtDate: {
								title :'Expected Assembly End Date',
								width: '8%',
								display:function(data){
													 
									return ((data.record.assemblyExpectedExtDate!=null) && (data.record.assemblyExpectedExtDate!="") ) ? moment(data.record.assemblyExpectedExtDate).format('DD-MM-YYYY') : "";
														}, 
		 											
								inputClass: 'validate[required]',
								list: true,
								create: true,
								edit: false
												
								},
								productionBy: {
									   title: 'Production By',
									   width : '10%',
										options : { 'InHouse': 'In House', 'FromTrade': 'From Trade' },
										edit : true,
										create: true 
									},			
													
							
				
				
				remarks: {
				   title: 'Remarks',
				   width : '10%',
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
	
				 /*  if (prevStage!='START'){
					 
				     $('#BogiesetProductionTableContainer').find('.jtable-toolbar-item.jtable-toolbar-item-add-record').remove();
				  } */
				  
				},
				formCreated: function (event, data) {

					data.form.find('textarea[name="remarks"]').attr('placeholder','Enter Remarks');
					data.form.find('input[name="assemblyExpectedExtDate"]').attr('placeholder','Enter expected Completion date');
					data.form.find('input[name="assemblyStartDate"]').attr('placeholder','Enter Assembly start Date');

// 					const peopleArray = Object.values(axleNumbers)
// alert(JSON.stringify(axleNumbers));

// 					data.form.find('[name=leftWheelAssetId1]').autocomplete({
			        	
// 			        	source: JSON.stringify(axleNumbers),
// 			        	minLength: 0,
// 			        	open: function() {
// 			        		  $(".ui-autocomplete").width( $(this).innerWidth() );
			               
// 			            },
// 			          //  change: function (event, ui) { alert("change event called"); },
// 		                select: function (event, ui) {
// 		                    $('[name=leftWheelAssetId1]').val(ui.item.leftWheelAssetId1);
		                   
// 		                    return false;
// 		                }
			        	
			        	  
// 				  });




	                   
            $('[name=assemblyStartDate]').datepicker({
						
						dateFormat: 'dd-mm-yy',
					    onSelect: function(selected) {
					      $('[name=assemblyExpectedExtDate]').datepicker("option","minDate", selected)
    
					    }
					}).datepicker("option", "maxDate", new Date);;

					$('[name=assemblyExpectedExtDate]').datepicker({ 
						
						dateFormat: 'dd-mm-yy',
					    onSelect: function(selected) {
					        $('[name=assemblyStartDate]').datepicker("option","maxDate", selected)

 					    }
 					}); 
			
				
					  $("[name=leftWheelAssetId1]").on('change', 
								function() {
						  
						  var leftaxle=$("[name=leftWheelAssetId1]").val();
						  
						  $("[name=rightWheelAssetId1]").find('[value='+leftaxle+']').remove();
						  
					  });
					  
					  data.form.validationEngine();
					  
					  
					  $("[name=rightWheelAssetId1]").on('change', 
								function() {
						  
						  var rightaxle=$("[name=rightWheelAssetId1]").val();
						  
						  $("[name=leftWheelAssetId1]").find('[value='+rightaxle+']').remove();
						  
					  });
					
				
					if(data.formType=='edit')
						{
						
						var leftaxleNo,rightaxleNo;
						
						if(data.record.leftWheelAssetId!=null)
						{
 						$.ajax({                    
 							  url: 'descByWheelAxleId',     
 							  type: 'post', // performing a POST request
 							  async: false,
							  
 							  dataType: 'json',
 								  data : {
									
									  wheelAxleId: data.record.leftWheelAssetId
 								  	  }									                    
 						})
 								.done(function( msg ) {
 									leftaxleNo=msg.axleNo;
									
 									//return msg.stageName;																			    											
 								  })
 								.error(function (msg){
 									alert("Error Saving Data");
 								})
 								  ;
 						$('#Edit-leftWheelAssetId1')
 				         .append($("<option selected></option>")
 				                    .attr("value",data.record.leftWheelAssetId)
 				                    .text(leftaxleNo));
 						
						}
						
					
					
					//right wheel dropdown
					
					if(data.record.rightWheelAssetId!=null)
						{
					
					$.ajax({                    
						  url: 'descByWheelAxleId',     
						  type: 'post', // performing a POST request
						  async: false,
						  
						  dataType: 'json',
							  data : {
								
								  wheelAxleId: data.record.rightWheelAssetId
							  	  }									                    
					})
							.done(function( msg ) {
								rightaxleNo=msg.axleNo;
								
								//return msg.stageName;																			    											
							  })
							.error(function (msg){
								alert("Error Saving Data");
							})
							  ;
					
					$('#Edit-rightWheelAssetId1')
			         .append($("<option selected></option>")
			                    .attr("value",data.record.rightWheelAssetId)
			                    .text(rightaxleNo));
					
						}
					
				
					
						}
	               	            },
	            recordDeleted: function(event,data)
	    		{
	    			srno=0;
	    			$('#BogiesetProductionTableContainer').jtable('load');
	    		},
	    		
 
					//Validate form when it is being submitted
				formSubmitting: function (event, data) {
			   return data.form.validationEngine('validate');
			   $('#BogiesetProductionTableContainer').jtable('load'); 
			            },
			    
				//Dispose validation logic when form is closed
				formClosed: function (event, data) {
			               data.form.validationEngine('hide');
			                data.form.validationEngine('detach');
			                $('#BogiesetProductionTableContainer').jtable('load');
				},
				recordUpdated:function(event,data)
				{
					srno=0;
					$('#BogiesetProductionTableContainer').jtable('load');
				},
	              
			});
	$('#BogiesetProductionTableContainer').jtable('load');
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
	<script>
// 	function findObjectByKey(array, key, value) {
// 	    for (var i = 0; i < array.length; i++) {
// 	        if (array[i][key] == value) {
// 	            return array[i];
// 	        }
// 	    }
// 	    return null;
// 	}
	
	</script>