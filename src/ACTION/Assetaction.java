package ACTION;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import dao.Asset_masterdao;
import java.io.IOException;
import model.Asset_master;
import java.util.List;
import java.util.Map;

public class Assetaction extends ActionSupport{ 

private static final long serialVersionUID = 1L;

	private  Asset_masterdao dao = new Asset_masterdao();
	
    private List<Asset_master> records;
	private String result;
	private String message;
	private Asset_master record;
	
	private Asset_master asset_master=new Asset_master();

	private String asset_type;
	private String asset_subtype;
	private String asset_subtype_description;
	private String asset_subtype_class;
	private Integer asset_subtype_capacity;
	
	private String jtSorting;//for sorting
	private String jtStartIndex;
	private String jtPageSize;
	private int totalRecordCount;
	

	

	public String getJtStartIndex() {
		return jtStartIndex;
	}

	public void setJtStartIndex(String jtStartIndex) {
		this.jtStartIndex = jtStartIndex;
	}

	public String getJtPageSize() {
		return jtPageSize;
	}

	public void setJtPageSize(String jtPageSize) {
		this.jtPageSize = jtPageSize;
	}

	public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}

	public Asset_masterdao getDao() {
		return dao;
	}

	public void setDao(Asset_masterdao dao) {
		this.dao = dao;
	}

	public Asset_master getAsset_master() {
		return asset_master;
	}

	public void setAsset_master(Asset_master asset_master) {
		this.asset_master = asset_master;
	}

	public List<Asset_master> getRecords() {
		return records;
	}

	public void setRecords(List<Asset_master> records) {
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

	public Asset_master getRecord() {
		return record;
	}

	public void setRecord(Asset_master record) {
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
			Map session_map= ActionContext.getContext().getSession();
			int startPageIndex=Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			setRecords(getDao().getAllasset_master(jtSorting, startPageIndex, numRecordsPerPage));
			totalRecordCount= (Integer) session_map.get("holding_count");
			session_map.remove("holding_count");
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
		
	    
		
		record = new Asset_master();
		
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
		record = new Asset_master();
		
	      record.setAsset_subtype(asset_subtype);
			record.setAsset_type(asset_type);
			record.setAsset_subtype_description(asset_subtype_description);
			record.setAsset_subtype_class(asset_subtype_class);
			record.setAsset_subtype_capacity(asset_subtype_capacity);
	
		try {
		    getDao().updateasset_master(record);;
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
			
		getDao().deleteasset_master(asset_subtype,asset_type);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}
}