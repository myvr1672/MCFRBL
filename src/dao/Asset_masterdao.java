package dao;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;

import hibernateConnect.HibernateConfig;
import model.Asset_master;

public class Asset_masterdao {
	

@SuppressWarnings("unchecked")
public List<Asset_master> getAllasset_master(String jtSorting, Integer startPageIndex, Integer numRecordsPerPage) {
		Session session =  null;
		List<Asset_master> list = null;
	
		try{
			session = HibernateConfig.getSession();
		//	session.beginTransaction();
			Criteria c = session.createCriteria(Asset_master.class);
			 Integer total_rec_count=c.list().size();
			 Map session_map=ActionContext.getContext().getSession();
			 session_map.put("holding_count", total_rec_count);
			 c.setFirstResult(startPageIndex);
			 c.setMaxResults(numRecordsPerPage);

			list=c.list();
		}
		catch(Exception ex){
			
			ex.printStackTrace();
		}finally{
			if(session!= null){
				session.close();
			}			
		}
		return list;
	}

	public void addasset_master(Asset_master asset) {
		Session session = null;
		
		 try{
	         session = HibernateConfig.getSession();
			
			 session.save(asset);
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				 session.close();
			 }
		 }
	}
	
	public void deleteasset_master(String asset_subtype,String asset_type){
		Session session = null;
		Asset_master a1 = null;
		 try{
			 session = HibernateConfig.getSession();
	         a1 = (Asset_master) session.load(Asset_master.class, /*new PKField(*/asset_subtype);
			 session.delete(a1);
			 session.beginTransaction().commit();
			 
		 }catch(Exception ex){
			
			 ex.printStackTrace();
		 }finally{
			 
			 if(session != null){
				session.close();
			 }
		 }
	}
	
	public void updateasset_master(Asset_master record){
		Session session = null;
		
			 try{
				 session = HibernateConfig.getSession();
				 session.update(record);
			 session.beginTransaction().commit();
				 
			 }catch(Exception ex){
					 ex.printStackTrace();
			 }finally{
				if(session != null){
					 session.close();
				 }
			 }
		}
	
}
