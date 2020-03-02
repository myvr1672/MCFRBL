package struts.action.master;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import beans.EmployeeTransferHistory;

import dao.DaoEmployeeMaster;
import hibernateConnect.HibernateConfig;
import model.EmployeeMaster;

public class TransferRetiredEmployeeAction {
          private String empNumber;
          private String subSection;
          private String fromDate;
          private String status;
          private String transfer_retiredDate;
	
	public String getTransfer()
	{
		Session session=null;
		session = HibernateConfig.getSession();
		
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//SubStagesMaster subStagesMaster= new SubStagesMaster();


//   SimpleDateFormat sdf= new SimpleDateFormat("dd-MM-yyyy");

Criteria cr = session.createCriteria(EmployeeMaster.class);
cr.add(Restrictions.eq("emp_no", empNumber));

EmployeeMaster	employeeMaster = (EmployeeMaster)cr.list().get(0);


			
			if(!("".equals(transfer_retiredDate)))
			{
				
				Date receiptDate_Date = df.parse(transfer_retiredDate);
				employeeMaster.setValidTo(receiptDate_Date);
			}
			else{
				employeeMaster.setValidTo(new Date());
				
			}
			employeeMaster.setStatus(status);
			
// new row for employee history table
			EmployeeTransferHistory employeeTransferHistory= new EmployeeTransferHistory();
			employeeTransferHistory.setEmpNo(empNumber);
			employeeTransferHistory.setSectionId(subSection);
		    employeeTransferHistory.setValidFrom(df.parse(fromDate));
		if(transfer_retiredDate!=null)  {  employeeTransferHistory.setValidTo(df.parse(transfer_retiredDate));}
		else {employeeTransferHistory.setValidTo(new Date());}
			
		 DaoEmployeeMaster dao = new DaoEmployeeMaster();
			
			
			// Second row entry
		 dao.updateEmployeeMaster(employeeMaster, employeeTransferHistory);	
			
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally{
			if(session!= null){
				
				session.close();
			}			
		}
	}

	public String getEmpNumber() {
		return empNumber;
	}

	public void setEmpNumber(String empNumber) {
		this.empNumber = empNumber;
	}

	public String getSubSection() {
		return subSection;
	}

	public void setSubSection(String subSection) {
		this.subSection = subSection;
	}

	public String getFromDate() {
		return fromDate;
	}

	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTransfer_retiredDate() {
		return transfer_retiredDate;
	}

	public void setTransfer_retiredDate(String transfer_retiredDate) {
		this.transfer_retiredDate = transfer_retiredDate;
	}
	
	
}
