package ACTION;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


import beans.EmployeeTransferHistory;
import dao.DaoEmployeeMaster;
import hibernateConnect.HibernateConfig;

import java.io.IOException;



import model.EmployeeMaster;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class EmployeeMasterAction extends ActionSupport{ 

private static final long serialVersionUID = 1L;

	private  DaoEmployeeMaster dao = new DaoEmployeeMaster();
	
    private List<EmployeeMaster> records;
	private String result;
	private String message;
	private EmployeeMaster record;
	
	private EmployeeMaster Emp_master=new EmployeeMaster();

	private String emp_no;
	private String emp_name;
	private String shop;
	private String section;
	private String subSection;
	
	private String validFrom;
	private String validTo;
	private String jtSorting;//for sorting
	private String jtStartIndex;
	private String jtPageSize;
	private int totalRecordCount;
	private String designation;
	
	public String list() {
		try {
			Map session_map= ActionContext.getContext().getSession();
			int startPageIndex=Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);

			setRecords(getDao().getAllEmployee(jtSorting, validFrom, validTo, startPageIndex, numRecordsPerPage));
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
		
	    
		Session session=null;
		session=HibernateConfig.getSession();
		EmployeeMaster empMaster=(EmployeeMaster) session.get(EmployeeMaster.class, emp_no);
		if(empMaster==null)
		{
		record = new EmployeeMaster();
		
	    record.setEmp_no(emp_no);
		record.setEmp_name(emp_name);
		record.setShop(shop);
		record.setSection(section);
		record.setSubSection(subSection);
		record.setDesignation(designation);
		record.setValidFrom(new Date());
		record.setStatus("working");
		Calendar c = Calendar.getInstance();
		
		c.add(Calendar.YEAR, 35);
	     record.setValidTo(c.getTime());
	
		try {
						
			
			dao.addEmployeeMaster(record);
			message="Data successfully saved";
			setResult("OK");
		} 
		catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		
		finally
		{
			session.close();
			
		}
		
		}
		else
		{
			message="Employee No. already exist";
			setResult("OK");
		}
		
				return ActionSupport.SUCCESS;	
	}
		
	
	public String updateDesignation() throws IOException {	
		System.out.println(emp_no);
		Session session=null;
	    session=HibernateConfig.getSession();
	 //   SimpleDateFormat sdf= new SimpleDateFormat("dd-MM-yyyy");
	   
	    Criteria cr = session.createCriteria(EmployeeMaster.class);
	    cr.add(Restrictions.eq("emp_no", emp_no));
	   
	    record = (EmployeeMaster)cr.list().get(0);
	    
	    record.setDesignation(designation);
	   
	   
	//Add new Record of the EmployeeTransferHistory
	  try
	  {
		    getDao().updateEmployeeMaster(record);
			
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
	

	public String update() throws IOException {	
		System.out.println(emp_no);
		Session session=null;
	    session=HibernateConfig.getSession();
	 //   SimpleDateFormat sdf= new SimpleDateFormat("dd-MM-yyyy");
	   
	    Criteria cr = session.createCriteria(EmployeeMaster.class);
	    cr.add(Restrictions.eq("emp_no", emp_no));
	   
	    record = (EmployeeMaster)cr.list().get(0);
	    String subsectionId=record.getSubSection();  // retrieve earlier section
	    Date oldValidity=record.getValidFrom();
	   
	    record.setShop(shop);
	    record.setSection(section);
	    record.setSubSection(subSection);
	    record.setDesignation(designation);
	    record.setValidFrom(new Date());
	    record.setStatus("working");
	   
	//Add new Record of the EmployeeTransferHistory
	    EmployeeTransferHistory	    empTransfer = new EmployeeTransferHistory();
	    empTransfer.setEmpNo(emp_no);
	    empTransfer.setSectionId(subsectionId);
	    empTransfer.setValidFrom(oldValidity);
	    Calendar cal = Calendar.getInstance();
	    cal.add(Calendar.DATE, -1);
	    empTransfer.setValidTo(cal.getTime());
	  
 // end of adding new employee
		try {
			if(!subsectionId.equals(subSection)){
		    getDao().updateEmployeeMaster(record, empTransfer);
			}
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
		System.out.println(emp_no);
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


	public DaoEmployeeMaster getDao() {
		return dao;
	}


	public void setDao(DaoEmployeeMaster dao) {
		this.dao = dao;
	}


	public List<EmployeeMaster> getRecords() {
		return records;
	}


	public void setRecords(List<EmployeeMaster> records) {
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


	public EmployeeMaster getRecord() {
		return record;
	}


	public void setRecord(EmployeeMaster record) {
		this.record = record;
	}


	public EmployeeMaster getEmp_master() {
		return Emp_master;
	}


	public void setEmp_master(EmployeeMaster emp_master) {
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


	public String getSubSection() {
		return subSection;
	}


	public void setSubSection(String subSection) {
		this.subSection = subSection;
	}


	public String getJtSorting() {
		return jtSorting;
	}


	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}


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


	public String getValidFrom() {
		return validFrom;
	}


	public void setValidFrom(String validFrom) {
		this.validFrom = validFrom;
	}


	public String getValidTo() {
		return validTo;
	}


	public void setValidTo(String validTo) {
		this.validTo = validTo;
	}


	public String getDesignation() {
		return designation;
	}


	public void setDesignation(String designation) {
		this.designation = designation;
	}
	

}