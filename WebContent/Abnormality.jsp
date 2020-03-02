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
.jtable-input-readonly{
     background-color:lightgray;
}
</style>
<script>



$(document).ready(function() {
	
	var shops=[]; 

	//start: retrieving shops in dropdown

	var i=0;
	<c:forEach var="a" items="${shopList}">
	        shops[i]={ Value: "${a.shopId}", DisplayText: "${a.shopName}" };
		i++;
	    </c:forEach>
	
	  //end: retrieving shops in dropdown
	  
	  //start: retrieving abnormality in dropdown option
	    var abnormalities=[]; 

		

		var j=0;
		<c:forEach var="b" items="${abnormalityList}">
		abnormalities[j]={ Value: "${b.key}", DisplayText: "${b.value}" };
			j++;
		    </c:forEach>
		  //end: retrieving abnormality in dropdown option
	var srno;
	$('#AbnormalityTableContainer').jtable({
		title : 'Abnormality List',
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
                        	
                        	 var $selectedRows = $('#AbnormalityTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a abnormality for which you want to perform action");
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
                    	 	 		title : 'Action taken for '+(findObjectByKey(abnormalities, 'Value',record.abnormalityID)).DisplayText,                     	 	 		
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
	                    						url : "actionForAbnormality",
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
	                    									//alert("Action/Remarks assigned successfully for the selected Abnormality");
	                    								}
	                    							else
	                    								{ alert("Action/Remarks is already assigned for the selected Abonormality date");
	                    								
	                    								}
	                    									$('#AbnormalityTableContainer').jtable('load');
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
                    	 			alert("Action is already submitted for the selected abnormality");
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
			listAction : 'listAbnormalityAction',
			createAction : 'createAbnormalityAction',
			updateAction : 'updateAbnormalityAction',
			deleteAction : 'deleteAbnormalityAction'
		},

		fields : {
			sno:{
				title : 'SNo',
				width:'2%',
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
				
				key : true,
				list : false,
				edit : false,
				create : false
			},
			abnormalityID: {
				title : 'Description',
				display:function(data){
					
					 if (data.record.abnormalityID != null) {
					//alert(data.record.id.hodyCode)	;				 
					return (findObjectByKey(abnormalities, 'Value', data.record.abnormalityID)).DisplayText;
					 }
										}, 
				options: abnormalities,
				width : '15%',
				edit : true
			},
			
			
			detailAbnormalityDescription:{
				title : 'Detailed Description',
				inputClass: 'validate[required]',
				type : 'textarea',
				width : '15%',
				edit : true
			}, 
			
			shop : {
				title : 'Shop',
				options: shops,
				width : '8%',
				list: true,
				edit : true
			},		
			createdate : {
				title : 'Occurance date',
				width : '8%',
				type : 'date',
				
				displayFormat: 'dd-mm-yy',
				edit : true
			},
			
			actionPerformed: {
				title : 'Action Taken',
				width : '25%',
				type : 'textarea',
				edit : true,
				create: false
			},


           remarks: {
				title : 'Remarks',
				width : '20%',
				type : 'textarea',
				edit : true,
				create: false
			},
			
			status: {
				title : 'Status',
				width : '8%',
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
			$('[name=createdate]').
			datepicker("option", "disabled", false ).
			val('').css('background-color' ,'').datepicker("option", "maxDate", new Date);
			$('[name=createdate]').val(moment(data.record.createdate).format('DD-MM-YYYY'));
//			$('#Edit-createdate').datepicker({
//				 maxDate: new Date(),
//		       	// minDate: '-1970/01/07'
//		       	});
//			$('[name=createdate]').prop('readonly', true);
			if(data.formType=='edit')
				{
				if(data.record.actionPerformed=='' || data.record.actionPerformed==null)
					{

$( "#jtable-edit-form .jtable-input-label:contains('Action Taken')" ).parent().hide();
					$('#Edit-actionPerformed').hide();
					$( "#jtable-edit-form .jtable-input-label:contains('Remarks')" ).parent().hide();
					$('#Edit-remarks').hide();
					
	$("#jtable-edit-form .jtable-input-label:contains('Status')" ).parent().hide();
	$('#Edit-actionPerformed').hide();
	
	
					}
				else{
					$( "#jtable-edit-form .jtable-input-label:contains('Action Taken')" ).parent().show();
					$('#Edit-actionPerformed').show();
					$( "#jtable-edit-form .jtable-input-label:contains('Remarks')" ).parent().show();
					$('#Edit-status').show();
					
					$("#jtable-edit-form .jtable-input-label:contains('Status')" ).parent().show();
					$("#jtable-edit-form .jtable-input-label:contains('Description')" ).parent().hide();
					$('#Edit-abnormalityID').hide();
					$('#Edit-shop option:not(:selected)').remove();
					
			        $('#Edit-shop').addClass('jtable-input-readonly');
			        $('#Edit-detailAbnormalityDescription').prop('readonly', true);
			        $('#Edit-detailAbnormalityDescription').addClass('jtable-input-readonly');
			       
					
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
			$('#AbnormalityTableContainer').jtable('load');
		},
		
		recordUpdated: function(event,data)
		{
			srno=0;
			$('#AbnormalityTableContainer').jtable('load');
		},
	});
	
	$('#AbnormalityTableContainer').jtable('load');

});




</script>


</head>
<body>



	<div
		style="width: 98%; margin-right:0%; margin-left: 2%; text-align: left;">
		<h3>Abnormality (Alarm Reported)</h3>
		<div align="center" id="status"></div>
		<div id="AbnormalityTableContainer"></div>
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