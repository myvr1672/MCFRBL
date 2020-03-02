<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Calendar" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<%@page import="org.hibernate.Criteria" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="hibernateConnect.HibernateConfig" %>
    
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




<body>
<div style="width:80%; margin-right:10%; margin-left:10%; text-align:left;">
	<h3>Machine Schedule Activity Description</h3>
	
	<div id ="MachineScheduleActivityTableContainer"></div>

</div>
</body>

 <script type="text/javascript">  
$(document).ready(function() {
	var messages={
			areYouSure:'Are you sure?',
			addNewRecord:'Add new Activity'
	}
	var srno;
	$('#MachineScheduleActivityTableContainer').jtable({
		title : 'Schedule Activity Master',
		paging:true,
		messages:messages,
        sorting: true,
        defaultSorting: 'activityDescription ASC',
        selecting: false, //Enable selecting
        multiselect: false, 
        multiSorting: true,
        animationsEnabled : true,
		actions : {
			listAction : 'listActivityAction',
			createAction : 'createActivityAction',
			updateAction : 'updateActivityAction',
			deleteAction : 'deleteActivityAction'
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
			
			activityNo: {
				title : 'Activity No',
				width : '5%',
				list: false,
				create: true,
				edit:false,
				key: true
				
			},
			
		
			activityDescription : {
				title : 'Activity Description',
				width : '70%',
				type:'textarea',
				list: true,
				edit : true,
				create: true,
				inputClass: 'validate[required]'
				
			},
			
			
			
			
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
			$('#MachineScheduleActivityTableContainer').jtable('load');
		},
		

		
	});
	
	$('#MachineScheduleActivityTableContainer').jtable('load');

}); 
</script>
</head>
</html>