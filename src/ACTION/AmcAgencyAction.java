package ACTION;
import com.opensymphony.xwork2.ActionSupport;
import dao.AmcAgencyDao;
import java.io.IOException;
import beans.AddAmcAgency;
import java.util.List;

public class AmcAgencyAction extends ActionSupport{ 

private static final long serialVersionUID = 1L;

	private  AmcAgencyDao dao = new AmcAgencyDao();
	
   

	private List<AddAmcAgency> records;
	
	private String result;
	private String message;
	private AddAmcAgency record;
	
	

	private AddAmcAgency amcAgency=new AddAmcAgency();

	
	private String amc_agency_id;
	private String amc_agency_name;
	private String amc_agency_address;
	private String country;
	private String telephone;
	private String fax;
	private String email;
	private String jtSorting;//for sorting
	private String mobileNo;
	
	
	 public AmcAgencyDao getDao() {
			return dao;
		}

		public void setDao(AmcAgencyDao dao) {
			this.dao = dao;
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
	public String getAmc_agency_id() {
		return amc_agency_id;
	}

	public void setAmc_agency_id(String amc_agency_id) {
		this.amc_agency_id = amc_agency_id;
	}

	public String getAmc_agency_name() {
		return amc_agency_name;
	}

	public void setAmc_agency_name(String amc_agency_name) {
		this.amc_agency_name = amc_agency_name;
	}

	public String getAmc_agency_address() {
		return amc_agency_address;
	}

	public void setAmc_agency_address(String amc_agency_address) {
		this.amc_agency_address = amc_agency_address;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	public String getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}

	public String getJtSorting() {
		return jtSorting;
	}

	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}

	public List<AddAmcAgency> getRecords() {
		return records;
	}

	public void setRecords(List<AddAmcAgency> records) {
		this.records = records;
	}

	public AddAmcAgency getRecord() {
		return record;
	}

	public void setRecord(AddAmcAgency record) {
		this.record = record;
	}

	public AddAmcAgency getAmcAgency() {
		return amcAgency;
	}

	public void setAmcAgency(AddAmcAgency amcAgency) {
		this.amcAgency = amcAgency;
	}

	public String list() {
		try {
			setRecords(getDao().getAmcAgency(jtSorting));
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
		
	    
		
		record = new AddAmcAgency();
		
	    record.setAmc_agency_id(amc_agency_id);
		record.setAmc_agency_name(amc_agency_name);
		record.setAmc_agency_address(amc_agency_address);
		record.setCountry(country.toUpperCase());
		record.setTelephone(telephone);
		record.setFax(fax);
		record.setEmail(email);
		record.setMobileNo(mobileNo);
	
		try {
						
			
			dao.addAmcAgency(record);
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
record = new AddAmcAgency();
		
	    record.setAmc_agency_id(amc_agency_id);
		record.setAmc_agency_name(amc_agency_name);
		record.setAmc_agency_address(amc_agency_address);
		record.setCountry(country);
		record.setTelephone(telephone);
		record.setFax(fax);
		record.setEmail(email);
		record.setMobileNo(mobileNo);
	
		try {
		    getDao().updateAmcAgency(record);;
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
			
		getDao().deleteAmcAgency(amc_agency_id);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}
}