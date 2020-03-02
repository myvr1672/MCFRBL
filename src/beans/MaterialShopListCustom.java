package beans;

public class MaterialShopListCustom implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String unifiedPL;
	private String materialDesc;
	private String usedByShop;
	
	public MaterialShopListCustom()
	{
		
	}
	
	public MaterialShopListCustom(String unifiedPL, String materialDesc, String usedByShop) {
		super();
		this.unifiedPL = unifiedPL;
		this.materialDesc = materialDesc;
		this.usedByShop = usedByShop;
	}

	public String getUnifiedPL() {
		return unifiedPL;
	}

	public void setUnifiedPL(String unifiedPL) {
		this.unifiedPL = unifiedPL;
	}

	public String getMaterialDesc() {
		return materialDesc;
	}

	public void setMaterialDesc(String materialDesc) {
		this.materialDesc = materialDesc;
	}

	public String getUsedByShop() {
		return usedByShop;
	}

	public void setUsedByShop(String usedByShop) {
		this.usedByShop = usedByShop;
	}
	
	
	
}
