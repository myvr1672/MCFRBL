<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
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
    padding: 8px;
}

.customers tr:nth-child(even){background-color: #f2f2f2;}

.customers tr:hover {background-color: #ddd;}

.customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #8d9c8e;
    color: white;
}
</style>
<title>Annual Target</title>
<script type="text/javascript">
function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
var req;
var which;
var req1;

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

			<%@ page import="java.util.*" %>
			<%@ page import="java.sql.*" %>
			<%@ page import="java.text.*" %>
			 <%@ page import="dao.*" %>
			 <%@ page import="java.util.Date" %>
		<%
			
				DbConnection db=new DbConnection();
		            Connection con=db.getConnection();
		            Integer assetId=Integer.parseInt(request.getParameter("assetId"));
		            String substageId=request.getParameter("substageId");
		           
		            
		            //out.println(yearEntered);
		            
			try {

				Statement st_row, st_column, st_qty;
st_row=con.createStatement();
st_column=con.createStatement();
st_qty=con.createStatement();
String activityId, activityDescription;
int month_seq;
String sql_row, sql_column;
ResultSet rs_column, rs_row, rs_qty;

  
  %>
  
 
			<table class="customers">
			<tr> <th>Activity Description</th>
			    <th>Start Date</th>
			    <th>End Date</th>
			    <th>Time Taken</th>
			    <th>Assigned Person</th>
			    <th>Remarks</th>
			    <th>Delay, if Any</th>
			    
			</tr>  
 
 

 <%

        sql_row="select activity_id, activity_description from public.activity_master where substage_id= '"+substageId+"'";
        rs_row=st_row.executeQuery(sql_row);
        
        while(rs_row.next())
            {
        	activityId=rs_row.getString(1);
        	activityDescription=rs_row.getString(2);
        	%>
        	<tr>
        	<th><%=activityDescription%></th>
        	<% 
        	SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        	Date startDateD=null;
        	String   startDate=""; String endDate=""; String remarks=""; Integer timeTaken=0; String asignedPerson=""; String delayReason="";
        	
        	 sql_column= "select reamrks, activity_start_date, activity_end_date, time_taken, assigned_person, delay_reason  from public.activity_transaction where activity_id='"+activityId+"' and substage_id='"+substageId+"' and asset_id='"+assetId+"' " ;
        	   rs_column= st_column.executeQuery(sql_column);
        	   while(rs_column.next())
        	   {
        		   remarks=rs_column.getString(1);  
        	  startDate=rs_column.getString(2);
        	  endDate=rs_column.getString(3);
        	  timeTaken= Integer.parseInt(rs_column.getString(4));
        	  asignedPerson=rs_column.getString(5);
        	  delayReason=rs_column.getString(6);
        	   }
     	       
        	  
//      			if(!("".equals(startDate)))
//        						   {
//       			startDateD = df.parse(startDate);
//          						}
        	   
        	%>
        	<td><input type="date" name="qty" value="<%=startDate%>"   onblur="retrieveURL('activityInsertion.jsp?activityId=<%=activityId%>&substageId=<%=substageId%>&assetId=<%=assetId%>&FIELD=activity_start_date', this.value)"/></td>
        	<td><input type="date" name="qty" value="<%=endDate%>"  onblur="retrieveURL('activityInsertion.jsp?activityId=<%=activityId%>&substageId=<%=substageId%>&assetId=<%=assetId%>&FIELD=activity_end_date', this.value)"/></td>
        	<td><input type="text" name="qty" value="<%=timeTaken%>"   onkeypress="return isNumberKey(event)"  onblur="retrieveURL('activityInsertion.jsp?activityId=<%=activityId%>&substageId=<%=substageId%>&assetId=<%=assetId%>&FIELD=time_taken', this.value)"/></td>
        	<td><input type="text" name="qty" value="<%=asignedPerson%>"  onblur="retrieveURL('activityInsertion.jsp?activityId=<%=activityId%>&substageId=<%=substageId%>&assetId=<%=assetId%>&FIELD=assigned_person', this.value)"/></td>
            <td><input type="text" name="qty" value="<%=remarks%>"  onblur="retrieveURL('activityInsertion.jsp?activityId=<%=activityId%>&substageId=<%=substageId%>&assetId=<%=assetId%>&FIELD=reamrks', this.value)"/></td>
            <td><input type="text" name="qty" value="<%=delayReason%>"  onblur="retrieveURL('activityInsertion.jsp?activityId=<%=activityId%>&substageId=<%=substageId%>&assetId=<%=assetId%>&FIELD=delay_reason', this.value)"/></td>
            </tr>
       <% 	}
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
</html>