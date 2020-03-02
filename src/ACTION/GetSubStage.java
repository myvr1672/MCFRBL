package ACTION;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dao.DbConnection;


public class GetSubStage {

	private String parentStage;
	private ArrayList<String> subStageIdList;
	private ArrayList<String> subStageDescriptionList;
	public String getStages() throws SQLException
		  {
			  DbConnection db=new DbConnection();
			  Connection con=db.getConnection(); 
			  ResultSet result;
			  try
			  {
			  	Statement st=con.createStatement();
			     
				//  String queryString="select substage_id, substage_description from public.substage_master where parent_stage_id in ('"+parentStage+"') and substage_validity=1 and gateout_validity=0";
			  	String queryString="SELECT DISTINCT substage_id, substage_description from public.furnishing_stage_master"; 
			  	System.out.println("Query for retrieving substage " +queryString);
				  result=st.executeQuery(queryString);
				  System.out.println("Query excecuted");
				  subStageIdList=new ArrayList<String>() ;
				  subStageDescriptionList=new ArrayList<String>() ;
				while(result.next())
				 {
					  
					   System.out.println("inside while loop");
					   String substage=result.getString(1);
					 System.out.println(substage);
					      subStageIdList.add(result.getString(1));
					      subStageDescriptionList.add(result.getString(2));
						 
					  
				   }
				return "success";
			       }
				
			  
			 
			  catch(Exception e)
			  	{
				  e.printStackTrace();
				  return null;
			  }
			  finally
			  {
				  con.close();
			  }
			  			
		  }
		  
	  
	
	public String getParentStage() {
		return parentStage;
	}

	public void setParentStage(String parentStage) {
		this.parentStage = parentStage;
	}



	public ArrayList<String> getSubStageIdList() {
		return subStageIdList;
	}



	public void setSubStageIdList(ArrayList<String> subStageIdList) {
		this.subStageIdList = subStageIdList;
	}



	public ArrayList<String> getSubStageDescriptionList() {
		return subStageDescriptionList;
	}



	public void setSubStageDescriptionList(ArrayList<String> subStageDescriptionList) {
		this.subStageDescriptionList = subStageDescriptionList;
	}



			
}
