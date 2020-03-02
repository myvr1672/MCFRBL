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
	
	var shops=[]; 

	//start: retrieving shops in dropdown

	var i=0;
	<c:forEach var="a" items="${shopList}">
	        shops[i]={ Value: "${a.shopId}", DisplayText: "${a.shopName}" };
		i++;
	    </c:forEach>
	
	  //end: retrieving shops in dropdown
	  
	  //start: autocomplete material in dropdown option
	    var materialLists=[]; 

		

		var j=0;
		<c:forEach var='b' items='${materialList}'>
		materialLists[j]={ value: '${b.key}', label: '${b.key}'+'-${b.value}' };
			j++;
		    </c:forEach>
		  //end: retrieving material in dropdown option
		  
		  //start: retrieving material in dropdown option
	    var materialLists1=[]; 

		

		var j=0;
		<c:forEach var='b' items='${materialList}'>
		materialLists1[j]={ Value: '${b.key}', DisplayText:'${b.value}' };
			j++;
		    </c:forEach>
		  //end: retrieving material in dropdown option
	var srno;
	$('#MaterialShortageTableContainer').jtable({
		title : 'Material Shortage List',
		paging:true,
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
                        	
                        	 var $selectedRows = $('#MaterialShortageTableContainer').jtable('selectedRows');
                    	 	 if ($selectedRows.length<1)
                    		 alert("Please select a material for which you want to perform action");
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
                    	 	 		title : 'Action taken for '+(findObjectByKey(materialLists1, 'Value',record.unifiedPLNo)).DisplayText,                     	 	 		
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
	                    						url : "actionForMaterialShortage",
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
	                    								{ alert("Action/Remarks is already assigned.");
	                    								
	                    								}
	                    									$('#MaterialShortageTableContainer').jtable('load');
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
                    	 			alert("Action is already submitted for the selected material");
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
			listAction : 'listMaterialShortageAction',
			createAction : 'createMaterialShortageAction',
			updateAction : 'updateMaterialShortageAction',
			deleteAction : 'deleteMaterialShortageAction'
		},

		fields : {
			sno:{
				title : 'SNo',
				create: false,
				edit : false,
				width:'7%',
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
			unifiedPLNo: {
				title :'PL No.',
				width : '10%',
				type:'textarea',
				edit : true,
				create: true
			},
			unifiedPLNo1: {
				title : 'Material Description',
 				display:function(data){
					
					 if (data.record.unifiedPLNo != null) {
				//alert(data.record.id.hodyCode)	;				 
				return (findObjectByKey(materialLists1, 'Value', data.record.unifiedPLNo)).DisplayText;
					 }
										}, 
				//options: materialLists1,
				width : '30%',
				create: false,
				edit : false
			},
			
			shop : {
				title : 'Shop',
				options: shops,
				width : '8%',
				list: true,
				edit : true
			},		
			dateOfReport : {
				title : 'Occurance date',
				width : '10%',
				type : 'date',
				
				displayFormat: 'dd-mm-yy',
				edit : true
			},
			qtyAvl:{
                title:'Qty Avl',
                width:'7%',
                inputClass: 'validate[custom[integer]]',
                list: true,
				edit : true
				},
				coachAffected:{
	                title:'Coach Affected',
	                width:'7%',
	                inputClass: 'validate[required, custom[integer]]',
	                list: true,
					edit : true
					},
				actionPerformed: {
				title : 'Action Taken',
				width : '20%',
				type : 'textarea',
				edit : true,
				create: false
			},


           remarks: {
				title : 'Remarks',
				width : '20%',
				type : 'text',
				edit : true,
				create: false
			},
			
			status: {
				title : 'Status',
				width : '10%',
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
			data.form.find('textarea[name="unifiedPLNo"]').attr('placeholder','Enter 4 digit of PL No. or Description to search');
			data.form.find('input[name="qtyAvl"]').attr('placeholder','Enter available quantity');
			$('[name=unifiedPLNo]').autocomplete({	
	        	source: materialLists,
		        	minLength: 4,
		        	open: function() {
	        		  $(".ui-autocomplete").width( $(this).innerWidth() );
	               
		            },
		            response: function (event, ui)
		            {
			            if(!ui.content.length){
	 			            
			            	$("[name=unifiedPLNo]").html("<b>No Entries Found</b>");
                  var result= {value: "error", label: "Drawing not exist"};
                  
                  ui.content.push(result);
                 // alert("Hi after push");
               //   $("[name=leftWheelAssetId2]").addClass("validate[custom[notExist]]");
                //  $('#AddRecordDialogSaveButton').addClass("disabled");
                  $('#AddRecordDialogSaveButton').prop("disabled", true);
                  
                  return false;
	 			            }
			            else {$('#AddRecordDialogSaveButton').prop("disabled", false);
			          $('#AddRecordDialogSaveButton').removeClass("disabled");}

			            },
		           // change: function (event, ui) { alert("change event called") },
                select: function (event, ui) {
                	
                	 $("[name=unifiedPLNo]").val(ui.item.label);
                	 $("[name=unifiedPLNo]").val(ui.item.value);
                	 	 
	                    return false;	              }
	        	
			         
		  }).focus(function () {$(this).autocomplete("search", $(this).val());
				  });






			
			$('[name=dateOfReport]').
			datepicker("option", "disabled", false ).
			val('').css('background-color' ,'').datepicker("option", "maxDate", new Date);
			//$('[name=dateOfReport]').val(moment(data.record.dateOfReport).format('DD-MM-YYYY'));

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
					$('#Edit-unifiedPLNo option:not(:selected)').remove();
					$('#Edit-shop option:not(:selected)').remove();   
					//$('#Edit-unifiedPLNo option:not(:selected)').attr('disabled', true);
					$('#Edit-unifiedPLNo').addClass('jtable-input-readonly');

					
					$('#Edit-shop').addClass('jtable-input-readonly');

					$('#Edit-dateOfReport').datepicker("option", "maxDate", null);
					//$('#Edit-dateOfReport').addClass('jtable-input-readonly');
					$('[name=dateOfReport]').datepicker("destroy").addClass('jtable-input-readonly').prop('readonly', true);
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
			$('#MaterialShortageTableContainer').jtable('load');
		},
		
		recordUpdated: function(event,data)
		{
			srno=0;
			$('#MaterialShortageTableContainer').jtable('load');
		},
	});
	
	$('#MaterialShortageTableContainer').jtable('load');

});




</script>


</head>
<body>



	<div
		style="width: 80%; margin-right: 10%; margin-left: 10%; text-align: left;">
		
		<div align="center" id="status"></div>
		<div id="MaterialShortageTableContainer"></div>
	</div>
	<!--  Dialog box code start here -->
	 <div id="actionDialog" style="height:100%; width:100%; display:none;z-index: 9;" >
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