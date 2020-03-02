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

 <div style="width:80%; margin-right:10%; margin-left:10%; text-align:center;">
  <h3>Machine Spare</h3>
	
<div id ="SpareMasterTableContainer"></div>
</div>
</body>
 
 
  <script type="text/javascript">  
$(document).ready(function() {
	var sno;
	
	
	$('#SpareMasterTableContainer').jtable({
	
		title : 'Spare Master',
		actions: {
			listAction : 'listSpareMasterAction',
			createAction : 'createSpareMasterAction',
			updateAction : 'updateSpareMasterAction',
			deleteAction : 'deleteSpareMasterAction'
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
			spareId : {
				title : 'Spare ID',
				width : '5%',
				list: false,
				create: true,
				key: true,
				edit:false
			
				
			},
			spareDescription : {
				title : 'Spare Description',
				width : '15%',
				list: true,
				edit : true,
				create: true,
				type: 'textarea',
				inputClass: 'validate[required]'
				
			},
			drawingNo:{
				title : 'Drawing No.',
				width : '10%',
				list: true,
				edit : true,
				create: true
			},
			selfLife:
				{
				title : 'Self Life(Yr)',
				width : '7%',
				list: true,
				edit : true,
				create: true,
				
				inputClass: 'validate[custom[integer]]'
				},
			unitPrice:
			{
			title : 'Unit Price',
			width : '8%',
			list: true,
			edit : true,
			create: true,
			
			inputClass: 'validate[custom[integer]]'
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
				$('#SpareMasterTableContainer').jtable('load');
			},
			
		
	});
	
	$('#SpareMasterTableContainer').jtable('load');
	

}); 

</script>
</head>

</html>
