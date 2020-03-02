<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

   <%@ page import ="java.util.*"%>
   <%@ page import="java.sql.*" %>
  <% String contextpath=request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<%String startingDate=request.getParameter("startDate"); %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>findInterval</title>
<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
  <!-- <link href="css/furnishingStatus.css" rel="stylesheet"  type="text/css" /> -->
  <link rel="stylesheet" href="<%=contextpath%>/css/furnishingStatus.css" type="text/css"> 
<!--   <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!--   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
  <script src="<%=contextpath %>/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<link href="<%=contextpath %>/css/jquery-ui-1.10.3.custom.css" rel="stylesheet"type="text/css" />
<script src="<%=contextpath %>/js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
 </head>
<style>
.submitBtn:hover {
  background-color:#5555;
  color: white;
  
}
input[type=text] {
  background-color: #f1f1f1;
  width: 75%;
  align:center;
}
input[type=submit] {
  background-color: SlateBlue;
  color: white;
  cursor: pointer;
  align:center;
  font-size: 15px;
  border-radius: 10px;
  padding: 6px;
}
.submitBtn{
	margin-left:10px;
	outline:none;
}
.hide {
display: none;
}

.alert
{
padding:10px;
backgrond-color:red;
color:white;
}
.closebtn
{
margin-left:15px;
color:white;
font-weight:bold;
float:right;
font-size:22px;
line-height:20px;
cursor:pointer;
transition:0.3s;
}
.closebtn:hover
{
color:black;
}

</style> 

<script>
function goBack() {
	  window.history.back();
	}
	
function convertToDate(v)
{
	var day=parseInt(v.substring(0,2));
	var month=parseInt(v.substring(3,5));
	var year=parseInt(v.substring(6,10));
	var date1=new Date(year,month-1,day);
	return date1;
}
function retrieveURLStart(v)
{
	

	var startDate=convertToDate(v.value);
	
	//var x=document.getElementById("StartDate"+i).defaultValue;
	var endDate=document.getElementById("EndDate").value;
//	alert("startDate->"+startDate+"  endDate->"+endDate);
	if(endDate!='')
		{
		
		var endDate1=convertToDate(endDate);
		if(endDate1.getTime()<startDate.getTime())
			{
			//alert("Start date shold be less than end date");
			var divId=document.getElementById("myDivStart");
			divId.style.display="block";
			divId.classList.add("alert");
			
			document.getElementById("StartDate").value=v.oldvalue;
		return false;
			}
		else
			{var divId=document.getElementById("myDivStart");
			divId.style.display="none";}
		
		}
}	
	function convertToDate1(v)
	{
		
		
		var year=parseInt(v.substring(0,4));
		var month=parseInt(v.substring(5,7));
		var day=parseInt(v.substring(8,10));
		var date1=new Date(year,month-1,day);
		return date1;
	}
	function retrieveURLEnd(v)
	{
		
		//var x=document.getElementById("EndDate"+i).defaultValue;
		var endDate=convertToDate(v.value);

		//alert("startDate->"+startDate+"  endDate->"+endDate);
		var startDate=document.getElementById("StartDate").value;
		if (startDate!='')
			{
			var startDate1=convertToDate(startDate);
			//alert("startDate1->"+startDate1);
			var comp=endDate.getTime()<startDate1.getTime();
			//alert("comparing end and start date->"+comp);
			if(endDate.getTime()<startDate1.getTime())
				{
				//alert("End date shold be greater than start date");
				var divId=document.getElementById("myDivEnd");
				divId.style.display="block";
				divId.classList.add("alert");
				document.getElementById("EndDate"+i).value=v.oldvalue;
			return false;
				}
			else
			{var divId=document.getElementById("myDivEnd");
			divId.style.display="none";}
		
			}
	
	}	
	
$(document).ready(function(){
	$(".datePicker").datepicker({
		
		
		   dateFormat: 'dd-mm-yy',
	       
		   changeMonth: true,
		   changeYear:true,
		   yearRange:'-2:+2',
		   constraininput: false,
		   duration: '',
		   gotoCurrent: true,
		   autoClose: true,
		   /* minDate:new Date(),
		   maxDate: new Date(), */
	      
	});
});

