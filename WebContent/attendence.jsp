<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <% String contextpath=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>List Of Employees</title>
<script language="javascript" type="text/javascript">

var xmlHttp;
function showsection(str)
{
	//alert(str);
	
	if (typeof XMLHttpRequest != "undefined")
		{
		xmlHttp = new XMLHttpRequest();
		}
	else if(window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		return;
	}
	if(xmlHttp === null)
		{
		alert("Browser does not support");
		}
	var url="attendsection.jsp?count="+str;
	//url+"?count="+str;
	xmlHttp.onreadystatechange = sectionchange;
	xmlHttp.open("GET",url,true);
	xmlHttp.send(null);
	
	}
	function sectionchange(){
		if(xmlHttp.readyState == 4 || xmlHttp.status==200){
			document.getElementById("sectionID").innerHTML=xmlHttp.responseText;
		}
	}
	function showsubsection(str)
	{
		if (typeof XMLHttpRequest != "undefined")
			{
			xmlHttp = new XMLHttpRequest();
			}
		else if(window.ActiveXObject){
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			return;
		}
		if(xmlHttp === null)
			{
			alert("Browser does not support");
			}
		var url="attendsubsection.jsp?count="+str;
		//url + "?count=" +str;
		xmlHttp.onreadystatechange = subsectionchange;
		xmlHttp.open("GET",url,true);
		xmlHttp.send(null);
		
		}
		function subsectionchange(){
			if(xmlHttp.readyState == 4 || xmlHttp.status== 200){
				document.getElementById("subsectionID").innerHTML=xmlHttp.responseText;
			}
		}
					
		function absent()
			{
				p=document.getElementById("shift").value;
				p1=document.getElementById("subsectionID").value;
				if (typeof XMLHttpRequest != "undefined")
					{
					xmlHttp = new XMLHttpRequest();
					}
				else if(window.ActiveXObject){
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
					return;
				}
				if(xmlHttp === null)
					{
					alert("Browser does not support");
					}
				
				var url="display.jsp?shift="+p+"&count="+p1;
						
				xmlHttp.onreadystatechange = addemployee;
				xmlHttp.open("GET",url,true);
				xmlHttp.send(null);
				
				}
				function addemployee(){
					if(xmlHttp.readyState == 4 || xmlHttp.status== 200){
						document.getElementById("d").innerHTML=xmlHttp.responseText;
					}
				}
			
			function absentee(x,y,a,b)
			{
				b=document.getElementById("reason").value;
					if (typeof XMLHttpRequest != "undefined")
					{
					xmlHttp = new XMLHttpRequest();
					}
				else if(window.ActiveXObject){
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
					return;
				}
				if(xmlHttp === null)
					{
					alert("Browser does not support");
					}
				
				var url="absent.jsp?emp_id="+x+"&shift_id="+y+"&ss="+a+"&reason="+b;
				
										
				xmlHttp.onreadystatechange = addemployee1;
				xmlHttp.open("GET",url,true);
				xmlHttp.send(null);
				alert("Operation Successful");
				
				}
				function addemployee1(){
					if(xmlHttp.readyState == 4 || xmlHttp.status== 200){
						
					}
				}
					
				
				
</script>

</head>
<body>
<div class="container">
<div class="row table-responsive">
<h2 style="color:blue;" align="center"><b><u>List Of Employees</u></b></h2></br>
<h5 style="color:red;">**Please Mark only Today's Absent Employee**</h5></br>
<table class="table">
<tr><th> SHOP</th><th> SECTION </th><th> SUB-SECTION</th><th>SHIFT</th><th>REASON FOR ABSENT</th></tr>
<tr>
<td>
<select id="shop" onchange="showsection(this.value)" class="form-control">
<option  value="none" >select shop</option>
<option  value='Bogie' >Bogie</option>

</select></td>

<td>
<select id="sectionID" onchange="showsubsection(this.value)" class="form-control">
<option value="-1" >select section</option>

</select> </td>
<td>

<select id="subsectionID" class="form-control">
<option  value="-1">select subsection</option>

</select>
</td>
<td>
<select  id="shift"  class="form-control" onclick="javascript:absent(this.value)" name="shift"><option disabled selected>Select Shift</option><option value="Shift-1">Shift 1</option><option value="Shift-2">Shift 2</option><option value="general">General</option><option value="Shift-3">Shift 3</option></select>
</td>
<td>
<select name='reason' class="form-control" id='reason'><option disabled selected>Select Absent Reason</option><option value='leave'>Leave</option><option value='sick'>Sick</option><option value='OD'>OD</option><option value='IOD'>IOD</option><option value='absent'>Absent</option></select>
</td>
</tr>
</table><br/><br/></div>

<div id="d" class="row table-responsive">

</div>
</div>
</body>
</html>