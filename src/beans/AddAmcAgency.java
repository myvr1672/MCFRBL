package beans;

public class AddAmcAgency implements java.io.Serializable{

private static final long serialVersionUID = 1L;
	
        String amc_agency_id;
		String amc_agency_name;
        String amc_agency_address;
        String country;
        String telephone;
        String fax;
        String email;
        String mobileNo;

	
	public AddAmcAgency(){
		//default Constructor
	}
	
	public AddAmcAgency(String amc_agency_id,String amc_agency_name,String amc_agency_address,String country,String telephone,String fax,String email, String mobileNo){
		
		this.amc_agency_id= amc_agency_id;
		this.amc_agency_name=amc_agency_name;
		this.amc_agency_address=amc_agency_address;
		this.telephone=telephone;
		this.country=country;
		this.fax =fax;
		this.email =email;
		this.mobileNo=mobileNo;
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

	

	

	
}