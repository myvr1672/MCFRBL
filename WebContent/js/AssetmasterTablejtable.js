
$(document).ready(function() {
	$('#AssetmasterTableContainer').jtable({
		title : 'Coach List',
		paging:true,
		actions : {
			listAction : 'listAssetAction',
			createAction : 'createAssetAction',
			updateAction : 'updateAssetAction',
			//deleteAction : 'deleteAssetAction'
		},
		

		fields : {
			asset_subtype : {
				title : 'Coach Type',
				width : '20%',
				list: true,
				create: true,
				key: true
			},
			
		
			asset_type : {
				title : 'Category',
				width : '20%',
				key: true,
				list: true,
				edit : true,
				create: true
				
			},
			
			asset_subtype_description: {
				title : 'Description',
				width : '30%',
				edit : true,
				list:true
				
			},
			asset_subtype_class : {
				title : 'Class',
				width : '30%',
				edit : true,
				list:true
				
			},
			
			asset_subtype_capacity : {
				title : 'Capacity',
				width : '30%',
				edit : true,
				list: true
				
			},
			
	},
		
	});
	
	$('#AssetmasterTableContainer').jtable('load');

}); 
