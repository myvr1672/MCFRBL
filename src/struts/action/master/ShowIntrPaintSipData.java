package struts.action.master;
import beans.IntrPaintFinalSipTran;
import beans.PaintTransaction;
import hibernateConnect.HibernateConfig;

import org.hibernate.Session;
public class ShowIntrPaintSipData {
	IntrPaintFinalSipTran intrPaintFinalSipTran;
	PaintTransaction paintTransaction;
	String paintAssetId;
	public String showData()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer paintAssetIdAsInt=Integer.parseInt(paintAssetId);
		intrPaintFinalSipTran=(IntrPaintFinalSipTran) session.get(IntrPaintFinalSipTran.class, paintAssetIdAsInt);
		paintTransaction= (PaintTransaction) session.get(PaintTransaction.class, paintAssetIdAsInt);
		try
		{
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
	public IntrPaintFinalSipTran getIntrPaintFinalSipTran() {
		return intrPaintFinalSipTran;
	}
	public void setIntrPaintFinalSipTran(IntrPaintFinalSipTran intrPaintFinalSipTran) {
		this.intrPaintFinalSipTran = intrPaintFinalSipTran;
	}
	public PaintTransaction getPaintTransaction() {
		return paintTransaction;
	}
	public void setPaintTransaction(PaintTransaction paintTransaction) {
		this.paintTransaction = paintTransaction;
	}
	public String getPaintAssetId() {
		return paintAssetId;
	}
	public void setPaintAssetId(String paintAssetId) {
		this.paintAssetId = paintAssetId;
	}
	
}
