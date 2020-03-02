package ACTION;

import java.io.IOException;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import dao.DaoDefineHoliday;
import beans.IrwisHrPubhodyM;

public class DefineHolidayAction extends ActionSupport{

	private static final long serialVersionUID = 1L;

	private DaoDefineHoliday dao = new DaoDefineHoliday();

	private List<IrwisHrPubhodyM> records;
	private String result;
	private String message;
	private IrwisHrPubhodyM record;

	private IrwisHrPubhodyM defineHoliday = new IrwisHrPubhodyM();
	
	private String hodyCode;
	private String hodyType;
	private String hodyDesc;
	
	private String jtSorting;//for sorting
	

	
	public DaoDefineHoliday getDao() {
		return dao;
	}

	public void setDao(DaoDefineHoliday dao) {
		this.dao = dao;
	}

	public IrwisHrPubhodyM getDefineHoliday() {
		return defineHoliday;
	}

	public void setDefineHoliday(IrwisHrPubhodyM defineHoliday) {
		this.defineHoliday = defineHoliday;
	}

	public String list() {
		try {
			setRecords(getDao().getAllHoliday(jtSorting));
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
		
		record = new IrwisHrPubhodyM();
		
		//record.setHodyCode(hodyCode);
		record.setAllowFlag('N');
		record.setHodyDesc(hodyDesc);
		record.setHodyDtype("PAID");
		record.setHodyType(hodyType);
		
		try {
			

				
			System.out.println("DefineHolidayCode = " + hodyCode);
			
			getDao().addHoliday(record);
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}

	public String update() throws IOException {			
		
		try {
			record = new IrwisHrPubhodyM();
			record.setHodyCode(hodyCode);
			//record.setAllowFlag('N');
			record.setHodyDesc(hodyDesc);
			//record.setHodyDtype("PAID");
			//record.setHodyType(hodyType);
			
			getDao().updateHoliday(record);
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
			
		getDao().deleteHoliday(hodyCode);			
			setResult("OK");
		} catch (Exception e) {
			setResult("ERROR");
			setMessage(e.getMessage());
			System.err.println(e.getMessage());
		}
		return ActionSupport.SUCCESS;
	}

	public List<IrwisHrPubhodyM> getRecords() {
		return records;
	}

	public void setRecords(List<IrwisHrPubhodyM> records) {
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

	public IrwisHrPubhodyM getRecord() {
		return record;
	}

	public void setRecord(IrwisHrPubhodyM record) {
		this.record = record;
	}

	
	public String getHodyCode() {
		return hodyCode;
	}

	public void setHodyCode(String hodyCode) {
		this.hodyCode = hodyCode;
	}

	public String getHodyType() {
		return hodyType;
	}

	public void setHodyType(String hodyType) {
		this.hodyType = hodyType;
	}

	public String getHodyDesc() {
		return hodyDesc;
	}

	public void setHodyDesc(String hodyDesc) {
		this.hodyDesc = hodyDesc;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getJtSorting() {
		return jtSorting;
	}

	public void setJtSorting(String jtSorting) {
		this.jtSorting = jtSorting;
	}


}
