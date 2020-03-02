

$(document).ready(function() {
	var srno;
	$('#SafetyInstructionMasterTableContainer').jtable({
		title : 'Safety Instruction Master',
		actions : {
			listAction : 'listSafetyInstructionMasterAction',
			createAction : 'createSafetyInstructionMasterAction',
			updateAction : 'updateSafetyInstructionMasterAction',
			deleteAction : 'deleteSafetyInstructionMasterAction'
		},
		

		fields : {
			sno:{
				title : 'SNo',
				create: false,
				edit : false,
				width: '15%',
				display: function(data)
				{
					
					srno++;
					return srno;
				}
			},
		
			safety_instruction_id : {
				title : 'safety_instruction_id',
				width : '80%',
				list: false,
				create: false,
				key: true
				
			},
			
		
			safety_instruction_description : {
				title : 'Safety Instruction',
				width : '20%',
				list: true,
				edit : true,
				create: true
				
				
			},
			
			
			
	},
	loadingRecords: function(event,data)
	{
		srno=0;
	},
	 recordDeleted: function(event,data)
		{
			srno=0;
			$('#SafetyInstructionMasterTableContainer').jtable('load');
		},
		
	});
	
	$('#SafetyInstructionMasterTableContainer').jtable('load');

}); 
