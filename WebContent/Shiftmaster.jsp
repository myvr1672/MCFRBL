<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <% String contextpath=request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
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
	var url="section.jsp?count="+str;
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
		var url="subsection.jsp?count="+str;
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
		
		
	
		
		function showemp(str)
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
			var url="emp.jsp?count="+str;
			//url + "?count=" +str;
			xmlHttp.onreadystatechange = empchange;
			xmlHttp.open("GET",url,true);
			xmlHttp.send(null);
			
			}
			function empchange(){
				if(xmlHttp.readyState == 4 || xmlHttp.status== 200){
					document.getElementById("d2").innerHTML=xmlHttp.responseText;
				}
			}
			
			function addshift(x,y)
			{
				//alert(y);
				p=document.getElementById("datealot").value;
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
				
				var url="Assignradio.jsp?eno="+x+"&ss="+y+"&dd="+p;
						//+"&ss="+y;
						
				//url + "?count=" +str;
				xmlHttp.onreadystatechange = addshiftchange;
				xmlHttp.open("GET",url,true);
				xmlHttp.send(null);
				
				}
				function addshiftchange(){
					if(xmlHttp.readyState == 4 || xmlHttp.status== 200){
						
						document.getElementById("d3").innerHTML=xmlHttp.responseText;
						//alert("hello");
						 //oo = document.getElementById('h1').value;
						//alert(document.getElementById('h1').value);
							
							//alert(oo);
							//alert("check the remarks below date");
						
						//document.getElementByTagName("input").disabled=true;
					}
				}
				
				
				
</script>
<style>
.table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
  background-color:#ADD8E6;
}
</style>

</head>
<body >
<div class="container">
<div class="row table-responsive">
<h2 style="text-align:center; color:#2B65EC"><b><u>SHIFT ALLOTMENT</u></b></h2><br/><br/>
<table class="table table-bordered table-hover">
<tr>
<td>
<select id="shop" onchange="showsection(this.value)" class="form-control">
<option  value="none" >select shop</option>
<option  value='Bogie' >Bogie</option>
<%-- <%


Class.forName("org.postgresql.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/MCFRBL","postgres","happy");
Statement stmt= con.createStatement();
ResultSet rs = stmt.executeQuery("select shop_id, shop_name from public.shop");
while(rs.next())
{
	%>
	<option value=<%=rs.getInt(1) %> > <%=rs.getString(2) %> </option>
	<% 
}

%> --%>


</select></td>
<td></td>
<td>
<select id="sectionID" onchange="showsubsection(this.value)" class="form-control">
<option value="-1" >select section</option>

</select> </td>
<td></td>
<td>

<select id="subsectionID" onchange="showemp(this.value)" class="form-control">
<option  value="-1">select subsection</option>

</select>
</td>
<td></td>
<td>

<input type="date" id="datealot" name="dateallot" class="form-control" /></td>
</tr>
</table><br/><br/></div>
<div id="d3" class="row table-responsive" >
</div>
<div id="d2" class="row table-responsive">

</div>

</div>
</body>
</html>