package ACTION;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import beans.BogiesetTransaction;
import dao.Asset_masterdao2;
import hibernateConnect.HibernateConfig;

import java.io.IOException;
import model.Asset_master2;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class Assetaction2 extends ActionSupport{ 

private static final long serialVersionUID = 1L;

	private  Asset_masterdao2 dao = new Asset_masterdao2();
	
    private List<Asset_master2> records;
	private String result;
	private String message;
	private Asset_master2 record;
	
	private Asset_master2 asset_master=new Asset_master2();
	private Integer asset_id;
	private String asset_type;
	private String asset_subtype;
	private String asset_subtype_description;
	private String asset_subtype_class;
	private Integer asset_subtype_capacity;
	private String fin_yr;
	private String enable_flag;

	
	public Integer getAsset_id() {
		return asset_id;
	}

	public void setAsset_id(Integer asset_id) {
		this.asset_id = asset_id;
	}

	public String getFin_yr() {
		return fin_yr;
	}

	public void setFin_yr(String fin_yr) {
		this.fin_yr = fin_yr;
	}

	public String getEnable_flag() {
		return enable_flag;
	}

	public void setEnable_flag(String enable_flag) {
		this.enable_flag = enable_flag;
	}

	private String jtSorting;//for sorting
	
	

	

	public Asset_masterdao2 getDao() {
		return dao;
	}

	public void setDao(Asset_masterdao2 dao) {
		this.dao = dao;
	}

	public Asset_master2 getAsset_master() {
		return asset_master;
	}

	public void setAsset_master(Asset_master2 asset_master) {
		this.asset_master = asset_master;
	}

	public List<Asset_master2> getRecords() {
		return records;
	}

	public void setRecords(List<Asset_master2> records) {
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

	public Asset_master2 getRecord() {
		return record;
	}

	public void setRecord(Asset_master2 record) {
		this.record = record;
	}

	

	public String getAsset_type() {
		return asset_type;
	}

	public void setAsset_type(String asset_type) {
		this.asset_type = asset_type;
	}

	public String getAsset_subtype() {
		return asset_subtype;
	}

	public void setAsset_subtype(String asset_subtype) {
		this.asset_subtype = asset_subtype;
	}

	public String getAsset_subtype_description() {
		return asset_subtype_description;
	}

	public void setAsset_subtype_description(String asset_subtype_description) {
		this.asset_subtype_description = asset_subtype_description;
	}

	public String getAsset_subtype_class() {
		return asset_subtype_class;
	}

	public void setAsset_subtype_class(String asset_subtype_class) {
		this.asset_subtype_class = asset_subtype_class;
	}

	public Integer getAsset_subtype_capacity() {
		return asset_subtype_capacity;
	}

	public void setAsset_subtype_capacity(Integer asset_subtype_capacity) {
		this.asset_subtype_capacity = asset_subtype_capacity;
	}

	public String getJtSorting() {
		return jtSorting;
	}

	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String list() {
		try {
			
			setRecords(getDao().getAllasset_master(jtSorting));
			
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
		
	    
		
		record = new Asset_master2();
		record.setFin_yr(fin_yr);
		record.setEnable_flag(enable_flag);
	    record.setAsset_subtype(asset_subtype);
		record.setAsset_type(asset_type);
		record.setAsset_subtype_description(asset_subtype_description);
		record.setAsset_subtype_class(asset_subtype_class);
		record.setAsset_subtype_capacity(asset_subtype_capacity);
	
		try {
						
			
			dao.addasset_master(record);
			setResult("OK");
		} 
		catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		
				return ActionSupport.SUCCESS;	
	}
		

	public String update() throws IOException {			
		
  
		    Session session=null;
		    session=HibernateConfig.getSession();
		    record = (Asset_master2) session.get(Asset_master2.class, asset_id);
		   
	        record.setAsset_subtype(asset_subtype);
		
			record.setAsset_subtype_description(asset_subtype_description);
			record.setAsset_subtype_class(asset_subtype_class);
			record.setAsset_subtype_capacity(asset_subtype_capacity);
			record.setEnable_flag(enable_flag);
	
		try {
		    dao.updateasset_master(record);
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		finally{
			session.close();
		}
		return ActionSupport.SUCCESS;
	}
	
	public String delete() throws IOException {
		try {
			
		getDao().deleteasset_master(asset_id);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}
}