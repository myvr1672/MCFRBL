<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Calendar" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="s" uri="/struts-tags"%> 

<%@page import="org.hibernate.Criteria" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="hibernateConnect.HibernateConfig" %>

<html>
<head>
<title></title>
<% String contextpath=request.getContextPath(); %>

<script src="<%=contextpath %>/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<link href="<%=contextpath %>/css/metro/blue/jtable.css" rel="stylesheet" type="text/css" />
<link href="<%=contextpath %>/css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css" />


<script src="<%=contextpath %>/js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/jquery.jtable.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/moment.js" type="text/javascript"></script>

<link href="<%=contextpath %>/js/validationEngine/validationEngine.jquery.css" rel="stylesheet"type="text/css" />

<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine.js" type="text/javascript"></script>
<script src="<%=contextpath %>/js/validationEngine/jquery.validationEngine-en.js" type="text/javascript"></script>

<style>

.jtable-input-readonly {
	background-color: lightgray;
}

#overlay{
	/* margin:0px auto;							
	
  display:block; z-index:15;
  width:47px; height:48px;  */
        position: fixed; 
        width: 20%; /* Set your desired with */
        z-index: 2; /* Make sure its above other items. */
        top: 50%;
        left: 50%;
        margin-top: -10%; /* Changes with height. */
        margin-left: -10%; /* Your width divided by 2. */
        /* You will not need the below, its only
           for styling   purposes.*/
        padding: 10px;
        border: 2px solid #555555;
        background-color: #ccc; 
/*        background-color: #4C4CFF; */
}


.hide-calendar .ui-datepicker-calendar {
	display: none;
}
/* button.ui-datepicker-current { display: none; } */
.jtable-child-table-container {
	border: 2px solid blue;
	width: 650px;
}
</style>





<style>
.no-titlebar .ui-dialog-titlebar {
    display: none;
}

.ui-datepicker .ui-datepicker-title select {
    color: #000;
}

.jtable-input-readonly {
	background-color: lightgray;
}

div.jtable-column-header-container {
	height: auto !important;
}

.col1
{
float:left;
padding: 5px 10px 5px 5px;
width: 45%;
}
.col2
{
float:right;
padding: 5px 5px 5px 10px;
width: 45%;
}


#jtable-create-form {
	
	display: block;
	width: 650px;
	
}

#jtable-edit-form {
	display: block;
	width: 650px;
	
}
#error_msg {
  color: red;
  text-align: center;
  margin: 10px auto;
}

.form_success span {
  width: 80%;
  height: 35px;
  margin: 3px 10%;
  font-size: 1.1em;
  color: green;
}
.form_success input {
  border: 1px solid green;
}
.disable{
   cursor: not-allowed;
   pointer-events: none;
   background-color: #cccccc;
  color: #666666;
}

#jtable-create-form{
display: block;
width: 500px;
-moz-column-gap:60px;
/*Firefox*/
-webkit-column-gap:60px;
/* Safari and Chrome */
column-gap:60px;
-moz-column-count:2;
/* Firefox */
-webkit-column-count:2;
/* Safari and Chrome */
column-count:2;
}

#jtable-edit-form{
display: block;
width: 500px;
-moz-column-gap:60px;
/*Firefox*/
-webkit-column-gap:60px;
/* Safari and Chrome */
column-gap:60px;
-moz-column-count:2;
/* Firefox */
-webkit-column-count:2;
/* Safari and Chrome */
column-count:2;
}

</style>

<body>
<div id="SheetMetalMasterTableContainer"></div>
  <div id="dialog-message" title="Message"  style="display: none">
  <p id="pTxt" style='color:red'><span id="txtMsg"></span><p>
  </div>
