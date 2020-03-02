<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Calendar" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
	float:right;
	margin-right:100px;
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
 <div style="width:80%; margin-right:10%; margin-left:10%; text-align:center;">
<div class="filtering">
 	<form>
        <b>Select Shop</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select id="shopList" ></select>&nbsp;&nbsp;&nbsp;
		<button type="submit" id="LoadRecordsButton">Load records</button>
		 </form>
	</div>
	
<div id ="MachineMaster1TableContainer"></div>
</div>
</body>
 
  <script type="text/javascript">  
$(document).ready(function() {
	
	var srno;
	$("#shopList").append('<option value="All" selected>All</option>');
	<c:forEach var="a" items="${workingShop}">
	var o = new Option("${a}"+ " Shop","${a}" );
	$("#shopList").append(o);
	
	</c:forEach>
	//start: retrieving axle number in dropdown option
    var machineTypes=[]; 

	var j=1;
	machineTypes[0]={ Value:null, DisplayText: "Select" };
	<c:forEach var="b" items="${machineType}">
	machineTypes[j]={ Value: "${b.key}", DisplayText: "${b.value}" };
		j++;
	    </c:forEach>
	  //end: retrieving axle number in dropdown option
	   var amcAgencyIds=[]; 

	var k=1;
	amcAgencyIds[0]={ Value:null, DisplayText: "Select" };
	<c:forEach var="b" items="${amcAgencyId}">
	amcAgencyIds[k]={ Value: "${b.key}", DisplayText: "${b.value}" };
		k++;
	    </c:forEach>

	//start: retrieving working shop in dropdown option
    var workingShops=[]; 

	var i=1;
	workingShops[0]={ Value:null, DisplayText: "Select" };
	<c:forEach var="b" items="${workingShop}">
	workingShops[i]={ Value: "${b}", DisplayText: "${b}" };
		i++;
	    </c:forEach>
	    
	  //end: retrieving axle number in dropdown option

	
	//start: retrieving axle number in dropdown option
     var activityDesc=[]; 

	var l=1;
	activityDesc[0]={ Value:null, DisplayText: "Select" };
	<c:forEach var="b" items="${activityId}">
	activityDesc[l]={ Value: "${b.key}", DisplayText: "${b.value}" };
		l++;
	    </c:forEach>
	 
	$('#MachineMaster1TableContainer').jtable({
		title : 'Machine List',
		paging:false,
        sorting: true,
        defaultSorting: 'machineDescription ASC',
        selecting: false, //Enable selecting
        multiselect: false, 
        multiSorting: true,
        animationsEnabled : true,
		actions : {
			listAction : 'listAddMachineMasterAction'
			
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
				list: true,
				edit : true,
				create: true
				
			},
			machineType : {
				title : 'Machine Type',
				width : '5%',
				options: machineTypes,
				edit : true,
				list: true
				
					},
					workingShop : {
						title : 'Working Shop',
						width : '5%',
						edit : true,
						options: workingShops,
						list: true
					},
					amcAgencyId : {
						title : 'AMC Agency',
						width : '5%',
						edit:true,
						list:true,
						options:amcAgencyIds
						
					},
			
					
					//CHILD TABLE DEFINITION 
		            Schedule:{
		                title: '',
		                width: '5%',
		                
		                edit: true,
		                create: true,
		                display: function (machineData) {
		                    //Create an image that will be used to open child table
		                    var $img = $('<button type="button" onclick="">ADD SCHEDULE </button>');
		                    //Open child table when user clicks the image
		                    $img.click(function () {
		                        $('#MachineMaster1TableContainer').jtable('openChildTable',
		                                $img.closest('tr'),
		                                {
		                                    title:  'Schedule Data',
		                                    actions: {
		                                        listAction: 'listScheduleTransactionAction?machineId='+machineData.record.machineId,
		                                        deleteAction: 'deleteScheduleTransactionAction',
		                                        updateAction: 'updateScheduleTransactionAction',
		                                        createAction: 'createScheduleTransactionAction'
		                                    },
		                                    fields: {
		                                    	scheduleId: {
		                                    		 title: 'Schedule Id',
		                                    		 key:true,
		                                             list:false,
		                                             create:false,
		                                             edit:false
		                                            
		                                        }, 
		                                        
		                                    	machineId: {
		                                            
		                                            title: 'Machine Id',
		                                            type: 'hidden',
		                                            
		                                            defaultValue: machineData.record.machineId
		                                        },
		                                        scheduleType: {
		                                            title: 'Schedule Type',
		                                            options: {"W":"Weekly", "M":"Monthly", "Q" : "Quartelrly","H":"Half Yearly", "Y":"Yearly" }
		                                        },
		                                        
		                                        scheduleDate:{
		                                            title: 'Schedule Date',
		                                            width: '30%',
		                                            create:true,
		                                            edit: true,
		                                            list: true,
		                                            type:'date',
		                                            displayFormat:'dd-mm-yy'
		                                        },
		                                        scheduleCompleted:{
		                                        	title: 'Schedule Completed',
		                                            width: '30%',
		                                            edit: true,
		                                            list: true,
		                                            options: {"Y":"Yes", "N":"No" },
		                                        	
		                                        },
		                                        scheduleCompletedDate:
		                                        	{
		                                        	title: 'Schedule Completed Date',
		                                            width: '30%',
		                                            create:true,
		                                            edit: true,
		                                            list: true,
		                                            type:'date',
		                                        	displayFormat:'dd-mm-yy'
		                                        	},
		                                        scheduleSequence:{
		                                        	title: 'Schedule Sequence',
		                                            width: '30%',
		                                            edit: true,
		                                            list: true,
		                                            options: {"1":"1","2":"2","3":"3" }
		                                        }
		                                        
		                                    }
		                                }, function (data) { //opened handler
		                                    data.childTable.jtable('load');
		                                });
		                    });
		                    //Return image to show on the person row
		                    return $img;
		                }
		            }
		          
		         
			},
			loadingRecords: function(event, data)
			{
				srno=0;
			},
			recordDeleted: function(event, data)
			{
				srno=0;
				$('#MachineMaster1TableContainer').jtable('load');
			}
		
	});
	
	//$('#MachineMaster1TableContainer').jtable('load');
	$('#LoadRecordsButton').click(function (e) {
        e.preventDefault(); 
	$('#MachineMaster1TableContainer').jtable('load', {shopFilter: $('#shopList').val()   });
	});
	$('#LoadRecordsButton').click();
}); 

</script>
</head>

</html>
