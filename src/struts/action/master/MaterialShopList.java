package struts.action.master;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import org.hibernate.Query;
import org.hibernate.Session;

import org.hibernate.transform.Transformers;


import beans.MaterialShopListCustom;
import beans.Shop;
import hibernateConnect.HibernateConfig;

import model.User;

public class MaterialShopList {
	private List<Shop> shopList;
	
	private Map<String,String> materialList;
	
	@SuppressWarnings("unchecked")
	public String getShopAndMaterial()
	{
		
	List<MaterialShopListCustom> listMaterial=null;
		Session session=null;
		String username= null;
		String roles= null;
		HttpSession session_http = ServletActionContext.getRequest().getSession(true);
		username = (String) session_http.getAttribute("userid");
		
		if (username != null)
		{
	session = HibernateConfig.getSession();
	
	User loginUser = (User)session.get(User.class,username.trim());
	    
		 roles= loginUser.getRoles();
		}

	roles = roles.replaceAll(", ","','");
	
		
		try {

			
			session.beginTransaction();
			
			Query query=null, queryMaterialList=null;
			 if(roles.equals("All")){
query = session.createSQLQuery("select substages from public.substage_master where parent_stage_id='0'  and substage_validity=1 order by substage_sequence");

queryMaterialList=session.createSQLQuery("select DISTINCT A.unified_pl \"unifiedPL\", A.material_desc \"materialDesc\", B.used_by_shop \"usedByShop\" from material_master A, material_allocation B where A.unified_pl = B.unified_pl_no");		
			 }
			 else
			 {
query = session.createSQLQuery("select substages from public.substage_master where substages in ('"+roles+"') and parent_stage_id='0'  and substage_validity=1 order by substage_sequence");
			
queryMaterialList=session.createSQLQuery("select DISTINCT A.unified_pl  \"unifiedPL\", A.material_desc \"materialDesc\", B.used_by_shop \"usedByShop\" from material_master A, material_allocation B where A.unified_pl = B.unified_pl_no");			 
			 }
					List<String> result = query.list();
		
					
					shopList=new ArrayList<Shop>();
			for(String i:result)
			{
				Shop s=new Shop();
				s.setShopId(i);
				s.setShopName(i+" Shop");
				shopList.add(s);
			}
			
			listMaterial =queryMaterialList.setResultTransformer(Transformers.aliasToBean(MaterialShopListCustom.class)).list();	
			
		
			//abnormalityList=new ArrayList<String>();
			materialList= new LinkedHashMap<String,String>();
			for(MaterialShopListCustom a:listMaterial)
			{
				//abnormalityList.add(a.getAbnormalityDescription());
				materialList.put(a.getUnifiedPL(), a.getMaterialDesc());
			}
			
			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		finally
		{
			session.close();
			
		}
	}

	public List<Shop> getShopList() {
		return shopList;
	}

	public void setShopList(List<Shop> shopList) {
		this.shopList = shopList;
	}

	public Map<String, String> getMaterialList() {
		return materialList;
	}

	public void setMaterialList(Map<String, String> materialList) {
		this.materialList = materialList;
	}

	
	
}
