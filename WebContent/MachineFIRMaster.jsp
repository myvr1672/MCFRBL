<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>JTable in Struts2 and Hibernate</title>
<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css" />
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>

<script src="js/MachineFIRMastertablejtable.js" type="text/javascript"></script>


<body>
<div
style="width:80%; margin-right:10%; margin-left:10%; text-align:center;">
	<h3>FIR Code And Description</h3>
	
	<div id ="MachineFIRMasterTableContainer"></div>

</div>
</body>

 <script type="text/javascript">  
$(document).ready(function() {
	var srno;
	$('#MachineFIRMasterTableContainer').jtable({
		title : 'Machine FIR Master',
		paging:true,
		actions : {
			listAction : 'listFailureAction',
			createAction : 'createFailureAction',
			updateAction : 'updateFailureAction',
			deleteAction : 'deleteFailureAction'
		},
		
			fields : {
				sno:{
					title : 'SNo',
					create: false,
					edit : false,
					width: '15%',
					display: function(data)
					{
						
						srno++;
						return srno;
					}
				},	
			
			failure_code : {
				title : 'failure_code',
				width : '20%',
				list: false,
				create: true,
				edit : true,
				key: true
				
			},
			
		
			failure_description : {
				title : 'FIR Description',
				width : '20%',
				list: true,
				edit : true,
				create: true
				
				
			},
			
			
			
			
	},
	loadingRecords: function(event,data)
	{
		srno=0;
	},
	 recordDeleted: function(event,data)
		{
			srno=0;
			$('#MachineFIRMasterTableContainer').jtable('load');
		},
		

		
	});
	
	$('#MachineFIRMasterTableContainer').jtable('load');

}); 
</script>
</head>
</html>