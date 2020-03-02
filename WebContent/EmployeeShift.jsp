<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="dao.*" %>

<!DOCTYPE html>
<html>
<head>
<style>
.customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

.customers td, .customers th {
    border: 1px solid #ddd;
    padding: 2px;
    width: 100px;
    
}

.customers tr:nth-child(even){background-color: #f2f2f2;}

.customers tr:hover {background-color: #ddd;}

.customers th {
    padding-top: 6px;
    padding-bottom: 6px;
    text-align: left;
    background-color: #8d9c8e;
    color: white;
}
</style>
<title>Master Production Sheet</title>
<script type="text/javascript">
 
function retrieveURL(url,v)
{
	 //tdt=document.getElementById("tdt").value;
	
    //  url=url+"&qty="+v+"&tdt="+tdt;
    url=url+"&qty="+v;
      //alert(url);

  if (window.XMLHttpRequest) { // Non-IE browsers
    req = new XMLHttpRequest();
    req.onreadystatechange = processStateChange;
    try {
      req.open("GET", url, true);
    } catch (e) {
      alert(e);
    }
    req.send(null);
  } else if (window.ActiveXObject) { // IE
    req = new ActiveXObject("Microsoft.XMLHTTP");
    if (req) {
      req.onreadystatechange = processStateChange;
      req.open("GET", url, true);
      req.send();
    }
  }
}

function processStateChange() {
  if (req.readyState == 4) { // Complete
    if (req.status == 200) { // OK response
      document.getElementById("dep").innerHTML = req.responseText;


    } else {
              document.getElementById("dep").innerHTML = req.responseText;
      alert("Problem: " + req.statusText);
    }
  }

}

</script>

</head>
<body>

<div id="dep"></div>

<%
DbConnection db=new DbConnection();
Connection con=db.getConnection(); 
String date=request.getParameter("date");
out.print(date);
String subsectionId=request.getParameter("subSectionId");
 try 
 {
Statement st_row, st_column, st_value;
st_row=con.createStatement();
st_column=con.createStatement();
st_value=con.createStatement();
String sql_row="";
ResultSet rs_column, rs_row, rs_value;

Calendar calendar1 = Calendar.getInstance();
//out.println("Calender1: "+calendar1.getTime());
int doy1 = calendar1.get(Calendar.DAY_OF_YEAR);

Calendar calendar2 = Calendar.getInstance();
//out.println("System Enter Date: " +date);
int year= Integer.parseInt(date.substring(0,4));
//out.println("Year :" +year);
int month=Integer.parseInt(date.substring(5,7))-1;
//out.println("Month :" +month);
int day= Integer.parseInt(date.substring(8,10));
//out.println("Day :" +day);
calendar2.set(year, month, day);
//out.println("Calender2: "+calendar2.getTime());
int doy2=calendar2.get(Calendar.DAY_OF_YEAR);
int difference= doy1-doy2;
//out.println("Doy1 :" +doy1);
//out.println("Doy2 :"+doy2);
//out.println("Difference: "+difference);
  %>
 
  
  <table class="customers">   
 <tr>
 <th>Employee</th>
 <th>Choose Shift</th>
</tr>

<% 
sql_row="select emp_no, emp_name from public.emp_master where sub_section='"+subsectionId+"' and validity_from <='"+date+"'  and validity_to>='"+date+"' and status='working'";
rs_row=st_row.executeQuery(sql_row);
int i=1;
while(rs_row.next())
{
	
	String empNo=rs_row.getString(1);
	String empName=rs_row.getString(2);
	
	%>
	
	<tr><td><%=empName%></td><td>
<% 	String sqlValue="select shift_id from public.shift_roaster_transaction where emp_id='"+empNo+"' and validity_from<='"+date+"'";
rs_value=st_value.executeQuery(sqlValue);

if(rs_value.next())
		{
	
	String shiftValue=rs_value.getString(1);
	if(shiftValue.equals("general")) 
	{  %>
		<input type="radio" name="shift<%=i%>" value="general" checked="checked"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">General, &nbsp;&nbsp;&nbsp;	
<% 	}
	else
	{  %>
<input type="radio" name="shift<%=i%>" value="general"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">General, &nbsp;&nbsp;&nbsp;
<% 	}
	if(shiftValue.equals("morning")) 
	{  %>
		<input type="radio" name="shift<%=i%>" value="morning" checked="checked"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">Shift-I, &nbsp;&nbsp;&nbsp;	
<% 	}
	else
	{  %>
<input type="radio" name="shift<%=i%>" value="morning"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">Shift-I, &nbsp;&nbsp;&nbsp;
<% 	}
	if(shiftValue.equals("evening")) 
	{  %>
		<input type="radio" name="shift<%=i%>" value="evening" checked="checked"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">Shift-II, &nbsp;&nbsp;&nbsp;	
<% 	}
	else
	{  %>
<input type="radio" name="shift<%=i%>" value="evening"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">Shift-II, &nbsp;&nbsp;&nbsp;
<% 	}
	if(shiftValue.equals("night")) 
	{  %>
		<input type="radio" name="shift<%=i%>" value="night" checked="checked"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">Shift-III, &nbsp;&nbsp;&nbsp;	
<% 	}
	else
	{  %>
<input type="radio" name="shift<%=i%>" value="night"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">Shift-III, &nbsp;&nbsp;&nbsp;
<% 	} %>
	<input type="radio" name="shift<%=i%>" value=""  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">None		
<% 	}  
 else
 {   
sqlValue="select shift_id from public.shift_roaster_history where emp_id='"+empNo+"' and validity_from<='"+date+"' and validity_to>='"+date+"'";
	 rs_value=st_value.executeQuery(sqlValue);
	 if(rs_value.next())
		{
	
	String shiftValue=rs_value.getString(1);
	if(shiftValue.equals("general")) 
	{  %>
		<input type="radio" name="shift<%=i%>" value="general" checked="checked"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">General, &nbsp;&nbsp;&nbsp;	
<% 	}
	else
	{  %>
<input type="radio" name="shift<%=i%>" value="general"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">General, &nbsp;&nbsp;&nbsp;
<% 	}
	if(shiftValue.equals("morning")) 
	{  %>
		<input type="radio" name="shift<%=i%>" value="morning" checked="checked"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">Shift-I, &nbsp;&nbsp;&nbsp;	
<% 	}
	else
	{  %>
<input type="radio" name="shift<%=i%>" value="morning"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">Shift-I, &nbsp;&nbsp;&nbsp;
<% 	}
	if(shiftValue.equals("evening")) 
	{  %>
		<input type="radio" name="shift<%=i%>" value="evening" checked="checked"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">Shift-II, &nbsp;&nbsp;&nbsp;	
<% 	}
	else
	{  %>
<input type="radio" name="shift<%=i%>" value="evening"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">Shift-II, &nbsp;&nbsp;&nbsp;
<% 	}
	if(shiftValue.equals("night")) 
	{  %>
		<input type="radio" name="shift<%=i%>" value="night" checked="checked"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">Shift-III, &nbsp;&nbsp;&nbsp;	
<% 	}
	else
	{  %>
<input type="radio" name="shift<%=i%>" value="night"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">Shift-III, &nbsp;&nbsp;&nbsp;
<% 	} %>
	<input type="radio" name="shift<%=i%>" value=""  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">None		
<% 	}  
	 else
	 {
 %>

<input type="radio" name="shift<%=i%>" value="general"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">General, &nbsp;&nbsp;&nbsp; 

<input type="radio" name="shift<%=i%>" value="morning"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">Shift-I, &nbsp;&nbsp;&nbsp; 

<input type="radio" name="shift<%=i%>" value="evening"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">Shift-II, &nbsp;&nbsp;&nbsp;

<input type="radio" name="shift<%=i%>" value="night"  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">Shift-III, &nbsp;&nbsp;&nbsp;

<input type="radio" name="shift<%=i%>" value=""  onclick="retrieveURL('EmployeeShift_do.jsp?dateField=<%=date%>&subsection_id=<%=subsectionId%>&employeeId=<%=empNo%>&FIELD=shift_id', this.value)">None
<%}
	 
	 }%>
	</td>
	</tr>
	<% i++;
   
}

    }
          
          catch(Exception e)
          {
               out.println("Exception Here "+e.toString());
          }
 finally
 {
	 con.close();
 }
             %>   
       
           </table>
</body>
<script>
$(document).ready(function(){
	var dateField=new Date('<%=date%>');	
	//var currentDate=new Date();
	var currentDate = new Date(new Date() - 86400000);

	var x= currentDate.getTime();
	var y= dateField.getTime();

	if(y < x)
		
		{ $("input[type=radio]").attr('disabled', true);  }
	else
		{
		{ $("input[type=radio]").attr('disabled', false);  }
		}
	});
</script>
</html>