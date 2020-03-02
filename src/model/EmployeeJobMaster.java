package model;


public class EmployeeJobMaster implements java.io.Serializable 
{
private static final long serialVersionUID = 1L;
	
	private String job_id;
	private String shop;
	private String section;
	private String subSection;
	private String status;
	private float allowed_time;
	private float prep_time;
	private String load_center_id;
	private String machine_id;
	private String jig_fix_id;
	
	public String getJob_id() {
		return job_id;
	}

	public void setJob_id(String job_id) {
		this.job_id = job_id;
	}

	private String job_desc;
	
	public float getAllowed_time() {
		return allowed_time;
	}

	public void setAllowed_time(float allowed_time) {
		this.allowed_time = allowed_time;
	}

	public float getPrep_time() {
		return prep_time;
	}

	public void setPrep_time(float prep_time) {
		this.prep_time = prep_time;
	}

	public String getLoad_center_id() {
		return load_center_id;
	}

	public void setLoad_center_id(String load_center_id) {
		this.load_center_id = load_center_id;
	}

	public String getMachine_id() {
		return machine_id;
	}

	public void setMachine_id(String machine_id) {
		this.machine_id = machine_id;
	}

	public String getJig_fix_id() {
		return jig_fix_id;
	}

	public void setJig_fix_id(String jig_fix_id) {
		this.jig_fix_id = jig_fix_id;
	}

	public EmployeeJobMaster(){
		//default Constructor
	}

	public String getShop() {
		return shop;
	}

	public void setShop(String shop) {
		this.shop = shop;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getSubSection() {
		return subSection;
	}

	public void setSubSection(String subSection) {
		this.subSection = subSection;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getJob_desc() {
		return job_desc;
	}

	public void setJob_desc(String job_desc) {
		this.job_desc = job_desc;
	}

	public EmployeeJobMaster(String job_id, String shop, String section, String subSection,
		 String status, String job_desc) {
		super();
		this.job_id = job_id;
		this.shop = shop;
		this.section = section;
		this.subSection = subSection;
		this.status = status;
		this.job_desc = job_desc;
	}
}
