<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Calendar" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<%@page import="org.hibernate.Criteria" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.criterion.Restrictions" %>
<%@page import="hibernateConnect.HibernateConfig" %>
<%@page import="model.SubStagesMaster" %>
<html>
<head>

<% String contextpath=request.getContextPath();
String stageID= request.getParameter("stageId");
Session session1=HibernateConfig.getSession();
 Criteria cr1=session1.createCriteria(SubStagesMaster.class);
 cr1.add(Restrictions.eq("substageId", stageID));
 SubStagesMaster subStagesMaster =(SubStagesMaster)cr1.list().get(0);

String previousStage=subStagesMaster.getPreviousstageId();   //return either START or some value. Create option only applicable for where the value is START
String nextStages=subStagesMaster.getNextStageId();
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
</style>
<body>
<div id="FurnishingProductionTableContainer"></div>
</body>
<script type="text/javascript">
		$(document).ready(function() {
			
			var prevStage='<%=previousStage%>';
		
			var srno,i=1;
       //retrieve bogie type
			var coachtypes=[];
			coachtypes[0]={ Value:null, DisplayText: "Select" };
			<c:forEach var="a" items="${coachType}">
			
			var o = new Option("${a}", "${a}");
			/// jquerify the DOM object 'o' so we can use the html method
			$(o).html("${a}");
			$("#coachType").append(o);
			
			coachtypes[i]={ Value: "${a}", DisplayText: "${a}" };
		i++;
	    </c:forEach>
	    
	    
	   // end of code for bogie type
			//start: retrieving axle number in dropdown option
		    var bogieNumbers=[]; 

			var j=1;
			bogieNumbers[0]={ Value:null, DisplayText: "Select" };
			<c:forEach var="b" items="${bogieNumberList}">
			bogieNumbers[j]={ Value: "${b.key}", DisplayText: "${b.value}" };
				j++;
			    </c:forEach>
			  //end: retrieving axle number in dropdown option
			


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
			
		
			$('#datepickerCompletion').datepicker({
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
			    
	$('#FurnishingProductionTableContainer').jtable({
			
			title : 'Furnishing Shop Production',
			
			paging:true,
            sorting: true,
          //  defaultSorting: 'furnishingAssetId ASC',  // CORRECTED BY MANOJ 19.06.19
            defaultSorting: 'assemblyDispatchDate DESC',
           
            selecting: true, //Enable selecting
            multiselect: false, 
            multiSorting: true,
            animationsEnabled : true,
     
            
			actions : {
	
 			listAction: 'listFurnishingAction?stageID=<%=stageID%>'
 		
 						},
			
			fields : {
				
				sno:{
					title : 'SNo',
					create: false,
					edit : false,
					width: '5%',
					display: function(data)
					{
						
						srno++;
						return srno;
					}
				},
				
				shellAssetId: {
					title: 'Shell No',
					width: '20%',
					display:function(data){
 						var shellNo;
						
 						$.ajax({                    
 							  url: 'descByshellFromIdinPaintShop',     
 							  type: 'post', // performing a POST request
 							  async: false,
							  
 							  dataType: 'json',
 								  data : {
									
 									 shellAssetId: data.record.shellAssetId
 								  	  }									                    
 						})
 								.done(function( msg ) {
 									shellNo=msg.shellNo;
									
 									//return msg.stageName;																			    											
 								  })
 								.error(function (msg){
 									alert("Error Saving Data");
 								})
 								  ;
						
						
 						return shellNo;
 						},
 						create: false,
 						width : '20%',
 						list: true,
 						edit : false
 					},
 					shellType: {
 						title :'Shell Type',
 						width: '8%',
 						list: true,
 						create: false,
 						edit: false		
 						},		
				
				furnishingAssetId : {
					title : 'furnishingAssetId',
					width: '8%',
					key: true,
					list : false,
					edit : false,
					create : false
									
					},
					assemblyDispatchDate: {
						   title: 'Dispatched from Shell',
						   width : '10%',
						  
						  display:function(data){
							  
		 						var assemblyDispatchDatefromShell;
								
		 						$.ajax({                    
		 							  url: 'assemblyDispatchDatefromShell',     
		 							  type: 'post', // performing a POST request
		 							  async: false,
									  
		 							  dataType: 'json',
		 								  data : {
											
											  shellAssetId: data.record.shellAssetId
		 								  	  }									                    
		 						})
		 								.done(function( msg ) {
		 									assemblyDispatchDatefromShell=msg.assemblyDispatchDatefromShell;
											
		 									//return msg.stageName;																			    											
		 								  })
		 								.error(function (msg){
		 									alert("Error Saving Data");
		 								})
		 								  ;
								
								return ((assemblyDispatchDatefromShell!=null) && (assemblyDispatchDatefromShell!="") ) ? moment(assemblyDispatchDatefromShell).format('DD-MM-YYYY') : "";

		 						},
							create: false,
							edit: false
							},
		
					assemblyStartDate: {
							title :'Assembly Date',
							width: '8%',
							inputClass: 'validate[required]',

							display:function(data){
												 
								return ((data.record.assemblyStartDate!=null) && (data.record.assemblyStartDate!="") ) ? moment(data.record.assemblyStartDate).format('DD-MM-YYYY') : "";
													}, 
							list: true,
							create: false,
							edit: false
											
							},
					
			 
			},
			loadingRecords: function(event,data)
			{
				srno=0;
			},
			
				formCreated: function (event, data) {
					  
				var startDate=(data.record.assemblyStartDate).substring(0,10);
				
                    var num = startDate.match(/\d+/g); 
             		var date = new Date(num[0], num[1]-1, num[2]);
					 $('[name=expectedExitDate]').datepicker("option","minDate", date)	;	
            
 				
					  $("[name=bogiePpSideAssetId1]").on('change', 
								function() {
						
						  var ppBogieAssetId=$("[name=bogiePpSideAssetId1]").val();
						  
						  $("[name=bogieNppSideAssetId1]").find('[value='+ppBogieAssetId+']').remove();
						  
					  });
					  
					  data.form.validationEngine();
					  
					  
					  $("[name=bogieNppSideAssetId1]").on('change', 
								function() {
						  
						  var nppBogieAssetId=$("[name=bogieNppSideAssetId1]").val();
						  
						  $("[name=bogiePpSideAssetId1]").find('[value='+nppBogieAssetId+']').remove();
						  
					  });
				
	               	            },
	          
					//Validate form when it is being submitted
				formSubmitting: function (event, data) {
			   return data.form.validationEngine('validate');
			             
			            },
			    
				//Dispose validation logic when form is closed
				formClosed: function (event, data) {
			               data.form.validationEngine('hide');
			                data.form.validationEngine('detach');
				},
			});
	$('#FurnishingProductionTableContainer').jtable('load');
		});
		
		
	</script>
	