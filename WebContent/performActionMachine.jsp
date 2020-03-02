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

<link href="jquery-ui-1.11.4/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <link href="jtable/themes/lightcolor/blue/jtable.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="jquery-datetimepicker/jquery.datetimepicker.css"/>
    <script src="jquery-1.11.2/jquery-1.11.2.js" type="text/javascript"></script>
    <script src="jquery-ui-1.11.4/jquery-ui.js" type="text/javascript"></script>
    <script src="jtable/jquery.jtable.js" type="text/javascript"></script>
    <script src="jquery-datetimepicker/jquery.datetimepicker.js"></script>


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
	
	if(document.getElementById("status").value =="Resolved")
		{
	
		  document.getElementById("rectificationDate").disabled = false;
		  $('#rectificationDate').addClass("validate[required]");
		}
	else
		{
		 document.getElementById("rectificationDate").disabled = true;	
	document.getElementById("rectificationDate").value="";
	 $('#rectificationDate').removeClass("validate[required]");
		}
} 
</script>
 <body>
 <div style="width:80%; margin-right:10%; margin-left:10%; text-align:center;">
<div id ="MachineMaster1TableContainer"></div>
</div>
    <div id="actionDialog" style="height:150%; width:200%; display:none;z-index: 9;" >
  <br> <br> 
 			 Breakdown Id :
		      <select id="breakdownId" ></select>
		    <br> <br> 
		   Enter Action to be Performed:
		     <textarea id="actionPerformed" placeholder="Enter Action"></textarea>
		    <br> <br>
		      
		      Remarks: <br>
		     <textarea id="remarks" placeholder="Enter Remark"></textarea>
		     <br>	
		      Status :<br> 
		      <select name="status" id="status" onchange="myFunction()">
		    </select>	
		    <br> 	
		    Completion Date:
		     <input type="Text" id="rectificationDate" disabled>
		    <br> <br>  

 </div>
 
</body> 
 
 
  <script type="text/javascript">  
$(document).ready(function() {
	var sno;
	
	 //retrieve breakdown id 
    $("#breakdownId").append('<option value="">Select</option>');
			<c:forEach var="a" items="${breakdownId}">
			var o = new Option("${a}", "${a}");
			$("#breakdownId").append(o);
			 </c:forEach> 
	//end of code	
	
		  /* for date picker in dialog box*/	
		  		$('#rectificationDate').datepicker({
		        //inline: true,
		        dateFormat: 'dd-mm-yy',
		        changeMonth: true,
		        changeYear: true,
		        yearRange: '-1:+1',
		        maxDate:new Date(),
		        constrainInput: true,
		        duration: '',
		        gotoCurrent: true,
		        beforeShow: function() {
		            setTimeout(function(){
		                $('.ui-datepicker').css('z-index', 99999999999999);
		            }, 0);
		        }

		    }).datepicker("setDate", new Date());
			
	
	$('#MachineMaster1TableContainer').jtable({
		
		
		title : 'Failed Machine List',
		selecting: true, //Enable selecting
        multiselect: false, 
        multiSorting: true,
        animationsEnabled : true,
        toolbar:{
        	items:[
        		{
					icon:'<%=contextpath%>/images/rs_out.png',
					text:'Perform Action',
					click: function(){
						var $selectedRows = $('#MachineMaster1TableContainer').jtable('selectedRows');
						if ($selectedRows.length<1)
							alert("Please select a row for which you want to perform action");
						else{
							var record;
							$selectedRows.each(function () {
                             record = $(this).data('record');
                              });
							if(record.actionPerformed=='' || record.actionPerformed==null)
            	 			{
            	 			$('#status').empty();
            	 			selectValues = { 'Intimated': 'Intimated', 'UnderProgress': 'Under Progress', 'Resolved': 'Resolved' };
            				                   				

            				$.each(selectValues, function(key, value) { 
            					
            						if(key==record.status)
            							{
            				     $('#status')
            				         .append($("<option selected></option>")
            				                    .attr("value",key)
            				                    .text(value)); 
            							}
            						else
            							{
            							 $('#status')
                				         .append($("<option></option>")
                				                    .attr("value",key)
                				                    .text(value));
            							}
            						
            				});
            	 			
							
								$("#actionDialog").dialog({
								title :'Action taken ',
								close: function (e, u) {
									$("#actionDialog").validationEngine('hideAll');	
								},
								buttons:{
									 Submit: {
										 text: "Submit", 
										 id: "my-button-submit",
										 click:function () {
											 if ($('#actionPerformed').validationEngine('validate')) {
		                                        	//alert(!$("#dialog").validationEngine('validate'));
		                                            return false;
											 }
											 $.ajax({
												 url : "actionOnMachine",  //action-name as defined in struts.xml
												 dataType: 'json', 
												 data : {
													 machineId:record.machineId,
													// breakdownId:record.breakdownId,
													 breakdownId:$('#breakdownId').val(),
													 actionPerformed:$('#actionPerformed').val(), 
													 remarks:$('#remarks').val(), 
													 status:$('#status').val(),
													 rectificationDate:$('#rectificationDate').val()
												 },
												 type : 'POST',
		                    					 async : false,
											 })
											 .done(function( msg ) {
												 	$('#breakdownId').val('');
												 	$('#actionPerformed').val('');
												 	$('#remarks').val(''); 
													$('#status').val('');
	                    							$('#rectificationDate').val('');
	                    							$('#actionDialog').dialog('close');
	                    							$('#MachineMaster1TableContainer').jtable('load');
											 })
											 .error(function (msg){
												 alert("Error Fetching Data"); 
											 });
											 return true;
										 }
									 },
									 Close: function () {
										 $(this).dialog('close');
									 }
									 
								},
								 modal: true
							  });
								
                   	 	 }	
                   	 		else
                   	 		{
                   	 			alert("Action is already submitted for the selected machine");
                   	 			                    	 			}
                   	 		   
								 return true;
							}
						}
						
					}
					
				
        	]
        },
		actions: {
			listAction : 'listPerformMachineMasterAction'
			
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
				machineId : {
				title : 'Machine id',
				width : '5%',
				list: false,
				create: false,
				key: true
			
				
			},
			machineSrNo : {
				title : 'Machine Sr No',
				width : '5%',
				list: true,
				edit : true,
				create: true
				
			},
			machineDescription : {
				title : 'Machine Description',
				width : '5%',
				list: true
				
				
			},
			machineType : {
				title : 'Machine Type',
				width : '5%',
				
				
					},
			
			workingShop : {
				title : 'Working Shop',
				width : '5%',
				edit : true,
				
				list: true
			},

			
			maintenanceShopId : {
				title : 'Maintenance Shop Id',
				width : '5%',
				
				
			},

			amcAgencyId : {
				title : 'AMC Agency',
				width : '5%',
				
				list:true,
				
				
			}
		
			
					
			},
			loadingRecords: function(event,data)
			{
				srno=0;
			},
			formSubmitting: function (event, data) {
				//alert("submitting form");
		    return data.form.validationEngine('validate');
		             
		            },
		            formClosed: function (event, data) {
		                data.form.validationEngine('hide');
		                data.form.validationEngine('detach');
		            },
			recordDeleted: function(event,data)
			{
				srno=0;
				$('#MachineMaster1TableContainer').jtable('load');
			},
			
			
			rowInserted: function(event,data)
			{
				if(data.record.machineStatus=="F")
					{
					data.row.css("background","grey");
					}
			}
	});
	
	
	$('#MachineMaster1TableContainer').jtable('load');
	});
	


</script>
</head>

</html>

 