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
	#intrPaintSIP{
		border:1px solid black;
		padding: 20px;
	}
	th{
		font-size:20px;
		padding:10px;
	}
	.t1{
		width:100%;
	}
	table.t1 td{
		padding:10px;
	}
	.t2{
		width:100%;
	}
	.t2 td{
		padding:10px;
	}
	.t3{
		width:70%;
	}
	#intrPaintFinal{
		border:1px solid black;
		padding: 20px;
	}
	td{
		padding:10px;
	}
	th{
		font-size:20px;
		padding:10px;
	}
	table{
		width:100%;
	}
	.t4{
		width:100%;
	}
	.t5{
		width:70%;
	}
	#extrPaintSip{
		border:1px solid black;
		padding: 30px;
	}
	table.t6 td{
		padding:10px;
	}
	th{
		font-size:20px;
		padding:10px;
	}
	.t7{
		width:100%;
	}
	.t7 td{
		padding:10px;
	}
	.t8{
		width:70%;
	}
	
	.center{
		width:25px;
		height:25px;
		display:block;
		margin-left: auto;
		margin-right:auto;
		width:50%;
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
                document.getElementById("isE").innerHTML="Paint Asset ID Number already asigned";
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
</head>
<body>
<div id="PaintProductionTableContainer"></div>
<div id="detailDialog" style="height:150%; width:200%; display:none;z-index: 9;" ></div>
 <div id="paintclearanceMemo" style="height:150%; width:200%; display:none;z-index: 9;" >
            <h3 style="text-align: center;">Quality Control Clearance Memo for Paint</h3>
            <br>
         <table>
          <tr>
          <th>DOC No.</th><td colspan="2"><input type="text"  style="width: 200px;" name="docNoQualityClearance" id="docNoQualityClearance" value="MCF/RBL/QMF 1006 Ver 11/2018" class='validate[required]'></td>
          <th>Date of Clearance</th><td><input type="text" name="testingClearanceMemoDate"   id="testingClearanceMemoDate" class='validate[required]'></td><td></td>
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
			//retrieve coach type 
		       $("#coachType").append('<option value="">Select</option>');
					
					
					<c:forEach var="a" items="${coachType}">
					
					var o = new Option("${a}", "${a}");
					
					$("#coachType").append(o);
				
			    </c:forEach>
//end of code

			
// for date picker in dialog box

	//Date picker code end here
		//start code
			
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
      //Create toolbar
            toolbar: {
                items: [

                  	 {
                         icon: '<%=contextpath%>/images/rs_out.png',
                             text: 'Qauality Control Clearance Memo',
                             click: function () {
                            
                             var $selectedRows = $('#PaintProductionTableContainer').jtable('selectedRows');
                         if ($selectedRows.length<1)
                         alert("Please select a Shell of paint for which you give clearance");
                         else{
                         var record;
                         $selectedRows.each(function () {
                                         record = $(this).data('record');
                                         });
                       }
                      
                       $("#paintclearanceMemo").dialog({
                       width: '50%',
                      
                       title : 'Testing clearance for Paint Asset ID No.: ' +record.paintAssetID  ,                    
                       close: function (e, u) {
                             
                           $("#paintclearanceMemo").validationEngine('hideAll');
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
                             url : "clearanceMemoPaint",  //action-name as defined in struts.xml
                             dataType: 'json',
                             data : {                      
                             paintAssetId: record.paintAssetId,
                            
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
                            
                            
                             $('#paintclearanceMemo').dialog('close'),
                             alert("saving Data");
                             $('#paintProductionTableContainer').jtable('load');
                  },
                 error:function (msg){
                 $('#paintclearanceMemo').dialog('close');
                 //alert("Error saving Data");
                 }
                                             }) ;
                            return true;
                                                }    
                          },
                                Close: function () {
                                
                                                $(this).dialog('close');
                                                $('#paintProductionTableContainer').jtable('load');
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
				
 		
 			listAction: 'qualityClearancePaintAction?stageID=<%=stageID%>',
 			
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
				intrSipFlag:
				{
				title: 'Intr SIP Report',
				            width: '3%',
				            edit: false,
				            create: false,
				            display: function (data) {
				           var $img = $('<img class="center" src="<%=contextpath%>/images/paint_sip_rep.png" title="Intr SIP Report" />');
				           $img.click(function () {
				       
				        var wWidth = $(window).width();
				var dWidth = wWidth * 0.9;
				var wheight = $(window).height();
				var dheight = wheight * 0.9;
				var paintAssetId=data.record.paintAssetId;

				    //var URL="open-final-bogie-SIP-report?bogieAssetId="+bogieAssetId;
				    var URL="intr-paint-sip-report?paint_asset_id="+paintAssetId;
				var diagtitle="Intr SIP Report";
				$( "#detailDialog" ).load( URL ).dialog({
				title: diagtitle,
				modal:true,
				height:dheight,
				width: '70%',
				}).prev(".ui-dialog-titlebar").css("background","blue");

				       
				         });
				           
				            return $img;
				            }
				},
				
				intrFinalFlag:
				{
				title: 'Intr Final Report',
				            width: '3%',
				            edit: false,
				            create: false,
				            display: function (data) {
				           var $img = $('<img class="center" src="<%=contextpath%>/images/paint_sip_rep.png" title="Intr Final Report" />');
				           $img.click(function () {
				       
				        var wWidth = $(window).width();
				var dWidth = wWidth * 0.9;
				var wheight = $(window).height();
				var dheight = wheight * 0.9;
				var paintAssetId=data.record.paintAssetId;

				    //var URL="open-final-bogie-SIP-report?bogieAssetId="+bogieAssetId;
				    var URL="intr-paint-final-report?paint_asset_id="+paintAssetId;
				var diagtitle="Intr Final Report";
				$( "#detailDialog" ).load( URL ).dialog({
				title: diagtitle,
				modal:true,
				height:dheight,
				width: '70%',
				}).prev(".ui-dialog-titlebar").css("background","blue");

				       
				         });
				           
				            return $img;
				            }
				},
				
				
				extrSipFlag:
				{
				title: 'Extr SIP Report',
				            width: '3%',
				            edit: false,
				            create: false,
				            display: function (data) {
				           var $img = $('<img class="center" src="<%=contextpath%>/images/paint_sip_rep.png" title="Extr SIP Report" />');
				           $img.click(function () {
				       
				        var wWidth = $(window).width();
				var dWidth = wWidth * 0.9;
				var wheight = $(window).height();
				var dheight = wheight * 0.9;
				var paintAssetId=data.record.paintAssetId;

				    //var URL="open-final-bogie-SIP-report?bogieAssetId="+bogieAssetId;
				    var URL="extr-paint-sip-report?paint_asset_id="+paintAssetId;
				var diagtitle="Extr SIP Report";
				$( "#detailDialog" ).load( URL ).dialog({
				title: diagtitle,
				modal:true,
				height:dheight,
				width: '70%',
				}).prev(".ui-dialog-titlebar").css("background","blue");

				       
				         });
				           
				            return $img;
				            }
				},
				
				
				extrFinalFlag:
				{
				title: 'Extr Final Report',
				            width: '3%',
				            edit: false,
				            create: false,
				            display: function (data) {
				           var $img = $('<img class="center" src="<%=contextpath%>/images/paint_sip_rep.png" title="Extr Final Report" />');
				           $img.click(function () {
				       
				        var wWidth = $(window).width();
				var dWidth = wWidth * 0.9;
				var wheight = $(window).height();
				var dheight = wheight * 0.9;
				var paintAssetId=data.record.paintAssetId;

				    //var URL="open-final-bogie-SIP-report?bogieAssetId="+bogieAssetId;
				    var URL="extr-paint-final-report?paint_asset_id="+paintAssetId;
				var diagtitle="Extr Final Report";
				$( "#detailDialog" ).load( URL ).dialog({
				title: diagtitle,
				modal:true,
				height:dheight,
				width: '70%',
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