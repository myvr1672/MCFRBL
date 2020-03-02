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
		<%
			  
			
				DbConnection db=new DbConnection();
		            Connection con=db.getConnection();
		            String dateOfProduction=request.getParameter("date");
		            String machineId=request.getParameter("machineId");
		            String shopId=request.getParameter("shopId");
		            
		          		            
			try {

				Statement stColumnCount,stMachineDescription,stMachineOperation, stMachineDailyProduction;

stColumnCount=con.createStatement();
stMachineDescription=con.createStatement();
stMachineOperation=con.createStatement();
stMachineDailyProduction=con.createStatement();


String machineOperationId, machineOperationDescription;


  
  %>
  
  <p>(Only number values are allowed)</p>
			<table class="customers">
			<tr> <th align ="center">Machine Description</th>
			<%
		String	SqlColumnCount= "select COUNT(*) from public.machine_operation where machine_id="+machineId+" " ;
			ResultSet	res=stColumnCount.executeQuery(SqlColumnCount);
			if(res.next())
			{ %>
				<th align ="center" colspan="<%=res.getString(1)%>">Operation of Machine</th>
				
		<% 	}
			%>
			  
 <tr>
 <% 
 String SqlMachineDescription="select machine_description from public.machine_master where machine_id="+machineId+"";
ResultSet res_machineDescription=stMachineDescription.executeQuery(SqlMachineDescription);
if(res_machineDescription.next())
{
 %>
 <th><%=res_machineDescription.getString(1)%> Type</th>
 <%
}
 String SqlMachineOperation="select machine_operation_id, machine_operation_description from public.machine_operation where machine_id="+machineId+"";
 ResultSet res_MachineOperation=stMachineOperation.executeQuery(SqlMachineOperation);
 while(res_MachineOperation.next())
     {
 
	 machineOperationId= res_MachineOperation.getString(1);
	 machineOperationDescription=res_MachineOperation.getString(2);
	%>
	<th><%=machineOperationDescription%></th>
<% } 
 %>
</tr>
<tr><td>Enter Qty of Production</td>
<%
  SqlMachineOperation="select machine_operation_id, machine_operation_description from public.machine_operation where machine_id="+machineId+"";
  res_MachineOperation=stMachineOperation.executeQuery(SqlMachineOperation);
while(res_MachineOperation.next())
     {
 
	 machineOperationId= res_MachineOperation.getString(1);
	 machineOperationDescription=res_MachineOperation.getString(2);
	 String machineDailyProduction="select qty_produced from public.machine_production_trans where machine_id="+machineId+" and machine_operation_id="+machineOperationId+" and date_of_production='"+dateOfProduction+"'";
	String qty="";
	ResultSet res_machineDailyProduction=stMachineDailyProduction.executeQuery(machineDailyProduction);
	while(res_machineDailyProduction.next())
			{
		qty=res_machineDailyProduction.getString(1);
   	  if(qty==null)
   	  qty="";
			}
	%>
<td><input type="text" name="qty" value="<%=qty%>" size="2" onkeypress="return isNumberKey(event)" onblur="retrieveURL('MachineUtilization_do.jsp?machineId=<%=machineId%>&machineOperationId=<%=machineOperationId%>&dateOfProduction=<%=dateOfProduction%>&FIELD=qty_produced', this.value)"/></td>
<% 
}  %>
</tr>
  <%  }
          
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
	var dateField=new Date('<%=dateOfProduction%>');	
	//var currentDate=new Date();
	var currentDate = new Date(new Date() - 15*86400000);

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