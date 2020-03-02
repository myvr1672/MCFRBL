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
     
// function isNumberKey(txt, evt){
// 	var charCode = (evt.which) ? evt.which : evt.keyCode;
//     if (charCode == 46) {
//         //Check if the text already contains the . character
//         if (txt.value.indexOf('.') === -1) {
//             return true;
//         } else {
        	
//         	return false;
              
//             }
        	
        	
       
//     }
//     else {
//        if (charCode > 31
//              && (charCode < 48 || charCode > 57))
//             return false;
//     }
    
//     return true;
//     }  code for accept only decimal. No restriction on number after decimal


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
 try 
 {
Statement st_row, st_column, st_qty;
st_row=con.createStatement();
st_column=con.createStatement();
st_qty=con.createStatement();
String substage_id, substage_description, assetSubType;
String sql_row, sql_column;
ResultSet rs_column, rs_row, rs_qty;
String date=request.getParameter("date");
String shop=request.getParameter("shop");
String assetType="";
if(shop.equals("Testing")) {assetType="Coach";}
else if(shop.equals("Furnishing")) {assetType="Coach";}
else if(shop.equals("Electrical")) {assetType="Coach";}
else if(shop.equals("Paint")) {assetType="Shell";}
else {assetType=shop;}

String productionBy= request.getParameter("prod_from");

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
  
  <p>(Only number values are allowed)</p>
  
  <table class="customers">   
 <tr>
 <th>Description</th>

 <%
        sql_column="select asset_subtype from public.asset_master where asset_type= '"+assetType+"'";
        rs_column=st_column.executeQuery(sql_column);
        while(rs_column.next())
        {
        	assetSubType=rs_column.getString(1);
       %>
   <th><%=assetSubType%></th>
    <% }
    %> 
      </tr>
         <%   
       
       sql_row="select substage_id, substage_description from public.substage_master where parent_stages='"+shop+"' order by substage_sequence";
      
       rs_row=st_row.executeQuery(sql_row);
          while(rs_row.next())
                {
         substage_id=rs_row.getString(1); 
         substage_description=rs_row.getString(2);%>
         <tr>
         <th ><%=substage_description%></th>
         <% 
          sql_column="select asset_subtype from public.asset_master where asset_type= '"+assetType+"'";
          rs_column=st_column.executeQuery(sql_column);
           while(rs_column.next())
           { 
           
        	   assetSubType=rs_column.getString(1);
        
          
   String  sql_qty= "select shop_prod_qty from public.shop_production_qty_t where coach_id='"+assetSubType+"' and substage_id='"+substage_id+"' and production_by='"+productionBy+"' and date='"+date+"'" ;
           rs_qty=st_qty.executeQuery(sql_qty);  
           String qty="";
           while(rs_qty.next())
           {
         	  qty=rs_qty.getString(1);
         	  if(qty==null)
         	  qty=""; 
           }
           if(difference<=300)
           {       
        	   %>

<td> <input type="text" id="txtChar" onkeypress="return isNumberKey(this, event)" name="shopProductionQty" size="3"  value="<%=qty%>"  onblur="retrieveURL('ShopStagesCount_do.jsp?asset_subtype=<%=assetSubType%>&substage_id=<%=substage_id%>&production_by=<%=productionBy%>&date=<%=date%>&substageDescription=<%=substage_description%>&FIELD=shop_prod_qty', this.value)"/></td>

    <% 
    }  
    else {
    %>
    	<td><%=qty%></td>
         <%  } } %>
            </tr>
            <% 
           
 }
          con.close();
                }
          
          catch(Exception e)
          {
               out.println("Exception Here "+e.toString());
          }
 finally{
	 if(con!=null)
	 {
		 con.close();
	 }
 }
             %>   
       
           </table>
</body>
</html>