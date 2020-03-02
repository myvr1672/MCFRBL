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
        String coachNum= request.getParameter("coachNumber");
    String    sql= "select coach_number from public.furnishing_tran where coach_number='"+coachNum+"' " ;
    ResultSet res=st.executeQuery(sql);
  
         if (!res.next()){
                out.print("valid");
                
            }else{
                out.print("false");
            }
         con.close();
        }catch (Exception e){
            System.out.println(e);  
        }
%>