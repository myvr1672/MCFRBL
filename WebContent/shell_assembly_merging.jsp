<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Calendar" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@page import="java.util.*" %>
<%@page import="org.hibernate.Criteria" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="hibernateConnect.HibernateConfig" %>
<%@page import="model.SubStagesMaster" %>
<html>
<head>
<title></title>
<% String contextpath=request.getContextPath();
String stageID= request.getParameter("stageId");
Session session1=HibernateConfig.getSession();
Criteria cr1=session1.createCriteria(SubStagesMaster.class);
cr1.add(Restrictions.eq("substageId", stageID));
SubStagesMaster subStagesMaster =(SubStagesMaster)cr1.list().get(0);
String stageDescription=subStagesMaster.getSubstageDescription();
String substages=subStagesMaster.getSubstages();
String substage_display=substages;
if(stageID.equals("2")) {substages="Wheel";}
if(stageID.equals("4")) {substages="Shell";}
if(stageID.equals("5")||stageID.equals("6")||stageID.equals("8")) {substages="Coach";}
String lowercase_Substages=substages.toLowerCase();
String previousStage=subStagesMaster.getPreviousstageId(); //return comma separated array like 2,3
String nextStages=subStagesMaster.getNextStageId();


String[] prevStageArr;
String delimiter = ", ";
/* given string will be split by the argument delimiter provided. */
prevStageArr = previousStage.split(delimiter);
ArrayList<String> previousStageDescription = new ArrayList<String>(); 

for (String s:prevStageArr)
{
	
	
	Criteria cr2=session1.createCriteria(SubStagesMaster.class);
	cr2.add(Restrictions.eq("substageId", s));
	 subStagesMaster =(SubStagesMaster)cr2.list().get(0);
 previousStageDescription.add(subStagesMaster.getSubstageDescription());
}

for(String p:previousStageDescription)
{
	if(p.equals("Paint"))
	{
		p="Shell";
	}
	
}
//out.print("Previous Stage: "+previousStage);


session1.close();


%>

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
.wrapper {
text-align: center;
}
.button{position:absolute; top:0%;}
</style>
<body>


<table>
<tr><td><div id="SheetCuttingTableContainer1"></div></td> <td><div id="SheetCuttingTableContainer2"></div></td></tr>
<!-- <tr><td><div id="SheetCuttingTableContainer3"></div></td> <td> <div id="SheetCuttingTableContainer4"></div></td></tr> -->
<tr><td colspan="2"><div class="wrapper"><input id="merge" type="button"  name="merge" value="Merge"></input></div></td> </tr>
 
 <tr><td colspan="2"><div id="SheetCuttingTableContainer5"></div></td> </tr> 
</table>
<div id="mergeDialog" style="height:150%; width:200%; display:none;z-index: 9;" >
  <br>
			  <br>
			 Entry Date: <br>
		     <input type="Text" id="datepickerExit" class='validate[required]' />
		     <br>
		      <br>
		     
 </div>

<!-- <div id="SheetCuttingTableContainer1" style="height: 40%;width:40%;position:relative"></div> -->

<p>
<div id="result"></div>
  </body>
