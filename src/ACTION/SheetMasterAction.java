package ACTION;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ActionSupport;

import beans.SheetmetalMaster;

import dao.DaoSheetmetalMaster;
import hibernateConnect.HibernateConfig;


public class SheetMasterAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	HttpSession session_http = ServletActionContext.getRequest().getSession(true);
	String userID = (String) session_http.getAttribute("userid");
	private DaoSheetmetalMaster dao = new DaoSheetmetalMaster();

	private List<SheetmetalMaster> records;
	private String result;
	private String message;
	private SheetmetalMaster record;

	
	private String drawingNo;
	private String description;
	private Float sizeLength;
	private Float sizeWidth;
	private Float sizeThickness;
	private String sizeUnit;
	private String rawMaterialUsed;
	private String processP1;
	private String processP2;
	private String processP3;
	private String processP4;
	private String processP5;
	private Integer qpc;
	private String shellType;
	private String componentType;
	private String fileName;
	private String userShop;
	
	
	private String jtSorting;
	
	
	public String list() {
		try {
			setRecords(getDao().getAllSheetMetal(jtSorting));
			
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
		Session session=null;
		session=HibernateConfig.getSession();
		record = new SheetmetalMaster();
		SheetmetalMaster sheetmetalMaster=	(SheetmetalMaster)session.get(SheetmetalMaster.class,drawingNo);
		
		
		if(sheetmetalMaster==null)
		{
			
			
		
		record.setDrawingNo(drawingNo);
		record.setDescription(description);
		record.setSizeLength(sizeLength);
		record.setSizeWidth(sizeWidth);		
		record.setSizeThickness(sizeThickness);
		record.setSizeUnit(sizeUnit);
		record.setRawMaterialUsed(rawMaterialUsed);
		record.setProcessP1(processP1);
		record.setProcessP2(processP2);
		record.setProcessP3(processP3);
		record.setProcessP4(processP4);
		
		record.setProcessP5(processP5);
		record.setQpc(qpc);
		record.setShellType(shellType);
		record.setComponentType(componentType);
		record.setFileName(fileName);
		record.setUserShop(userShop);
		record.setEntrydate(sdf.format(timestamp));
		record.setEntryBy(userID);
		
		try {
			/*File file = new File("E:/Upload");
			if (!file.exists()) {
		        if (file.mkdirs()) {
		            System.out.println("Directory is created!");
		        } else {
		            System.out.println("Failed to create directory!");
		        }
		    }
			 String filePath = file.getPath();
		       File saveFilePath = new File(filePath , "navin_"+userImageFileName);
		        
		        	//FileUtils.copyFile(this.fileUpload, fileToCreate);
		            FileUtils.copyFile(userImage, saveFilePath);
*/		    
			getDao().addSheetmetalMaster(record);
			
			
			message="Data successfully inserted";
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		finally{
			session.close();
		}
		}
		else
		{
			message="Drawing No already exists";
			setResult("OK");
			session.close();
		}
		
		return ActionSupport.SUCCESS;
	}

	public String update() throws IOException {			
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		Timestamp timestamp= new Timestamp(System.currentTimeMillis());	
		Session session =  null;
		try {
			
			
			session = HibernateConfig.getSession();
			Criteria cr = session.createCriteria(SheetmetalMaster.class);
		    cr.add(Restrictions.eq("drawingNo", drawingNo));
		   
		    record = (SheetmetalMaster)cr.list().get(0);
			//record = (SheetmetalMaster)session.load(SheetmetalMaster.class,drawingNo);
			record.setDescription(description);
			record.setSizeLength(sizeLength);
			record.setSizeWidth(sizeWidth);		
			record.setSizeThickness(sizeThickness);
			record.setSizeUnit(sizeUnit);
			record.setRawMaterialUsed(rawMaterialUsed);
			record.setProcessP1(processP1);
			record.setProcessP2(processP2);
			record.setProcessP3(processP3);
			record.setProcessP4(processP4);
			
			record.setProcessP5(processP5);
			record.setQpc(qpc);
			record.setShellType(shellType);
			record.setComponentType(componentType);
			record.setUserShop(userShop);
			record.setEntrydate(sdf.format(timestamp));
			record.setEntryBy(userID);
			
			getDao().updateSheetmetalMaster(record);  //code here
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
			
		getDao().deleteSheetmetalMaster(drawingNo);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}

	
	
	
	
	
	public DaoSheetmetalMaster getDao() {
		return dao;
	}
	public void setDao(DaoSheetmetalMaster dao) {
		this.dao = dao;
	}
	public List<SheetmetalMaster> getRecords() {
		return records;
	}
	public void setRecords(List<SheetmetalMaster> records) {
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
	public SheetmetalMaster getRecord() {
		return record;
	}
	public void setRecord(SheetmetalMaster record) {
		this.record = record;
	}
	
	public String getDrawingNo() {
		return drawingNo;
	}

	public void setDrawingNo(String drawingNo) {
		this.drawingNo = drawingNo;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Float getSizeLength() {
		return sizeLength;
	}
	public void setSizeLength(Float sizeLength) {
		this.sizeLength = sizeLength;
	}
	public Float getSizeWidth() {
		return sizeWidth;
	}
	public void setSizeWidth(Float sizeWidth) {
		this.sizeWidth = sizeWidth;
	}
	public Float getSizeThickness() {
		return sizeThickness;
	}
	public void setSizeThickness(Float sizeThickness) {
		this.sizeThickness = sizeThickness;
	}
	public String getSizeUnit() {
		return sizeUnit;
	}
	public void setSizeUnit(String sizeUnit) {
		this.sizeUnit = sizeUnit;
	}
	public String getRawMaterialUsed() {
		return rawMaterialUsed;
	}
	public void setRawMaterialUsed(String rawMaterialUsed) {
		this.rawMaterialUsed = rawMaterialUsed;
	}
	public String getProcessP1() {
		return processP1;
	}
	public void setProcessP1(String processP1) {
		this.processP1 = processP1;
	}
	public String getProcessP2() {
		return processP2;
	}
	public void setProcessP2(String processP2) {
		this.processP2 = processP2;
	}
	public String getProcessP3() {
		return processP3;
	}
	public void setProcessP3(String processP3) {
		this.processP3 = processP3;
	}
	public String getProcessP4() {
		return processP4;
	}
	public void setProcessP4(String processP4) {
		this.processP4 = processP4;
	}
	public String getProcessP5() {
		return processP5;
	}
	public void setProcessP5(String processP5) {
		this.processP5 = processP5;
	}
	public Integer getQpc() {
		return qpc;
	}
	public void setQpc(Integer qpc) {
		this.qpc = qpc;
	}
	public String getShellType() {
		return shellType;
	}
	public void setShellType(String shellType) {
		this.shellType = shellType;
	}
	public String getComponentType() {
		return componentType;
	}
	public void setComponentType(String componentType) {
		this.componentType = componentType;
	}
	
	public String getJtSorting() {
		return jtSorting;
	}
	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getUserShop() {
		return userShop;
	}

	public void setUserShop(String userShop) {
		this.userShop = userShop;
	}

		
	
	
}
