package ACTION;
import java.util.Map;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import javax.servlet.http.HttpSession;


import com.opensymphony.xwork2.ActionSupport;
import common.Encryption;

import model.User;
import hibernateConnect.HibernateConfig;
import dao.DbConnection;
import java.sql.*;
public class LoginAction extends ActionSupport implements SessionAware {
	private static final long serialVersionUID = 1L;
	
	private String username;
	private String password;
	private String oldpwd;
	private String newpwd;
	private String newpwd_again;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	private String name;
	
	private SessionMap<String, Object> sessionMap;
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);

	private Statement  st; 
	@Override
	public void setSession(Map<String, Object> map) {
		sessionMap = (SessionMap<String, Object>) map;
	}
	@Override
	public String execute() throws SQLException 
	{
		String sql_update="", sqlInsert="";
		User loginUser = null;
		Session session = null;
		if ("".equals(username)||"".equals(password))
		{
			addActionError(getText("error.login.required"));
			return "error";
		}
		else
		{
		session = HibernateConfig.getSession();
		loginUser = (User)session.get(User.class,username.trim());
		 if(loginUser!=null)
		 {
			 String encryptedpassword=	Encryption.generateHash(password);
				
		 if(encryptedpassword.equals(loginUser.getPwd()))
		 {
			name=loginUser.getUserid();
			sessionMap.put("userid", username);
			
			DbConnection db=new DbConnection();
			Connection con=db.getConnection(); 
			Statement  st_update;
			
			
			try{
			st_update=con.createStatement();// for update
			sql_update="update public.set_date set crnt_date= now()::date";
			st_update.executeUpdate(sql_update);
			String sql = "SELECT * FROM public.login_user where user_id='"+name+"' ";
			Statement st1=con.createStatement();
			ResultSet resultSet =  st1.executeQuery(sql);
			if(!resultSet.next()){
			sqlInsert="insert into public.login_user (user_id, login_time) values('"+name+"', now())";
			st_update.executeUpdate(sqlInsert);
			}
			st1.close();
			st_update.close();
			con.close();
			
			}
			catch(Exception e){
				e.printStackTrace();
			}
			finally{
				session.close();
				con.close();
			}
			return "success";
			
		
		 }
		
		 else 
		 {
			addActionError(getText("error.login"));
			return "error";
		  } 
		    
		 }
		 else
		 {
			  addActionError(getText("error.login"));
				return "error"; 
		 }
		}
	}
		
	public String resetPwd() 
	{
		User loginUser = null;
		Session session = null;
		
		if ("".equals(username))
		{
			addActionError(getText("error.userid.required"));
			return "error";
		}
		else
		{
		session = HibernateConfig.getSession();
		loginUser = (User)session.get(User.class,username.trim());
		 if(loginUser!=null)
		 {
			 String encryptedpassword=	Encryption.generateHash("MCFRBL@123");
			
			loginUser.setPwd(encryptedpassword);
			session.saveOrUpdate(loginUser);
			session.beginTransaction().commit();
		 	 return "success";
		
		
		 }
		
		 else 
		 {
			addActionError(getText("error.resetpassword"));
			return "error";
		  } 
		   
		 
		}
		
		
		
	} 
	
	public String changePwd() 
	{
		User loginUser = null;
		Session session = null;
		
		if ("".equals(oldpwd))
		{
			addActionError(getText("error.oldpassword.required"));
			return "error";
		}
		else if ("".equals(newpwd))
		{
			addActionError(getText("error.newpwd.required"));
			return "error";	
		}
		else if ("".equals(newpwd_again))
		{
			addActionError(getText("error.newpwd_again.required"));
			return "error";	
		}
		else if (!newpwd_again.equals(newpwd))
		{
			addActionError(getText("error.newpwd_again.equal"));
			return "error";	
		}
		else
		{
			HttpSession session_http = ServletActionContext.getRequest().getSession(true);
			username = (String) session_http.getAttribute("userid");
			
			if (username != null)
			{
		session = HibernateConfig.getSession();
		loginUser = (User)session.get(User.class,username.trim());
		    
			 String oldpassword_database=loginUser.getPwd();
			 String encryptedpassword=	Encryption.generateHash(oldpwd);
			if(encryptedpassword.equals(oldpassword_database)) 
			{
			String encryptednewpassword=	Encryption.generateHash(newpwd);
			loginUser.setPwd(encryptednewpassword);
			session.saveOrUpdate(loginUser);
			session.beginTransaction().commit();
		 	 return "success";
			}
			else
			{
				addActionError(getText("error.oldpasswordnotsame"));	
				return "error";	
			}
			}		
		   else 
		   {
			addActionError(getText("error.changepassword"));
			return "error";
		  
			} 
		 
		}
	} 
	public String logout()
	{
		
		sessionMap.remove("userId");
		sessionMap.invalidate();
		addActionError(getText("error.logout"));
		return "LOGOUT";
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public String getOldpwd() {
		return oldpwd;
	}
	public void setOldpwd(String oldpwd) {
		this.oldpwd = oldpwd;
	}
	public String getNewpwd() {
		return newpwd;
	}
	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}
	public String getNewpwd_again() {
		return newpwd_again;
	}
	public void setNewpwd_again(String newpwd_again) {
		this.newpwd_again = newpwd_again;
	}
	
	
}
