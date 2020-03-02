package struts.action.master;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;


import dao.DaoJobMaster;
import hibernateConnect.HibernateConfig;
import beans.JobTransaction;

public class JobCompletionAction {
	private  DaoJobMaster dao = new DaoJobMaster();
	private Integer jobSeqNo;
    private String status;
    private String remarks;
    
    private String completionDate;
    
    public String setCompletionDate()
	{
		Session session=null;
		session = HibernateConfig.getSession();
		
		try {
SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//SubStagesMaster subStagesMaster= new SubStagesMaster();


//   SimpleDateFormat sdf= new SimpleDateFormat("dd-MM-yyyy");

Criteria cr = session.createCriteria(JobTransaction.class);
cr.add(Restrictions.eq("jobSeqNo", jobSeqNo));

JobTransaction	jobMaster = (JobTransaction)cr.list().get(0);


			
			if(!("".equals(completionDate)))
			{
				
				Date completion_Date = df.parse(completionDate);
				jobMaster.setCompletionDate(completion_Date);
			}
			else{
				jobMaster.setCompletionDate(new Date());
				
			}
			jobMaster.setStatus(status);
			jobMaster.setInspectionStatus("OK");
			jobMaster.setRemarks(remarks);
			
			  dao.updateJobMaster(jobMaster);	
			
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

	
	public Integer getJobSeqNo() {
		return jobSeqNo;
	}


	public void setJobSeqNo(Integer jobSeqNo) {
		this.jobSeqNo = jobSeqNo;
	}


	public String getRemarks() {
		return remarks;
	}


	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCompletionDate() {
		return completionDate;
	}

	public void setCompletionDate(String completionDate) {
		this.completionDate = completionDate;
	}


    
    
}
