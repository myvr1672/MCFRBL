package ACTION;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import dao.DaoMaterialShortage;
import hibernateConnect.HibernateConfig;
import model.User;
import beans.MaterialShortage;
import common.SentEmail;
import common.SentSms;
import beans.MaterialMaster;

public class MaterialShortageAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private DaoMaterialShortage dao = new DaoMaterialShortage();

	private List<MaterialShortage> records;
	private String result;
	private String message;
	private MaterialShortage record;

	private MaterialShortage materialShortage = new MaterialShortage();
	private MaterialMaster materialMaster= new MaterialMaster();
	
	private int abid;
	private String unifiedPLNo;
	//private String plDesc;
	private String qtyAvl;
	private String dateOfReport;
	private String shop;
	
	private String actionPerformed;
	private String remarks;
	
	private String status;
	private Integer coachAffected;
	private String jtSorting;//for sorting
	private String jtStartIndex;
	private String jtPageSize;
	private int totalRecordCount;
	
		public String list() {
		try {
			Map session_map= ActionContext.getContext().getSession();
			int startPageIndex=Integer.parseInt(jtStartIndex);
			int numRecordsPerPage=Integer.parseInt(jtPageSize);
			setRecords(getDao().getAllMaterialShortage(jtSorting, startPageIndex, numRecordsPerPage));
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
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());
		record = new MaterialShortage();
		Session session =  null;
		session = HibernateConfig.getSession();
		//record.setAbid(abid);
		record.setUnifiedPLNo(unifiedPLNo);
		materialMaster = (MaterialMaster)session.get(MaterialMaster.class, unifiedPLNo);
		record.setPlDesc(materialMaster.getMaterialDesc());
		record.setQtyAvl(qtyAvl);
		record.setShop(shop);
		record.setCoachAffected(coachAffected);
		
		           //enter code here for shop
		
		record.setEntryDate(sdf.format(timestamp));
		record.setEntryBy(userID);
		record.setStatus("Intimated");
		try {
			
			SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			
			if(!("".equals(dateOfReport)))
						{
							
						record.setDateOfReport(df.parse(dateOfReport));
						
						}
			else { record.setDateOfReport(new Date());  }
			getDao().addMaterialShortage(record);
			
			// sent mail id code	
			System.out.println("receipient mail code");
						
						SentEmail sentMail=new SentEmail();
						SentSms sentSMS=new SentSms();
			             session=HibernateConfig.getSession();
			            Criteria cr2= session.createCriteria(User.class);
			            Criterion rest1=Restrictions.eq("userType", "System Admin");  //1
			            
			            Criterion rest2=Restrictions.and(Restrictions.eq("userType", "Production")
			                ,Restrictions.in("roles",new String[] {shop, "All"}));//2
			                cr2.add(Restrictions.or(rest1,rest2));
			         // cr2.setProjection(Projections.property("email"));
			          //cr2.setProjection(Projections.projectionList().add(Projections.property("email")).add(Projections.property("telephone"))); 
			          @SuppressWarnings("unchecked")
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
			          
			       
					
			        String subject="Material Shortage: " +materialMaster.getMaterialDesc()+ " reported in "+shop+" ";
			        String content="Material: " +materialMaster.getMaterialDesc()+ " is shortage in "+shop+" . "+coachAffected+" coach affected due to this material.  ";
			       // sentMail.sentMail("dasgupta.hirak@gmail.com", subject, content);
			        sentMail.sentMail_1(email, subject, content);
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
			record = (MaterialShortage)session.get(MaterialShortage.class,abid);
			//record.setAbid(abid);
			String plNoFromDB=record.getUnifiedPLNo();
			String shopFromDB=record.getShop();
			String dateofReportFromDB=df.format(record.getDateOfReport());
			String qtyAvailablefromDB=record.getQtyAvl();
			record.setUnifiedPLNo(unifiedPLNo);
			materialMaster = (MaterialMaster)session.get(MaterialMaster.class, unifiedPLNo);
			record.setPlDesc(materialMaster.getMaterialDesc());
			record.setQtyAvl(qtyAvl);
			record.setShop(shop);
			record.setCoachAffected(coachAffected);
			
			
			
			if(!("".equals(dateOfReport)))
			{
				
				
			
				record.setDateOfReport(df.parse(dateOfReport));
			
			}
			
			else { record.setDateOfReport(new Date());  }
			record.setShop(shop);           //enter code here for shop
			if(!(plNoFromDB.equals(unifiedPLNo))||!(dateofReportFromDB.equals(dateOfReport))||!(shopFromDB.equals(shop))||!(qtyAvailablefromDB.equals(qtyAvl)))
			{
			record.setEntryDate(sdf.format(timestamp));
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
			record.setRemarkEntryDate(sdf.format(timestamp));
			}
			}
			getDao().updateMaterialShortage(record);  //code here
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
			
		getDao().deleteMaterialShortage(abid);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}

	public DaoMaterialShortage getDao() {
		return dao;
	}

	public void setDao(DaoMaterialShortage dao) {
		this.dao = dao;
	}

	public List<MaterialShortage> getRecords() {
		return records;
	}

	public void setRecords(List<MaterialShortage> records) {
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

	public MaterialShortage getRecord() {
		return record;
	}

	public void setRecord(MaterialShortage record) {
		this.record = record;
	}

	public MaterialShortage getMaterialShortage() {
		return materialShortage;
	}

	public void setMaterialShortage(MaterialShortage materialShortage) {
		this.materialShortage = materialShortage;
	}

	public MaterialMaster getMaterialMaster() {
		return materialMaster;
	}

	public void setMaterialMaster(MaterialMaster materialMaster) {
		this.materialMaster = materialMaster;
	}

	public int getAbid() {
		return abid;
	}

	public void setAbid(int abid) {
		this.abid = abid;
	}

	public String getUnifiedPLNo() {
		return unifiedPLNo;
	}

	public void setUnifiedPLNo(String unifiedPLNo) {
		this.unifiedPLNo = unifiedPLNo;
	}

	public String getQtyAvl() {
		return qtyAvl;
	}

	public void setQtyAvl(String qtyAvl) {
		this.qtyAvl = qtyAvl;
	}

	
	public String getShop() {
		return shop;
	}

	public void setShop(String shop) {
		this.shop = shop;
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

	
	
	public String getDateOfReport() {
		return dateOfReport;
	}

	public void setDateOfReport(String dateOfReport) {
		this.dateOfReport = dateOfReport;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getJtSorting() {
		return jtSorting;
	}

	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}

	public Integer getCoachAffected() {
		return coachAffected;
	}

	public void setCoachAffected(Integer coachAffected) {
		this.coachAffected = coachAffected;
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

	
}
