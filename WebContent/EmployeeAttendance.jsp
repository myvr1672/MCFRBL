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
String subsectionId=request.getParameter("subSectionId");
String shift=request.getParameter("shift");
 try 
 {
Statement st_row, st_column, st_value;
st_row=con.createStatement();
st_column=con.createStatement();
st_value=con.createStatement();
String sql_row="";
ResultSet rs_column, rs_row, rs_value;


  %>
 
  
  <table class="customers">   
 <tr>
 <th>Employee</th>
 <th>Choose Absent Type</th>
</tr>

<% 
sql_row="select B.emp_id, A.emp_name from public.shift_roaster_transaction as B, public.emp_master as A   where A.emp_no=B.emp_id and B.shift_id='"+shift+"' and A.sub_section='"+subsectionId+"' and B.validity_from<= '"+date+"'";
rs_row=st_row.executeQuery(sql_row);
int i=1;
while(rs_row.next())
{
	String empNo=rs_row.getString(1);
	
	String empName=rs_row.getString(2);
	
	%>
	
	<tr><td><%=empName%></td><td>
<% 	String sqlValue="select absent_type from public.employee_absent_transaction where emp_id='"+empNo+"' and shift_id ='"+shift+"' and absent_date='"+date+"'";
rs_value=st_value.executeQuery(sqlValue);

if(rs_value.next())
		{
	
	String absentValue=rs_value.getString(1);
	if(absentValue.equals("leave")) 
	{  %>
		<input type="radio" name="absent<%=i%>" value="leave" checked="checked"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">LEAVE, &nbsp;&nbsp;&nbsp;	
<% 	}
	else
	{  %>
<input type="radio" name="absent<%=i%>" value="leave"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">LEAVE, &nbsp;&nbsp;&nbsp;
<% 	}
	
	if(absentValue.equals("sick")) 
	{  %>
		<input type="radio" name="absent<%=i%>" value="sick" checked="checked"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">SICK, &nbsp;&nbsp;&nbsp;	
<% 	}
	else
	{  %>
<input type="radio" name="absent<%=i%>" value="sick"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">SICK,&nbsp;&nbsp;&nbsp;
<% 	}
	if(absentValue.equals("od")) 
	{  %>
		<input type="radio" name="absent<%=i%>" value="od" checked="checked"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">ON DUTY, &nbsp;&nbsp;&nbsp;	
<% 	}
	else
	{  %>
<input type="radio" name="absent<%=i%>" value="od"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">ON DUTY, &nbsp;&nbsp;&nbsp;
<% 	} 
if(absentValue.equals("iod")) 
	{  %>
		<input type="radio" name="absent<%=i%>" value="iod" checked="checked"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">IOD, &nbsp;&nbsp;&nbsp;	
<% 	}
	else
	{  %>
<input type="radio" name="absent<%=i%>" value="iod"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">IOD, &nbsp;&nbsp;&nbsp;
<% 	} 
if(absentValue.equals("CR")) 
{  %>
	<input type="radio" name="absent<%=i%>" value="CR" checked="checked"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">Compensatory Rest, &nbsp;&nbsp;&nbsp;	
<% 	}
else
{  %>
<input type="radio" name="absent<%=i%>" value="CR"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">Compensatory Rest, &nbsp;&nbsp;&nbsp;
<% 	} 
if(absentValue.equals("TTC")) 
{  %>
	<input type="radio" name="absent<%=i%>" value="TTC" checked="checked"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">Technical Training Centre, &nbsp;&nbsp;&nbsp;	
<% 	}
else
{  %>
<input type="radio" name="absent<%=i%>" value="TTC"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">Technical Training Centre, &nbsp;&nbsp;&nbsp;
<% 	} 
if(absentValue.equals("absent")) 
	{  %>
		<input type="radio" name="absent<%=i%>" value="iod" checked="checked"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">ABSENT, &nbsp;&nbsp;&nbsp;	
<% 	}
	else
	{  %>
<input type="radio" name="absent<%=i%>" value="absent"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">ABSENT, &nbsp;&nbsp;&nbsp;
<% 	}  %>
	<input type="radio" name="absent<%=i%>" value=""  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">None
<% 	}
else
{

%>
<input type="radio" name="absent<%=i%>" value="leave"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">LEAVE, &nbsp;&nbsp;&nbsp;
<input type="radio" name="absent<%=i%>" value="sick"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">SICK,&nbsp;&nbsp;&nbsp;
<input type="radio" name="absent<%=i%>" value="od"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">ON DUTY, &nbsp;&nbsp;&nbsp;
<input type="radio" name="absent<%=i%>" value="iod"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">IOD, &nbsp;&nbsp;&nbsp;
<input type="radio" name="absent<%=i%>" value="CR"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">Compensatory Rest, &nbsp;&nbsp;&nbsp;
<input type="radio" name="absent<%=i%>" value="TTC"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">Technical Training Centre, &nbsp;&nbsp;&nbsp;
<input type="radio" name="absent<%=i%>" value="absent"  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">ABSENT, &nbsp;&nbsp;&nbsp;
<input type="radio" name="absent<%=i%>" value=""  onclick="retrieveURL('EmployeeAttendance_do.jsp?dateField=<%=date%>&shift=<%=shift%>&employeeId=<%=empNo%>&FIELD=absent_type', this.value)">None
<%} %>	</td>
	</tr>
	<%   i++;
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