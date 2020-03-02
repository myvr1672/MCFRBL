package ACTION;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;


import hibernateConnect.HibernateConfig;




public class ShellStage {
	private String stageDesc;
	public List<Object[]> results;
	public List<String> results1;
	private List<String> substageDescList2;
	private List<String> substageDescList;
	private List<String> furnAssetIdList;
	private List<String> shellNoList;
	private List<String> furnNoList;
	private List<String> coachTypeList;
	@SuppressWarnings("unchecked")
	public String getshellStageDetails()
	{     System.out.print(stageDesc);
		Session session =  null;
	
		/*HttpSession session_http = ServletActionContext.getRequest().getSession(true);*/
		session = HibernateConfig.getSession();
		String hql="SELECT  A.furnishing_asset_id,  B.shell_no, C.furnishing_no, C.coach_type,J.substage_description from furnishing_tran A,shell_tran B,paint_tran C,furnishing_stage_master J,testing_mobile_clearance K where A.shell_asset_id  = B.shell_asset_id and B.shell_asset_id= C.shell_asset_id and C.coach_type=J.coach_type and J.substage_id=K.substage_id and A.furnishing_asset_id=K.furnishing_asset_id  and A.assembly_dispatch_date is null and (K.substage_description='"+stageDesc+"' and k.testing_status='ok') order by furnishing_asset_id";
			Query query = session.createSQLQuery(hql);
			 results = query.list();
			 substageDescList=new ArrayList<String>();
			 furnAssetIdList=new ArrayList<String>();
			 shellNoList=new ArrayList<String>();
			 furnNoList=new ArrayList<String>();
			 coachTypeList=new ArrayList<String>();
			 for(Object[] s:results)
				{
					String furnAssetId=s[0].toString();
					String ShellNo=s[1].toString();
					String furnNo=s[2].toString();
					String coachType=s[3].toString();
					String substageDesc=s[4].toString();
					//
					shellNoList.add(ShellNo);
					furnAssetIdList.add(furnAssetId);
					
					furnNoList.add(furnNo);
					coachTypeList.add(coachType);
					substageDescList.add(substageDesc);
					System.out.println(shellNoList);
			        
				}
			 Session session2 =  null;
				
				
				session2= HibernateConfig.getSession();
				String hql1="SELECT  distinct substage_description from furnishing_stage_master order by substage_description ASC ";
					Query query1 = session2.createSQLQuery(hql1);
					 results1 = query1.list();
					 substageDescList2=new ArrayList<String>();
					 for(int s1=0;s1<results1.size();s1++)
					 {
						 String description1=results1.get(s1);
						 substageDescList2.add(description1);
					 }
			
			 return "success";
				
		}
	public String getStageDesc() {
		return stageDesc;
	}
	public void setStageDesc(String stageDesc) {
		this.stageDesc = stageDesc;
	}
	public List<Object[]> getResults() {
		return results;
	}
	public void setResults(List<Object[]> results) {
		this.results = results;
	}
	public List<String> getSubstageDescList() {
		return substageDescList;
	}
	public void setSubstageDescList(List<String> substageDescList) {
		this.substageDescList = substageDescList;
	}
	public List<String> getFurnAssetIdList() {
		return furnAssetIdList;
	}
	public void setFurnAssetIdList(List<String> furnAssetIdList) {
		this.furnAssetIdList = furnAssetIdList;
	}
	
	
	public List<String> getShellNoList() {
		return shellNoList;
	}
	public void setShellNoList(List<String> shellNoList) {
		this.shellNoList = shellNoList;
	}
	public List<String> getFurnNoList() {
		return furnNoList;
	}
	public void setFurnNoList(List<String> furnNoList) {
		this.furnNoList = furnNoList;
	}
	public List<String> getCoachTypeList() {
		return coachTypeList;
	}
	public void setCoachTypeList(List<String> coachTypeList) {
		this.coachTypeList = coachTypeList;
	}
	public List<String> getResults1() {
		return results1;
	}
	public void setResults1(List<String> results1) {
		this.results1 = results1;
	}
	public List<String> getSubstageDescList2() {
		return substageDescList2;
	}
	public void setSubstageDescList2(List<String> substageDescList2) {
		this.substageDescList2 = substageDescList2;
	}
}
