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
<% String contextpath=request.getContextPath();%>
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
}
</style>





<style>
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
</style>
<body>
<div id="ShellProductionTableContainer"></div>

</body>
<script type="text/javascript">
		$(document).ready(function() {
		
	
	$('#ShellProductionTableContainer').jtable({
			
		
		
		
		title : 'Shell Available in Paint Shop',
			
			paging:true,
            sorting: true,
            // defaultSorting: 'shellAssetId ASC', // CORRECTED BY MANOJ 19.06.19
            defaultSorting: 'assemblyDispatchDate DESC',
            selecting: false, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
     
	actions : {
 			listAction: 'availablePaintAction',
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
				
				shellAssetId: {
					title: 'Shell No',
					width: '20%',
					display:function(data){
 						var shellNo;
						
 						$.ajax({                    
 							  url: 'descByshellFromIdinPaintShop',     
 							  type: 'post', // performing a POST request
 							  async: false,
							  
 							  dataType: 'json',
 								  data : {
									
 									 shellAssetId: data.record.shellAssetId
 								  	  }									                    
 						})
 								.done(function( msg ) {
 									shellNo=msg.shellNo;
									
 									//return msg.stageName;																			    											
 								  })
 								.error(function (msg){
 									alert("Error Saving Data");
 								})
 								  ;
						
						
 						return shellNo;
 						},
					create: false,
					width : '20%',
					list: true,
					edit : false
				},
				shellType: {
					title :'Shell Type',
					width: '8%',
					list: true,
					create: false,
					edit: false		
					},		
					
					
				assemblyDispatchDate: {
					   title: 'Dispatched from Shell',
					   width : '10%',
					  
					  display:function(data){
						  
	 						var assemblyDispatchDatefromShell;
							
	 						$.ajax({                    
	 							  url: 'assemblyDispatchDatefromShell',     
	 							  type: 'post', // performing a POST request
	 							  async: false,
								  
	 							  dataType: 'json',
	 								  data : {
										
										  shellAssetId: data.record.shellAssetId
	 								  	  }									                    
	 						})
	 								.done(function( msg ) {
	 									assemblyDispatchDatefromShell=msg.assemblyDispatchDatefromShell;
										
	 									//return msg.stageName;																			    											
	 								  })
	 								.error(function (msg){
	 									alert("Error Saving Data");
	 								})
	 								  ;
							
							return ((assemblyDispatchDatefromShell!=null) && (assemblyDispatchDatefromShell!="") ) ? moment(assemblyDispatchDatefromShell).format('DD-MM-YYYY') : "";

	 						},
						create: false,
						edit: false
						},
						
						assemblyStartDate: {
						   title: 'Receipt at Paint Shop',
						   width : '10%',
						   type: 'date',
						  displayFormat: 'dd-mm-yy',
							edit : false,
							create: false 
						},
			
					
								

                        
			},
			loadingRecords: function(event,data)
			{
				srno=0;
			},
			
				
	           
	    		
 
					//Validate form when it is being submitted
				formSubmitting: function (event, data) {
			   // return data.form.validationEngine('validate');
			             
			            },
			    
				//Dispose validation logic when form is closed
				formClosed: function (event, data) {
			            //    data.form.validationEngine('hide');
			            //    data.form.validationEngine('detach');
				}
	              
			});
	$('#ShellProductionTableContainer').jtable('load');
		});
		
		
	</script>
	 
	