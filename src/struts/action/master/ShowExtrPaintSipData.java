package struts.action.master;
import beans.ExtrPaintFinalSipTran;
import beans.PaintTransaction;
import hibernateConnect.HibernateConfig;

import org.hibernate.Session;
public class ShowExtrPaintSipData {
	ExtrPaintFinalSipTran extrPaintFinalSipTran;
	PaintTransaction paintTransaction;
	String paintAssetId;
	public String showData()
	{
		Session session=null;
		session=HibernateConfig.getSession();
		Integer paintAssetIdAsInt=Integer.parseInt(paintAssetId);
		extrPaintFinalSipTran=(ExtrPaintFinalSipTran) session.get(ExtrPaintFinalSipTran.class, paintAssetIdAsInt);
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
	public ExtrPaintFinalSipTran getExtrPaintFinalSipTran() {
		return extrPaintFinalSipTran;
	}
	public void setExtrPaintFinalSipTran(ExtrPaintFinalSipTran extrPaintFinalSipTran) {
		this.extrPaintFinalSipTran = extrPaintFinalSipTran;
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
