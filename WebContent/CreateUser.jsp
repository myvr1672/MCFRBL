<head>
<title>Create new User</title>
<% String contextpath=request.getContextPath();%>
<script src="<%=contextpath %>/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/jquery-ui-1.11.4.custom/jquery-ui.js" type="text/javascript"></script>
<link href="<%=contextpath %>/css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />


<link rel="stylesheet" href="<%=contextpath%>/js/jquery-ui-1.11.4.custom/jquery-ui.css">
<script src="<%=contextpath %>/js/jquery.jtable.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/moment.js" type="text/javascript"></script>
<link href="<%=contextpath%>/js/validationEngine/validationEngine.jquery.css" rel="stylesheet"type="text/css" />

<script src="<%=contextpath%>/js/validationEngine/jquery.validationEngine.js" type="text/javascript"></script>
<script src="<%=contextpath%>/js/validationEngine/jquery.validationEngine-en.js" type="text/javascript"></script>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <script src="<%=contextpath %>/js/CreateUserTableJtable.js" type="text/javascript"></script> --%>



</head>

  <h4>Default password for newly created user is <b><i>MCFRBL@123</i></b>. Kindly change password after login.</h4>
	<div style="width: 90%; margin-right: 5%; margin-left: 0%; text-align: center; margin-top:2%">
		<b>Already Existing User in the System</b>
		<div id="CreateUserTableContainer"></div>
	</div>
