package ACTION;

import java.util.ArrayList;
import java.util.List;

import beans.MachineMaster;
import dao.DaoMachineMaster;


public class GetMachineByShop {
	List<MachineMaster>  machineList= new ArrayList<MachineMaster>();
	  String shop;
	  public String getMachine()
		{
			 try
			  {
				 DaoMachineMaster   machinDetailsDao= new DaoMachineMaster();
				 machineList=machinDetailsDao.getMachineByShop(shop);
			  }
			  catch(Exception e){
				  e.printStackTrace();
				  return null;
			  }
		  
		  return "success";
	}
	public List<MachineMaster> getMachineList() {
		return machineList;
	}
	public void setMachineList(List<MachineMaster> machineList) {
		this.machineList = machineList;
	}
	public String getShop() {
		return shop;
	}
	public void setShop(String shop) {
		this.shop = shop;
	}

}