<script type="text/javascript">

		$(document).ready(function() {
			var stageID='<%=stageID%>';

			// for date picker in dialog box
			$('#datepickerExit').datepicker({
		        //inline: true,
		        dateFormat: 'dd-mm-yy',
		        changeMonth: true,
		        changeYear: true,
		        yearRange: '-1:+1',
		        constrainInput: true,
		        duration: '',
		        gotoCurrent: true,
		        beforeShow: function() {
		            setTimeout(function(){
		                $('.ui-datepicker').css('z-index', 99999999999999);
		            }, 0);
		        }

		    }).datepicker("setDate", new Date());
			
			//Date picker code end here
			
	$('#SheetCuttingTableContainer1').jtable({
			
			title : 'Outturn from Bogie Shop',
			
			
            sorting: true,
            defaultSorting: 'bogieNumber ASC',
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
      
                       
			actions : {
				
 				//createAction : 'createSheetCuttingAction',
 				listAction: 'listUnderFrameAction?prevStageID=2&stageID='+stageID,
 				updateAction:'updateUnderFrameAction?prevStageID_1=2&stageID='+stageID
 						},
							
 				fields:{
 					assetID : {
 						title : 'assetID',
 						width: '20%',
 						key: true,
 						list : false,
 						edit : false,
 						create : false
 										
 						},
 					
 					bogieNumber : {
					title : 'Bogie No.',
					width: '20%',
					
					list: true,
					create: false,
					edit: false
									
					},
					
	 					wheelNumber : {
						title : 'Wheel No.',
						width: '20%',
						
						list: true,
						create: false,
						edit: false
										
						},
				shellType: {
					title: 'Shell Type',
					
					width : '20%',
					list: true,
					create: false,
					edit : false
				},
				
				 entryDate : {
					title : 'Entry Date',
					type: 'date',
					displayFormat: 'dd-mm-yy',
					edit : false
					
					
				},
				receiptDate : {
					title : 'Receipt Date',
					type: 'date',
					displayFormat: 'dd-mm-yy',
					edit : true	,
					
					
				} 
							}
	}),
				
	$('#SheetCuttingTableContainer1').jtable('load');
	
		
		
$('#SheetCuttingTableContainer2').jtable({
			
			title : 'Outturn from Paint Shop',
			
			
            sorting: true,
            defaultSorting: 'shellNumber ASC',
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
      
                       
			actions : {
				
 				
 				listAction: 'listSidewallAction?prevStageID=4&stageID='+stageID,
 				updateAction:'updateSidewallAction?prevStageID=4&stageID='+stageID
 						},
 						fields : {		
 					
 							assetID : {
 		 						title : 'assetID',
 		 						width: '20%',
 		 						key: true,
 		 						list : false,
 		 						edit : false,
 		 						create : false
 		 										
 		 						},		
 					shellNumber : {
					title : 'Shell No.',
					width: '20%',
					key: true,
					list: true,
					create: false,
					edit: false
									
					},
				shellType: {
					title: 'Shell Type',
					
					width : '20%',
					list: true,
					edit : false
				},
				
				 entryDate : {
					title : 'Entry Date',
					type: 'date',
					displayFormat: 'dd-mm-yy',
					edit : false,
					create : false
					
				},
				receiptDate : {
					title : 'Receipt Date',
					type: 'date',
					displayFormat: 'dd-mm-yy',
					edit : true	,
					create : false
					
				} 
 						}
				
				
				
	}),
				
	$('#SheetCuttingTableContainer2').jtable('load');



$('#SheetCuttingTableContainer5').jtable({
	
	title : 'Shell Bogie Assembled',
	
	
    sorting: true,
    defaultSorting: 'bogieNumber ASC',
    
    selecting: true, //Enable selecting
    multiselect: false, 
    multiSorting: true,
    animationsEnabled : true,

               
	actions: {
		
		//	createAction : 'createSheetCuttingAction',
			listAction: 'listSheetCuttingAction?stageID=<%=stageID%>'
		//	updateAction:'updateSheetCuttingAction'
					},
					fields:{
						assetID : {
		 						title : 'assetID',
		 						width: '20%',
		 						key: true,
		 						list : false,
		 						edit : false,
		 						create : false
		 										
		 						},		
				wheelNumber : {
				title : 'Wheel No.',
				width: '20%',
				list: true,
				create: false,
			  edit: false
											
							},			
		  shellNumber : {
			title : 'Shell No',
			width: '20%',
			key: true,
			list: true,
			edit: false
							
			},
			bogieNumber : {
				title : 'Bogie No.',
				width: '20%',
				key: true,
				list: true,
				edit: false
								
				},
		shellType: {
			title: 'Shell Type',
			width : '20%',
			list: true,
			edit :false
		},
		
		entryDate : {
			title : 'Entry Date',
			type: 'date',
			displayFormat: 'dd-mm-yy',
			edit : false
			
			
		},
		receiptDate : {
			title : 'Receipt Date',
			type: 'date',
			displayFormat: 'dd-mm-yy',
			edit : true	,
			create : true
			
		}
					}
}),
		
$('#SheetCuttingTableContainer5').jtable('load');
	
	$('#merge').click(function(){
          	//alert("hello");
			  var ShellType;
			  var notSelected=false;
         	 var $selectedRows = $('#SheetCuttingTableContainer1').jtable('selectedRows');
     	 	 if ($selectedRows.length<1)
     	 		 {
     	 		notSelected=true;
     	 		 }
     	 	 else{
     	 		
     	 		var bogie;
     	 		$selectedRows.each(function () {
     	 			bogie = $(this).data('record');
                     });
     	 		assetID_bogie=bogie.assetID;
     	 		ShellType=bogie.shellType;
     	 		wheelNumber=bogie.wheelNumber;
     	 		bogieNumber=bogie.bogieNumber;
     	 		
     	 	 }
     	 		var $selectedRows = $('#SheetCuttingTableContainer2').jtable('selectedRows');
        	 	 if ($selectedRows.length<1)
        	 		 {
        	 		notSelected=true;
        	 		 }
        	 	 else{
        	 		//var recordSideWall;
        	 		var paint;
        	 		$selectedRows.each(function () {
        	 			paint = $(this).data('record');
                        });
     	 		shellNumber=paint.shellNumber;
     	 		assetID_paint=paint.assetID;
        	 	 }
         	if(notSelected==true)
         		{
         		alert("Please select row from each of the above two table of similar Shell Type");
         		return false; 
         		}
         	
         	// navin code add here
         	$("#mergeDialog").dialog({
                    	 	 		title : 'Assembled Bogie and Shell',                     	 	 		
                    	 	 		close: function (e, u) {
              	 		              //$(".formError").remove();
              	 		          	$("#exitDialog").validationEngine('hideAll');
              	 		          } ,
              // navin code end here
         	//for submit button in dialog box
         	buttons: {
	                                    Submit: function () {
	                                    		
	                                    	//alert("$('#qtyDispatched').val()->"+$('#qtyDispatched').val());
	                                    	//alert("record.balanceQtyToDispatch->"+record.balanceQtyToDispatch);
	                            	 		
	                                    	if ($('#datepickerExit').validationEngine('validate')) {
				                                        	//alert(!$("#dialog").validationEngine('validate'));
				                                            return false;
				                                        }
         	//end of submit button
         	$.ajax({
				url : "mergeAssembly",
				dataType: 'json', 
				data : {
					
				//	calHodyDate: moment(record.id.calHodyDate).format('DD-MM-YYYY'),
					shellNumber: shellNumber,
					assetID_bogie:assetID_bogie,
					shellType:ShellType,
					wheelNumber:wheelNumber,
					
					bogieNumber:bogieNumber,
         	        assetID_paint:assetID_paint,
         	       entryDate:$('#datepickerExit').val(),
         	       stageID: stageID,
				},
				
				type : 'POST',
				async : false,
	 		})
				.done(function( msg ) {
					$('#datepickerExit').val('');
					   window.location.reload();	
				
					$('#mergeDialog').dialog('close');
					
						//	$('#HolidayTableContainer5').jtable('load', {year: $('#year').val()});
							$('#HolidayTableContainer5').jtable('load');
							$('#HolidayTableContainer1').jtable('load');
							$('#HolidayTableContainer2').jtable('load');
				  })
				  //code start
				.error(function (msg){
					//$('#dialog').dialog('close');
					alert("Error Fetching Data");
				})
				//code end
				  ;
     			    	   return true;
         		                                    },//submit ended
	                                    Close: function () {
				                        	
	                                        $(this).dialog('close');
	                                    }
                            },//button ended
                            modal: true
         
     	 	
	 });//dialog ended
	
});//click function ended

	
	
});//document.ready function ended	
		
	</script>
	 
	