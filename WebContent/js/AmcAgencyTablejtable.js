
$(document).ready(function() {
	$('#AmcAgencyTableContainer').jtable({
		title : 'Machine Amc Agency',
		
		
		
        sorting: true,
        defaultSorting: 'amc_agency_name ASC',
        selecting: false, //Enable selecting
        multiselect: false, 
        multiSorting: true,
        animationsEnabled : true,
      //  toolbarsearch:true,
		actions : {
			listAction : 'listAmcAction',
			createAction : 'createAmcAction',
			updateAction : 'updateAmcAction',
			deleteAction : 'deleteAmcAction'
		},
		

		fields : {
			amc_agency_id : {
				title :'Id',
				width : '20%',
				list: false,
				create: true,
				key: true,
				inputClass: 'validate[required]'
			},
			
		
			amc_agency_name : {
				title : 'Agency Name',
				width : '20%',
				list: true,
				edit : true,
				inputClass: 'validate[required]'
				
			},
			
			amc_agency_address: {
				title : 'Address',
				type:'textarea',
				
				edit : true,
				list:true,
				inputClass: 'validate[required, custom[max1]]'
				
			},
			 country: {
				title : 'Country',
				width : '30%',
				edit : true,
				list:true,
				inputClass: 'validate[required]'
				
			},
			
			 telephone : {
				title : ' Telephone',
				width : '30%',
				edit : true,
				list: true,inputClass: 'validate[required]'
				
			},
			mobileNo : {
				title : ' Phone No.',
				width : '30%',
				edit : true,
				list: true,inputClass: 'validate[required, custom[phone_indian]]'
				
			},
			 fax: {
					title : 'Fax',
					width : '30%',
					edit : true,
					list: true,
					inputClass: 'validate[required]'
					
				},
				 email: {
						title : 'Email',
						width : '30%',
						edit : true,
						list: true,
						inputClass: 'validate[required, custom[email]]'
						
					},
			
	},
	formSubmitting: function (event, data) {
		//alert("submitting form");
    return data.form.validationEngine('validate');
             
            },

//Dispose validation logic when form is closed
	formClosed: function (event, data) {
                data.form.validationEngine('hide');
                data.form.validationEngine('detach');
            },
		
	});
	
	$('#AmcAgencyTableContainer').jtable('load');

}); 
