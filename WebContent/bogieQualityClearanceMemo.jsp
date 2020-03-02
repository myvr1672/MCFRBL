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
<div id="filter">
<form>
<b>Set Bogie Assemble Date</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<i>From Date :</i><input type="text" id="datepickerfrom"/>&nbsp;&nbsp;&nbsp;
<i>To Date   :</i><input type="text" id="datepickerto"/>&nbsp;&nbsp;&nbsp;
<button type="submit" id="LoadRecordsButton">Load records</button>
</form>
</div>
<div id="BogiesetProductionTableContainer"></div>
   <div id="detailDialog" style="height: 200%; width:50%; display:none;z-index: 9;" ></div>
    <div id="bogieclearanceMemo" style="height:150%; width:200%; display:none;z-index: 9;" >
            <h3 style="text-align: center;">Quality Control Clearance Memo for BogieSet</h3>
            <br>
         <table>
          <tr>
          <th>DOC No.</th><td colspan="2"><input type="text"  style="width: 200px;" name="docNoQualityClearance" id="docNoQualityClearance" value="MCF/RBL/QMF 1006 Ver 03/2016" class='validate[required]'></td>
          <th>Date of Clearance</th><td><input type="text" name="testingClearanceMemoDate"    id="testingClearanceMemoDate" class='validate[required]'></td><td></td>
          </tr>
          
          <tr>
          <th>Status:</th><td><select name="testingClearanceMemoStatus" id="testingClearanceMemoStatus" class='validate[required]'>
          <option value="">Select</option>
          <option value="Cleared">Cleared</option>
          <option value="Not Cleared">Not Cleared</option>
          </select></td><td></td>
          <th>Observation (Remarks):</th><td><textarea name="testingClearanceMemoRemark" id="testingClearanceMemoRemark"></textarea></td><td></td>
          
          </tr>
         
          </table>
 </div>