<style>
#jtable-create-form, #jtable-edit-form {
	
	display: block;
	width: 500px;
	
}
.jtable-input-readonly{
     background-color:lightgray;
}
</style>
<script>
$(document).ready(function() {
	var messages={
			areYouSure:'Are you sure?',
			addNewRecord:'Create new User'
	}
	var srno;
	
	
	var coachTypes=[];
	var k=1;
		
	coachTypes[0]={ Value: "All", DisplayText: "All"};
		<c:forEach var="a" items="${coachType}">
		coachTypes[k]={ Value: "${a}", DisplayText: "${a}"};
		k++;
		</c:forEach>
	
	
	$('#CreateUserTableContainer').jtable({
		title : 'User List',
		sorting: true,
		messages:messages,
		defaultSorting: 'userid ASC',
		actions : {
			listAction : 'listUserAction',
			createAction : 'createUserAction',
			updateAction : 'updateUserAction',
			deleteAction : 'deleteUserAction'
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
			userid : {
				title : 'User ID',
				width : '5%',
				key : true,
				list : true,
				edit : false,
				create :true
				
			},
			
			userType : {
				title : 'User Type',
				width : '8%',
				options: {'System Admin':'System Admin', 'Production':'Production Module','Manpower':'Manpower Utilization','Worker':'Worker','testingClearance':'Testing Clearance','Management':'Higher Management', 'maintenance':'Plant Maintenance'},
				edit : true
			},
			userName : {
				title : 'User Name',
				width : '10%',
				edit : true,
				inputClass: 'validate[required]'
			},
			email : {
				title : 'Email',
				width : '10%',
				edit : true,
				inputClass: 'validate[required, custom[email]]'
			},
			telephone : {
				title : 'Phone No.',
				width : '5%',
				edit : true,
				inputClass: 'validate[required, custom[phone_indian]]'
			},
			
			designation : {
				title : 'Designation',
				width : '5%',
				edit : true,
				inputClass: 'validate[required]'
			},
			dept : {
				title : 'Department',
				width : '5%',
				edit : true
			},
			
			coachtypes : {
				title : 'Responsible For',
				options: coachTypes,
				
				edit : true,
				list: false,
				create: true
			},
			coachtype1: {
				title : 'Responsible For',
				display: function(data)
				{

					return data.record.coachtypes;
				},
				width : '10%',
				edit : false,
				create: false
							},
							
							
			roles : {
				title : 'Authorization',
				options:['All'],
				
				edit : true,
				list: false,
			},
			roles1: {
				title : 'Authorization',
				display: function(data)
				{
					
					
					return data.record.roles;
				},
				
				width : '10%',
				edit : false,
				create: false
							},
							
							
							empId : {
								title : 'Employee Id',
								
								width : '10%',
								edit : true,
								list: true,
							},
		},
		formCreated: function (event, data) {
			data.form.find('select[name=coachtypes]').attr('disabled', true);
			 data.form.find('select[name=coachtypes]').removeAttr('multiple');
		     //   $('#Edit-coachType').addClass('jtable-input-readonly');
			if($("[name=userType]").val()=='Production')
			{
			
			//$('[name=roles]').show();
			data.form.find('select[name=roles]').attr('multiple','multiple');
			
			selectValues = { "SheetMetal": "Sheet Metal", "Wheel": "Wheelset", "Bogie": "Bogie", "Shell": "Shell" , "Paint": "Paint" ,
					"Furnishing": "Furnishing", "Electrical": "Electrical", "Testing": "Testing", "Tool":"Tool Room", "CoachManufactured": "Coach Manufactured", 
					"CoachTurnout": "Coach Turnout" };
			

			$.each(selectValues, function(key, value) {   
			     $('[name=roles]')
			         .append($("<option></option>")
			                    .attr("value",key)
			                    .text(value)); 
			});
			}
			
			else if($("[name=userType]").val()=='Manpower')
			{
			
    
			data.form.find('select[name=roles]').attr('multiple','multiple');
			
			
			
			
			selectValues = { "JobCreation": "Job Creation", "ShiftAllocation": "Shift Allocation", "Attendance": "Attendance Marking", "JobAllocation": "Job Allocation" };
			

			$.each(selectValues, function(key, value) {   
			     $('[name=roles]')
			         .append($("<option></option>")
			                    .attr("value",key)
			                    .text(value)); 
			});
			
            
			
			
			} 
			else if($("[name=userType]").val()=='testingClearance')
			{
        
				data.form.find('select[name=coachtypes]').attr('disabled', false);
				 data.form.find('select[name=coachtypes]').attr('multiple','multiple');
			
			    //    $('#Edit-coachType').removeClass('jtable-input-readonly');
			//$('[name=roles]').show();
			
			
			data.form.find('select[name=coachtypes]').attr('multiple','multiple');
			data.form.find('select[name=roles]').attr('multiple','multiple');
			
			
		//ye code dekhana hai:	
			
			$.ajax({
	            type: "post",
	            async:false,
	            url:"getSubStages", 
	            dataType:'json',
	        data:{
	           parentStage:  "'5','6','7'"       
	              }
	        })

	 .done(function(msg)
	                		   {
		 
		 for(i=0;i<msg.subStageIdList.length;i++)
		   {
		  
		   $('[name=roles]').append('<option value='+msg.subStageIdList[i]+'>'+msg.subStageDescriptionList[i]+'</option>');
		   } 
	 
	/*	 for (var j=0;i<msg.coachesList.length;j++)   
  		 
  		   { 
  			   
  			          $('[name=coachtypes]').append('<option value='+msg.coachesList[j]+'>'+msg.coachesList[j]+'</option>'); 
  			   }  */
	                
		 
	                		   })
	                		   .error(function (msg)
	                				   {
	                			   alert("Error in retrieving data");
	                				   });
			
			
			
			
	                   
	                }
			

					else
			{
						data.form.find('select[name=coachtypes]').attr('disabled', true);
						
			data.form.find('select[name=roles]').removeAttr('multiple');
			data.form.find('select[name=coachtypes]').removeAttr('multiple');
			$('[name=roles]')
			.find('option')
    .remove()
    .end()
	         .append($("<option></option>")
	                    .attr("value","All")
	                    .text("All"));
			
			
			}
			
		    $("[name=userType]").on('change', 
			function() {
		if($("[name=userType]").val()=='Production')
			{
			data.form.find('select[name=coachtypes]').attr('disabled', true);
			 data.form.find('select[name=coachtypes]').removeAttr('multiple');
				data.form.find('select[name=roles]').removeAttr('multiple');

			$('[name=roles]')
			.find('option')
    .remove()
    .end()
	         .append($("<option></option>")
	                    .attr("value","All")
	                    .text("All"));
			
			
			
			//$('[name=roles]').show();
			data.form.find('select[name=roles]').attr('multiple','multiple');
				selectValues = {"SheetMetal": "Sheet Metal", "Wheel": "Wheelset", "Bogie": "Bogie", "Shell": "Shell" , "Paint": "Paint" ,
					"Furnishing": "Furnishing", "Electrical": "Electrical", "Testing": "Testing","Tool":"Tool Room", "CoachManufactured": "Coach Manufactured", 
					"CoachTurnout": "Coach Turnout" };
			

			$.each(selectValues, function(key, value) {   
			     $('[name=roles]')
			         .append($("<option></option>")
			                    .attr("value",key)
			                    .text(value)); 
			});
		
			}
		else if($("[name=userType]").val()=='Manpower')
		{
			data.form.find('select[name=coachtypes]').attr('disabled', true);
			 data.form.find('select[name=coachtypes]').removeAttr('multiple');

			$('[name=roles]')
			.find('option')
    .remove()
    .end()
	         .append($("<option></option>")
	                    .attr("value","All")
	                    .text("All"));
		
		
		//$('[name=roles]').show();
		data.form.find('select[name=roles]').attr('multiple','multiple');
			selectValues = { "JobCreation": "Job Creation", "ShiftAllocation": "Shift Allocation", "Attendance": "Attendance Marking", "JobAllocation": "Job Allocation" };
		

		$.each(selectValues, function(key, value) {   
		     $('[name=roles]')
		         .append($("<option></option>")
		                    .attr("value",key)
		                    .text(value)); 
		});
		}
		else if($("[name=userType]").val()=='testingClearance')
		{
			data.form.find('select[name=coachtypes]').attr('disabled', false);
			 data.form.find('select[name=coachtypes]').attr('multiple','multiple');
			
			
		//$('[name=roles]').show();
		
		data.form.find('select[name=roles]').attr('multiple','multiple');
		
		
	//ye code dekhana hai:	
		
		$.ajax({
            type: "post",
            async:false,
            url:"getSubStages", 
            dataType:'json',
data:{
           parentStage:  "'5','6','7'"       
}
        })

 .done(function(msg)
                		   {
                	   if(msg.subStageIdList!=null)
                		   {
                		  
                		   for(i=0;i<msg.subStageIdList.length;i++)
                			   {
                			   $('[name=roles]').append('<option value='+msg.subStageIdList[i]+'>'+msg.subStageDescriptionList[i]+'</option>');
                			   }
                		   }
                	   
             /*   	   for (var j=0; j<msg.coachesList; j++)   
            		   {  $('[name=coachtypes]').append('<option value='+msg.coachesList[j]+'>'+msg.coachesList[j]+'</option>');  }
             */
                	   
                	   
                		   })
                		   .error(function (msg)
                				   {
                			   alert("Error in retrieving data");
                				   });
                   
                }
		
		else
			{
			data.form.find('select[name=coachtypes]').attr('disabled', true);
			 
			data.form.find('select[name=roles]').removeAttr('multiple');
			data.form.find('select[name=coachtypes]').removeAttr('multiple');
			$('[name=roles]')
			.find('option')
    .remove()
    .end()
	         .append($("<option></option>")
	                    .attr("value","All")
	                    .text("All"));
			
			
			
			
			}
            	//alert($("[name=userType]").val());
				
			});
          
          
 //data.form.find('select[name=roles]').attr('multiple','multiple');
 	data.form.validationEngine();
            
      },
			//Validate form when it is being submitted
		formSubmitting: function (event, data) {
			//alert("submitting form");
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
//		recordAdded: function(event,data)
//		{
//			alert(data.serverResponse.message);
//		},
	    
		recordDeleted: function(event,data)
		{
			srno=0;
			$('#CreateUserTableContainer').jtable('load');
		},
		recordUpdated:function(event,data)
		{
			srno=0;
			$('#CreateUserTableContainer').jtable('load');
		},
		
	});
	
	$('#CreateUserTableContainer').jtable('load');

});
</script>