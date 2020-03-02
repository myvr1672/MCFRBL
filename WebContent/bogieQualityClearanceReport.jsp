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
    
</body>
<script type="text/javascript">
		$(document).ready(function() {
			
// end of code
			
			var prevStage='<%=previousStage%>';
			var srno,i=1;



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
            selecting: false, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
     
           
			actions : {
				
 		 
 			listAction: 'listClearanceReportBogieAction?stageID=<%=stageID%>'
 			
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
				
var diagtitle="STATIC SIP Report";
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
				
				clearanceMemoBogie:
				{
			title: 'Quality Clearance Memo',
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
			
var URL="open-qualityclearancememo-bogie-report?bogieAssetId="+bogieAssetId;
				
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
	
