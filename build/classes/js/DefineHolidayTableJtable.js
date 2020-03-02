$(document).ready(function() {
	var srno;
	$('#DefineHolidayTableContainer').jtable({
		title : 'Define New Holiday',
		sorting: true,
		defaultSorting: 'sortSeq ASC',
		actions : {
			listAction : 'listDefineHolidayAction',
			createAction : 'createDefineHolidayAction',
			updateAction : 'updateDefineHolidayAction',
			deleteAction : 'deleteDefineHolidayAction'
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
			hodyType : {
				title : 'Holiday Type',
				width : '20%',
				options: {'GH':'Gazetted Holiday', 'NH':'National Holiday'},
				edit : true,
				list: true,
				create : true
			},
			hodyCode : {
				title : 'Holiday Code',
				width : '20%',
				key : true,
				list : true,
				edit : true,
				create : true
			},
			hodyDesc : {
				title : 'Holiday Description',
				width : '20%',
				key : true,
				list : true,
				edit : true,
				create : true
			},
			
		},
		loadingRecords: function(event,data)
		{
			srno=0;
		},
		recordDeleted: function(event,data)
		{
			srno=0;
			$('#DefineHolidayTableContainer').jtable('load');
		},
		recordUpdated:function(event,data)
		{
			srno=0;
			$('#DefineHolidayTableContainer').jtable('load');
		},
	});
	
	$('#DefineHolidayTableContainer').jtable('load');

});