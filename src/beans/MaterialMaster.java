package beans;

public class MaterialMaster implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private String unifiedPL;
	private String plNo;
	private String materialDesc;
	private String unitOfMeasure;
	private Integer ratePerUnit;
	private float weight;
	private String weightUnit;
	private float dimensionLength;
	private float dimensionWidth;
	private float dimensionHeight;
	private String dimensionUnit;
	private float volume;
	private String volumeUnit;
	private String criticalityLevel;
	private String drawing;
	private String typeOfMaterial;
	private String selfLife;
	
	public MaterialMaster()
	{
		
	}

	public MaterialMaster(String unifiedPL, String plNo, String materialDesc, String unitOfMeasure, Integer ratePerUnit,
			float weight, String weightUnit, float dimensionLength, float dimensionWidth, float dimensionHeight,
			String dimensionUnit, float volume, String volumeUnit, String criticalityLevel, String drawing,
			String typeOfMaterial, String selfLife) {
		super();
		this.unifiedPL = unifiedPL;
		this.plNo = plNo;
		this.materialDesc = materialDesc;
		this.unitOfMeasure = unitOfMeasure;
		this.ratePerUnit = ratePerUnit;
		this.weight = weight;
		this.weightUnit = weightUnit;
		this.dimensionLength = dimensionLength;
		this.dimensionWidth = dimensionWidth;
		this.dimensionHeight = dimensionHeight;
		this.dimensionUnit = dimensionUnit;
		this.volume = volume;
		this.volumeUnit = volumeUnit;
		this.criticalityLevel = criticalityLevel;
		this.drawing = drawing;
		this.typeOfMaterial = typeOfMaterial;
		this.selfLife = selfLife;
	}

	public String getUnifiedPL() {
		return unifiedPL;
	}

	public void setUnifiedPL(String unifiedPL) {
		this.unifiedPL = unifiedPL;
	}

	public String getPlNo() {
		return plNo;
	}

	public void setPlNo(String plNo) {
		this.plNo = plNo;
	}

	public String getMaterialDesc() {
		return materialDesc;
	}

	public void setMaterialDesc(String materialDesc) {
		this.materialDesc = materialDesc;
	}

	public String getUnitOfMeasure() {
		return unitOfMeasure;
	}

	public void setUnitOfMeasure(String unitOfMeasure) {
		this.unitOfMeasure = unitOfMeasure;
	}

	public Integer getRatePerUnit() {
		return ratePerUnit;
	}

	public void setRatePerUnit(Integer ratePerUnit) {
		this.ratePerUnit = ratePerUnit;
	}

	public float getWeight() {
		return weight;
	}

	public void setWeight(float weight) {
		this.weight = weight;
	}

	public String getWeightUnit() {
		return weightUnit;
	}

	public void setWeightUnit(String weightUnit) {
		this.weightUnit = weightUnit;
	}

	public float getDimensionLength() {
		return dimensionLength;
	}

	public void setDimensionLength(float dimensionLength) {
		this.dimensionLength = dimensionLength;
	}

	public float getDimensionWidth() {
		return dimensionWidth;
	}

	public void setDimensionWidth(float dimensionWidth) {
		this.dimensionWidth = dimensionWidth;
	}

	public float getDimensionHeight() {
		return dimensionHeight;
	}

	public void setDimensionHeight(float dimensionHeight) {
		this.dimensionHeight = dimensionHeight;
	}

	public String getDimensionUnit() {
		return dimensionUnit;
	}

	public void setDimensionUnit(String dimensionUnit) {
		this.dimensionUnit = dimensionUnit;
	}

	public float getVolume() {
		return volume;
	}

	public void setVolume(float volume) {
		this.volume = volume;
	}

	public String getVolumeUnit() {
		return volumeUnit;
	}

	public void setVolumeUnit(String volumeUnit) {
		this.volumeUnit = volumeUnit;
	}

	public String getCriticalityLevel() {
		return criticalityLevel;
	}

	public void setCriticalityLevel(String criticalityLevel) {
		this.criticalityLevel = criticalityLevel;
	}

	public String getDrawing() {
		return drawing;
	}

	public void setDrawing(String drawing) {
		this.drawing = drawing;
	}

	public String getTypeOfMaterial() {
		return typeOfMaterial;
	}

	public void setTypeOfMaterial(String typeOfMaterial) {
		this.typeOfMaterial = typeOfMaterial;
	}

	public String getSelfLife() {
		return selfLife;
	}

	public void setSelfLife(String selfLife) {
		this.selfLife = selfLife;
	}

	
	
}
