package struts.action.master;


import org.hibernate.Session;
import dao.DaoShellAssemblySIP;

import beans.ShellSideRoofShellCombineSipTran;
import beans.ShellTransaction;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SaveShellSIPAssembly {

	private String shellAssetId;
	private String docNo;
	private String revNo;
	private String docNoDate;
	private String shiftOfTesting;
	private String dateOfTesting;
	private String sidewallInspectionVisualHolesObser;
	private String sidewallInspectionVisualHolesRectStatus;
	private String sidewallSuspectedHolesObser;
	private String sidewallSuspectedHolesRectStatus;
	private String sidewallIncompleteWeldingObser;
	private String sidewallIncompleteWeldingRectStatus;
	private String sidewallLeakageTestObser;
	private String sidewallLeakageTestRectStatus;
	private String roofInspectionVisualHolesObser;
	private String roofInspectionVisualHolesRectStatus;
	private String roofSuspectedHolesObser;
	private String roofSuspectedHolesRectStatus;
	private String roofIncompleteWeldingObser;
	private String roofIncompleteWeldingRectStatus;
	private String shellInspectionVisualHolesObser;
	private String shellInspectionVisualHolesRectStatus;
	private String shellIncompleteWeldingObser;
	private String shellIncompleteWeldingRectStatus;
	private String shellInspectionHolesTroughObser;
	private String shellInspectionHolesTroughRectStatus;
	private String shellInspectionHolesRoofObser;
	private String shellInspectionHolesRoofRectStatus;
	private String shellSuspectedHolesObser;
	private String shellSuspectedHolesRectStatus;
	private String shellSideRoofShellCombineTestingStatus;
	
	public String saveData()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		
		// update shell_tran table
		ShellTransaction shellTransaction= (ShellTransaction) session.get(ShellTransaction.class, shellAssetIdAsInt);
		shellTransaction.setAssemblySipFlag(1);
		//end of update shell_tran
		
		// insertion in ShellSideRoofShellCombineSipTran
		ShellSideRoofShellCombineSipTran shellSideRoofShellCombineSipTran=new ShellSideRoofShellCombineSipTran();
		shellSideRoofShellCombineSipTran.setShellAssetId(shellAssetIdAsInt);
		System.out.println("shellAssetIdAsInt"+shellAssetIdAsInt);
		
		shellSideRoofShellCombineSipTran.setDocNo(docNo);
		shellSideRoofShellCombineSipTran.setRevNo(revNo);
		if(!"".equals(docNoDate))
		{
			shellSideRoofShellCombineSipTran.setDocNoDate(DateUtil.convertToDate(docNoDate));
		}
		shellSideRoofShellCombineSipTran.setShiftOfTesting(shiftOfTesting);
		if(!"".equals(dateOfTesting))
		{
			shellSideRoofShellCombineSipTran.setDateOfTesting(DateUtil.convertToDate(dateOfTesting));
		}
		
		shellSideRoofShellCombineSipTran.setSidewallInspectionVisualHolesObser(sidewallInspectionVisualHolesObser);
		shellSideRoofShellCombineSipTran.setSidewallInspectionVisualHolesRectStatus(sidewallInspectionVisualHolesRectStatus);
		shellSideRoofShellCombineSipTran.setSidewallSuspectedHolesObser(sidewallSuspectedHolesObser);
		shellSideRoofShellCombineSipTran.setSidewallSuspectedHolesRectStatus(sidewallSuspectedHolesRectStatus);
		shellSideRoofShellCombineSipTran.setSidewallIncompleteWeldingObser(sidewallIncompleteWeldingObser);
		shellSideRoofShellCombineSipTran.setSidewallIncompleteWeldingRectStatus(sidewallIncompleteWeldingRectStatus);
		shellSideRoofShellCombineSipTran.setSidewallLeakageTestObser(sidewallLeakageTestObser);
		shellSideRoofShellCombineSipTran.setSidewallLeakageTestRectStatus(sidewallLeakageTestRectStatus);
		shellSideRoofShellCombineSipTran.setRoofInspectionVisualHolesObser(roofInspectionVisualHolesObser);
		shellSideRoofShellCombineSipTran.setRoofInspectionVisualHolesRectStatus(roofInspectionVisualHolesRectStatus);
		shellSideRoofShellCombineSipTran.setRoofSuspectedHolesObser(roofSuspectedHolesObser);
		shellSideRoofShellCombineSipTran.setRoofSuspectedHolesRectStatus(roofSuspectedHolesRectStatus);
		shellSideRoofShellCombineSipTran.setRoofIncompleteWeldingObser(roofIncompleteWeldingObser);
		shellSideRoofShellCombineSipTran.setRoofIncompleteWeldingRectStatus(roofIncompleteWeldingRectStatus);
		shellSideRoofShellCombineSipTran.setShellInspectionVisualHolesObser(shellInspectionVisualHolesObser);
		shellSideRoofShellCombineSipTran.setShellInspectionVisualHolesRectStatus(shellInspectionVisualHolesRectStatus);
		shellSideRoofShellCombineSipTran.setShellIncompleteWeldingObser(shellIncompleteWeldingObser);
		shellSideRoofShellCombineSipTran.setShellIncompleteWeldingRectStatus(shellIncompleteWeldingRectStatus);
		shellSideRoofShellCombineSipTran.setShellInspectionHolesTroughObser(shellInspectionHolesTroughObser);
		shellSideRoofShellCombineSipTran.setShellInspectionHolesTroughRectStatus(shellInspectionHolesTroughRectStatus);
		shellSideRoofShellCombineSipTran.setShellInspectionHolesRoofObser(shellInspectionHolesRoofObser);
		shellSideRoofShellCombineSipTran.setShellInspectionHolesRoofRectStatus(shellInspectionHolesRoofRectStatus);
		shellSideRoofShellCombineSipTran.setShellSuspectedHolesObser(shellSuspectedHolesObser);
		shellSideRoofShellCombineSipTran.setShellSuspectedHolesRectStatus(shellSuspectedHolesRectStatus);
		shellSideRoofShellCombineSipTran.setShellSideRoofShellCombineTestingStatus(shellSideRoofShellCombineTestingStatus);
	
		
		
		
		
		
		// end of code
		
			try
			{
				DaoShellAssemblySIP dao=new DaoShellAssemblySIP();
				dao.saveData(shellSideRoofShellCombineSipTran, shellTransaction);
				System.out.println("After");
				System.out.println();
				System.out.println(docNo);
				System.out.println(revNo);
				System.out.println(docNoDate);
				System.out.println(shiftOfTesting);
				System.out.println(dateOfTesting);
				System.out.println(sidewallInspectionVisualHolesObser);
				System.out.println(sidewallInspectionVisualHolesRectStatus);
				System.out.println(sidewallSuspectedHolesObser);
				System.out.println(sidewallSuspectedHolesRectStatus);
				System.out.println(sidewallIncompleteWeldingObser);
				System.out.println(sidewallIncompleteWeldingRectStatus);
				System.out.println(sidewallLeakageTestObser);
				System.out.println(sidewallLeakageTestRectStatus);
				System.out.println(roofInspectionVisualHolesObser);
				System.out.println(roofInspectionVisualHolesRectStatus);
				System.out.println(roofSuspectedHolesObser);
				System.out.println(roofSuspectedHolesRectStatus);
				System.out.println(roofIncompleteWeldingObser);
				System.out.println(roofIncompleteWeldingRectStatus);
				System.out.println(shellInspectionVisualHolesObser);
				System.out.println(shellInspectionVisualHolesRectStatus);
				System.out.println(shellIncompleteWeldingObser);
				System.out.println(shellIncompleteWeldingRectStatus);
				System.out.println(shellInspectionHolesTroughObser);
				System.out.println(shellInspectionHolesTroughRectStatus);
				System.out.println(shellInspectionHolesRoofObser);
				System.out.println(shellInspectionHolesRoofRectStatus);
				System.out.println(shellSuspectedHolesObser);
				System.out.println(shellSuspectedHolesRectStatus);
				System.out.println(shellSideRoofShellCombineTestingStatus);
				
				return "success";
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				return "error";
			}
		}

	public String getShellAssetId() {
		return shellAssetId;
	}

	public void setShellAssetId(String shellAssetId) {
		this.shellAssetId = shellAssetId;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public String getRevNo() {
		return revNo;
	}

	public void setRevNo(String revNo) {
		this.revNo = revNo;
	}

	public String getDocNoDate() {
		return docNoDate;
	}

	public void setDocNoDate(String docNoDate) {
		this.docNoDate = docNoDate;
	}

	public String getShiftOfTesting() {
		return shiftOfTesting;
	}

	public void setShiftOfTesting(String shiftOfTesting) {
		this.shiftOfTesting = shiftOfTesting;
	}

	public String getDateOfTesting() {
		return dateOfTesting;
	}

	public void setDateOfTesting(String dateOfTesting) {
		this.dateOfTesting = dateOfTesting;
	}

	public String getSidewallInspectionVisualHolesObser() {
		return sidewallInspectionVisualHolesObser;
	}

	public void setSidewallInspectionVisualHolesObser(String sidewallInspectionVisualHolesObser) {
		this.sidewallInspectionVisualHolesObser = sidewallInspectionVisualHolesObser;
	}

	public String getSidewallInspectionVisualHolesRectStatus() {
		return sidewallInspectionVisualHolesRectStatus;
	}

	public void setSidewallInspectionVisualHolesRectStatus(String sidewallInspectionVisualHolesRectStatus) {
		this.sidewallInspectionVisualHolesRectStatus = sidewallInspectionVisualHolesRectStatus;
	}

	
	public String getSidewallSuspectedHolesObser() {
		return sidewallSuspectedHolesObser;
	}

	public void setSidewallSuspectedHolesObser(String sidewallSuspectedHolesObser) {
		this.sidewallSuspectedHolesObser = sidewallSuspectedHolesObser;
	}

	public String getSidewallSuspectedHolesRectStatus() {
		return sidewallSuspectedHolesRectStatus;
	}

	public void setSidewallSuspectedHolesRectStatus(String sidewallSuspectedHolesRectStatus) {
		this.sidewallSuspectedHolesRectStatus = sidewallSuspectedHolesRectStatus;
	}

	public String getSidewallIncompleteWeldingObser() {
		return sidewallIncompleteWeldingObser;
	}

	public void setSidewallIncompleteWeldingObser(String sidewallIncompleteWeldingObser) {
		this.sidewallIncompleteWeldingObser = sidewallIncompleteWeldingObser;
	}

	public String getSidewallIncompleteWeldingRectStatus() {
		return sidewallIncompleteWeldingRectStatus;
	}

	public void setSidewallIncompleteWeldingRectStatus(String sidewallIncompleteWeldingRectStatus) {
		this.sidewallIncompleteWeldingRectStatus = sidewallIncompleteWeldingRectStatus;
	}

	public String getSidewallLeakageTestObser() {
		return sidewallLeakageTestObser;
	}

	public void setSidewallLeakageTestObser(String sidewallLeakageTestObser) {
		this.sidewallLeakageTestObser = sidewallLeakageTestObser;
	}

	public String getSidewallLeakageTestRectStatus() {
		return sidewallLeakageTestRectStatus;
	}

	public void setSidewallLeakageTestRectStatus(String sidewallLeakageTestRectStatus) {
		this.sidewallLeakageTestRectStatus = sidewallLeakageTestRectStatus;
	}

	public String getRoofInspectionVisualHolesObser() {
		return roofInspectionVisualHolesObser;
	}

	public void setRoofInspectionVisualHolesObser(String roofInspectionVisualHolesObser) {
		this.roofInspectionVisualHolesObser = roofInspectionVisualHolesObser;
	}

	public String getRoofInspectionVisualHolesRectStatus() {
		return roofInspectionVisualHolesRectStatus;
	}

	public void setRoofInspectionVisualHolesRectStatus(String roofInspectionVisualHolesRectStatus) {
		this.roofInspectionVisualHolesRectStatus = roofInspectionVisualHolesRectStatus;
	}

	public String getRoofSuspectedHolesObser() {
		return roofSuspectedHolesObser;
	}

	public void setRoofSuspectedHolesObser(String roofSuspectedHolesObser) {
		this.roofSuspectedHolesObser = roofSuspectedHolesObser;
	}

	public String getRoofSuspectedHolesRectStatus() {
		return roofSuspectedHolesRectStatus;
	}

	public void setRoofSuspectedHolesRectStatus(String roofSuspectedHolesRectStatus) {
		this.roofSuspectedHolesRectStatus = roofSuspectedHolesRectStatus;
	}

	public String getRoofIncompleteWeldingObser() {
		return roofIncompleteWeldingObser;
	}

	public void setRoofIncompleteWeldingObser(String roofIncompleteWeldingObser) {
		this.roofIncompleteWeldingObser = roofIncompleteWeldingObser;
	}

	public String getRoofIncompleteWeldingRectStatus() {
		return roofIncompleteWeldingRectStatus;
	}

	public void setRoofIncompleteWeldingRectStatus(String roofIncompleteWeldingRectStatus) {
		this.roofIncompleteWeldingRectStatus = roofIncompleteWeldingRectStatus;
	}

	public String getShellInspectionVisualHolesObser() {
		return shellInspectionVisualHolesObser;
	}

	public void setShellInspectionVisualHolesObser(String shellInspectionVisualHolesObser) {
		this.shellInspectionVisualHolesObser = shellInspectionVisualHolesObser;
	}

	public String getShellInspectionVisualHolesRectStatus() {
		return shellInspectionVisualHolesRectStatus;
	}

	public void setShellInspectionVisualHolesRectStatus(String shellInspectionVisualHolesRectStatus) {
		this.shellInspectionVisualHolesRectStatus = shellInspectionVisualHolesRectStatus;
	}

	public String getShellIncompleteWeldingObser() {
		return shellIncompleteWeldingObser;
	}

	public void setShellIncompleteWeldingObser(String shellIncompleteWeldingObser) {
		this.shellIncompleteWeldingObser = shellIncompleteWeldingObser;
	}

	public String getShellIncompleteWeldingRectStatus() {
		return shellIncompleteWeldingRectStatus;
	}

	public void setShellIncompleteWeldingRectStatus(String shellIncompleteWeldingRectStatus) {
		this.shellIncompleteWeldingRectStatus = shellIncompleteWeldingRectStatus;
	}

	public String getShellInspectionHolesTroughObser() {
		return shellInspectionHolesTroughObser;
	}

	public void setShellInspectionHolesTroughObser(String shellInspectionHolesTroughObser) {
		this.shellInspectionHolesTroughObser = shellInspectionHolesTroughObser;
	}

	public String getShellInspectionHolesTroughRectStatus() {
		return shellInspectionHolesTroughRectStatus;
	}

	public void setShellInspectionHolesTroughRectStatus(String shellInspectionHolesTroughRectStatus) {
		this.shellInspectionHolesTroughRectStatus = shellInspectionHolesTroughRectStatus;
	}

	public String getShellInspectionHolesRoofObser() {
		return shellInspectionHolesRoofObser;
	}

	public void setShellInspectionHolesRoofObser(String shellInspectionHolesRoofObser) {
		this.shellInspectionHolesRoofObser = shellInspectionHolesRoofObser;
	}

	public String getShellInspectionHolesRoofRectStatus() {
		return shellInspectionHolesRoofRectStatus;
	}

	public void setShellInspectionHolesRoofRectStatus(String shellInspectionHolesRoofRectStatus) {
		this.shellInspectionHolesRoofRectStatus = shellInspectionHolesRoofRectStatus;
	}

	public String getShellSuspectedHolesObser() {
		return shellSuspectedHolesObser;
	}

	public void setShellSuspectedHolesObser(String shellSuspectedHolesObser) {
		this.shellSuspectedHolesObser = shellSuspectedHolesObser;
	}

	public String getShellSuspectedHolesRectStatus() {
		return shellSuspectedHolesRectStatus;
	}

	public void setShellSuspectedHolesRectStatus(String shellSuspectedHolesRectStatus) {
		this.shellSuspectedHolesRectStatus = shellSuspectedHolesRectStatus;
	}

	public String getShellSideRoofShellCombineTestingStatus() {
		return shellSideRoofShellCombineTestingStatus;
	}

	public void setShellSideRoofShellCombineTestingStatus(String shellSideRoofShellCombineTestingStatus) {
		this.shellSideRoofShellCombineTestingStatus = shellSideRoofShellCombineTestingStatus;
	}

	

	

	

	
		
}