<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Asset master</title>
<link href="css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css" />
<script src="js/jquery-1.8.2.js" type="text/javascript"></script>
<script src="js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="js/jquery.jtable.js" type="text/javascript"></script>
<!-- <script src="js/EmpmasterTablejtable.js" type="text/javascript"></script> -->
<% String contextpath=request.getContextPath();%>
<link href="<%=contextpath %>/css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />

<script src="<%=contextpath %>/js/moment.js" type="text/javascript"></script>


<link href="<%=contextpath %>/js/validationEngine/validationEngine.jquery.css" rel="stylesheet"type="text/css" />

<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine-en.js" type="text/javascript"></script>
<script>

$(document).ready(function() {
	var srno;
	var workingShops=[], i=1;
	workingShops[0]={Value:'', DisplayText:"Select"}
	<c:forEach var="a" items= "${workingShop}">
	workingShops[i]={Value:"${a.shopId}", DisplayText:"${a.shopName}"};
	i++;
	</c:forEach>
	$('#EmpmasterTableContainer').jtable({
		
		title : 'Employee List',
		paging:true,
		sorting: true,
		defaultSorting: 'emp_no ASC',
		selecting: true, //Enable selecting
        multiselect: false,
		actions : {
			listAction : 'listEmployeeAction',
			createAction : 'createEmployeeAction',
			updateAction : 'updateDesignationEmployeeAction',
			//deleteAction : 'deleteEmployeeAction'
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
			emp_no : {
				title : 'Emp No',
				inputClass: 'validate[required]',
				width : '10%',
				edit :false,
				list: true,
				create: true,
				key: true
			},
			
		
			emp_name : {
				title : 'Emp Name',
				inputClass: 'validate[required]',
				width : '10%',
				list: true,
				edit : false,
				create: true
				
			},
			
			shop: {
				title : 'Shop',
				width : '10%',
				//options:workingShops,
				options:{'':'Select','Wheel':'Wheel Shop','Bogie':'Bogie Shop', 'Shell':'Shell Shop'},
				edit : false,
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
                edit: false,
                create:true
            },
				
			
            subSection : {
            	title : 'Sub Section',
            	inputClass: 'validate[required]',
				dependsOn: 'section',
				key:true,
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
                edit: false,
                create:true,
                inputClass: 'validate[required]'
            },
            
            designation:
            {
            title:'Designation',
            width : '10%',

options:{'':'Select','Helper':'Helper','Fitter':'Fitter','Welder':'Welder','Khalasi':'Khalasi','Tech-I':'Tech-I','Tech-II':'Tech-II', 'Tech-III':'Tech-III', 'Tech-III':'Tech-III','MCM':'MCM','Sr. Tech':'Sr. Tech', 'SSE':'SSE'},
edit : true,
list:true
            },
			validFrom : {
				title : 'Valid From',
				width : '10%',
				edit :false,
				list: false,
				create: false
				
			},
			validTo : {
				title : 'Valid To',
				width : '10%',
				edit :false,
				list: false,
				create: false,
				
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
		$('#EmpmasterTableContainer').jtable('load');
	},
	rowAdded: function(event, data)
	{
		if(data.serverResponse.message=='Data successfully saved')
			{$('#pText').css("color", 'green');}
		else
			{$('#pText').css("color", 'red');}
		$('#txtMsg').html(data.serverResponse.message);
		
		
		$('#dialog-message').dialog({
			
		model:true,
		buttons:{
			
			Ok:function(){
				$(this).dialog("close");
			}
		}
			
			
		});
		
		
		
	},
	
	recordUpdated: function(event,data)
	{
		srno=0;
		$('#EmpmasterTableContainer').jtable('load');
	},
		
	});
	
	$('#EmpmasterTableContainer').jtable('load');

}); 



</script>
</head>
<body>
	<div
		style="width: 80%; margin-right: 10%; margin-left: 10%; text-align: center;">
		
		<div id="EmpmasterTableContainer"></div>
	</div>
	<div id="dialog-message" title="Message"  style="display:none">
	<p id="pText" style='color:red'><span id="txtMsg"></span></p>
	
	</div>
</body>
</html>