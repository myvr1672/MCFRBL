package ACTION;
import com.opensymphony.xwork2.ActionSupport;


import dao.Emp_masterdao;
import hibernateConnect.HibernateConfig;

import java.io.IOException;


import model.Emp_master;
import java.util.List;


import org.hibernate.Session;


public class Empaction extends ActionSupport{ 

private static final long serialVersionUID = 1L;

	private  Emp_masterdao dao = new Emp_masterdao();
	
    private List<Emp_master> records;
	private String result;
	private String message;
	private Emp_master record;
	
	private Emp_master Emp_master=new Emp_master();

	private String emp_no;
	private String emp_name;
	private String shop;
	private String section;
	private String cadre;
	
	private String jtSorting;//for sorting
	
	

	


	public Emp_masterdao getDao() {
		return dao;
	}


	public void setDao(Emp_masterdao dao) {
		this.dao = dao;
	}


	public List<Emp_master> getRecords() {
		return records;
	}


	public void setRecords(List<Emp_master> records) {
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


	public Emp_master getRecord() {
		return record;
	}


	public void setRecord(Emp_master record) {
		this.record = record;
	}


	public Emp_master getEmp_master() {
		return Emp_master;
	}


	public void setEmp_master(Emp_master emp_master) {
		Emp_master = emp_master;
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
			setRecords(getDao().getAllEmp_master(jtSorting));
			System.out.println("hello");
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
		
	    
		
		record = new Emp_master();
		
	    record.setEmp_no(emp_no);
		record.setEmp_name(emp_name);
		record.setShop(shop);
		record.setSection(section);
		record.setCadre(cadre);
	
		try {
						
			
			dao.addEmp_master(record);
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
	    record = (Emp_master) session.get(Emp_master.class, emp_no);
		
		
	    record.setEmp_name(emp_name);
		record.setShop(shop);
		record.setSection(section);
		record.setCadre(cadre);
		try {
		    getDao().updateEmp_master(record);;
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
			
		getDao().deleteEmp_master(emp_no);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}
}