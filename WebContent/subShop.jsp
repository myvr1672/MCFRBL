<%@page import="java.sql.*"%>
<%@ page import="dao.*" %>
<%
String shop=request.getParameter("shop");  
 //String buffer="<select name='subShopFrom' id='subShopId'><option value='' selected>Select</option>";
 String buffer=null;
 Connection con=null;
 try{
	 DbConnection db=new DbConnection();
	con=db.getConnection();
 
 Statement stmt = con.createStatement();  
 ResultSet rs = stmt.executeQuery("Select subsection_id, subsection_description from public.employee_section where parent_subsection_id='"+shop+"' ");  
   while(rs.next()){
   buffer=buffer+"<option value='"+rs.getString(1)+"'>"+rs.getString(2)+"</option>";  
   }  
 //buffer=buffer+"</select>";  
 response.getWriter().println(buffer); 
 }
 catch(Exception e){
     System.out.println(e);
 }
 finally{
	 con.close();
 }

 %>