<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.Calendar" %>
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
<!-- <script src="js/AssetmasterTablejtable2.js" type="text/javascript"></script> -->
<% String contextpath=request.getContextPath();%>
<link href="<%=contextpath %>/css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="<%=contextpath %>/css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css" />
<script src="<%=contextpath %>/js/jquery-1.8.2.js" type="text/javascript"></script>
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
	width: 300px;
	
}

#jtable-edit-form {
	display: block;
	width: 300px;
	
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
/* #jtable-create-form{ */
/* display:block;  */
/* width:500px; */
/* -moz-column-gap:60px; */
/* -webkit-column-gap:60px; */
/* column-gap:60px; */
/* -moz-column-count:1; */
/* -webkit-column-count:1; */
/* column-count:1; */
/* } */
/* #jtable-edit-form{ */
/* display:block;  */
/* width:500px; */
/* -moz-column-gap:60px; */
/* -webkit-column-gap:60px; */
/* column-gap:60px; */
/* -moz-column-count:1; */
/* -webkit-column-count:1; */
/* column-count:1; */
/* } */
</style>
</head>
<body>
	<div
		style="width: 80%; margin-right: 10%; margin-left: 10%; text-align: center;">
		
		<div id="AssetmasterTableContainer"></div>
	</div>
	<%
Calendar cal = Calendar.getInstance();
int year= cal.get(Calendar.YEAR);
%>
	
</body>

<script type="text/javascript">

$(document).ready(function() {
	
	var srno,i=1;
    //retrieve bogie type
			var bogietypes=[];
			bogietypes[0]={ Value:null, DisplayText: "Select" };
			<c:forEach var="a" items="${coachType}">
			
			var o = new Option("${a}", "${a}");
			/// jquerify the DOM object 'o' so we can use the html method
			$(o).html("${a}");
			$("#coachType").append(o);
			
			bogietypes[i]={ Value: "${a}", DisplayText: "${a}" };
		i++;
	    </c:forEach>
	    
	    
	$('#AssetmasterTableContainer').jtable({
		title : 'Coach List',
		//paging:true,
		actions : {
			listAction : 'listAsset2Action',
			createAction : 'createAsset2Action',
			updateAction : 'updateAsset2Action',
			deleteAction : 'deleteAsset2Action'
		},
		

		fields : {  
			
			asset_id : {
				title : 'Coach Type',
				width : '20%',
				list: false,
		
				create: false,
				
				key: true
				
			},
				asset_subtype : {
			
				title : 'Coach Type',
				width : '20%',
				list: true,
				create: true,
				options : bogietypes,
				inputClass: 'validate[required]',
			
			},
			
		
			asset_type : {
				title : 'Category',
				width : '20%',
				
				list: true,
				edit : false,
				create: true,
				options : {'Coach':'Coach'},
				inputClass: 'validate[required]'
				
			},
			
			asset_subtype_description: {
				title : 'Description',
				width : '30%',
				edit : true,
				list:true
				
			},
			asset_subtype_class : {
				title : 'Class',
				width : '30%',
				edit : true,
				list:true
				
			},
			
			asset_subtype_capacity : {
				title : 'Capacity',
				width : '30%',
				edit : true,
				list: true
				
			},
			fin_yr :{
				title : 'Fin Year',
				width : '30%',
				edit : false,
				list:true,
                options: { "<%=year-3%>-<%=year-2%>": "<%=year-3%>-<%=year-2%>", "<%=year-2%>-<%=year-1%>": "<%=year-2%>-<%=year-1%>", "<%=year-1%>-<%=year%>":"<%=year-1%>-<%=year%>" , "<%=year%>-<%=year+1%>":"<%=year%>-<%=year+1%>","<%=year+1%>-<%=year+2%>":"<%=year+1%>-<%=year+2%>" }
			
			},
			
			
	},
		
	formCreated: function (event, data) {
        data.form.validationEngine();
    },
    loadingRecords: function(event,data)
	{
		srno=0;
	},
    //Validate form when it is being submitted
    formSubmitting: function (event, data) {
        return data.form.validationEngine('validate');
    },
    //Dispose validation logic when form is closed
    formClosed: function (event, data) {
        data.form.validationEngine('hide');
        data.form.validationEngine('detach');
    }
});


$('#AssetmasterTableContainer').jtable('load');

}); 

</script>