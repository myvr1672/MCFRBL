

$(document).ready(function() {
	$('#machine_operationTableContainer').jtable({
		title : 'machine List',
		actions : {
			listAction : 'listOperationAction',
			createAction : 'createOperationAction',
			updateAction : 'updateoperationAction',
			deleteAction : 'deleteOperationAction'
		},
		

		fields : {
			id : {
				title : 'id',
				width : '20%',
				list: true,
				create: false,
				key: true
				
			},
			
		
			operation : {
				title : 'operation',
				width : '20%',
				list: true,
				edit : true,
				create: true
				
			},
			
			
			
	},
		
	});
	
	$('#machine_operationTableContainer').jtable('load');

}); 
