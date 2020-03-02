package common;

import java.util.Date;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;


import beans.WheelsetTransaction;
import hibernateConnect.HibernateConfig;


public class DescById {
private String axleNo;
private Integer wheelAxleId;

private Date assemblyDispatchDatefromShell;
Session session =null;
public String getAxleDesc()
{
	session = HibernateConfig.getSession();
	try {
		
		

		
		Criteria cr1 = session.createCriteria(WheelsetTransaction.class);
		
		cr1.add(Restrictions.eq("wheelsetAssetId", wheelAxleId));
		
		WheelsetTransaction wheelsetTransaction = (WheelsetTransaction)cr1.list().get(0);
		axleNo=wheelsetTransaction.getAxleNumber();
		
	} catch (Exception e) {
		
		System.err.println(e.getMessage());
	}
	finally{
		session.close();
	}
	
	return "success";
}
/*
public String getShellDesc()
{
	session = HibernateConfig.getSession();
	try {
		
		

		
		Criteria cr1 = session.createCriteria(ShellTransaction.class);
		
		cr1.add(Restrictions.eq("shellAssetId", shellAssetId));
		
		ShellTransaction shellTransaction = (ShellTransaction)cr1.list().get(0);
		shellNo=shellTransaction.getShellNumber();
		
	} catch (Exception e) {
		
		System.err.println(e.getMessage());
	}
	finally{
		session.close();
	}
	
	return "success";
}



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
*/
public String getAxleNo() {
	return axleNo;
}

public void setAxleNo(String axleNo) {
	this.axleNo = axleNo;
}

public Integer getWheelAxleId() {
	return wheelAxleId;
}

public void setWheelAxleId(Integer wheelAxleId) {
	this.wheelAxleId = wheelAxleId;
}



public Date getAssemblyDispatchDatefromShell() {
	return assemblyDispatchDatefromShell;
}

public void setAssemblyDispatchDatefromShell(Date assemblyDispatchDatefromShell) {
	this.assemblyDispatchDatefromShell = assemblyDispatchDatefromShell;
}



	
}
