package dao;
//import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class DbConnection {

	HttpServletRequest request;
	HttpServletResponse response;
	
	public static String url="";
    public static String user="";
    public static String password="";
    
    static java.sql.Connection connection;
    

	public  DbConnection()
        {
            
            //String value = getServletConfig().getInitParameter("db_url");
            //System.out.println("hello"+db_url);
	}
	
	public Connection getConnection(){
		try {
           
			//Class.forName("oracle.jdbc.driver.OracleDriver");
                    Class.forName("org.postgresql.Driver");
                        
		} 
                catch (ClassNotFoundException e) 
                {
			
			e.printStackTrace();
		}
//		
		try 
                {
			             
			
			System.out.println("Connection Being stated");
			String url = "jdbc:postgresql://localhost:5432/MCFRBL";
			
            // Set URL for data source
           String user = "postgres";
           String password = "postgress";
                connection = DriverManager.getConnection(url, user, password);
                
                if(connection==null){
                	
                	RequestDispatcher rs=request.getRequestDispatcher("Database_error.jsp");
                	rs.forward(request, response);
                }

                    System.out.println("connection Opened");
                          } 
                catch (Exception e1) 
                {
			System.out.println(e1.toString());
			e1.printStackTrace();
		     }
		  return connection;	
	}
}
