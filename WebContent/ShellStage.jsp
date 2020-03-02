<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@page import="ACTION.ShellStage"%>
   <%@ page import ="java.util.*"%>
   <%@ page import="java.sql.*" %>
   <%@page import="beans.TestingMobileClearance" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shell in a Stage</title>
</head>
<style>
.Custom{
 position: relative;
 font-family: Arial;
 box-sizing: border-box;
   padding-left:2px;}
   
   .Custom-select select {
  display: none; 
}

.select-selected {
  background-color: white;
}
.submitBtn:hover {
  background-color:#5555;
  color: white;
  
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
</style>
<body>
<h1 style="font-size:25px;color:SlateBlue; margin-left:20px;"> Enter Stage :</h1>
<% ShellStage s=new ShellStage();
s.getshellStageDetails();
List<String>substagei=s.getSubstageDescList2();
%>
<div class="Custom" style="margin-bottom:20px;margin-left:20px;">
<select id="dropdown" style="font-size:17px; background-color:F7F1EF;">
<option><b>Select:</b></option><% 
 
for(String i:substagei) {%>
<option value="<%=i%>"><%=i %></option>
<% 
}
%>
</select>
</div>
 <br><input type="submit"  value="Confirm" name="SUBMIT" class="submitBtn" id="submitBtn" onClick="return shellStages()" style="margin-left:120px;margin-bottom:40px;">
 
<script>

function goBack() {
  window.history.back();
}

function shellStages(){
	var stageDesc= $('#dropdown').find(":selected").text();
	console.log("received broadcast: " + ", " +stageDesc);
	//var stage=$('input[id=stage]').val();
	//var stageDesc=stage.toUpperCase();

    var formdata={stageDesc:stageDesc};
	$.ajax({
		url:"shellStage",
		type:'POST',
		data:formdata,
	   success: function(data){
		   var $table  =  $('<table style="margin-left:20px;"border="2px solidblack"><tr><td><b>furnishing Asset Id</td><td><b>Shell Number</td><td><b>Furnishing Number</b></td><td><b>Coach Type</b></td><td><b>Substage Description</b></td></tr></table>');
		   if(data.furnAssetIdList.length!=0){
		      for(var i in data.furnAssetIdList)
		   {
		      //console.log("received broadcast: " + ", " +data.furnNoList[i]);
		    //console.log("received broadcast: " + ", " + data.shellNoList[i]);
		       var $tr =  $('<tr> </tr>');
		       var $td0 =  $('<td> </td>');
		       var $td1 =  $('<td> </td>');
		       var $td2 =  $('<td> </td>');
		       var $td3 =  $('<td> </td>');
		       var $td4 =  $('<td> </td>');
		       $td0.append(data.furnAssetIdList[i]);
		       $td1.append(data.shellNoList[i]);
		       $td2.append(data.furnNoList[i]);
		       $td3.append(data.coachTypeList[i]);
		       $td4.append(data.substageDescList[i]);
		      
		      
		       $tr.append($td0);
		       $tr.append($td1);
		       $tr.append($td2);
		       $tr.append($td3);
		       $tr.append($td4);
		       $table.append($tr);
		   }
		 
		   
		   $('div#divTable').empty().append($table);
		   
		   } 
		//  $('#divTable').html('<link href="css/furnishingStatus.css" rel="stylesheet"  type="text/css" />' );
		   
		else
			{  var $tr =  $('<tr> </tr>');
		       var $td0 =  $('<td> </td>');
		       var $td1 =  $('<td> </td>');
		       var $td2 =  $('<td> </td>');
		       var $td3 =  $('<td> </td>');
		       var $td4 =  $('<td> </td>');
		       $td0.append("No data Available");
		       $td1.append("No data Available");
		       $td2.append("No data Available");
		       $td3.append("No data Available");
		       $td4.append("No data Available");
		      
		      
		       $tr.append($td0);
		       $tr.append($td1);
		       $tr.append($td2);
		       $tr.append($td3);
		       $tr.append($td4);
		       $table.append($tr);
			 $('div#divTable').empty().append($table);
			}
		   }
	   });
}
	
</script>
<input type="submit" value="Back" id="SUBMIT" class="submitBtn" onclick="goBack()" style="margin-left:20px;margin-bottom:40px;">
<div id="divTable" class="divTable"></div>  

</body>
</html>