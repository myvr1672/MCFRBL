

$(document).ready(function() {
	$('#MachineBreakdownTableContainer').jtable({
		title : 'Machine List',
		actions : {
			listAction : 'listMachineBreakdownAction',
			createAction : 'createMachineBreakdownAction',
			updateAction : 'updateMachineBreakdownAction',
			deleteAction : 'deleteMachineBreakdownAction'
		},
		

		fields : {
			machine_id : {
				title : 'machine_id',
				width : '20%',
				list: true,
				create: false,
				key: true
				
			},
			breakdown_details: {
				title : 'breakdown_details',
				width : '30%',
				edit : true,
				list:true
				
			},
			
	},
		
	});
	
	$('#MachineBreakdownTableContainer').jtable('load');

}); 
