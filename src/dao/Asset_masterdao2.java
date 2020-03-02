package dao;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionContext;

import hibernateConnect.HibernateConfig;
import model.Asset_master2;

public class Asset_masterdao2 {
	

@SuppressWarnings("unchecked")
public List<Asset_master2> getAllasset_master(String jtSorting) {
		Session session =  null;
		List<Asset_master2> list = null;
	
		try{
			session = HibernateConfig.getSession();
		//	session.beginTransaction();
			Criteria c = session.createCriteria(Asset_master2.class);
			
			
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

	public void addasset_master(Asset_master2 asset) {
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
	public void updateasset_master(Asset_master2 record){
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
	
	
	public void deleteasset_master(Integer asset_id){
		Session session = null;
		Asset_master2 a1 = null;
		 try{
			 session = HibernateConfig.getSession();
	         a1 = (Asset_master2) session.load(Asset_master2.class,asset_id);
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
	
	
}
