package common;
import javax.servlet.http.HttpSession;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import dao.DbConnection;
import java.sql.*;

public class SessionListener  implements HttpSessionListener {

	Session session=null;
	  @Override
    public void sessionCreated( HttpSessionEvent arg0 ) {
		  try{
		  HttpSession session_http=ServletActionContext.getRequest().getSession(false);
//		  String userID=(String) session_http.getAttribute("userid");
		  System.out.println("Session created");
		  }
//	     String sqlInsert="";
//	     DbConnection db=new DbConnection();
//	     Connection con=db.getConnection();
//	     Statement stInsert;
//	     
//	     try{
//	    	 sqlInsert="insert into public.login_user (user_id, login_time) values('"+userID+"', now())";
//	    	 stInsert= con.createStatement();
//	    	 int i=stInsert.executeUpdate(sqlInsert);
//	    	 if(i>0) {System.out.println("Login User created");}
//	    	 else {System.out.println("Insertion Failed");}
//	     }
     catch(Exception ex)
	     {
	    	 ex.printStackTrace();
	     }
    }
 
	    @Override
	    public void sessionDestroyed( HttpSessionEvent sessionEvent ) {
	    	 HttpSession session_http=ServletActionContext.getRequest().getSession();
			  String userID=(String) session_http.getAttribute("userid");
	    	System.out.println("Session DESTROYED");
	    	String sqlDelete="";
		     DbConnection db=new DbConnection();
		     Connection con=db.getConnection();
		     Statement stDelete;
		     
		     try{
		    	 sqlDelete="delete from public.login_user where user_id='"+userID+"'";
		    	 stDelete= con.createStatement();
		    	 int i=stDelete.executeUpdate(sqlDelete);
		    	 if(i>0) {System.out.println("Login User deleted");}
		    	 else {System.out.println("Deletion Failed");}
		     }
		     catch(Exception ex)
		     {
		    	 ex.printStackTrace();
		     }
		    
		     
	    	
	    }	
	
}
