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
				create : true
				inputClass: 'validate[required]'
			},
			
			userType : {
				title : 'User Type',
				width : '20%',
				options: {'System Admin':'System Admin', 'DEO':'Data Entry User', 'Management':'Higher Management'},
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
				edit : true
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
		
			
//			createdate : {
//				title : 'Createdate',
//				width : '15%',
//				type : 'date',
//				displayFormat: 'dd-mm-yy',
//				edit : true
//			},
			
		},
		loadingRecords: function(event,data)
		{
			srno=0;
		},
		formCreated: function (event, data) {
			                data.form.find('input[name="userid"]').addClass('validate[required]');
			                data.form.find('input[name="email"]').addClass('validate[required,custom[email]]');
			                data.form.find('input[name="userName"]').addClass('validate[required]');
			                data.form.find('input[name="designation"]').addClass('validate[required]');
			                data.form.validationEngine();
			            },
			formSubmitting: function (event, data) {
				                return data.form.validationEngine('validate');
				            },
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
		formClosed: function (event, data) {
			                data.form.validationEngine('hide');
			                data.form.validationEngine('detach');
			            }
	});
	
	$('#CreateUserTableContainer').jtable('load');

});