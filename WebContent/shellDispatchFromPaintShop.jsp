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
		var srno;
			



	$('#ShellProductionTableContainer').jtable({
	
		title : 'Shell Dispatched from Paint Shop',
			
			paging:true,
            sorting: true,
            // defaultSorting: 'shellAssetId ASC', // CORRECTED BY MANOJ 19.06.19
            defaultSorting: 'assemblyStartDate DESC',
 
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
     
	actions : {
 			listAction: 'dispatchPaintAction'
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
				paintAssetId : {
					title : 'paintAssetId',
					width: '8%',
					key: true,
					list : false,
					edit : false,
					create : false
									
					},
				
						shellAssetId: {
							title: 'Shell No',
							
							display:function(data){
		 						var shellNo;
								
		 						$.ajax({                    
		 							  url: 'descByshellFromId',     
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
							
							width : '20%'
							
						},
						shellType: {
							title: 'Shell Type',
							width: '20%'
							
						},
				
						assemblyStartDate: {
							title :'Entry Date',
							type: 'date',
							width: '8%',
							
							displayFormat: 'dd-mm-yy',
							display:function(data){
										 
								return ((data.record.assemblyStartDate!=null) && (data.record.assemblyStartDate!="") ) ? moment(data.record.assemblyStartDate).format('DD-MM-YYYY') : "";
										}, 
									     	
							list: true
							
											
							},
				furnishingNumber:{
                    title: 'Furnishing No.',
                    width: '10%'
					},
				assemblyDispatchDate: {
					   title: 'Dispatched Date',
					   width : '10%',
					   type: 'date',
					  displayFormat: 'dd-mm-yy'
						
					},
					exitRemarks: {
						   title: 'Remarks',
						   width : '10%',
							type : 'textarea'
							
						},
			       
			},
			loadingRecords: function(event,data)
			{
				srno=0;
			},
		   
			});
	$('#ShellProductionTableContainer').jtable('load');
		});
		
		
	</script>
	 
	