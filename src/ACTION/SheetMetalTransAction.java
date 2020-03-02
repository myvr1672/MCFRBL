package ACTION;

import java.io.IOException;
//import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import com.opensymphony.xwork2.ActionSupport;

import beans.SheetmetalTransaction;

import dao.DaoSheetMetalTrans;
import hibernateConnect.HibernateConfig;


public class SheetMetalTransAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private DaoSheetMetalTrans dao = new DaoSheetMetalTrans();

	private List<SheetmetalTransaction> records;
	private String result;
	private String message;
	private SheetmetalTransaction record;

	private SheetmetalTransaction abnormality = new SheetmetalTransaction();
	
	
	private String drawingNo;
	private String productionDate;
	private Integer qtyProduced;
	
	
	private String jtSorting;//for sorting
	
	public String list() {
		try {
			setRecords(getDao().getAllSheetDetails(jtSorting));
			
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
		//SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		//Timestamp timestamp= new Timestamp(System.currentTimeMillis());
		record = new SheetmetalTransaction();
		//Session session =  null;
		//session = HibernateConfig.getSession();
		
		record.setDrawingNo(drawingNo);
		record.setQtyProduced(qtyProduced);	
		try {
			
			SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			
			if(!("".equals(productionDate)))
						{
							Date productionDateD = df.parse(productionDate);
						record.setProductionDate(productionDateD);
						}
			getDao().addSheetMetalTran(record);
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}

	public String update() throws IOException {			
		//SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		//Timestamp timestamp= new Timestamp(System.currentTimeMillis());	
		Session session =  null;
		try {
			SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			
			session = HibernateConfig.getSession();
			record = (SheetmetalTransaction)session.get(SheetmetalTransaction.class,drawingNo);
			
			record.setQtyProduced(qtyProduced);
			
			if(!("".equals(productionDate)))
			{
				
				Date productionDateD = df.parse(productionDate);
			
			record.setProductionDate(productionDateD);
			
			}
			
			else { record.setProductionDate(new Date());  }
			
		
			getDao().updateSheetMetalTran(record);  //code here
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
			
		getDao().deleteSheetMetalTran(drawingNo);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}

	public DaoSheetMetalTrans getDao() {
		return dao;
	}

	public void setDao(DaoSheetMetalTrans dao) {
		this.dao = dao;
	}

	public List<SheetmetalTransaction> getRecords() {
		return records;
	}

	public void setRecords(List<SheetmetalTransaction> records) {
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

	public SheetmetalTransaction getRecord() {
		return record;
	}

	public void setRecord(SheetmetalTransaction record) {
		this.record = record;
	}

	public SheetmetalTransaction getAbnormality() {
		return abnormality;
	}

	public void setAbnormality(SheetmetalTransaction abnormality) {
		this.abnormality = abnormality;
	}

	
	public String getDrawingNo() {
		return drawingNo;
	}

	public void setDrawingNo(String drawingNo) {
		this.drawingNo = drawingNo;
	}

	public String getProductionDate() {
		return productionDate;
	}

	public void setProductionDate(String productionDate) {
		this.productionDate = productionDate;
	}

	public String getJtSorting() {
		return jtSorting;
	}

	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}

	public Integer getQtyProduced() {
		return qtyProduced;
	}

	public void setQtyProduced(Integer qtyProduced) {
		this.qtyProduced = qtyProduced;
	}
	
	
}
