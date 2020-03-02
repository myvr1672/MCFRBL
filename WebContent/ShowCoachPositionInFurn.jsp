<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%--    <%@page import="ACTION.Details" %> --%>
   <%@ page import ="java.util.*"%>
   <%@ page import="java.sql.*" %>
   <%@page import="beans.TestingMobileClearance" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" rel="Stylesheet"></link>

<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js" ></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Details</title>
</head>
<style>
* {
  box-sizing: border-box;
   padding-left:2px;
}

body {
  font: 16px Arial;  
}

/*the container must be positioned relative:*/
.autocomplete {
  position: relative;
  display: inline-block;
   padding-left:20px;
}

input {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 16px;
}

input[type=text] {
  background-color: #f1f1f1;
  width: 100%;
  align:center;
}

input[type=submit] {
  background-color: SlateBlue;
  color: white;
  cursor: pointer;
  align:center;
  font-size: 15px;
  border-radius: 10px;
  padding: 16px;
}
.submitbtn:hover {
  background-color:#5555;
  color: white;
  
}
.submitbtn{
	margin-left:10px;
	outline:none;
}
.submitbt{
	margin-left:20px;
	outline:none;
}

table{
	margin:30px;
	}

.submitbt:hover {
  background-color:#5555;
  color: white;
  align:center;
  
}
.autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  /*position the autocomplete items to be the same width as the container:*/
  top: 100%;
  left: 0;
  right: 0;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4; 
}

/*when hovering an item:*/
.autocomplete-items div:hover {
  background-color: #e9e9e9; 
}

/*when navigating through the items using the arrow keys:*/
.autocomplete-active {
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}

</style>
<body>

<h1  style="font-size:20px;" style="color:SlateBlue;"> <b>Select the Furnishing number:</b></h1>
<script>
function goBack()
{
	window.history.back();
}
function autocomplete(inp, arr) {
  var currentFocus;
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      
      this.parentNode.appendChild(a);
      
      for (i = 0; i < arr.length; i++) {
        
        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
         
          b = document.createElement("DIV");
         
          b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].substr(val.length);
         
          b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
          
          b.addEventListener("click", function(e) {
              
              inp.value = this.getElementsByTagName("input")[0].value;
              
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
         currentFocus++;
        
        addActive(x);
      } else if (e.keyCode == 38) { 
        
        currentFocus--;
        
        addActive(x);
      } else if (e.keyCode == 13) {
        
        e.preventDefault();
        if (currentFocus > -1) {
        
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
   
    if (!x) return false;
       removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
   
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
   
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
   
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}
 function fnIsEmpty(){
    	var subtle=document.getElementById("furnishingno");
    	if(subtle.value==""){
    		alert("Furnishing No. can't be Empty");
    	return false;	
    	}
    }
$(document).ready (function()
		{
	var liarray = [];
	$.ajax({
		url:"retrieveFurnNo",
		type:'POST',
		async:false,
		success:function(data)
		{
			for(var x in data.furnNoList){
        	    liarray.push(data.furnNoList[x]);
        	   //liarray.push(x);
		}
			 autocomplete(document.getElementById("furnishingno"), liarray);	
	}
	}
	);
		});
		
		
function somethin(){
	var liarray = [];
	var furnishingNo=$('input[name=furnishingNo]').val();
    var formdata={furnishingNo: furnishingNo};
	$.ajax({
		url:"Details",
		type:'POST',
		data:formdata,
	   success: function(data){
		  
		   var $table  =  $('<table border="1"><tr><td><b>SubstageDescription</td><td><b>TestingStartDate</td><td><b>TestingEndDate</b></td><td><b>Remarks</b></td></tr></table>');
		 
//            for(var x in data.furnNoList){
//         	    liarray.push(data.furnNoList[x]);
       	   //liarray.push(x);
//    }
           
//            autocomplete(document.getElementById("furnishingno"), liarray);
   if(data.stageDescList.length!=0){
 		     
           for(var i in data.stageDescList)
		   {
		       //console.log("received broadcast: " + ", " + data.stageDescList[i]);
		       var $tr =  $('<tr> </tr>');
		       var $td0 =  $('<td> </td>');
		       var $td1 =  $('<td> </td>');
		       var $td2 =  $('<td> </td>');
		       var $td3 =  $('<td> </td>');
		       $td0.append(data.stageDescList[i]);
		       $td1.append(data.testingStartDateList[i]);
		       $td2.append(data.testingEndDateList[i]);
		      $td3.append(data.remark[i]);
		       $tr.append($td0);
		       $tr.append($td1);
		       $tr.append($td2);
		       $tr.append($td3);
		       $table.append($tr);
		   }

		 
		   
   }
   else {
	   var $tr =  $('<tr> </tr>');
       var $td0 =  $('<td> </td>');
       var $td1 =  $('<td> </td>');
       var $td2 =  $('<td> </td>');
       var $td3 =  $('<td> </td>');
       $td0.append("NO Data");
       $td1.append("NO Data");
       $td2.append("NO Data");
      $td3.append("NO Data");
       $tr.append($td0);
       $tr.append($td1);
       $tr.append($td2);
       $tr.append($td3);
       $table.append($tr);
	   
   }
   $('div#target').empty().append($table);
       
		   }
	   });
	   }
	   
</script>
        
         <div class="autocomplete" style="width:300px;">
		<input type="text" id="furnishingno" onblur="fnIsEmpty()" name="furnishingNo" placeholder="Enter Furnishing No." maxlength="10"/> 
        </div>
        <input type="submit"  value="Confirm" name="SUBMIT" id="SUBMIT" class="submitbtn" onClick="return somethin(this.form)">
        
<div id="target"></div>  
		       
<input type="submit" value="Back" id="SUBMIT" class="submitbt" onclick="return goBack(this.form)">				

</body>
</html>