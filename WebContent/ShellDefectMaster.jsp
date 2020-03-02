<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css" />
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>


<body>
<div
style="width:80%; margin-right:10%; margin-left:10%; text-align:center;">
	<h3>Shell Defect Code and Description</h3>
	
	<div id ="ShellDefectMasterTableContainer"></div>

</div>
</body>

 <script type="text/javascript">  
$(document).ready(function() {
	var srno;
	$('#ShellDefectMasterTableContainer').jtable({
		title : 'Machine FIR Master',
		sorting: true,
		defaultSorting: 'shellDefectDescription ASC',
		paging:true,
		actions : {
			listAction : 'listShellDefectMasterAction',
			createAction : 'createShellDefectMasterAction',
			updateAction : 'updateShellDefectMasterAction',
			deleteAction : 'deleteFailureMasterAction'
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
			
				shellDefectId : {
				title : 'Shell Defect Code',
				width : '20%',
				list: false,
				create: false,
				edit : false,
				key: true
				
			},
			
		
			shellDefectDescription : {
				title : 'Shell Defect Description',
				width : '50%',
				type:'textarea',
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
			$('#ShellDefectMasterTableContainer').jtable('load');
		},
		

		
	});
	
	$('#ShellDefectMasterTableContainer').jtable('load');

}); 
</script>
</head>
</html>