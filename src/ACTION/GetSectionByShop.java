package ACTION;
import beans.EmployeeSection;
import dao.EmployeeSectionDao;
import java.util.ArrayList;
import java.util.List;
public class GetSectionByShop {
     List<EmployeeSection>  sectionList= new ArrayList<EmployeeSection>();
	  String shop;
	  public String getSection(){
		  {
			  try
			  {
				EmployeeSectionDao   employeeSectionDao= new EmployeeSectionDao();
				sectionList=employeeSectionDao.getSectionByShop(shop);
			  }
			  catch(Exception e){
				  e.printStackTrace();
				  return null;
			  }
		  }
		  return "success";
	  }
	public List<EmployeeSection> getSectionList() {
		return sectionList;
	}
	public void setSectionList(List<EmployeeSection> sectionList) {
		this.sectionList = sectionList;
	}
	public String getShop() {
		return shop;
	}
	public void setShop(String shop) {
		this.shop = shop;
	}
	
	  
	  
}
