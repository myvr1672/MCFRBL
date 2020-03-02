$(document).ready(function() {
	var srno;
	$('#CreateUserTableContainer').jtable({
		title : 'User List',
		sorting: true,
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
				width : '20%',
				key : true,
				list : true,
				edit : false,
				create :true
				
			},
			
			userType : {
				title : 'User Type',
				width : '20%',
				options: {'System Admin':'System Admin', 'DEO':'Data Entry User', 'Management':'Higher Management', 'All':'Super User'},
				edit : true
			},
			userName : {
				title : 'User Name',
				width : '20%',
				edit : true
			},
			email : {
				title : 'Email',
				width : '20%',
				edit : true
			},
			telephone : {
				title : 'Phone No.',
				width : '20%',
				edit : true,
				inputClass: 'validate[required]'
			},
			
			designation : {
				title : 'Designation',
				width : '20%',
				edit : true
			},
			dept : {
				title : 'Department',
				width : '20%',
				edit : true
			},
		
			
		},
		formCreated: function (event, data) {
            alert("form created");
			data.form.validationEngine();
            
        },
			//Validate form when it is being submitted
		formSubmitting: function (event, data) {
			alert("submitting form");
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