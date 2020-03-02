package ACTION;
import java.io.IOException;
//import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;
//import com.opensymphony.xwork2.ModelDriven;

import common.Encryption;
import dao.DaoUser;
import hibernateConnect.HibernateConfig;
import model.User;

/**
 * @author NAVINKUMAR
 *
 */
public class UserAction extends ActionSupport{
	

	private static final long serialVersionUID = 1L;

	private DaoUser dao = new DaoUser();

	private List<User> records;
	private String result;
	private String message;
	private User record;

	private User user = new User();
	
	String userid;  
	
	String userType;
	String userName;
	String email;
	String telephone;
	String designation;
	String dept;
	String roles[];
	String coachtypes[];
	
	private String jtSorting;//for sorting
	

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public DaoUser getDao() {
		return dao;
	}

	public void setDao(DaoUser dao) {
		this.dao = dao;
	}
public String roleAsString(){   //newly added by navin.
	String role="";
	for (int i=0; i<roles.length; i++)
	{
		
		if(!roles[i].equals(""))
		{
			if(i==0)
			{
				role=roles[i];
			}
			else
			{
			role= role+ ", "+roles[i];
			}
		}
		if(role.contains("All"))
		{
			role="All";
		}
		
	}
	return role;
}

public String coachAsString(){   //newly added by navin.
	String coachT="";
	if(!userType.equals("testingClearance"))
	{
		coachT="All";	
	}
	else
	{
	for (int i=0; i<coachtypes.length; i++)
	{
		
		if(!coachtypes[i].equals(""))
		{
			if(i==0)
			{
				coachT=coachtypes[i];
			}
			else
			{
				coachT= coachT+ ", "+coachtypes[i];
			}
		}
		if(coachT.contains("All"))
		{
			coachT="All";
		}
	System.out.println("Coach List: "+coachT);
		
	}
	}
	return coachT;
}

	public String list() {
		try {
			setRecords(getDao().getAllUser(jtSorting));
			System.out.println("Records = "+getRecords());
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}

	public String create() throws IOException {
		if("".equals(userid))
		{
			//addActionError(getText("error.userid.exist"));
			message="User Id cannot be blank";
			return ActionSupport.SUCCESS;
		
	     }
	else
	{
		User user = null;
		Session session = null;
		session = HibernateConfig.getSession();
		user = (User)session.get(User.class,userid);
		if((user==null))
		{
		record = new User();
		record.setUserid(userid);
		
		String password=	Encryption.generateHash("MCFRBL@123");
		
		record.setPwd(password);
		record.setUserType(userType);
		record.setUserName(userName);
		record.setEmail(email);
		record.setTelephone(telephone);
		record.setDesignation(designation);
		record.setDept(dept);
		record.setRoles(roleAsString());   //Newly added by navin
		record.setCoachtypes(coachAsString());
		record.setCreatedate(new Date()); 
		
		
		try {
						
			System.out.println("User = " + userid);
			
			getDao().addUser(record);
			setResult("OK");
		} 
		catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		finally
		{
			session.close();
		}
				return ActionSupport.SUCCESS;	
	}
		
		else
		{
			
			message="User Id already exist";
			return ActionSupport.SUCCESS;
		}
	}
	}

	public String update() throws IOException {			
		
		try {
			record = new User();
			record.setUserid(userid);
			String password=	Encryption.generateHash("MCFRBL@123");
			
			record.setPwd(password);
			//record.setPwd(pwd);
			record.setUserType(userType);
			record.setUserName(userName);
			record.setEmail(email);
			record.setTelephone(telephone);
			record.setDesignation(designation);
			record.setDept(dept);
			//SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			
			record.setRoles(roleAsString());
			record.setCoachtypes(coachAsString());
			record.setCreatedate(new Date()); 
//			if(!("".equals(createdate)))
//			{
//				
//				Date createdateD = df.parse(createdate);
//			
//			record.setCreatedate(createdateD);
//			
//			}
//			else { record.setCreatedate(new Date());  }
			getDao().updateUser(record);;
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		
		return ActionSupport.SUCCESS;
	}

	public String delete() throws IOException {
		try {
			
		getDao().deleteUser(userid);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}

	public List<User> getRecords() {
		return records;
	}

	public void setRecords(List<User> records) {
		this.records = records;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public User getRecord() {
		return record;
	}

	public void setRecord(User record) {
		this.record = record;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

		public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	

	public String[] getRoles() {
		return roles;
	}
	public void setRoles(String[] roles) {
		this.roles = roles;
	}
	public String getJtSorting() {
		return jtSorting;
	}

	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}
	public String[] getCoachtypes() {
		return coachtypes;
	}
	public void setCoachtypes(String[] coachtypes) {
		this.coachtypes = coachtypes;
	}
	

	}