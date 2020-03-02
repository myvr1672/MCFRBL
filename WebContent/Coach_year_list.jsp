<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import="java.sql.*" %>
<%@ page import="dao.*" %> 
<%@ page import="java.util.Calendar" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Coach Dispatch</title>
<style>
   /* div{
       background-color:blue;
       color:white;
     } */

</style>

</head>
<body>
      <%  
          String sql;
          DbConnection db=new DbConnection();
 	      Connection con=db.getConnection();
 	      Statement st=con.createStatement(); 
 	      PreparedStatement ps=null;
 	      Calendar cal=Calendar.getInstance();
 	      int cur=cal.get(Calendar.YEAR);
 	       cal.add(Calendar.YEAR,-1);
 	      int prev=cal.get(Calendar.YEAR);
 	     
 	      
      %>
      <div> 
          <H4 style=""> Coach Manufacture Details </H4>
      </div>
       <form>
         <table >
          <tr> 
           <td style="color:blue;">Select Railway</td>
           <td> 
                <select name="rly">
                  <option selected disabled>select railway </option>
                  <%
                  ResultSet rs=st.executeQuery("Select railway_code from railway_master");
              	   while(rs.next())
              	   {%>
              		  <option ><%=rs.getString(1) %></option>
              		  
              		<%}%> 
              		</select> 
              		</td>
             </tr>
              	<tr>
              	    <td style="color:blue;">Select Coach Type</td>
              	   <td> <select name="ctype">
              	         <option selected disabled>select coach </option>
              	         <option >All Coach Types </option>
              	        <%
              	      ResultSet rs1=st.executeQuery("Select coach_type from coach_master");
              	        while(rs1.next())
              	         {%>
              	         <option ><%=rs1.getString(1) %></option>
              	          <%}%>
              	       </select>
              	    </td>
              	</tr>
                
                <tr>
                  
                   <td style="color:blue;">Select From Month </td>
                   <td>
                     <select name="from_mon">
                      <%
                      ResultSet rs2=st.executeQuery("Select month_seq, month_code from month_finance_year_master order by month_seq");
                      while(rs2.next())
                      {%>
                         <option><%=rs2.getString(2)%> </option>
                            <%}%>
                   </select> 
                    </td>
                       <td style="color:blue;">Select From Year </td>  
                       <td>
                         <select name="from_yr"> 
                             <option><%=cur%>-<%=cur+1%> </option>
                             <option><%=prev%>-<%=prev+1%> </option>
                         </select>
                        </td>
                </tr>
                 <tr>
                  
                   <td style="color:blue;">Select to Month </td>
                   <td>
                     <select name="to_mon">
                      <%
                      ResultSet rs3=st.executeQuery("Select month_code from month_finance_year_master");
                      while(rs3.next())
                      {%>
                         <option><%=rs3.getString(1)%> </option>
                            <%}%>
                   </select> 
                    </td>
                       <td style="color:blue;">Select to Year </td>  
                       <td>
                         <select name="to_yr" onchange="this.form.submit()"> 
                             <option selected disabled>year </option>
                             <option><%=cur%>-<%=cur+1%> </option>
                             <option><%=prev%>-<%=prev+1%> </option>
                         </select>
                        </td>
                </tr>
               </table>
               </form>
               <%
               String rly=request.getParameter("rly");
               String ctype=request.getParameter("ctype");
               String from_mon=request.getParameter("from_mon");
               String from_yr=request.getParameter("from_yr");
               String to_mon=request.getParameter("to_mon");
               String to_yr=request.getParameter("to_yr");
               String mon_ar[]=new String[24];
               Calendar calend=Calendar.getInstance();
            
               int to_seq=0,from_seq=0;
               if(rly!=null)
               {
            	   
            	   ResultSet rs_seq=st.executeQuery("Select month_seq from month_finance_year_master where month_code='"+from_mon+"' ");
            	   while(rs_seq.next()){
            		  from_seq= rs_seq.getInt(1);
            	   }
            	   ResultSet rs_seq_to=st.executeQuery("Select month_seq from month_finance_year_master where month_code='"+to_mon+"' ");
            	   while(rs_seq_to.next()){
            		  to_seq= rs_seq_to.getInt(1);
            	   }
             	 
               if(from_yr.equals(to_yr))
               {
            	   
            	  sql="Select a.asset_type,a.railway,sum(asset_qty) from asset_rly_prod a,month_finance_year_master b where asset_type=? and railway=? and year=?   and a.month_code=b.month_code and month_seq between ? and ? group by a.asset_type,a.railway " ;
            	  ps=con.prepareStatement(sql);
            	  ps.setString(1,ctype);
            	  ps.setString(2,rly);  
            	  ps.setString(3,to_yr);
            	  ps.setInt(4,from_seq);
            	  ps.setInt(5,to_seq);
               }
               else{
            	   sql="Select a.asset_type,a.railway,sum(asset_qty) from asset_rly_prod a,month_finance_year_master b where asset_type=? and railway=? and year  in  (?,?)   and a.month_code=b.month_code and ((month_seq between ? and 12) OR ( month_seq between 1 and ? )) group by a.asset_type,a.railway";
            	   ps=con.prepareStatement(sql);
             	  ps.setString(1,ctype);
             	  ps.setString(2,rly);  
             	  ps.setString(3,from_yr);
             	  ps.setString(4,to_yr);
             	  ps.setInt(5,from_seq);
             	  ps.setInt(6,to_seq);
               }
                
               
               ResultSet rs4=ps.executeQuery();
                while(rs4.next())
              {%>
              
              <table  style="border:1px solid crimson; ">
              <tr style="background-color:crimson;font-weight:bold;color:darkblue;border:1px solid crimson">
              <td style="border:1px solid crimson">Coach Type</td><td style="border:1px solid crimson">Railway  </td> <td style="border:1px solid crimson"> Quantity</td>
              </tr>
               <tr style="border:1px solid crimson">
               <td style="border:1px solid crimson"><%=rs4.getString(1) %> </td> <td style="border:1px solid crimson"><%=rs4.getString(2) %> </td> <td style="border:1px solid crimson"><%=rs4.getString(3) %> </td> 
               </tr>
              
              </table>
              
              
              
              <%} }
              con.close();
              %> 
               
               
               
               
</body>
</html>