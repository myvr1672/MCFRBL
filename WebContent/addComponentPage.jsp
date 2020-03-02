<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
    text-align: center;
    background-color: #8d9c8e;
    color: white;
}
</style>
<script type="text/javascript">
var req;

function retrieveURL(url,v)
{
	
    url=url+"&qty="+v;
     

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
<title>Insert title here</title>
</head>
<body>
<div id="dep"></div>

			<%@ page import="java.util.*" %>
			<%@ page import="java.sql.*" %>
			<%@ page import="java.text.*" %>
			 <%@ page import="dao.*" %>
			 <%@ page import="java.util.Date" %>
<% 
String type=request.getParameter("type");
//String subType=request.getParameter("subType");
Integer assetId=Integer.parseInt(request.getParameter("assetId"));
//out.println("type:"+type+ ",sub-type:"+subType+" ,assetId: "+assetId);
DbConnection db=new DbConnection();
Connection con=db.getConnection();
try {

	Statement st_row, st_column, st_qty;
st_row=con.createStatement();
st_column=con.createStatement();
st_qty=con.createStatement();
String  componentDetails;
Integer componentId;
int month_seq;
String sql_row, sql_column;
ResultSet rs_column, rs_row, rs_qty;

if(type.equals("OS"))
{
%>
<table class="customers">

			<tr> <th rowspan="2">Component Description</th>
			    <th colspan="2">Earth End Side</th>
			    <th colspan="2">Earth End Phonic Wheel</th>
			    <th colspan="2">Plane Side</th>
			    <th colspan="2">Plane Phonic Wheel</th>
			</tr>  
 <tr>
 <th>Make</th>
 <th>Number</th>
 <th>Make</th>
 <th>Number</th>
 <th>Make</th>
 <th>Number</th>
 <th>Make</th>
 <th>Number</th>
 </tr>
 <tr>
<% 
      sql_row="select component_id, component_details from public.component_master where component_type= '"+type+"' and component_class='Bogie'";
       rs_row=st_row.executeQuery(sql_row);
        
       while(rs_row.next())
             {
        	componentId=Integer.parseInt(rs_row.getString(1));
        	componentDetails=rs_row.getString(2);
       	%> 
         	 
        	<th><%=componentDetails%></th> 
         	<%  
  // for first tow column of Earth End Side     	
      String   assetNumber1=""; String make1=""; 
	sql_column= "select asset_number, make  from public.component_transaction where component_id='"+componentId+"' and asset_id='"+assetId+"' and component_sub_type='OS1'" ;
     	   rs_column= st_column.executeQuery(sql_column);
       	   if(rs_column.next())
         	   {
         	assetNumber1=rs_column.getString(1);  
         	if(assetNumber1==null) {assetNumber1="";}
        	 make1=rs_column.getString(2);
        	 if(make1==null){make1="";}
        	 
        	   }
     	  	%> 
     	<td><input type="text" name="qty" value="<%=assetNumber1%>"   onblur="retrieveURL('componentInsertion.jsp?assetId=<%=assetId%>&component_id=<%=componentId%>&component_sub_type=OS1&FIELD=asset_number', this.value)"/></td>
        <td><input type="text" name="qty" value="<%=make1%>"  onblur="retrieveURL('componentInsertion.jsp?assetId=<%=assetId%>&component_id=<%=componentId%>&component_sub_type=OS1&FIELD=make', this.value)"/></td> 
   <% 
// for second tow column of Earth End Phonic Wheel Side   
      String   assetNumber2=""; String make2=""; 
	sql_column= "select asset_number, make  from public.component_transaction where component_id='"+componentId+"' and asset_id='"+assetId+"' and component_sub_type='OS2'" ;
     	   rs_column= st_column.executeQuery(sql_column);
       	   if(rs_column.next())
         	   {
         	assetNumber2=rs_column.getString(1);  
         	if(assetNumber2==null) {assetNumber2="";}
        	 make2=rs_column.getString(2);
        	 if(make2==null){make2="";}
        	 
        	   }
     	  	%> 
     	<td><input type="text" name="qty" value="<%=assetNumber2%>"   onblur="retrieveURL('componentInsertion.jsp?assetId=<%=assetId%>&component_id=<%=componentId%>&component_sub_type=OS2&FIELD=asset_number', this.value)"/></td>
        <td><input type="text" name="qty" value="<%=make2%>"  onblur="retrieveURL('componentInsertion.jsp?assetId=<%=assetId%>&component_id=<%=componentId%>&component_sub_type=OS2&FIELD=make', this.value)"/></td> 
      <% 
     
     // for Fourth tow column of Plane Phonic Wheel Side   
      String   assetNumber3=""; String make3=""; 
	sql_column= "select asset_number, make  from public.component_transaction where component_id='"+componentId+"' and asset_id='"+assetId+"' and component_sub_type='OS3'" ;
     	   rs_column= st_column.executeQuery(sql_column);
       	   if(rs_column.next())
         	   {
         	assetNumber3=rs_column.getString(1); 
         	if(assetNumber3==null) {assetNumber3="";}
        	 make3=rs_column.getString(2);
        	 if(make3==null){make3="";}
        	   }
     	  	%> 
     	<td><input type="text" name="qty" value="<%=assetNumber3%>"   onblur="retrieveURL('componentInsertion.jsp?assetId=<%=assetId%>&component_id=<%=componentId%>&component_sub_type=OS3&FIELD=asset_number', this.value)"/></td>
        <td><input type="text" name="qty" value="<%=make3%>"  onblur="retrieveURL('componentInsertion.jsp?assetId=<%=assetId%>&component_id=<%=componentId%>&component_sub_type=OS3&FIELD=make', this.value)"/></td> 
        <% 
     // for third tow column of Plane Side   
        String   assetNumber4=""; String make4=""; 
  	sql_column= "select asset_number, make  from public.component_transaction where component_id='"+componentId+"' and asset_id='"+assetId+"' and component_sub_type='OS4'" ;
       	   rs_column= st_column.executeQuery(sql_column);
         	   if(rs_column.next())
           	   {
           	assetNumber4=rs_column.getString(1);  
           	if(assetNumber4==null) {assetNumber4="";}
          	 make4=rs_column.getString(2);
          	 if(make4==null){make4="";}
          	   }
       	  	%> 
       	<td><input type="text" name="qty" value="<%=assetNumber4%>"   onblur="retrieveURL('componentInsertion.jsp?assetId=<%=assetId%>&component_id=<%=componentId%>&component_sub_type=OS4&FIELD=asset_number', this.value)"/></td>
          <td><input type="text" name="qty" value="<%=make4%>"  onblur="retrieveURL('componentInsertion.jsp?assetId=<%=assetId%>&component_id=<%=componentId%>&component_sub_type=OS4&FIELD=make', this.value)"/></td> 
        
            </tr>
       <% 	} %>
       </table>
<% 	}
if(type.equals("LSD"))
{
	%>
	<table class="customers">

				<tr> <th rowspan="2">Component Description</th>
				    <th colspan="2">Lateral Damper Side</th>
				    <th colspan="2">Non Lateral Damper Side</th>
				   
				</tr>  
	 <tr>
	 <th>Make</th>
	 <th>Number</th>
	 <th>Make</th>
	 <th>Number</th>
	 
	 </tr>
	 <tr>
	<% 
	      sql_row="select component_id, component_details from public.component_master where component_type= '"+type+"' and component_class='Bogie'";
	       rs_row=st_row.executeQuery(sql_row);
	        
	       while(rs_row.next())
	             {
	        	componentId=Integer.parseInt(rs_row.getString(1));
	        	componentDetails=rs_row.getString(2);
	       	%> 
	         	 
	        	<th><%=componentDetails%></th> 
	         	<%  
	  // for first tow column of Earth End Side     	
	      String   assetNumber1=""; String make1=""; 
		sql_column= "select asset_number, make  from public.component_transaction where component_id='"+componentId+"' and asset_id='"+assetId+"' and component_sub_type='LDS'" ;
	     	   rs_column= st_column.executeQuery(sql_column);
	       	   if(rs_column.next())
	         	   {
	         	assetNumber1=rs_column.getString(1); 
	         	if(assetNumber1==null) {assetNumber1="";}
	        	 make1=rs_column.getString(2);
	        	 if(make1==null){make1="";}
	        	   }
	     	  	%> 
	     	<td><input type="text" name="qty" value="<%=assetNumber1%>"   onblur="retrieveURL('componentInsertion.jsp?assetId=<%=assetId%>&component_id=<%=componentId%>&component_sub_type=LDS&FIELD=asset_number', this.value)"/></td>
	        <td><input type="text" name="qty" value="<%=make1%>"  onblur="retrieveURL('componentInsertion.jsp?assetId=<%=assetId%>&component_id=<%=componentId%>&component_sub_type=LDS&FIELD=make', this.value)"/></td> 
	   <% 
	// for second tow column of Earth End Phonic Wheel Side   
	      String   assetNumber2=""; String make2=""; 
		sql_column= "select asset_number, make  from public.component_transaction where component_id='"+componentId+"' and asset_id='"+assetId+"' and component_sub_type='NLDS'" ;
	     	   rs_column= st_column.executeQuery(sql_column);
	       	   if(rs_column.next())
	         	   {
	         	assetNumber2=rs_column.getString(1);
	         	if(assetNumber2==null) {assetNumber2="";}
	        	 make2=rs_column.getString(2);
	        	 if(make2==null){make2="";}
	        	   }
	     	  	%> 
	     	<td><input type="text" name="qty" value="<%=assetNumber2%>"   onblur="retrieveURL('componentInsertion.jsp?assetId=<%=assetId%>&component_id=<%=componentId%>&component_sub_type=NLDS&FIELD=asset_number', this.value)"/></td>
	        <td><input type="text" name="qty" value="<%=make2%>"  onblur="retrieveURL('componentInsertion.jsp?assetId=<%=assetId%>&component_id=<%=componentId%>&component_sub_type=NLDS&FIELD=make', this.value)"/></td> 
	     
	     
	    
	        
	            </tr>
	                 
	       <% 	
	       
	             }  %>
	  
	</table>
	
	
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
       
           
</body>
</html>
