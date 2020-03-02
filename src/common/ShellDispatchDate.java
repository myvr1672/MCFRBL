package common;

import java.util.Date;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import beans.PaintTransaction;
import beans.ShellTransaction;
import beans.WheelsetTransaction;
import hibernateConnect.HibernateConfig;


public class ShellDispatchDate {
	private Integer shellAssetId;

private Date assemblyDispatchDatefromShell;
Session session =null;





public String getShellDispatchDate()
{
	session = HibernateConfig.getSession();
	try {
		
		

		
		Criteria cr1 = session.createCriteria(ShellTransaction.class);
		
		cr1.add(Restrictions.eq("shellAssetId", shellAssetId));
		
		ShellTransaction shellTransaction = (ShellTransaction)cr1.list().get(0);
		assemblyDispatchDatefromShell=shellTransaction.getAssemblyDispatchDate();
		
	} catch (Exception e) {
		
		System.err.println(e.getMessage());
	}
	finally{
		session.close();
	}
	
	return "success";
	
}




public Integer getShellAssetId() {
	return shellAssetId;
}




public void setShellAssetId(Integer shellAssetId) {
	this.shellAssetId = shellAssetId;
}




public Date getAssemblyDispatchDatefromShell() {
	return assemblyDispatchDatefromShell;
}

public void setAssemblyDispatchDatefromShell(Date assemblyDispatchDatefromShell) {
	this.assemblyDispatchDatefromShell = assemblyDispatchDatefromShell;
}



	
}
