package ACTION;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.google.gson.Gson;

import hibernateConnect.HibernateConfig;

public class ShowListStages {
	
	private String coachType;
	
	private String stageSequence;
	public List<Object[]> stages;
	

	private List<String> stageIdList;
	private List<String> stageDescList;
	

	@SuppressWarnings("unchecked")
	public String showStages()
	{
		
		Session session=null;
		session=HibernateConfig.getSession();
		
		 
		
		//System.out.print(coachType+"getstages "+stageSequence);
		 String coach=coachType.replaceAll("\\s+","");
		Integer stageSequenceAsInt=Integer.parseInt(stageSequence);
		//System.out.println("before hql");
		String hql="select substage_id,substage_description  from furnishing_stage_master where coach_type = '" + coach + "' and stage_sequence <= '"+stageSequenceAsInt +"' order by stage_sequence asc";
		//System.out.println("after hql");
		Query query = session.createSQLQuery(hql);
		stages = query.list();
		//System.out.println("list ofages");
		 stageIdList= new ArrayList<String>();
		 stageDescList= new ArrayList<String>();
		 for(Object[] s : stages)
		 {   
			 String substageId=s[0].toString();
			 stageIdList.add(substageId);
			 String substageDescription=s[1].toString();
			 stageDescList.add(substageDescription);
			 if(substageDescription.equalsIgnoreCase("FLOORING")){
				 System.out.println("seeulater");
			 }
			 System.out.println("substageId"+substageId+"substageDescription"+substageDescription);
		 }
		 
		//System.out.println("s");
		return "success";
		 
	  
	}

	public String getCoachType() {
		return coachType;
	}

	public void setCoachType(String coachType) {
		this.coachType = coachType;
	}

	public String getStageSequence() {
		return stageSequence;
	}

	public void setStageSequence(String stageSequence) {
		this.stageSequence = stageSequence;
	}

	
	public List<Object[]> getStages() {
		return stages;
	}

	public void setStages(List<Object[]> stages) {
		this.stages = stages;
	}

	public List<String> getStageIdList() {
		return stageIdList;
	}

	public void setStageIdList(List<String> stageIdList) {
		this.stageIdList = stageIdList;
	}

	public List<String> getStageDescList() {
		return stageDescList;
	}

	public void setStageDescList(List<String> stageDescList) {
		this.stageDescList = stageDescList;
	}
	

	

}
