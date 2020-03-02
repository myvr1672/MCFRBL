package model;

public class Asset_master2 implements java.io.Serializable{

private static final long serialVersionUID = 1L;
	Integer asset_id;
	String asset_subtype;
	String asset_type;
	String asset_subtype_description;
	String asset_subtype_class;
	Integer asset_subtype_capacity;
	String fin_yr;
	String enable_flag;
	
	public Asset_master2(){
		//default Constructor
	}
	
	
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


	public Asset_master2(Integer asset_id, String asset_subtype, String asset_type, String asset_subtype_description,
			String asset_subtype_class, Integer asset_subtype_capacity, String fin_yr, String enable_flag) {
		super();
		this.asset_id = asset_id;
		this.asset_subtype = asset_subtype;
		this.asset_type = asset_type;
		this.asset_subtype_description = asset_subtype_description;
		this.asset_subtype_class = asset_subtype_class;
		this.asset_subtype_capacity = asset_subtype_capacity;
		this.fin_yr = fin_yr;
		this.enable_flag = enable_flag;
	}


	public String getAsset_subtype() {
		return asset_subtype;
	}

	public void setAsset_subtype(String asset_subtype) {
		this.asset_subtype = asset_subtype;
	}

	public String getAsset_type() {
		return asset_type;
	}

	public void setAsset_type(String asset_type) {
		this.asset_type = asset_type;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

	
}