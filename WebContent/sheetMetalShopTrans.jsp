<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>jTable in Struts2 Integrated with Hibernate</title>
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
<%-- <script src="<%=contextpath %>/js/AbnormalityTableJtable.js" type="text/javascript"></script> --%>
<style>
.jtable-input-readonly{background-color: lightgray;}
</style>
<script>



$(document).ready(function() {
	
		  
	  //start: autocomplete material in dropdown option
	    var drawingDetailsAutoComplete=[]; 

		

		var j=0;
		<c:forEach var='b' items='${drawingList}'>
		drawingDetailsAutoComplete[j]={ value: '${b.key}', label: '${b.key}'+'-${b.value}' };
			j++;
		    </c:forEach>
		  //end: retrieving material in dropdown option
		  
		  //start: retrieving material in dropdown option
	    var drawingDetailsDisplay=[]; 

		var j=0;
		<c:forEach var='b' items='${drawingList}'>
		drawingDetailsDisplay[j]={ Value: '${b.key}', DisplayText:'${b.value}' };
			j++;
		    </c:forEach>
		  //end: retrieving material in dropdown option
	var srno;
	$('#SheetMetalShopTransTable').jtable({
		title : 'Sheet Metal Shop Transaction',
		sorting: true,
		defaultSorting: 'drawingNo ASC',
		 selecting: false, //Enable selecting
         multiselect: false, 
				
		
		actions : {
			listAction : 'listSheetMetalTransAction',
			createAction : 'createSheetMetalTransAction',
			updateAction : 'updateSheetMetalTransAction',
			deleteAction : 'deleteSheetMetalTransAction'
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
			drawingNo : {
				title : 'Drawing No.',
				key : true,
				list : true,
				edit : true,
				create : true
			},
			drawingNo1 : {
				title : 'Description',
				display:function(data){
					
					 if (data.record.drawingNo != null) {
				//alert(data.record.id.hodyCode)	;				 
				return (findObjectByKey(drawingDetailsDisplay, 'Value', data.record.drawingNo)).DisplayText;
					 }
										}, 
				list : true,
				edit : false,
				create : false
			},
			
			productionDate : {
				title : 'Production Date',
				width : '15%',
				type : 'date',
				
				displayFormat: 'dd-mm-yy',
				edit : true
			},
			qpc:
			{
             title:'Qty Per Coach',
             width: '15%',
             list:false,
             edit:false,
             create:true
			},
			rawMaterialUsed:
				{
                 title:'Raw Material Used',
                 width: '15%',
                 list:false,
                 edit:false,
                 create:true
				},
			qtyProduced:{
                title:'Qty Manufactured',
                width:'15%',
                list: true,
				edit : true
				},
			
						},
		//rowInserted function get called for each and every row during listing of jtable
		rowInserted:function(event,data)
		{
			
		},
		formCreated: function(event,data)
		{
			
			$('[name=qpc]').attr("disabled", "disabled");
			$('[name=rawMaterialUsed]').attr("disabled", "disabled");
			$('[name=drawingNo]').autocomplete({	
	        	source: drawingDetailsAutoComplete,
		        	minLength: 3,
		        	open: function() {
	        		  $(".ui-autocomplete").width( $(this).innerWidth() );
	               
		            },
		            response: function (event, ui)
		            {
			            if(!ui.content.length){
	 			            
			            	$("[name=drawingNo]").html("<b>No Entries Found</b>");
                  var result= {value: "error", label: "Drawing not exist"};
                  
                  ui.content.push(result);
                 
                  $('#AddRecordDialogSaveButton').prop("disabled", true);
                  
                  return false;
	 			            }
			            else {$('#AddRecordDialogSaveButton').prop("disabled", false);
			          $('#AddRecordDialogSaveButton').removeClass("disabled");}

			            },
		           // change: function (event, ui) { alert("change event called") },
                select: function (event, ui) {
                	
                	 $("[name=drawingNo]").val(ui.item.label);
                	 $("[name=drawingNo]").val(ui.item.value);
                	 	 
	                    return false;	              }
	        	
			         
		  }).focus(function () {$(this).autocomplete("search", $(this).val());
				  });

			$('[name=productionDate]').
			datepicker("option", "disabled", false ).
			val('').css('background-color' ,'').datepicker("option", "maxDate", new Date);
// 
			$("[name=drawingNo]").change(function() {

				$.ajax({                    
				 url: 'getSheetMetalMasterDetail',     
				 type: 'post', // performing a POST request
				 async: false,
				 
				 dataType: 'json',
				 data : {
				 
					 drawingNo:  data.form.find('[name=drawingNo]') .val() 
				 	 }	                   
				})
				.done(function( msg ) {
				$('[name=qpc]').val(msg.qtyPerCOach);
				$('[name=rawMaterialUsed]').val(msg.rawMaterialUsed);  
				})
				.error(function (msg){
				alert("Error Saving Data");
				})
			});

							

			data.form.validationEngine();
		},
		formSubmitting: function(event,data)
		{
			
			return data.form.validationEngine('validate');
		},
		
		formClosed: function (event, data) {
	                data.form.validationEngine('hide');
	                data.form.validationEngine('detach');
	            },
		loadingRecords: function(event,data)
		{
			srno=0;
		},
		recordDeleted: function(event,data)
		{
			srno=0;
			$('#SheetMetalShopTransTable').jtable('load');
		},
		
		recordUpdated: function(event,data)
		{
			srno=0;
			$('#SheetMetalShopTransTable').jtable('load');
		},
	});
	
	$('#SheetMetalShopTransTable').jtable('load');

});




</script>


</head>
<body>



	<div
		style="width: 90%; margin-right: 5%; margin-left: 5%; text-align: left;">
		
		<div align="center" id="status"></div>
		<div id="SheetMetalShopTransTable"></div>
	</div>
	
</body>
</html>
<script>
 function findObjectByKey(array, key, value) {
	    for (var i = 0; i < array.length; i++) {
	        if (array[i][key] == value) {
	            return array[i];
	        }
	    }
	    return null;
	}
 </script>