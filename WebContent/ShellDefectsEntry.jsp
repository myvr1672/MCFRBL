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

<style>
.jtable-input-readonly{
     background-color:lightgray;
}
</style>

<script>



$(document).ready(function() {
	
	var shellNo=[]; 

	//start: retrieving shops in dropdown

	var i=0;
	<c:forEach var="a" items="${shellNos}">
	        shellNo[i]={ Value: "${a.key}", DisplayText: "${a.value}" };
		i++;
	    </c:forEach>
	
	  //end: retrieving shell no in dropdown
	  
	  //start: retrieving shell defect in dropdown option
	    var shellDefect=[]; 

		

		var j=0;
		<c:forEach var="b" items="${shellDefects}">
		shellDefect[j]={ Value: "${b.key}", DisplayText: "${b.value}" };
			j++;
		    </c:forEach>
		  //end: shell defects in dropdown option
	var srno;
	$('#ShellDefectsTableContainer').jtable({
		title : 'Shell Defects Log Book Entry',
		sorting: true,
		defaultSorting: 'abid ASC',
		 selecting: true, //Enable selecting
         multiselect: false, 
		// TOOLBAR BUTTON STARTS HERE
	 toolbar: {
                items: [
                    {
                    	icon: '<%=contextpath%>/images/rs_out.png',
                        text: 'Perform Action',
                        click: function () {
                        	
                        	 var $selectedRows = $('#ShellDefectsTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a Shell Defect for which you want to perform action");
                    	 	 else{
                    	 		var record;
                    	 		$selectedRows.each(function () {
                                    record = $(this).data('record');
                                    });
                    	 		
                    	 		//alert(record.status);
                    	 		
                    	 		
                    	 		
                    	 		if(record.actionPerformed=='' || record.actionPerformed==null)
                    	 			{
                    	 			$('#status1').empty();
                    	 			selectValues = { 'Intimated': 'Intimated', 'UnderProgress': 'Under Progress', 'Resolved': 'Resolved' };
                    				                   				

                    				$.each(selectValues, function(key, value) { 
                    					
                    						if(key==record.status)
                    							{
                    				     $('#status1')
                    				         .append($("<option selected></option>")
                    				                    .attr("value",key)
                    				                    .text(value)); 
                    							}
                    						else
                    							{
                    							 $('#status1')
                        				         .append($("<option></option>")
                        				                    .attr("value",key)
                        				                    .text(value));
                    							}
                    						
                    				});
                    	 			
                    	 		
                    	 	 	$("#actionDialog").dialog({
                    	 	 		title : 'Action taken for '+(findObjectByKey(shellDefect, 'Value',record.shellDefectId)).DisplayText,                     	 	 		
                    	 	 		close: function (e, u) {
              	 		              //$(".formError").remove();
              	 		          	$("#actionDialog").validationEngine('hideAll');
              	 		          },
                	 		 	
 		 							buttons: {
	                                    Submit: function () {
	                                    		
	                                    	//alert("$('#qtyDispatched').val()->"+$('#qtyDispatched').val());
	                                    	//alert("record.balanceQtyToDispatch->"+record.balanceQtyToDispatch);
	                            	 		
	                                    	if ($('#actionPerformed').validationEngine('validate')) {
				                                        	//alert(!$("#dialog").validationEngine('validate'));
				                                            return false;
				                                        }
	                                    		    	   
	                                    	$.ajax({
	                    						url : "actionForShellDefect",
	                    						dataType: 'json', 
	                    						data : {
	                    							
	                    							abid: record.abid,
	                    							actionPerformed:$('#actionPerformed').val(),
	                    							remarks:$('#remarks').val(),
	                    							status: $('#status1').val()
	                    						},
	                    						
	                    						type : 'POST',
	                    						async : false,
	                            	 		})
	                    						.done(function( msg ) {
	                    							
	                    							
	                    							$('#actionPerformed').val('');
	                    							$('#remarks').val('');
	                    							$('#status1').val('');
	                    							$('#actionDialog').dialog('close');
	                    							if(msg.res==true)
	                    								{
	                    								$('#status').html("Action Performed Saved Successfully");
	                    								
	                    								}
	                    							else
	                    								{ alert("Action/Remarks is already assigned for the selected date");
	                    								
	                    								}
	                    									$('#ShellDefectsTableContainer').jtable('load');
	         								  })
	         								.error(function (msg){
	         									//$('#dialog').dialog('close');
	         									alert("Error Fetching Data");
	         								})
	         								  ;
					                 			    	   return true;
				                                    },
				                        Close: function () {
				                        	
				                                        $(this).dialog('close');
				                                    }
	                                    },
	                    	        modal: true
    	    });
                    	 		
                    	 		
                    	 		
                    	 	 }	
                    	 		else
                    	 		{
                    	 			alert("Action is already submitted for the selected Shell Defect");
                    	 			                    	 			}
                    	 		    
            			    	   return true;
                    	 		    
                    	 			  
                    	 		  }//ending else               	  
                    	  // ajax call ends here				
    						 
                        }
                    }
            ]
            },	
		
		//TOOLBAR BUTTON ENDS HERE 
		
		
		actions : {
			listAction : 'listShellDefectAction',
			createAction : 'createShellDefectAction',
			updateAction : 'updateShellDefectAction',
			deleteAction : 'deleteShellDefectAction'
		},

		fields : {
			sno:{
				title : 'SNo',
				width : '5%',
				create: false,
				edit : false,
				display: function(data)
				{
					
					srno++;
					return srno;
				}
			},
			abid : {
				title : 'abid',
				width : '5%',
				key : true,
				list : false,
				edit : false,
				create : false
			},
			shellAssetId: {
				title : 'Shell No',
				 display:function(data){
					
					 if (data.record.shellAssetId != null) {
									 
					return (findObjectByKey(shellNo, 'Value', data.record.shellAssetId)).DisplayText;
					 }
										},  
				options: shellNo,
				width : '5%',
				edit : true
			},
			shellDefectId: {
				title : 'Defect Type',
				display:function(data){
					
					 if (data.record.shellDefectId != null) {
					//alert(data.record.id.hodyCode)	;				 
					return (findObjectByKey(shellDefect, 'Value', data.record.shellDefectId)).DisplayText;
					 }
										}, 
				options: shellDefect,
				width : '10%',
				edit : true
			},
			detailShellDefectDescription:{
				title : 'Detailed Description',
				inputClass: 'validate[required]',
                type : 'textarea',
				width : '15%',
				edit : true
			}, 
			
			defectReportedDate : {
				title : 'Occurance date',
				width : '5%',
				type : 'date',
				displayFormat: 'dd-mm-yy',
				edit : true
			},
			
			actionPerformed: {
				title : 'Action Taken',
				width : '15%',
				type : 'textarea',
				edit : true,
				create: false
			},


			remarks: {
				title : 'Remarks',
				width : '15%',
				type : 'text',
				edit : true,
				create: false
			},
			
			status: {
				title : 'Status',
				width : '5%',
				options: { 'Intimated': 'Intimated', 'UnderProgress': 'Under Progress', 'Resolved': 'Resolved' },
				edit : true,
				create: false
			},
		},
		//rowInserted function get called for each and every row during listing of jtable
		rowInserted:function(event,data)
		{
			if(data.record.status=='Resolved')
			{
			//alert("inside resolved");
			//data.row.find('.jtable-edit-button').css("opacity",1);
			//data.row.find('.jtable-edit-button').off("click");
			data.row.find('.jtable-edit-command-button').hide();
			data.row.find('.jtable-delete-command-button').hide();
			}
		else
			{
			data.row.find('.jtable-edit-command-button').show();
			data.row.find('.jtable-delete-command-button').show();
			}
			//if(data.record.actionPerformed!=null)
			//	{
			if(data.record.actionPerformed!='' && data.record.actionPerformed!=null)
				{
				//alert("inside resolved");
				//data.row.find('.jtable-edit-button').css("opacity",1);
				//data.row.find('.jtable-edit-button').off("click");
				
				data.row.find('.jtable-delete-command-button').hide();
				}
			else
				{
				
				data.row.find('.jtable-delete-command-button').show();
				}
			//	}
		},
		formCreated: function(event,data)
		{
			$('[name=defectReportedDate]').
			datepicker("option", "disabled", false ).
			val('').css('background-color' ,'').datepicker("option", "maxDate", new Date);
			$('[name=defectReportedDate]').val(moment(data.record.defectReportedDate).format('DD-MM-YYYY'));

			if(data.formType=='edit')
				{
				if(data.record.actionPerformed=='' || data.record.actionPerformed==null)
					{

$( "#jtable-edit-form .jtable-input-label:contains('Action Taken')" ).parent().hide();
					$('#Edit-actionPerformed').hide();
					$( "#jtable-edit-form .jtable-input-label:contains('Remarks')" ).parent().hide();
					$('#Edit-remarks').hide();
					
	$("#jtable-edit-form .jtable-input-label:contains('Status')" ).parent().hide();
	$('#Edit-status').hide();
	
	
					}
				else{
					$( "#jtable-edit-form .jtable-input-label:contains('Action Taken')" ).parent().show();
					$('#Edit-actionPerformed').show();
					$( "#jtable-edit-form .jtable-input-label:contains('Remarks')" ).parent().show();
					$('#Edit-remarks').show();
					
					
					$("#jtable-edit-form .jtable-input-label:contains('Status')" ).parent().show();
					$('#Edit-status').show();

					$("#jtable-edit-form .jtable-input-label:contains('Defect Type')" ).parent().hide();
					$('#Edit-shellDefectId').hide();
					$("#jtable-edit-form .jtable-input-label:contains('Shell No')" ).parent().hide();
					$('#Edit-shellAssetId').hide();
									
			      
			        $('[name=defectReportedDate]').datepicker("destroy").addClass('jtable-input-readonly').prop('readonly', true);
					
			        $('#Edit-detailShellDefectDescription').prop('readonly', true);
			        $('#Edit-detailShellDefectDescription').addClass('jtable-input-readonly');
				}
				
				
				
				}

			data.form.validationEngine();
		},
		formSubmitting: function(event,data)
		{
			if(data.formType=='edit')
			{
			if($('#Edit-actionPerformed').val()=='')
			{
			
			$('#Edit-actionPerformed').addClass('validate[required]');
			}
		else
			{
			$('#Edit-actionPerformed').removeClass('validate[required]');
			}
			}
			return data.form.validationEngine('validate');
		},
		//Dispose validation logic when form is closed
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
			$('#ShellDefectsTableContainer').jtable('load');
		},
		
		recordUpdated: function(event,data)
		{
			srno=0;
			$('#ShellDefectsTableContainer').jtable('load');
		},
	});
	
	$('#ShellDefectsTableContainer').jtable('load');

});




</script>


</head>
<body>



	<div
		style="width: 80%; margin-right: 10%; margin-left: 10%; text-align: left;">
		<h3>Shell Defect Reported</h3>
		<div align="center" id="status"></div>
		<div id="ShellDefectsTableContainer"></div>
	</div>
	<!--  Dialog box code start here -->
	 <div id="actionDialog" style="height:150%; width:200%; display:none;z-index: 9;" >
  <br>

			  <br>
			 Enter Action To be Performed: <br>
		     <textarea  id="actionPerformed" class='validate[required]' ></textarea>
		     <br>
		      <br>
		      Remarks: <br>
		     <textarea id="remarks" ></textarea>
		     
		     <br>
		      Status: <br>
		     <select id="status1" ></select>
 </div>
 <!--  Dialog box code ends here -->
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