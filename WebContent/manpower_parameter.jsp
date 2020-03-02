<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import= "java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Scanner"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.util.Map" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="com.opensymphony.xwork2.ActionSupport" %>
<%@ page import="org.apache.struts2.ServletActionContext" %>
<%@ page import="org.apache.struts2.dispatcher.SessionMap" %>
<%@ page import="org.apache.struts2.interceptor.SessionAware" %>
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
					
		function showjob()
			{
				p=document.getElementById("jobID").value;
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
				
				var url="job_description.jsp?job="+p+"&sub="+p1;
						
				xmlHttp.onreadystatechange = job;
				xmlHttp.open("GET",url,true);
				xmlHttp.send(null);
				
				}
				function job(){
					if(xmlHttp.readyState == 4 || xmlHttp.status== 200){
						document.getElementById("jobID").innerHTML=xmlHttp.responseText;
					}
				}
				
				
		function showman()
					{
						p=document.getElementById("jobID").value;
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
						
						var url="manpowerlist.jsp?job="+p+"&sub="+p1;
								
						xmlHttp.onreadystatechange = man;
						xmlHttp.open("GET",url,true);
						xmlHttp.send(null);
						
						}
						function man(){
							if(xmlHttp.readyState == 4 || xmlHttp.status== 200){
								document.getElementById("d").innerHTML=xmlHttp.responseText;
							}
						}
					
				
</script>

</head>
<body>

<div class="container">
<div class="row table-responsive">
<h2 style="color:blue;" align="center"><b><u>JOB WISE MANPOWER BOOKING</u></b></h2></br>
<table class="table">
<tr><th> SHOP</th><th> SECTION </th><th> SUB-SECTION</th><th>JOB DESCRIPTION</th></tr>
<tr>
<td>
<select id="shop" onchange="showsection(this.value)" class="form-control">
<option  value="none" >select shop</option>
<option  value='Wheel' >Wheel Shop</option>
<option  value='Bogie' >Bogie Shop</option>
</select></td>

<td>
<select id="sectionID" onchange="showsubsection(this.value)" class="form-control">
<option value="-1" >select section</option>

</select> </td>

<td>

<select id="subsectionID" class="form-control"  onchange="showjob()" >
<option  value="-1">select subsection</option>
</select>
</td>
<td>
<select  id="jobID"  class="form-control" name="job" onchange="showman()" >
<option  value="-1"> select job description</option>
</select>
</td>
</tr>
</table><br/><br/></div>

<div id="d" class="row table-responsive">

</div>
</div>
</body>
</html>