package model;

public class Asset_master implements java.io.Serializable{

private static final long serialVersionUID = 1L;
	
	String asset_subtype;
	String asset_type;
	String asset_subtype_description;
	String asset_subtype_class;
	Integer asset_subtype_capacity;
	
	public Asset_master(){
		//default Constructor
	}
	
	public Asset_master(String asset_subtype,String asset_type,String asset_subtype_description,String asset_subtype_class,Integer asset_subtype_capacity){
		
		this.asset_subtype = asset_subtype;
		this.asset_type=asset_type;
		this.asset_subtype_description =asset_subtype_description;
		this.asset_subtype_class =asset_subtype_class;
		this.asset_subtype_capacity =asset_subtype_capacity;
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