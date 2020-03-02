<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="dao.*" %> 
<head> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ALL</title>
  <style>
     #b1{
        position:absolute;
        top:0%;
        left:96%;
        background-color:blue;
        color:white;
        border-radius: 8px;
        border: 1px solid blue;
     }
      #table1{
        height:10%;
        width:50%;
      }
      #table2
      {
      position:absolute;
      top:10%;
      left:55%;
      height:10%;
      width:55%;
      }
      #shell_tab{
         position:absolute;
      top:35%;
      left:55%;
      height:10%;
      width:55%;
      }
      #bog_tab{
       height:10%;
        width:50%;
      }
      #wh_tab{
        position:absolute;
      top:65%;
      left:55%;
      height:10%;
      width:55%;
      }
  </style>
 
</head>
<body>
 <div class="container">
   <%
    String coach_no;
    DbConnection db=new DbConnection();
	Connection con=db.getConnection();
	Statement st=con.createStatement();
	%>
	<form target="_self" style="width:50%">
	 <label>Select a coach number</label>
	 <select name="coach" onchange='this.form.submit()'>
	  <option selected disabled>coach number</option>
	<%
	ResultSet rs=st.executeQuery("Select coach_number from finishing_tran");
	 while(rs.next())
	 {	 
	 %>
	  <option><%=rs.getString(1) %></option>
	 <%}%>
    </select>
     
    </form>
     
    <% 
    
      coach_no=request.getParameter("coach");
    session.setAttribute("coach_num","coach_no"); 
      if(coach_no!=null)
      {  
    %>
    <span>  Coach No <kbd style="background-color:coral"><%=coach_no %>  </kbd></span>
    <button id="b1" onClick="location.href='dashboard_allstages.jsp?coach_number=<%=coach_no%>'" >Report</button>
    <br>
    
    <table class="table table-bordered" id="table1">
     <tr><td colspan=5 style="background-color:pink;"> Finishing </td> </tr>
       <tr>
         <td>Shell Type </td> 
          <td>Start</td> <td>End</td> <td>Dispatch</td> 
      </tr>
     <%
       //out.println(coach_no); 
       int fur_id=0;
       ResultSet rs1=st.executeQuery("select finishing_asset_id,f.assembly_start_date,f.assembly_end_date,f.assembly_dispatch_date,s.shell_type,f.furnishing_asset_id from finishing_tran f,shell_tran s where f.shell_asset_id=s.shell_asset_id and f.coach_number='"+coach_no+"' "); 
       while(rs1.next())
       {
    	   fur_id=rs1.getInt(6);
         %>
        <tr>
<%--           <td><%out.println(rs1.getString(1));%></td> --%>
          <td> <% out.println(rs1.getString(5));%></td> 
          <td> <% out.println(rs1.getString(2));%></td> 
          <td> <% out.println(rs1.getString(3));%>  </td> 
          <td> <% out.println(rs1.getString(4));%></td> 
       </tr>
         
       
       
        
       <%}%>
      
       </table >
   
         <table class="table table-bordered" id="table2">
         <tr> <td colspan=6 style="background-color:pink;">Furnishing </td></tr>
          <tr>
               <td>Start</td> <td>End</td> <td>Dispatch</td><TD>Shell no </TD><TD> Bogie 1 </TD> <TD>Bogie 2 </TD>
           </tr>
           <tr>
        <%  
          int paint_id=0;
          int bogie_id[]=new int[2];
           ResultSet rs2=st.executeQuery("select furnishing_asset_id,paint_asset_id,f.assembly_start_date,f.assembly_end_date,f.assembly_dispatch_date,bogie_pp_side_asset_id,bogie_npp_side_asset_id,s.shell_no from furnishing_tran f,shell_tran s where furnishing_asset_id='"+fur_id+"' and f.shell_asset_id=s.shell_asset_id  ");
            while(rs2.next())
            {
    	      paint_id=rs2.getInt(2);
    	      bogie_id[0]=rs2.getInt(6);
    	      bogie_id[1]=rs2.getInt(7);
    	      %>
    	      
            <td> <% out.println(rs2.getString(3));%></td> 
             <td> <% out.println(rs2.getString(4));%></td>
            <td> <% out.println(rs2.getString(5));%></td>
             <td> <%=rs2.getString(8)%></td>
         <%}%>
               <%
               int b=0;
               for(b=0;b<2;b++)
               {	   
    	     ResultSet rs_bog=st.executeQuery("select bogie_number from bogieset_trans where bogie_asset_id='"+ bogie_id[b]+"' ");
    	     while(rs_bog.next())
    	     {
    	     %> 
    	     <td><%=rs_bog.getString(1)%>  </td>
           <% ;
             } }%>
             </tr>
       </table>
       <!-- Paint  -->
       
         <table class="table table-bordered" id="table1">
         <tr>
            <td colspan=4 style="background-color:pink;" >  Paint </td>
         </tr>
          <tr> 
          <td>Shell No </td> <td>Start date </td> <td>End date  </td> <td>Dispatch date </td>
          </tr>
             <%  
          int shell_id=0;
           ResultSet rs3=st.executeQuery("select paint_asset_id,p.shell_asset_id,p.assembly_start_date,p.assembly_end_date,p.assembly_dispatch_date,shell_no from paint_tran p,shell_tran s where paint_asset_id='"+paint_id+"' and p.shell_asset_id=s.shell_asset_id");
            while(rs3.next())
            {
    	      shell_id=rs3.getInt(2);%>
        
        <tr>
            <td> <% out.println(rs3.getString(6));%></td>
            <td> <% out.println(rs3.getString(3));%></td> 
            <td> <% out.println(rs3.getString(4));%>  </td> 
            <td> <% out.println(rs3.getString(5));%></td>
         </tr>
         <%}%>    
       
         </table>
         
        <!-- Shell  -->
         <table class="table table-bordered" id="shell_tab">
         <tr>
             <td colspan=4 style="background-color:pink;">Shell</td>
          </tr>
         <tr> 
           <td> Shell No</td> <td>Start</td> <td>End</td> <td>Dispatch</td> 
         </tr>
             <%  
        
           ResultSet rs4=st.executeQuery("select shell_asset_id,assembly_start_date,assembly_end_date,assembly_dispatch_date,shell_no from shell_tran where shell_asset_id='"+shell_id+"'  ");
            while(rs4.next())
            {
            	%>
        
        <tr>
            <td><%out.println(rs4.getString(5));%></td> 
            <td> <% out.println(rs4.getDate(2));%></td> 
            <td> <% out.println(rs4.getString(3));%></td> 
            <td> <% out.println(rs4.getString(4));%></td> 
        </tr>
         <%}%>    
         </table>
         
       <!--Bogie -->
           <table class="table table-bordered" id="bog_tab">
           <tr> <td colspan=6 style="background-color:pink;">Bogie </td>
            </tr>
           <tr>
           <td>Bogie no:</td> <td>Start</td> <td>End</td> <td>Dispatch</td> <td>Axle no1 </td> <td> Axle no2</td>
           </tr>
         <% int i=0;
            int wheel_id[][]=new int[2][2];
            for(i=0;i<2;i++) 
            {	 
           ResultSet rs5=st.executeQuery("select bogie_asset_id,assembly_start_date,assembly_end_date,assembly_exit_date,left_wheel_asset_id,right_wheel_asset_id,bogie_number from bogieset_trans where bogie_asset_id='"+bogie_id[i]+"'  ");
           while(rs5.next())
            {
            	wheel_id[i][0]=rs5.getInt(5);
            	wheel_id[i][1]=rs5.getInt(6);
            	
            	%>
         
        <tr> <td><%=rs5.getString(7)%></td> 
             <td> <% out.println(rs5.getString(2));%></td> 
             <td> <% out.println(rs5.getString(3));%>  </td> 
          <td> <% out.println(rs5.getString(4));%></td> 
          
         <%
         DbConnection db1=new DbConnection();
       	Connection con1=db1.getConnection();
       	Statement st1=con1.createStatement();
          ResultSet rs_wh=st1.executeQuery("select axle_no from wheelset_tran where wheelset_asset_id='"+rs5.getInt(5)+"' or wheelset_asset_id='"+rs5.getInt(6)+"' ");
         int w=1;
         while(rs_wh.next())
         {
        	 %>
         	<td> <%=rs_wh.getString(1) %> </td>
         	
         	<% 
         w++;}%>
          </tr>
             <%}}%>    
        
         
         </table>  
         
      <!--wheel -->
        
         
         <table class="table table-bordered" id="wh_tab">
         <tr> <td colspan=4 style="background-color:pink;">Wheel </td>
         </tr>
         <tr>
         <td> Axle no: </td> <td>Start</td> <td>End</td> <td>Dispatch</td>
         </tr>
         <% 
          int j,k=0;
         for(i=0;i<2;i++)
         {	 
          for(j=0;j<2;j++)	 
            {	 
           ResultSet rs6=st.executeQuery("select wheelset_asset_id,assembly_start_date,assembly_end_date,assembly_dispatch_date,axle_no from wheelset_tran where wheelset_asset_id='"+wheel_id[i][j]+"'  ");
            while(rs6.next())
            {%>
         
           <tr> <td> <%=rs6.getString(5)%></td> 
             <td> <% out.println(rs6.getString(2));%></td> 
              <td> <% out.println(rs6.getString(3));%>  </td> 
            <td> <% out.println(rs6.getString(4));%></td> </tr>
         <% } }}
         
         %>    
         </table>           
        <%} 
      con.close();
        %>
        
       </div>
       
    
</body>
</html>