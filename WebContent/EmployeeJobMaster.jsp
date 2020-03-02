<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Employee Job Master</title>
<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css" />
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>
<% String contextpath=request.getContextPath();%>
<link href="<%=contextpath %>/css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />

<script src="<%=contextpath %>/js/moment.js" type="text/javascript"></script>


<link href="<%=contextpath %>/js/validationEngine/validationEngine.jquery.css" rel="stylesheet"type="text/css" />

<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine-en.js" type="text/javascript"></script>
<script>

$(document).ready(function() {
	var srno;
	$('#EmployeeJobMasterTableContainer').jtable({
		
		title : 'Activity List',
		
		sorting: true,
		defaultSorting: 'job_id ASC',
		selecting: true, //Enable selecting
        multiselect: false,
		actions : {
			listAction : 'listEmployeeJobAction',
			createAction : 'createEmployeeJobAction',
			updateAction : 'updateEmployeeJobAction',
			//deleteAction : 'deleteEmployeeJobAction'
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
			job_id : {
				title : 'Activity Id',
				inputClass: 'validate[required]',
				width : '10%',
				edit :false,
				list: true,
				create: true,
				key: true
			},
			
			
			shop: {
				title : 'Shop',
				width : '10%',
				options:{'':'Select','bogie':'Bogie Shop','wheel':'Wheel Shop','shell':'Shell Shop',
							'paint':'Paint Shop'},
				edit : true,
				list:true
				
			},
			section : {
				title : 'Section',
				dependsOn: 'shop',
				options: function (data) {
                   var optionField=[];
                   $.ajax({
                	  url:'getSectionByShop',
                	  type:'post',
                	  async:false,
                	  dataType:'json',
                	  data:{
                		  shop:data.dependedValues.shop
                	  }
                   })
                   .done(function(msg)
                		   {
                	   if(msg.sectionList!=null)
                		   {
                		  
                		   for(i=0;i<msg.sectionList.length;i++)
                			   {
                			   optionField[i]={Value:msg.sectionList[i].subsectionId, DisplayText:msg.sectionList[i].subsectionDescription};
                			   }
                		   }
                	   return optionField;
                		   })
                		   .error(function (msg)
                				   {
                			   alert("Error in retrieving data");
                				   });
                   return optionField;
                },
                edit: true,
                create:true
            },
				
			
            subSection : {
            	title : 'Sub Section',
            	inputClass: 'validate[required]',
				dependsOn: 'section',
				options: function (data) {
                   var optionField=[];
                   $.ajax({
                	  url:'getSectionByShop',
                	  type:'post',
                	  async:false,
                	  dataType:'json',
                	  data:{
                		  shop:data.dependedValues.section
                	  }
                   })
                   .done(function(msg)
                		   {
                	   if(msg.sectionList!=null)
                		   {
                		   for(i=0;i<msg.sectionList.length;i++)
                			   {
                			   optionField[i]={Value:msg.sectionList[i].subsectionId, DisplayText:msg.sectionList[i].subsectionDescription};
                			   }
                		   }
                	   return optionField;
                		   })
                		   .error(function (msg)
                				   {
                			   alert("Error in retrieving data");
                				   });
                   return optionField;
                },
                edit: true,
                create:true,
                inputClass: 'validate[required]'
            },
            status:{
            	title:'Status',
            	width:'10%',
            	edit:false,
            	create:false,
            	list:true
            },
			job_desc:{
				title:'Activity Description',
				width:'10%',
				edit:true,
				list:true,
				create:true
			},
            allowed_time:{
				title:'Allowed Time',
				width:'10%',
				edit:false,
				list:true,
				create:true
			},
            prep_time:{
				title:'Prep Time',
				width:'10%',
				edit:false,
				list:true,
				create:true
			},
			load_center_id:{
				title:'Load Center Id',
				width:'10%',
				edit:false,
				list:true,
				create:true
			},
			machine_id:{
				title:'Machine Id',
				width:'10%',
				edit:false,
				list:true,
				create:true
			},
			jig_fix_id:{
				title:'Jig FIx Id',
				width:'10%',
				edit:false,
				list:true,
				create:true
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
		$('#EmployeeJobMasterTableContainer').jtable('load');
	},
	
	recordUpdated: function(event,data)
	{
		srno=0;
		$('#EmployeeJobMasterTableContainer').jtable('load');
	},
		
	});
	
	$('#EmployeeJobMasterTableContainer').jtable('load');

}); 



</script>
</head>
<body>
	<div
		style="width: 80%; margin-right: 10%; margin-left: 10%; text-align: center;">
		
		<div id="EmployeeJobMasterTableContainer"></div>
	</div>
</body>
</html>