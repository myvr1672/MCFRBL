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

.hide-calendar .ui-datepicker-calendar {
	display: none;
}
/* button.ui-datepicker-current { display: none; } */
.jtable-child-table-container {
	border: 2px solid blue;
	width: 650px;
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


</style>
 <body>

 <div style="width:98%; margin-right:1%; margin-left:1%; text-align:center;">
  <h3>Machine Master</h3>
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
	var messages={
			areYouSure:'Are you sure?',
			addNewRecord:'Add Machine'
	}
	var sno;
	$("#shopList").append('<option value="All" selected>All</option>');
	<c:forEach var="a" items="${workingShop}">
	var o = new Option("${a}"+ " Shop","${a}" );
	$("#shopList").append(o);
	//retrieve supplier code
	</c:forEach>
	 
    var b=1;
		var suppliers=[];
		suppliers[0]={ Value:null, DisplayText: "Select" };
		<c:forEach var="a" items="${supplier}">
		
		suppliers[b]={ Value: "${a.key}", DisplayText: "${a.value}" };
	b++;
    </c:forEach>

   // end of code for supplier
	
	//start: retrieving axle number in dropdown option
    var machineTypes=[]; 

	var j=1;
	machineTypes[0]={ Value:null, DisplayText: "Select" };
	<c:forEach var="b" items="${machineType}">
	machineTypes[j]={ Value: "${b.key}", DisplayText: "${b.value}" };
		j++;
	    </c:forEach>
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
    var amcAgencyIds=[]; 

	var k=1;
	amcAgencyIds[0]={ Value:null, DisplayText: "Select" };
	<c:forEach var="b" items="${amcAgencyId}">
	amcAgencyIds[k]={ Value: "${b.key}", DisplayText: "${b.value}" };
		k++;
	    </c:forEach>
	  //end: retrieving axle number in dropdown option

	//start: retrieving axle number in dropdown option
    var maintenanceShopIds=[]; 

	var a=1;
	maintenanceShopIds[0]={ Value:null, DisplayText: "Select" };
	<c:forEach var="b" items="${maintenanceShopId}">
	maintenanceShopIds[a]={ Value: "${b.key}", DisplayText: "${b.value}" };
		a++;
	    </c:forEach>
	  //end: retrieving axle number in dropdown option
	
	$('#MachineMaster1TableContainer').jtable({
		
	    
		
		
		title : 'Machine List',
		messages:messages,
		paging:false,
        sorting: true,
        defaultSorting: 'machineDescription ASC',
        selecting: true, //Enable selecting
        multiselect: false, 
        multiSorting: true,
        animationsEnabled : true,
		actions: {
			listAction : 'listMachineMasterAction',
			createAction : 'createMachineMasterAction',
			updateAction : 'updateMachineMasterAction',
			deleteAction : 'deleteMachineMasterAction'
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
				list: true,
				edit : true,
				create: true,
				inputClass: 'validate[required]'
				
			},
			machineType : {
				title : 'Machine Type',
				width : '5%',
				options: machineTypes,
				edit : true,
				list: true
				//options: machineTypes
					},
			
			workingShop : {
				title : 'Working Shop',
				width : '5%',
				edit : true,
				options: workingShops,
				list: true
			},

			make : {
				title : 'Make',
				width : '5%',
				list: true,
				edit:true,
				create: true
			
				
			},
			model : {
				title : 'Model',
				width : '5%',
				list: true,
				edit:true,
				create: true
			
			
				
			},
			
			
			purchasedBy: {
				title : 'Purchased by',
				width : '5%',
				options:suppliers,
				list: true,
				edit:true,
				create: true
			
			
				
			},
			purchaseNo: {
				title : 'Purchase No',
				width : '5%',
				list: true,
				edit:true,
				create: true
			},
			
			purchaseDate:{
					title : 'Purchase Order date',
					width : '5%',
					list: true,
					edit:true,
					create: true,
					type:'date',
					displayFormat: 'dd-mm-yy'
			},  
		 
			
			maintenanceShopId : {
				title : 'Maintenance Section',
				width : '5%',
				edit:true,
				options: maintenanceShopIds
			},

			
			  dateOfCommissioned : {
				title : 'Date of commissioned',
				width : '5%',
				type :'date',
				displayFormat:'dd-mm-yy'
				
			}, 
			  
		     /* createdDate : {
				title : 'Created Date',
				width : '5%',
				type :'date',
				displayFormat:'dd-mm-yy'
				
			},  */
			 
			machineStatus : {
				title : 'Machine Status(F/W)',
				width : '5%',
				create:false,
				edit:false,
				list:false
			
			
				
			},
			
			machineCost : {
				title : 'Machine Cost',
				width : '5%',
				type:'number',
				list: true,
				edit:true,
			
				create: true,
				inputClass:'validate[required,custom[number]]'
			
			
				
			},
			
			
			machineLife : {
				title : 'Machine Life',
				width : '5%',
				type:'number',
				list: true,
				edit:true,
				create: true,
				inputClass:'validate[required,custom[number]]'
			
			
				
			},
			amcAgencyId : {
				title : 'AMC Agency',
				width : '5%',
				edit:true,
				list:true,
				options:amcAgencyIds
				
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
