
$(document).ready(function() {
	$('#EmpmasterTableContainer').jtable({
		title : 'Employee List',
		actions : {
			listAction : 'listEmpAction',
			createAction : 'createEmpAction',
			updateAction : 'updateEmpAction',
			//deleteAction : 'deleteAssetAction'
		},
		

		fields : {
			emp_no : {
				title : 'Emp No',
				width : '10%',
				edit :false,
				list: true,
				create: true,
				key: true
			},
			
		
			emp_name : {
				title : 'Emp Name',
				width : '10%',
				key: true,
				list: true,
				edit : true,
				create: true
				
			},
			
			shop: {
				title : 'Shop',
				width : '10%',
				edit : true,
				list:true
				
			},
			section : {
				title : 'Section',
				width : '10%',
				edit : true,
				list:true
				
			},
			
			cadre : {
				title : 'Cadre',
				width : '10%',
				edit : true,
				list: true
				
			},
			
	},
		
	});
	
	$('#EmpmasterTableContainer').jtable('load');

}); 
