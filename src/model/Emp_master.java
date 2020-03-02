package model;

public class Emp_master implements java.io.Serializable{

private static final long serialVersionUID = 1L;
	
	private String emp_no;
	private String emp_name;
	private String shop;
	private String section;
	private String cadre;
	
	public Emp_master(){
		//default Constructor
	}

	
	public Emp_master(String emp_no, String emp_name, String shop, String section, String cadre) {
		super();
		this.emp_no = emp_no;
		this.emp_name = emp_name;
		this.shop = shop;
		this.section = section;
		this.cadre = cadre;
	}


	public String getEmp_no() {
		return emp_no;
	}


	public void setEmp_no(String emp_no) {
		this.emp_no = emp_no;
	}


	public String getEmp_name() {
		return emp_name;
	}


	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
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


	public String getCadre() {
		return cadre;
	}


	public void setCadre(String cadre) {
		this.cadre = cadre;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

	
}