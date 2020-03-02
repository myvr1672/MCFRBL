<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DbConnection" %>
<%@page trimDirectiveWhitespaces="true" %>
<%
    try{
//         Class.forName("com.mysql.jdbc.Driver");
//         Connection con =(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/taxi", "root", "");
        
        DbConnection db=new DbConnection();
        Connection con=db.getConnection(); 
        Statement st= con.createStatement();
        String axleNum= request.getParameter("axleNumber");
    String    sql= "select axle_no from public.wheelset_tran where axle_no='"+axleNum+"' " ;
    ResultSet res=st.executeQuery(sql);
  
         if (!res.next()){
                out.print("true");
                
            }else{
                out.print("false");
            }
         con.close();
        }catch (Exception e){
            System.out.println(e);  
        }
      
%>