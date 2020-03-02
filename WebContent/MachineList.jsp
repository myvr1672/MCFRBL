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
 
 
 
  <script type="text/javascript">  
$(document).ready(function() {
	
	var srno;
	
	
	  //start: retrieving axle number in dropdown option
	   /*  var MachineIDS=[]; 

		var j=1;
		MachineIDS[0]={ Value:null, DisplayText: "Select" };
		<c:forEach var="b" items="${machineId}">
		MachineIDS[j]={ Value: "${b}", DisplayText: "${b}" };
			j++;
		    </c:forEach> */
		  //end: retrieving axle number in dropdown option

		//start: retrieving axle number in dropdown option
	    var workingShops=[]; 

		var i=1;
		workingShops[0]={ Value:null, DisplayText: "Select" };
		<c:forEach var="b" items="${workingShop}">
		workingShops[i]={ Value: "${b}", DisplayText: "${b}"+" Shop" };
			i++;
		    </c:forEach>
		  //end: retrieving axle number in dropdown option

		//start: retrieving axle number in dropdown option
	    var machineSRNO=[]; 

		var k=1;
		machineSRNO[0]={ Value:null, DisplayText: "Select" };
		<c:forEach var="b" items="${machineSrNo}">
		machineSRNO[k]={ Value: "${b}", DisplayText: "${b}" };
			k++;
		    </c:forEach>
		  //end: retrieving axle number in dropdown option
		  
		  var MachineDesc=[]; 

		var k=1;
		MachineDesc[0]={ Value:null, DisplayText: "Select" };
		<c:forEach var="b" items="${machineDescription}">
		MachineDesc[k]={ Value: "${b}", DisplayText: "${b}" };
			k++;
		    </c:forEach>

		//start: retrieving axle number in dropdown option
	    var ShopID=[]; 

		var a=1;
		ShopID[0]={ Value:null, DisplayText: "Select" };
		<c:forEach var="b" items="${maintenanceShopId}">
		ShopID[a]={ Value: "${b}", DisplayText: "${b}" };
			a++;
		    </c:forEach>
		  //end: retrieving axle number in dropdown option
		    
		  //start: retrieving axle number in dropdown option
		    
		    var SafetyInst=[]; 

			var k=1;
			SafetyInst[0]={ Value:null, DisplayText: "Select" };
			<c:forEach var="b" items="${safetyInstructionId}">
			SafetyInst[k]={ Value: "${b.key}", DisplayText: "${b.value}" };
				k++;
			    </c:forEach>
		  //end: retrieving axle number in dropdown option
	 
	$('#MachineListTableContainer').jtable({
		
	   
		title : 'machine-list',
		actions : {
			listAction : 'listMachineListAction'
			
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
					
					list: true,
					create: false,
					key: true
				
			
			}, 
			
			machineSrNo : {
				title : 'Machine Sr No',
				list: true
			},
			machineDescription : {
				title : 'Machine Description',
				width : '5%',
				list: true				
			},
			workingShop : {
				title : 'Working Shop',
				width : '5%',
				list: true
				
				
					},
		
					
					
					//CHILD TABLE DEFINITION 
		            Safety:{
		                title: '',
		                width: '5%',
		                
		                edit: true,
		                create: true,
		                display: function (machineData) {
		                    //Create an image that will be used to open child table
		                    var $img = $('<button type="button" onclick="">ADD SAFETY INSTRUCTIONS </button>');
		                    //Open child table when user clicks the image
		                    $img.click(function () {
		                        $('#MachineListTableContainer').jtable('openChildTable',
		                                $img.closest('tr'),
		                                {
		                                    title:  'Safety Instructions',
		                                    actions: {
		                                        listAction: 'listSafetyTransactionAction?machineId='+machineData.record.machineId,
		                                        deleteAction: 'deleteSafetyTransactionAction?machineId='+machineData.record.machineId,
		                                        createAction: 'createSafetyTransactionAction?machineId='+machineData.record.machineId
		                                    },
		                                    fields: {
		                                    	
		                                    	    
		                                        safetyFlag:{
		                                        	title: 'Safety Flag',
		                                        	list : true,
		                                        	create: true,
		                                        	edit: false,
		                                            options: {"Informative":"Informative", "Descriptive":"Descriptive" }
		                                        	
		                                        	
		                                        	
		                                        	
		                                        },
		                                        safetyInstructionId:
		                                        	{
		                                        	
		                                        	title: 'Safety Instruction Id',
		                                        	key: true,
		                                        	list : true,
		                                        	create: true,
		                                        	edit: false,
		                                        	options: SafetyInst
		                                        	
		                                        	}
		                                        	
		                                    	
		                                        
		                                    },
		                                    formCreated: function (event, data)
			                    			{
			                    				$('[name=safetyFlagForEdit]').val(data.record.safetyInstructionId);
			                    			},
		                                }, 
		                                
		                                
		                                
		                                function (data) { //opened handler
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
				$('#MachineListTableContainer').jtable('load');
			}
		
	});
	
	$('#MachineListTableContainer').jtable('load');

}); 

</script>
</head>
<body>

<div
style="width:80%; margin-right:10%; margin-left:10%; text-align:center;">
	<h3>Machine Safety Instruction List</h3>
	<div id ="MachineListTableContainer"></div>

</div>

</body>
</html>
