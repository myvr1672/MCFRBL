package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import beans.MachineBreakdown;
import beans.MachineMaster;
import beans.MachinePerformAction;
import beans.SpareChangeInMachinefailure;
import hibernateConnect.HibernateConfig;

public class DaoMachineBreakdown {

	
	private Session session;

	public void saveMachineBreakdown(MachineBreakdown machineBreakdown, MachineMaster machineMaster)
	{
		Transaction tx=null;
		session = null;
	
		try{
		session=HibernateConfig.getSession();
		tx= session.beginTransaction();
		session.save(machineBreakdown);
		session.update(machineMaster);
		tx.commit();
		}
		catch(Exception ex){
			if(tx!=null) {tx.rollback();}
			ex.printStackTrace();
		}
		finally{
			if(session!=null) {session.close(); }
		}
		
	}
	
	public void updatemachineBreakDown(MachineBreakdown machineBreakdown)
	{
		Transaction tx=null;
		session = null;
	
		try{
		session=HibernateConfig.getSession();
		tx= session.beginTransaction();
		session.update(machineBreakdown);
		
		tx.commit();
		}
		catch(Exception ex){
			if(tx!=null) {tx.rollback();}
			ex.printStackTrace();
		}
		finally{
			if(session!=null) {session.close(); }
		}
		
	}
	public void updatemachineBreakDown(MachinePerformAction machinePerformedAction, MachineBreakdown machineBreakdown, MachineMaster machineMaster, List<SpareChangeInMachinefailure> spareChangeList)
	{
		Transaction tx=null;
		session = null;
	
		try{
		session=HibernateConfig.getSession();
		tx= session.beginTransaction();
		session.saveOrUpdate(machinePerformedAction);
		session.update(machineBreakdown);
		session.saveOrUpdate(machineMaster);
		if(spareChangeList.size()>0)
		{
			for(SpareChangeInMachinefailure s:spareChangeList)
			{
				session.saveOrUpdate(s);
			}
		}
		tx.commit();
		}
		catch(Exception ex){
			if(tx!=null) {tx.rollback();}
			ex.printStackTrace();
		}
		finally{
			if(session!=null) {session.close(); }
		}
		
	}
}
