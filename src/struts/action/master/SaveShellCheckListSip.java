package struts.action.master;


import org.hibernate.Session;
import dao.DaoShellCheckListSip;

import beans.ShellCheckListSip;
import beans.ShellTransaction;

import hibernateConnect.HibernateConfig;

public class SaveShellCheckListSip {

	private String shellAssetId;
	private String waterTankBracket;
	private String crossBrace;
	private String sidewallAssembly;
	private String stiffingPlate;
	private String loroPipeBracket;
	private String footStepBracket;
	private String liftingPad;
	private String curveRollBracket;
	private String waterTankLiner;
	private String sideLavMountingBracket;
	private String sideHoseCouplingBracket;
	private String groundingFlapBracket;
	private String powerPanelBracket;
	

	public String saveData()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer shellAssetIdAsInt=Integer.parseInt(shellAssetId);
		
		// update shell_tran table
		ShellTransaction shellTransaction= (ShellTransaction) session.get(ShellTransaction.class, shellAssetIdAsInt);
		shellTransaction.setCheckListFlag(1);
		//end of update shell_tran
		
		// insertion in ShellSideRoofShellCombineSipTran
		ShellCheckListSip shellCheckListSip=new ShellCheckListSip();
		shellCheckListSip.setShellAssetId(shellAssetIdAsInt);
		System.out.println("shellAssetIdAsInt"+shellAssetIdAsInt);
		
		shellCheckListSip.setWaterTankBracket(waterTankBracket);
		shellCheckListSip.setCrossBrace(crossBrace);
		shellCheckListSip.setSidewallAssembly(sidewallAssembly);
		shellCheckListSip.setStiffingPlate(stiffingPlate);
		shellCheckListSip.setLoroPipeBracket(loroPipeBracket);
		shellCheckListSip.setFootStepBracket(footStepBracket);
		shellCheckListSip.setLiftingPad(liftingPad);
		shellCheckListSip.setCurveRollBracket(curveRollBracket);
		shellCheckListSip.setWaterTankLiner(waterTankLiner);
		shellCheckListSip.setSideLavMountingBracket(sideLavMountingBracket);
		shellCheckListSip.setSideHoseCouplingBracket(sideHoseCouplingBracket);
		shellCheckListSip.setGroundingFlapBracket(groundingFlapBracket);
		shellCheckListSip.setPowerPanelBracket(powerPanelBracket);
	
			try
			{
				DaoShellCheckListSip dao=new DaoShellCheckListSip();
				dao.saveData(shellCheckListSip, shellTransaction);
				System.out.println("After");
				System.out.println(shellAssetIdAsInt);
				System.out.println(waterTankBracket);
				System.out.println(crossBrace);
				System.out.println(sidewallAssembly);
				return "success";
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				return "error";
			}
			finally
			{
				if(session!=null)
				{
					session.close();
				}
			}
		}

	public String getShellAssetId() {
		return shellAssetId;
	}

	public void setShellAssetId(String shellAssetId) {
		this.shellAssetId = shellAssetId;
	}

	public String getWaterTankBracket() {
		return waterTankBracket;
	}

	public void setWaterTankBracket(String waterTankBracket) {
		this.waterTankBracket = waterTankBracket;
	}

	public String getCrossBrace() {
		return crossBrace;
	}

	public void setCrossBrace(String crossBrace) {
		this.crossBrace = crossBrace;
	}

	public String getSidewallAssembly() {
		return sidewallAssembly;
	}

	public void setSidewallAssembly(String sidewallAssembly) {
		this.sidewallAssembly = sidewallAssembly;
	}

	public String getStiffingPlate() {
		return stiffingPlate;
	}

	public void setStiffingPlate(String stiffingPlate) {
		this.stiffingPlate = stiffingPlate;
	}

	public String getLoroPipeBracket() {
		return loroPipeBracket;
	}

	public void setLoroPipeBracket(String loroPipeBracket) {
		this.loroPipeBracket = loroPipeBracket;
	}

	public String getFootStepBracket() {
		return footStepBracket;
	}

	public void setFootStepBracket(String footStepBracket) {
		this.footStepBracket = footStepBracket;
	}

	public String getLiftingPad() {
		return liftingPad;
	}

	public void setLiftingPad(String liftingPad) {
		this.liftingPad = liftingPad;
	}

	public String getCurveRollBracket() {
		return curveRollBracket;
	}

	public void setCurveRollBracket(String curveRollBracket) {
		this.curveRollBracket = curveRollBracket;
	}

	public String getWaterTankLiner() {
		return waterTankLiner;
	}

	public void setWaterTankLiner(String waterTankLiner) {
		this.waterTankLiner = waterTankLiner;
	}

	public String getSideLavMountingBracket() {
		return sideLavMountingBracket;
	}

	public void setSideLavMountingBracket(String sideLavMountingBracket) {
		this.sideLavMountingBracket = sideLavMountingBracket;
	}

	public String getSideHoseCouplingBracket() {
		return sideHoseCouplingBracket;
	}

	public void setSideHoseCouplingBracket(String sideHoseCouplingBracket) {
		this.sideHoseCouplingBracket = sideHoseCouplingBracket;
	}

	public String getGroundingFlapBracket() {
		return groundingFlapBracket;
	}

	public void setGroundingFlapBracket(String groundingFlapBracket) {
		this.groundingFlapBracket = groundingFlapBracket;
	}

	public String getPowerPanelBracket() {
		return powerPanelBracket;
	}

	public void setPowerPanelBracket(String powerPanelBracket) {
		this.powerPanelBracket = powerPanelBracket;
	}

	
}