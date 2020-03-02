

$(document).ready(function() {
	$('#MachineFIRMasterTableContainer').jtable({
		title : 'Machine Failure Master',
		paging:true,
		actions : {
			listAction : 'listFailureAction',
			createAction : 'createFailureAction',
			updateAction : 'updateFailureAction',
			deleteAction : 'deleteFailureAction'
		},
		
			fields : {
			failure_code : {
				title : 'failure_code',
				width : '20%',
				list: true,
				create: true,
				edit : true,
				key: true
				
			},
			
		
			failure_description : {
				title : 'failure_description',
				width : '20%',
				list: true,
				edit : true,
				create: true
				
				
			},
			
			
			
			
	},
		
	});
	
	$('#MachineFIRMasterTableContainer').jtable('load');

}); 
