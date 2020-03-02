$(document).ready(function() {
	var srno;
	$('#AbnormalityTableContainer').jtable({
		title : 'Abnormality List',
		sorting: true,
		defaultSorting: 'abid ASC',
		actions : {
			listAction : 'listAbnormalityAction',
			createAction : 'createAbnormalityAction',
			updateAction : 'updateAbnormalityAction',
			deleteAction : 'deleteAbnormalityAction'
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
			abid : {
				title : 'abid',
				
				key : true,
				list : false,
				edit : false,
				create : false
			},
			abnormalityDescription : {
				title : 'Description',
				options: {'Failure of a machine':'Failure of a machine','Lack of critical material':'Lack of critical material','Change in production schedule':'Change in production schedule',
					'Drastically less production by a particular section':'Drastically less production by a particular section', 
					'Critical components required within the procurement lead time':'Critical components required within the procurement lead time', 'Contractor failure':'Contractor failure','Lack of manpower':'Lack of manpower',
					'Coaches held up for final gate out on account of waiting for loco':'Coaches held up for final gate out on account of waiting for loco',
					'Coaches held up for final gate out on account of waiting for rake formation':'Coaches held up for final gate out on account of waiting for rake formation','Others':'Others'},
				width : '20%',
				edit : true
			},
			shop : {
				title : 'Shop',
				options: {'Shell':'Shell Shop', 'test':'test'},
				width : '20%',
				list: true,
				edit : true
			},	
					
			createdate : {
				title : 'Occurance date',
				width : '25%',
				type : 'date',
				displayFormat: 'dd-mm-yy',
				edit : true
			},
			
		},
		formCreated: function(event,data)
		{
			$('[name=createdate]').
			datepicker("option", "disabled", false ).
			val('').css('background-color' ,'').datepicker("option", "maxDate", new Date);
//			$('#Edit-createdate').datepicker({
//				 maxDate: new Date(),
//		       	// minDate: '-1970/01/07'
//		       	});
//			$('[name=createdate]').prop('readonly', true);
		},
		loadingRecords: function(event,data)
		{
			srno=0;
		},
		recordDeleted: function(event,data)
		{
			srno=0;
			$('#AbnormalityTableContainer').jtable('load');
		},
		
		recordUpdated: function(event,data)
		{
			srno=0;
			$('#AbnormalityTableContainer').jtable('load');
		},
	});
	
	$('#AbnormalityTableContainer').jtable('load');

});