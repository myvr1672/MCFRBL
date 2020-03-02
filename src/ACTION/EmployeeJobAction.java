package ACTION;


import com.opensymphony.xwork2.ActionSupport;

import dao.DaoEmployeeJobMaster;
import java.io.IOException;
import model.EmployeeJobMaster;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import hibernateConnect.HibernateConfig;


public class EmployeeJobAction extends ActionSupport{ 

private static final long serialVersionUID = 1L;

	private  DaoEmployeeJobMaster dao = new DaoEmployeeJobMaster();
	
    private List<EmployeeJobMaster> records;
	private String result;
	private String message;
	private EmployeeJobMaster record;
	
	private EmployeeJobMaster emp_job=new EmployeeJobMaster();

	private String job_id;
	private String shop;
	private String section;
	private String subSection;
	private String job_desc;
	private String allowed_time;
	private String prep_time;
	private String load_center_id;
	private String machine_id;
	private String jig_fix_id;
	private String jtSorting;//for sorting
	
	
	public String list() {
		try {
			setRecords(getDao().getAllEmployee(jtSorting));
		
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
		
	    
		
		record = new EmployeeJobMaster();
		
	    record.setJob_id(job_id);
		record.setShop(shop);
		record.setSection(section);
		record.setSubSection(subSection);
		record.setStatus("active");
		record.setJob_desc(job_desc);
		record.setLoad_center_id(load_center_id);
		record.setMachine_id(machine_id);
		record.setJig_fix_id(jig_fix_id);
	
		try {
			if(!("".equals(allowed_time)))
			{
				float f1;
				f1=Float.parseFloat(allowed_time);
				record.setAllowed_time(f1);
			}
			if(!("".equals(prep_time)))
			{
				float f2;
				f2=Float.parseFloat(prep_time);
				record.setPrep_time(f2);
			}
			dao.addEmployeeJobMaster(record);
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
	    
	   
	    Criteria cr = session.createCriteria(EmployeeJobMaster.class);
	    cr.add(Restrictions.eq("job_id", job_id));
	   
	    record = (EmployeeJobMaster)cr.list().get(0);
	   
	    record.setShop(shop);
	    record.setSection(section);
	    record.setSubSection(subSection);
	    record.setJob_desc(job_desc);
	  
		try {
		    getDao().updateEmployeeJobMaster(record);
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
		System.out.println(job_id);
		try {
			
			getDao().deleteEmployeeJobMaster(job_id);			
				setResult("OK");
			} catch (Exception e) {
				setResult("ERROR");
				setMessage(e.getMessage());
				System.err.println(e.getMessage());
			}
			return ActionSupport.SUCCESS;
			}


	public DaoEmployeeJobMaster getDao() {
		return dao;
	}


	public void setDao(DaoEmployeeJobMaster dao) {
		this.dao = dao;
	}


	public List<EmployeeJobMaster> getRecords() {
		return records;
	}


	public void setRecords(List<EmployeeJobMaster> records) {
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


	public EmployeeJobMaster getRecord() {
		return record;
	}


	public void setRecord(EmployeeJobMaster record) {
		this.record = record;
	}


	public EmployeeJobMaster getEmp_job() {
		return emp_job;
	}


	public void setEmp_job(EmployeeJobMaster emp_job) {
		this.emp_job = emp_job;
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


	public String getJob_id() {
		return job_id;
	}


	public void setJob_id(String job_id) {
		this.job_id = job_id;
	}


	public String getJob_desc() {
		return job_desc;
	}


	public void setJob_desc(String job_desc) {
		this.job_desc = job_desc;
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


	public String getAllowed_time() {
		return allowed_time;
	}


	public void setAllowed_time(String allowed_time) {
		this.allowed_time = allowed_time;
	}


	public String getPrep_time() {
		return prep_time;
	}


	public void setPrep_time(String prep_time) {
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


	

}