</body>
<script type="text/javascript">
		$(document).ready(function() {
			
// end of code
			
			var prevStage='<%=previousStage%>';
			var srno,i=1;


		       //retrieve bogie type
      /*  $("#bogieType").append('<option value="">Select</option>');
			var bogietypes=[];
			bogietypes[0]={ Value:null, DisplayText: "Select" };
			<c:forEach var="a" items="${bogieType}">
			
			var o = new Option("${a}", "${a}");
			/// jquerify the DOM object 'o' so we can use the html method
			//$(o).html("${a}");
			$("#bogieType").append(o);
			
			bogietypes[i]={ Value: "${a}", DisplayText: "${a}" };
		i++;
	    </c:forEach> */
	    
	    
	   // end of code for bogie type
			//start: retrieving axle number in dropdown option
		 /*    var axleNumbers=[]; 

			var j=1;
			axleNumbers[0]={ Value:null, DisplayText: "Select" };
			<c:forEach var="b" items="${axleNumberList}">
			axleNumbers[j]={ Value: "${b.key}", DisplayText: "${b.value}"};
				j++;
			    </c:forEach>
			  //end: retrieving axle number in dropdown option
			
//start: retrieving axle number for auto complete
		    var axleNumbers1=[]; 

			var j=1;
			axleNumbers1[0]={ value:null, label: "Select" };
			<c:forEach var="b" items="${axleNumberList}">
			axleNumbers1[j]={ value: "${b.key}", label: "${b.value}"};
				j++;
			    </c:forEach> */
			  //end: retrieving axle number for autocomplete


$('#testingClearanceMemoDate').datepicker({
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

});
			    $('#datepickerto').datepicker({
				       
			        dateFormat: 'dd-mm-yy',
			        changeMonth: true,
			        changeYear: true,
			        yearRange: '-2:+2',
			        maxDate: new Date(),
			        constrainInput: false,
			        duration: '',
			        gotoCurrent: true,
			        beforeShow: function() {
			            setTimeout(function(){
			                $('.ui-datepicker').css('z-index', 99999999999999);
			            }, 0);
			        }
			    }).datepicker("setDate", new Date());


				$('#datepickerfrom').datepicker({
				       
			        dateFormat: 'dd-mm-yy',
			        changeMonth: true,
			        changeYear: true,
			        yearRange: '-2:+2',
			        constrainInput: false,
			        duration: '',
			        gotoCurrent: true,
			        beforeShow: function() {
			            setTimeout(function(){
			                $('.ui-datepicker').css('z-index', 99999999999999);
			            }, 0);
			        }
			    }).datepicker("setDate", "-30");			    
	$('#BogiesetProductionTableContainer').jtable({
			
			title : 'Bogie Shop Production',
			
			paging:true,
            sorting: true,
            defaultSorting: 'bogieAssetId ASC',
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
      //Create toolbat
            toolbar: {
                items: [
                	  {
                      	icon: '<%=contextpath%>/images/rs_out.png',
                          text: 'Qauality Control Clearance Memo for Bogie Set',
                          click: function () {
                          	
                          	 var $selectedRows = $('#BogiesetProductionTableContainer').jtable('selectedRows');
                      	 	 if ($selectedRows.length<1)
                      		 alert("Please select a Bogie Set for which you give clearance");
                      	 	 else{
                      	 		var record;
                      	 		$selectedRows.each(function () {
                                      record = $(this).data('record');
                                      });
                      	 	
                            
                    	 			}
                    	 		
                    	 	 	$("#bogieclearanceMemo").dialog({
                    	 	 		width: '50%',
                    	 	 
                    	 	 		title : 'Testing clearance for Bogie No.: ' +record.bogieNumber  ,                     	 	 		
                    	 	 		close: function (e, u) {
              	 		              //$(".formError").remove();
              	 		          	$("#bogieclearanceMemo").validationEngine('hideAll');
                    	 	 		    },
                	 		 	
      	 							buttons: {
      	 								Submit: {
                                             text: "Submit",
                                            
                                             click:function () {
                                          	   if ($('#docNoQualityClearance').validationEngine('validate')) {
  		                                            return false;
  		                                        }
                                          	   if ($('#testingClearanceMemoDate').validationEngine('validate')) {
  		                                            return false;
  		                                        }
                                          	   if ($('#testingClearanceMemoStatus').validationEngine('validate')) {
  		                                            return false;
  		                                        }
                                     
                                            var c=confirm("Verify data before submit, Are you sure to save data");
                                         	if(c==false){return false;}	    	   
                                         	$.ajax({
                         						url : "clearanceBogieMemoEntry",  //action-name as defined in struts.xml
                         						dataType: 'json', 
                         						data : {                       							
                         							bogieAssetId: record.bogieAssetId,
                         							docNoQualityClearance:$('#docNoQualityClearance').val(),
                         							testingClearanceMemoDate:$('#testingClearanceMemoDate').val(),
                         							testingClearanceMemoStatus:$('#testingClearanceMemoStatus').val(),
                         							testingClearanceMemoRemark:$('#testingClearanceMemoRemark').val(),
                         						},
                         						
                         						type : 'POST',
                         						async : false,
                                 	 		
                         						success : function( msg ) {
                         							
                         							$('#docNoQualityClearance').val(''),
                         							$('#testingClearanceMemoDate').val(''),
                         							$('#testingClearanceMemoStatus').val(''),
                         							$('#testingClearanceMemoRemark').val(''),
                         							
                         							
                         							$('#bogieclearanceMemo').dialog('close'),
                         							alert("saving Data");
                         							$('#BogiesetProductionTableContainer').jtable('load');
              								  },
              								error:function (msg){
              									$('#bogieclearanceMemo').dialog('close');
              									//alert("Error saving Data");
              								}
                                         	}) ;
      				                 			    return true;
                                             }    
                    	 	 		    },
      			                        Close: function () {
      			                        	
      			                                        $(this).dialog('close');
      			                                        $('#BogiesetProductionTableContainer').jtable('load');
      			                                    }
      	 								  },
                                         modal: true
      	 				    	    });
      	 				                    	 		
      	 			
      	 				            			    	   return true;
      	 				                    	 		    
      	 				                    	 			  
      	 				                    	 		  }//ending else               	  
      	 				                    	  // ajax call ends here				
                    		 } 
                    
                	 
 		 				            ]
 		 				            },
            
			actions : {
				
 		 
 			listAction: 'listQualityClearanceBogieAction?stageID=<%=stageID%>'
 			
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
				sipStaticBogie:
				{
			title: 'Static SIP Report',
            width: '3%',
            edit: false,
            create: false,	
            display: function (data) {
         var $img = $('<img src="<%=contextpath%>/images/schedule_form.png" title="Static Report" />');	
         $img.click(function () {
        
        	var wWidth = $(window).width();
			var dWidth = wWidth * 0.9;
			var wheight = $(window).height();
			var dheight = wheight * 0.9;
			var bogieAssetId=data.record.bogieAssetId;
			
var URL="open-bogieStaticSIP-report?bogieAssetId="+bogieAssetId;
				
var diagtitle="Wheel & Axle SIP Report";
					$( "#detailDialog" ).load( URL ).dialog({
															title: diagtitle,
															modal:true,
															height: dheight, 
															width: '40%',
															}).prev(".ui-dialog-titlebar").css("background","blue");
		
        	
         });
            	
            	return $img;	
            }
				},
				
				sipFinalBogie:
				{
			title: 'Final SIP Report',
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
			var bogieAssetId=data.record.bogieAssetId;
			
var URL="open-final-bogie-SIP-report?bogieAssetId="+bogieAssetId;
				
var diagtitle="Final SIP Report";
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
			
 
					//Validate form when it is being submitted
				formSubmitting: function (event, data) {
			   return data.form.validationEngine('validate');
			             
			            },
			    
				//Dispose validation logic when form is closed
				formClosed: function (event, data) {
			               data.form.validationEngine('hide');
			                data.form.validationEngine('detach');
				},
				recordUpdated:function(event,data)
				{
					srno=0;
					$('#BogiesetProductionTableContainer').jtable('load');
				},
	              
			});
	 $('#LoadRecordsButton').click(function (e) {
         e.preventDefault();
		
$('#BogiesetProductionTableContainer').jtable('load', {datefrom: $('#datepickerfrom').val(),dateto: $('#datepickerto').val()});

	    });
	       $('#LoadRecordsButton').click();
	});
		
		
	</script>
	