<script type="text/javascript">
		$(document).ready(function() {
		
			var srno=0,i=1;
			var shelltypes=[];
			shelltypes[0]={ Value: "", DisplayText: "Select" };
			
			<c:forEach var="a" items="${shellType}">
			var o = new Option("${a}", "${a}");
			/// jquerify the DOM object 'o' so we can use the html method
			$(o).html("${a}");
			$("#shellType").append(o);
			shelltypes[i]={ Value: "${a}", DisplayText: "${a}" };
		i++;
	    </c:forEach>
		
	    $('#Edit-userImage').click(function(){
			
			alert($('[name=drawingNo]').val());
		});
  

	$('#SheetMetalMasterTableContainer').jtable({

		

		
			title : 'Shell Metal Master Screen',
			
			
            sorting: true,
            defaultSorting: 'drawingNo ASC',
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
      	actions : {
				
 		   createAction : 'createSheetMasterAction',
 			listAction: 'listSheetMasterAction',
 			updateAction: 'updateSheetMasterAction'
 						},
 						
			fields : {
				
				sno:{
					title : 'SNo',
					create: false,
					edit : false,
					width: '5%',
					/* display: function(data)
					{
						
						srno++;
						return srno;
					} */
				},
				
				drawingNo : {
					title : 'Drawing No.',
					width: '8%',
					key: true,
					list : true,
					edit : false,
					create : true,
					//inputClass: 'validate[required, custom[number]]'
					inputClass: 'validate[required]'
					},
					description : {
						title : 'Description',
						width: '8%',
						
						list : true,
						edit : true,
						create : true,
						inputClass: 'validate[required]'				
						},
						description : {
							title : 'Description',
							width: '8%',
							
							list : true,
							edit : true,
							create : true,
							inputClass: 'validate[required]'				
							},
						
								sizeThickness : {
									title : 'Thickness',
									width: '8%',
									list : true,
									edit : true,
									inputClass: 'validate[custom[number]]',
									create : true				
												},		
								sizeWidth : {
									title : 'Width',
									width: '8%',
									list : true,
									edit : true,
									inputClass: 'validate[custom[number]]',
									create : true				
											},		
											sizeLength : {
												title : 'Length',
												width: '8%',
												list : true,
												edit : true,
												inputClass: 'validate[custom[number]]',
												create : true				
														},	
								sizeUnit : {
								title : 'Unit of Measure',
								width: '8%',
								options : { '':'Select','mm': 'mm','cm':'cm', 'meter': 'meter' , 'foot':'foot'},
								list : true,
								edit : true,
									
								create : true				
									},	
									rawMaterialUsed:{
										title : 'Raw Material',
										width: '8%',
								options : { '':'Select','SSF': 'SSF','SSA':'SSA', 'CS': 'CS' , 'Al':'Aluminum','ST52':'ST52','MS':'MS'},
										list : true,
										edit : true,
											
										create : true				
										},
										processP1:
											{
											title : 'Process- P1',
											width: '8%',
									options : { '':'Select','CTL': 'CTL','S/C':'S/C', 'LCM': 'LCM' , 'LCWM':'LCWM','120T':'120T','160T':'160T', '440T':'440T', 'FLD':'FLD', 'SB':'SB','DRLL':'DRLL', 'NTC':'NTC','PCT':'PCT', '800T':'800T', '800THY':'800THY', 'CHOD':'CHOD', 'MS':'MS', 'F':'F'},
											list : true,
											edit : true,
												
											create : true
											},
											processP2:
											{
											title : 'Process- P2',
											width: '8%',
									options : { '':'Select','CTL': 'CTL','S/C':'S/C', 'LCM': 'LCM' , 'LCWM':'LCWM','120T':'120T','160T':'160T', '440T':'440T', 'FLD':'FLD', 'SB':'SB','DRLL':'DRLL', 'NTC':'NTC','PCT':'PCT', '800T':'800T', '800THY':'800THY', 'CHOD':'CHOD', 'MS':'MS', 'F':'F'},
											list : true,
											edit : true,
												
											create : true
											},
											processP3:
											{
											title : 'Process- P3',
											width: '8%',
									options : { '':'Select','CTL': 'CTL','S/C':'S/C', 'LCM': 'LCM' , 'LCWM':'LCWM','120T':'120T','160T':'160T', '440T':'440T', 'FLD':'FLD', 'SB':'SB','DRLL':'DRLL', 'NTC':'NTC','PCT':'PCT', '800T':'800T', '800THY':'800THY', 'CHOD':'CHOD', 'MS':'MS', 'F':'F'},
											list : true,
											edit : true,
												
											create : true
											},
											processP4:
											{
											title : 'Process- P4',
											width: '8%',
									options : { '':'Select','CTL': 'CTL','S/C':'S/C', 'LCM': 'LCM' , 'LCWM':'LCWM','120T':'120T','160T':'160T', '440T':'440T', 'FLD':'FLD', 'SB':'SB','DRLL':'DRLL', 'NTC':'NTC','PCT':'PCT', '800T':'800T', '800THY':'800THY', 'CHOD':'CHOD', 'MS':'MS', 'F':'F'},
											list : true,
											edit : true,
												
											create : true
											},
											processP5:
											{
									title : 'Process- P5',
											width: '8%',
									options : { '':'Select','CTL': 'CTL','S/C':'S/C', 'LCM': 'LCM' , 'LCWM':'LCWM','120T':'120T','160T':'160T', '440T':'440T', 'FLD':'FLD', 'SB':'SB','DRLL':'DRLL', 'NTC':'NTC','PCT':'PCT', '800T':'800T', '800THY':'800THY', 'CHOD':'CHOD', 'MS':'MS', 'F':'F'},
											list : true,
											edit : true,
												
											create : true
											},	

											qpc:
												{
											title:'Qty Per Coach',
											list : true,
											edit : true,
											width: '8%',
											inputClass: 'validate[custom[integer]]',	
											create : true
											},	
											
							
					shellType: {
					title: 'Shell Type',
					width: '20%',
					options: shelltypes,
					width : '8%',
					list: true,
					edit : true
				},
				
				componentType: {
				   title: 'Component Type',
				   width : '8%',
				   options : { '':'Select','ROOF': 'ROOF','SIDEWALL':'SIDEWALL', 'ENDWALL': 'ENDWALL' , 'UNDERFRAME':'UNDERFRAME'},
					edit : true,
					create: true 
				},
				userShop: {
					   title: 'User Shop',
					   width : '8%',
					   options : { '':'Select','ROOF': 'ROOF','SIDEWALL':'SIDEWALL', 'ENDWALL': 'ENDWALL' , 'UNDERFRAME':'UNDERFRAME', 'CARPENTARY':'CARPENTARY','WHEEL':'WHEEL', 'BOGIE':'BOGIE','FURNISHING':'FURNISHING'},
						edit : true,
						create: true 
					}
		
 	 				      
			    
			},
			
 			loadingRecords: function(event,data)
			{
				srno=0;
		},
			recordsLoaded:function(event, data) {
 				var SrNo=0;
 				if(data.records){
 $.each(data.records,function(index,record){
 	var row=$('#SheetMetalMasterTableContainer').jtable('getRowByKey',record.drawingNo);
 	SrNo++;
 	row.find('td:eq(0)').text(SrNo);
 }


 		)
 					}
 			}, 
			recordAdded: function(event, data) {
				if(data.serverResponse.message=='Data successfully inserted')
				{	$("#pTxt").css("color","green");}
				else
					{$("#pTxt").css("color","red");
					}
				$("#txtMsg").html(data.serverResponse.message);
                $("#dialog-message").dialog({
					modal:true,
					buttons:{
						Ok:function(){
					$(this).dialog("close");
							}
						}

                    });
                
				alert(data.serverResponse.message);
                srno=0;
				$('#SheetMetalMasterTableContainer').jtable('reload');
			
					},
									formCreated: function (event, data) {
										data.form.attr('enctype', 'multipar/form-data');
										 data.form.attr("encoding", "multipart/form-data");
										$('[name=userImage]').attr("disabled", "disabled");
										$('[name=drawingNo]').blur(function(){
											if($('[name=drawingNo]').val())
												{
												$('[name=userImage]').attr("disabled", false);
												}
											else
												{
												$('[name=userImage]').attr("disabled", true);
												}
										});
																				
					data.form.find('input[name="drawingNo"]').attr('placeholder','Enter Drawing No.');
					data.form.find('input[name="description"]').attr('placeholder','Enter Description');
					data.form.find('input[name="sizeLength"]').attr('placeholder','Enter Length');
					data.form.find('input[name="sizeWidth"]').attr('placeholder','Enter Width');
					data.form.find('input[name="sizeThickness"]').attr('placeholder','Enter Thickeness');	
					data.form.find('input[name="qpc"]').attr('placeholder','Enter Qty in number');
								
					data.form.validationEngine();
	               	            },
	            recordDeleted: function(event,data)
	    		{
	    			srno=0;
	    			$('#SheetMetalMasterTableContainer').jtable('load');
	    		},
	    		
 
					//Validate form when it is being submitted
				formSubmitting: function (event, data) {
			    var res=data.form.validationEngine('validate');
			    
			    return res;   
			            },
			    
				//Dispose validation logic when form is closed
				formClosed: function (event, data) {
			               data.form.validationEngine('hide');
			               data.form.validationEngine('detach');
				}
	              
			});
	$('#SheetMetalMasterTableContainer').jtable('load');

	
		});
		
		
	</script>
	 
	