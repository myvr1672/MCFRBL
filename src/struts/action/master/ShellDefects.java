package struts.action.master;


import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Query;
import org.hibernate.Session;
import hibernateConnect.HibernateConfig;
import model.User;

public class ShellDefects {
private Map<Integer, String> shellNos;
private Map<Integer,String> shellDefects;
	
	@SuppressWarnings("unchecked")
	public String getShellAndShop()
	{
		
		Session session =  null;
		String username= null;
		String roles= null;
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	User loginUser = (User)session.get(User.class,username.trim());
	    
		 roles= loginUser.getRoles();
		}

	roles = roles.replaceAll(", ","','");
	
		try {

			
			session.beginTransaction();
Query query=null;
			 
query = session.createSQLQuery("select F.shell_asset_id, S.shell_no from furnishing_tran F, shell_tran S where F.shell_asset_id=S.shell_asset_id  and F.assembly_dispatch_date is NULL");
List<Object[]> rowList = query.list();
shellNos= new LinkedHashMap<Integer,String>();
for(Object[] row : rowList){
	shellNos.put(Integer.parseInt(row[0].toString()), row[1].toString());
}			
//retrieve supplier details
Query queryForShellDefects=null;

queryForShellDefects = session.createSQLQuery("select shell_defect_id, shell_defect_description from public.shell_defects_master");
List<Object[]> rowDefect = queryForShellDefects.list();
shellDefects= new LinkedHashMap<Integer,String>();
for(Object[] row : rowDefect){
	shellDefects.put(Integer.parseInt(row[0].toString()), row[1].toString());
}			
return "success";
}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally
		{session.close(); }
	}

	public Map<Integer, String> getShellNos() {
		return shellNos;
	}

	public void setShellNos(Map<Integer, String> shellNos) {
		this.shellNos = shellNos;
	}

	public Map<Integer, String> getShellDefects() {
		return shellDefects;
	}

	public void setShellDefects(Map<Integer, String> shellDefects) {
		this.shellDefects = shellDefects;
	}
	
	
	
	
}
