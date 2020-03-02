package beans;

public class SupplierDetails implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String supplierCode;
	private String supplierName;
	private String supplierAddress;
	private String supplierCountry;
	private String telephoneNo;
	private String faxNo;
	private String email;
	private String contactPerson;
	private String mobileNo;
	
	
	public SupplierDetails()
	{
		
	}


	public SupplierDetails(String supplierCode, String supplierName, String supplierAddress, String supplierCountry,
			String telephoneNo, String faxNo, String email, String contactPerson, String mobileNo) {
		super();
		this.supplierCode = supplierCode;
		this.supplierName = supplierName;
		this.supplierAddress = supplierAddress;
		this.supplierCountry = supplierCountry;
		this.telephoneNo = telephoneNo;
		this.faxNo = faxNo;
		this.email = email;
		this.contactPerson = contactPerson;
		this.mobileNo = mobileNo;
	}


	public String getSupplierCode() {
		return supplierCode;
	}


	public void setSupplierCode(String supplierCode) {
		this.supplierCode = supplierCode;
	}


	public String getSupplierName() {
		return supplierName;
	}


	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}


	public String getSupplierAddress() {
		return supplierAddress;
	}


	public void setSupplierAddress(String supplierAddress) {
		this.supplierAddress = supplierAddress;
	}


	public String getSupplierCountry() {
		return supplierCountry;
	}


	public void setSupplierCountry(String supplierCountry) {
		this.supplierCountry = supplierCountry;
	}


	public String getTelephoneNo() {
		return telephoneNo;
	}


	public void setTelephoneNo(String telephoneNo) {
		this.telephoneNo = telephoneNo;
	}


	public String getFaxNo() {
		return faxNo;
	}


	public void setFaxNo(String faxNo) {
		this.faxNo = faxNo;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getContactPerson() {
		return contactPerson;
	}


	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}


	public String getMobileNo() {
		return mobileNo;
	}


	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	
}