function sendValues(){
	 var StartDate = document.getElementById("StartDate").value; 
		var endDate = document.getElementById("EndDate").value;	
		if(StartDate.length==0 && endDate.length==0 ){
			alert("Dates Can't Be Empty");
		}
		else  if(StartDate.length==0){
			alert("StartDate Can't Be Empty");
		}
		
		else if(endDate.length==0){
			alert("EndDate Can't Be Empty");
		}
		
		else {
    var formdata={testingStartDate:StartDate,testingEndDate:endDate};
	$.ajax({
		url:"interval",
		type:'POST',
		data:formdata,
	   success: function(data){
		   var $table  =  $('<table style="margin-left:30px;" border="1"><tr><th>Furnishing Number</th><th>Substage Description</th><th>testing status</th><th>Testing Start Date</th><th>Testing End Date</th><th>Remarks</th></tr></table>');
           if(data.furnshingnumberList.length!=0){
		   for(var i in data.furnshingnumberList)
		   {
		       console.log("received broadcast: " + ", " + data.furnshingnumberList[i]);
		       var $tr =  $('<tr></tr>');
		       var $td0 =  $('<td></td>');
		       var $td1 =  $('<td></td>');
		       var $td2 =  $('<td></td>');
		       var $td3 =  $('<td></td>');
		       var $td4 =  $('<td></td>');
		       var $td5 =  $('<td></td>');
		       $td0.append(data.furnshingnumberList[i]);
		       $td1.append(data.descriptionList[i]);
		       $td2.append(data.testingstatusList[i]);
		       $td3.append(data.teststartdateList[i]);
		       $td4.append(data.testenddateList[i]);
		       $td5.append(data.remarkList[i]);
		       $tr.append($td0);
		       $tr.append($td1);
		       $tr.append($td2);
		       $tr.append($td3);
		       $tr.append($td4);
		       $tr.append($td5);
		       $table.append($tr);
		   }
           }
           
           else {
        	   var $tr =  $('<tr></tr>');
		       var $td0 =  $('<td></td>');
		       var $td1 =  $('<td></td>');
		       var $td2 =  $('<td></td>');
		       var $td3 =  $('<td></td>');
		       var $td4 =  $('<td></td>');
		       var $td5 =  $('<td></td>');
		       $td0.append("No Data");
		       $td1.append("No Data");
		       $td2.append("No Data");
		       $td3.append("No Data");
		       $td4.append("No Data");
		       $td5.append("No Data");
		       $tr.append($td0);
		       $tr.append($td1);
		       $tr.append($td2);
		       $tr.append($td3);
		       $tr.append($td4);
		       $tr.append($td5);
		       $table.append($tr);
           }   
		   $('div#target').empty().append($table);
		   
		   

		   }
	   });
		}
}
	
</script>
<%
 String startDate="",endDate="";
 
 %>
<body>
   <div id="myDivStart" style="display:none;background-color:#f44336">
<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
<strong>Error!</strong> Start Date should not come after End Date.
</div>
<div id="myDivEnd" style="display:none;background-color:#f44336">
<span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
<strong>Error!</strong> End Date should not come before Start Date.
</div>

<div style="margin-left:100px;" >
<h1  style="font-size:20px;color:SlateBlue;"> <b>Select the Furnishing number:</b></h1>
<table style="width:500px;">
	<tr><td><b>From Date: </b></td><td><b>To Date:</b> </td></tr>
	<tr>
	<td><input type="text" autocomplete="off" id="StartDate" class="datePicker" value="<%=startDate%>" name="qty" onfocus="this.oldvalue=this.value" onchange="retrieveURLStart(this)"></td>
	<td><input type="text" autocomplete="off" id ="EndDate" class="datePicker"   value="<%=endDate%>" name="qty" onfocus="this.oldvalue=this.value" onchange="retrieveURLEnd(this)" ></td>
	</tr>
</table>
  <br>
  <br>
  
  
     <input type="submit"  value="SUBMIT" name="SUBMIT" id="SUBMIT" class="submitBtn" onClick="return sendValues(this)" style="margin-left:120px;margin-bottom:40px;" required>
  <input type="submit" id="SUBMIT" value="Back" name="Back" class="submitBtn" onclick="goBack()" style="margin-left:20px;margin-bottom:40px;"><br>
  </div>
  <div id="target"></div> 
</body>
</html>