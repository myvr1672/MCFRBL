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

.tooltip {
  position: relative;
  display: inline-block;
  border-bottom: 1px dotted black;
}

  .tooltip .tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;
  
  /* Position the tooltip */
  position: absolute;
  z-index: 1;
  bottom: 100%;
  left: 50%;
  margin-left: -60px;
}

.tooltip:hover .tooltiptext {
  visibility: visible;
  }
</style>
<title>Master Production Sheet</title>
<script type="text/javascript">
  
function isNumberKey(el, evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    var number = el.value.split('.');
    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    //just one dot
    if(number.length>1 && charCode == 46){
         return false;
    }
    //get the carat position
    var caratPos = getSelectionStart(el);
    var dotPos = el.value.indexOf(".");
    if( caratPos > dotPos && dotPos>-1 && (number[1].length > 1)){ //Change 1 to 2 for 3 places of decimal allowed
        return false;
    }
    return true;
}

//thanks: http://javascript.nwbox.com/cursor_position/
function getSelectionStart(o) {
	if (o.createTextRange) {
		var r = document.selection.createRange().duplicate();
		r.moveEnd('character', o.value.length);
		if (r.text == '') return o.value.length
		return o.value.lastIndexOf(r.text)
	} else return o.selectionStart
}
     

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
Statement st_row, st_column, st_qty;
st_row=con.createStatement();
st_column=con.createStatement();
st_qty=con.createStatement();
String empId, empName, jobId, jobDescription ;
String sql_row, sql_column;
ResultSet rs_column, rs_row, rs_qty;



  %>
  
  <p>(Allocate time duration in HRS)</p>
  
  <table class="customers">  
  <tr>
  <th rowspan="2">Job Description</th>
  <%String sql_count="select count (emp_id) from public.shift_roaster_transaction where shift_id='"+shift+"' and validity_from<='"+date+"' and emp_id not in (select emp_id from public.employee_absent_transaction where shift_id='"+shift+"' and absent_date='"+date+"')";
 Statement st=con.createStatement();
 int count=0;
 ResultSet res= st.executeQuery(sql_count);
 if(res.next())
 {count=res.getInt(1);}
 %>
 <th colspan="<%=count%>">Present Employee ID in Shift <%=shift%> (Only numeric value allowed. Enter value in HRS)</th>
  </tr> 
 <tr>
 <%
        sql_column="select B.emp_id, A.emp_name from public.shift_roaster_transaction as B, public.emp_master as A   where A.emp_no=B.emp_id and B.shift_id='"+shift+"' and A.sub_section='"+subsectionId+"' and B.validity_from<= '"+date+"'  and B.emp_id not in (select emp_id from public.employee_absent_transaction where shift_id='"+shift+"' and absent_date='"+date+"')";
        rs_column=st_column.executeQuery(sql_column);
        while(rs_column.next())
        {
        	empId=rs_column.getString(1);
        	empName=rs_column.getString(2);
       %>
   <td title="<%=empName%>" width="5%"><%=empId%></td>
    <% }
    %> 
      </tr>
         <%   
       
       sql_row="select job_seq_no, job_description from public.job_transaction where sub_section='"+subsectionId+"' and status!='completed' order by job_seq_no";
      
       rs_row=st_row.executeQuery(sql_row);
          while(rs_row.next())
                {
         jobId=rs_row.getString(1); 
         jobDescription=rs_row.getString(2);%>
         <tr>
         <td width="5%"><%=jobDescription%></td>
         <% 
          sql_column="select B.emp_id, A.emp_name from public.shift_roaster_transaction as B, public.emp_master as A   where A.emp_no=B.emp_id and B.shift_id='"+shift+"' and A.sub_section='"+subsectionId+"' and B.validity_from<= '"+date+"'  and B.emp_id not in (select emp_id from public.employee_absent_transaction where shift_id='"+shift+"' and absent_date='"+date+"')";
        // select B.emp_id, A.emp_name from public.shift_roaster_transaction as B, public.emp_master as A   where A.emp_no=B.emp_id and B.shift_id='"+shift+"' and A.sub_section='"+subsectionId+"' and B.validity_from<= '"+date+"'  and B.emp_id not in (select emp_id from public.employee_absent_transaction where shift_id='"+shift+"' and absent_date='"+date+"' and absent_type='fulltime') 
         rs_column=st_column.executeQuery(sql_column);
           while(rs_column.next())
           { 
           
        	empId=rs_column.getString(1);
           	empName=rs_column.getString(2);
        
          
   String  sql_qty= "select job_alloted_time from public.job_allocation_trans where emp_id='"+empId+"' and shift_id='"+shift+"' and job_seq_no="+jobId+" and job_alocation_date='"+date+"'" ;
          
   rs_qty=st_qty.executeQuery(sql_qty);  
           String qty="";
           while(rs_qty.next())
           {
         	  qty=rs_qty.getString(1);
         	  if(qty==null)
         	  qty=""; 
           }
                
        	   %>

<td> <input type="text" id="txtChar" onkeypress="return isNumberKey(this, event)" name="jobAllotedTime" size="3"  value="<%=qty%>"  onblur="retrieveURL('JobAllocation_do.jsp?employeeId=<%=empId%>&shiftId=<%=shift%>&jobId=<%=jobId%>&date=<%=date%>&FIELD=job_alloted_time', this.value)"/></td>

  
         <%   } %>
            </tr>
            <% 
           
 }
                }
          
          catch(Exception e)
          {
               out.println("Exception Here "+e.toString());
          }
 finally{
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
	
	{ $("input[type=text]").attr('disabled', true);  }
else
	{
	{ $("input[type=text]").attr('disabled', false);  }
	}
});
</script>

</html>