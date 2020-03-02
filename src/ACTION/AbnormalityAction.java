package ACTION;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import common.SentEmail;
import common.SentSms;
import dao.DaoAbnormality;
import hibernateConnect.HibernateConfig;
import model.Abnormality;
import model.AbnormalityMaster;
import model.User;


public class AbnormalityAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private DaoAbnormality dao = new DaoAbnormality();

	private List<Abnormality> records;
	private String result;
	private String message;
	private Abnormality record;
   
	private Abnormality abnormality = new Abnormality();
	private AbnormalityMaster abnormalityMaster= new AbnormalityMaster();
	
	private int abid;
	private Integer abnormalityID;
	private String detailAbnormalityDescription;
	private String createdate;
	private String shop;
	private String actionPerformed;
	private String remarks;
	private String status;
	private String jtSorting;//for sorting
	
	

	public Abnormality getAbnormility() {
		return abnormality;
	}

	public void setAbnormility(Abnormality abnormality) {
		this.abnormality = abnormality;
	}

	public DaoAbnormality getDao() {
		return dao;
	}

	public void setDao(DaoAbnormality dao) {
		this.dao = dao;
	}
	

	public String getDetailAbnormalityDescription() {
		return detailAbnormalityDescription;
	}

	public void setDetailAbnormalityDescription(String detailAbnormalityDescription) {
		this.detailAbnormalityDescription = detailAbnormalityDescription;
	}

	public String list() {
		try {
			setRecords(getDao().getAllAbnormaity(jtSorting));
		
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
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());
		record = new Abnormality();
		Session session =  null;
		session = HibernateConfig.getSession();
		//record.setAbid(abid);
		record.setAbnormalityID(abnormalityID);

	 abnormalityMaster = (AbnormalityMaster)session.get(AbnormalityMaster.class, abnormalityID);
		record.setAbnormalityDescription(abnormalityMaster.getAbnormalityDescription());
		record.setDetailAbnormalityDescription(detailAbnormalityDescription);
		record.setCreatedate(new Date());
		record.setShop(shop);           //enter code here for shop
		
		record.setEntrydate(sdf.format(timestamp));
		record.setEntryBy(userID);
		record.setStatus("Intimated");
		try {
			
			SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			
			if(!("".equals(createdate)))
						{
							
							Date createdateD = df.parse(createdate);
						
						record.setCreatedate(createdateD);
						
						}
			getDao().addAbnormality(record);
			//sent mail
System.out.println("receipient mail code");
			
			SentEmail sentMail=new SentEmail();
			SentSms   sentSMS= new SentSms();
             session=HibernateConfig.getSession();
            Criteria cr2= session.createCriteria(User.class);
            Criterion rest1=Restrictions.eq("userType", "System Admin");  //1
            
            Criterion rest2=Restrictions.and(Restrictions.eq("userType", "Production")
                ,Restrictions.in("roles",new String[] {shop, "All"}));//2
                cr2.add(Restrictions.or(rest1,rest2));
         // cr2.setProjection(Projections.property("email"));
          //cr2.setProjection(Projections.projectionList().add(Projections.property("email")).add(Projections.property("telephone"))); 
          List <User> users=cr2.list();
          String email[]=new String[users.size()];
          String telephone[]=new String[users.size()];
          int i=0;
          for (User user:users)
          {
        	  email[i]=user.getEmail();
           //String email=  
          telephone[i]=user.getTelephone();
           i++;
          }
          
       
		
        String subject="Abnormality: " +detailAbnormalityDescription+ " reported in "+shop+" ";
        String content="Abnormality: " +detailAbnormalityDescription+ " with remark "+ remarks+ "reported in "+shop+"  ";
       // sentMail.sentMail("dasgupta.hirak@gmail.com", subject, content);
        sentMail.sentMail_1(email, subject, content);     //sent email
        sentSMS.sentBulkSms(telephone, content);
			//end of code
			
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
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());	
		Session session =  null;
		try {
			SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			
			session = HibernateConfig.getSession();
			record = (Abnormality)session.get(Abnormality.class,abid);
			//record.setAbid(abid);
			Integer abnormalityIDFromDB=record.getAbnormalityID();
			String shopFromDB=record.getShop();
			String createDateFromDB=df.format(record.getCreatedate());
			
			record.setAbnormalityID(abnormalityID);
			System.out.println("Create Date:"+createdate);
			abnormalityMaster = (AbnormalityMaster)session.get(AbnormalityMaster.class, abnormalityID);
			record.setAbnormalityDescription(abnormalityMaster.getAbnormalityDescription());
			record.setDetailAbnormalityDescription(detailAbnormalityDescription);
			//record.setCreatedate(new Date());
			
			if(!("".equals(createdate)))
			{
				
				Date createdateD = df.parse(createdate);
			
			record.setCreatedate(createdateD);
			
			}
			
			else { record.setCreatedate(new Date());  }
			record.setShop(shop);           //enter code here for shop
			if((abnormalityIDFromDB!=abnormalityID)||!(createDateFromDB.equals(createdate))||!(shopFromDB.equals(shop)))
			{
			record.setEntrydate(sdf.format(timestamp));
			record.setEntryBy(userID);
			}
			if(!("".equals(actionPerformed)))
			//if(actionPerformed!=null)
			{		
			String actionPerformedFromDB=	record.getActionPerformed();
			String remarksFromDB=	record.getRemarks();
			record.setActionPerformed(actionPerformed);
			record.setRemarks(remarks);
			record.setStatus(status);
			if((!actionPerformedFromDB.equals(actionPerformed))||!(remarksFromDB.equals(remarks)))
			{
			record.setRemarkEntryBy(userID);
			record.setRemarkEntrydate(sdf.format(timestamp));
			}
			}
			getDao().updateAbnormality(record);  //code here
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
			
		getDao().deleteAbnormality(abid);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}

	public List<Abnormality> getRecords() {
		return records;
	}

	public void setRecords(List<Abnormality> records) {
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

	public Abnormality getRecord() {
		return record;
	}

	public void setRecord(Abnormality record) {
		this.record = record;
	}

	public Abnormality getAbnormality() {
		return abnormality;
	}

	public void setAbnormality(Abnormality abnormality) {
		this.abnormality = abnormality;
	}

	public int getAbid() {
		return abid;
	}

	public void setAbid(int abid) {
		this.abid = abid;
	}

	

	public Integer getAbnormalityID() {
		return abnormalityID;
	}

	public void setAbnormalityID(Integer abnormalityID) {
		this.abnormalityID = abnormalityID;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public String getShop() {
		return shop;
	}

	public void setShop(String shop) {
		this.shop = shop;
	}

	public String getJtSorting() {
		return jtSorting;
	}

	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}

	public String getActionPerformed() {
		return actionPerformed;
	}

	public void setActionPerformed(String actionPerformed) {
		this.actionPerformed = actionPerformed;
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

	public void setStatus(String status1) {
		this.status = status1;
	}

	public AbnormalityMaster getAbnormalityMaster() {
		return abnormalityMaster;
	}

	public void setAbnormalityMaster(AbnormalityMaster abnormalityMaster) {
		this.abnormalityMaster = abnormalityMaster;
	}

	
}
