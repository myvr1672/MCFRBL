
package struts.action.master;

import dao.DaoBogieStaticSip;



import java.sql.Timestamp;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
//import beans.ShellUnderframeSipTrans;
import beans.BogiesetTransaction;
import beans.BogieStaticSipTran;
import common.DateUtil;
import hibernateConnect.HibernateConfig;

public class SavesStaticBogieSIP {
	
	private String bogieAssetId;
	private String dateOfTesting;
	private String fiatbogieSipShift;
	
	private String fiatbogiedrawingNo;
	private String fiatbogiewino;
	private String brakecylinderno1;
	private String brakecylinderno2;
	private String brakecylinderno3;
	private String brakecylinderno4;
	
    private String tarezoneone;
	private String tarezthreeone;
	private String tarezfourone;
	private String tareztwoone;
	private String tarex;
	private String tareavgheighton;
	private String tareavgheighttwo;
	private String grosszoneone;
	private String grosszthreeone;
	private String grosszfourone;
	private String grossztwoone;
	private String grossx;
	private String grossavgheightone;
	private String grossavgheighttwo;
	private String tarelongxonefour;
	private String tarelongxtwofour;
	private String tarelatyonethree;
	private String tarelatythreethree;
	private String tareaside;
	private String tarebside;
	private String grosslongxonefour;
	private String grosslongxtwofour;
	private String grosslatyonethree;
	private String grosslatythreethree;
	private String grossaside;
	private String grossbside;
	private String checkingStatus;
	private String fiatbogieDocNo;
	private String fiatbogieType;
	private String fiatbogieNumber;
	private String frameMake;
	private String frameno;
	
	private String vsaprimemake;
	private String vsaprimeno;
	private String vsasecmake;
	private String vsasecno;
	private String lateralshockmake;
	private String lateralshockno;
	private String bolstermake;
	private String bolsterno;
	private String airspringmakeno1;
	private String airspringmakeno2;
	
	
	

	public String savebogiedata()
	{
		System.out.println("hii");
		Session session=null;
		session=HibernateConfig.getSession();
		HttpSession httpSession=ServletActionContext.getRequest().getSession();
		System.out.println("2");
	String userID=(String)httpSession.getAttribute("userid");
	Timestamp entryTime=new Timestamp(System.currentTimeMillis());
	BogieStaticSipTran bogieStaticSipTran=new BogieStaticSipTran();
	Integer bogieAssetIdAsInt=Integer.parseInt(bogieAssetId);
	
	bogieStaticSipTran.setBogieAssetId(bogieAssetIdAsInt);
	
    bogieStaticSipTran.setShiftOfTesting(fiatbogieSipShift);
    bogieStaticSipTran.setDocNo(fiatbogieDocNo);
	bogieStaticSipTran.setWiNo(fiatbogiewino);
	bogieStaticSipTran.setDrawingNo(fiatbogiedrawingNo);
	
		BogiesetTransaction bogiesetTransaction=(BogiesetTransaction) session.get(BogiesetTransaction.class,bogieAssetIdAsInt);
		
		
		bogiesetTransaction.setStaticSipBogieFlag(1);
		bogiesetTransaction.setBogieNumber(fiatbogieNumber);
		bogiesetTransaction.setBogieType(fiatbogieType);
		bogiesetTransaction.setSecAirSpringNo1(airspringmakeno1);
		bogiesetTransaction.setSecAirSpringNo2(airspringmakeno2);
		bogiesetTransaction.setBolsNo(bolsterno);
		bogiesetTransaction.setBolsterMake(bolstermake);
		bogiesetTransaction.setBrakeCylinderNo1(brakecylinderno1);
		bogiesetTransaction.setBrakeCylinderNo2(brakecylinderno2);
		bogiesetTransaction.setBrakeCylinderNo3(brakecylinderno3);
		bogiesetTransaction.setBrakeCylinderNo4(brakecylinderno4);
		bogiesetTransaction.setVsaAtPrimarySuspMake(vsaprimemake);
		bogiesetTransaction.setVsaAtPrimarySuspNo(vsaprimeno);
		bogiesetTransaction.setVsaAtSecondarySuspMake(vsasecmake);
		bogiesetTransaction.setVsaAtSecondarySuspNo(vsasecno);
		bogiesetTransaction.setLateralShockAbsorberMake(lateralshockmake);
		bogiesetTransaction.setLateralShockAbsorberNo(lateralshockno);
		bogiesetTransaction.setFrameMake(frameMake);
		bogiesetTransaction.setFrameNo(frameno);
		bogieStaticSipTran.setEntryTime(entryTime);
		bogieStaticSipTran.setEntryBy(userID);
		if(!"".equals(dateOfTesting))
		{
			bogieStaticSipTran.setDateOfTesting(DateUtil.convertToDate(dateOfTesting));
		}
		
		bogieStaticSipTran.setBogieStaticSipStatus(checkingStatus);
		  System.out.println("1");
		
				if(!"".equals(tarezoneone))
			{
				Integer TarezoneoneAsInt=Integer.parseInt(tarezoneone);
				bogieStaticSipTran.setLoadTareZ11(TarezoneoneAsInt);
				
			}
				
				System.out.println("3");
			if(!"".equals(tarezthreeone))
			{
				Integer TarezthreeoneAsInt=Integer.parseInt(tarezthreeone);
				bogieStaticSipTran.setLoadTareZ31(TarezthreeoneAsInt);
				
			}
			System.out.println("31");
		
			if(!"".equals(tarezfourone))
			{
				Integer TarezfouroneAsInt=Integer.parseInt(tarezfourone);
				bogieStaticSipTran.setLoadTareZ41(TarezfouroneAsInt);
				
			}
			System.out.println("32");
			if(!"".equals(tareztwoone))
			{
				Integer TareztwooneeAsInt=Integer.parseInt(tareztwoone);
				bogieStaticSipTran.setLoadTareZ21(TareztwooneeAsInt);
				
			}
			System.out.println("33");
			if(!"".equals(tarex))
			{
				Integer TarexAsInt=Integer.parseInt(tarex);
				bogieStaticSipTran.setLoadTareX( TarexAsInt);
				
			}
			System.out.println("34");
			if(!"".equals(tareavgheighton))
			{
				Float TareavgheightonAsInt=Float.parseFloat(tareavgheighton);
				bogieStaticSipTran.setLoadTareZ12Z22(TareavgheightonAsInt);
				
			}
			System.out.println("35");
			if(!"".equals(tareavgheighttwo))
			{
				Float TareavgheighttwonAsInt=Float.parseFloat(tareavgheighton);
				bogieStaticSipTran.setLoadTareZ32Z42(TareavgheighttwonAsInt);
				
			}
			System.out.println("36");
			if(!"".equals(grosszoneone))
			{
				Integer GrosszoneoneAsInt=Integer.parseInt(grosszoneone);
				bogieStaticSipTran.setLoadGrossZ11(GrosszoneoneAsInt);
				
			}
			System.out.println("37");
			if(!"".equals(grosszthreeone))
			{
				Integer GrosszthreeoneAsInt=Integer.parseInt(grosszthreeone);
				bogieStaticSipTran.setLoadGrossZ31(GrosszthreeoneAsInt);
				
			}
			if(!"".equals(grossavgheightone))
			{
				Float GrossavgheightoneAsInt=Float.parseFloat(grossavgheightone);
				bogieStaticSipTran.setLoadGrossZ12Z22(GrossavgheightoneAsInt);
				
			}
			if(!"".equals(grossavgheighttwo))
			{
				Float GrossavgheighttwoAsInt=Float.parseFloat(grossavgheighttwo);
				bogieStaticSipTran.setLoadGrossZ32Z42(GrossavgheighttwoAsInt);
			}

			if(!"".equals(tarelongxonefour))
			{
				Integer TarelongxonefourAsInt=Integer.parseInt(tarelongxonefour);
				bogieStaticSipTran.setLoadTareX14( TarelongxonefourAsInt);
				
			}
			if(!"".equals(tarelongxtwofour))
			{
				Integer TarelongxtwofourAsInt=Integer.parseInt(tarelongxtwofour);
				bogieStaticSipTran.setLoadTareX24(TarelongxtwofourAsInt);
				
			}
			if(!"".equals(tarelatyonethree))
			{
				Integer TarelatyonethreeAsInt=Integer.parseInt(tarelatyonethree);
				bogieStaticSipTran.setLoadTareY13(TarelatyonethreeAsInt);
				
			}
			if(!"".equals(tarelatythreethree))
			{
				Integer TarelatythreethreeAsInt=Integer.parseInt(tarelatythreethree);
				bogieStaticSipTran.setLoadTareY33(TarelatythreethreeAsInt);
				
			}
			
			if(!"".equals(tareaside))
			{
				Integer TareasideAsInt=Integer.parseInt(tareaside);
				bogieStaticSipTran.setLoadTareASide(TareasideAsInt);
				
			}
			if(!"".equals(tarebside))
			{
				Integer TarebsideAsInt=Integer.parseInt(tarebside);
				bogieStaticSipTran.setLoadTareBSide(TarebsideAsInt);
				
			}
			if(!"".equals(grosszfourone))
			{
				Integer GrosszfouroneAsInt=Integer.parseInt(grosszfourone);
				bogieStaticSipTran.setLoadGrossZ41(GrosszfouroneAsInt);
				
			}
			if(!"".equals(grosslongxonefour))
			{
				Integer GrosslongxonefourAsInt=Integer.parseInt(grosslongxonefour);
				bogieStaticSipTran.setLoadGrossX14(GrosslongxonefourAsInt);
				
			}
			if(!"".equals(grosslongxtwofour))
			{
				Integer GrosslongxtwofourAsInt=Integer.parseInt(grosslongxtwofour);
				bogieStaticSipTran.setLoadGrossX24(GrosslongxtwofourAsInt);
				
			}

			if(!"".equals(grosslatyonethree))
			{
				Integer grosslatyonethreeAsInt=Integer.parseInt(grosslatyonethree);
				bogieStaticSipTran.setLoadGrossY13(grosslatyonethreeAsInt);
				
			}
			if(!"".equals(grosslatythreethree))
			{
				Integer GrosslatythreethreeAsInt=Integer.parseInt(grosslatythreethree);
				bogieStaticSipTran.setLoadGrossY33(GrosslatythreethreeAsInt);
				
			}
						System.out.println("38");
			
	if(!"".equals(grossx))
			{
				Integer GrossxAsInt=Integer.parseInt(grossx);
				bogieStaticSipTran.setLoadGrossX(GrossxAsInt);
				
			}
	
			System.out.println("39");
		
			if(!"".equals(grossztwoone))
			{
				Integer grossztwooneAsInt=Integer.parseInt(grossztwoone);
				bogieStaticSipTran.setLoadGrossZ21(grossztwooneAsInt);
				
			}
			
			
			
		
		
		System.out.println("last!!");
		
		
		
		System.out.println("last1");
		try
		{	
			System.out.println(bogieAssetIdAsInt);
			DaoBogieStaticSip dao= new 	DaoBogieStaticSip();
			dao.saveBogieStaticSip(bogieStaticSipTran,bogiesetTransaction);
			//System.out.println(shellAssetIdAsInt);
			return "success";
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "error";
		}
		finally
		{
			if(session!=null)
				session.close();
		}
		
	}
	
		public String getFiatbogieDocNo() {
		return fiatbogieDocNo;
	}

	public void setFiatbogieDocNo(String fiatbogieDocNo) {
		this.fiatbogieDocNo = fiatbogieDocNo;
	}

	public String getFiatbogieType() {
		return fiatbogieType;
	}

	public void setFiatbogieType(String fiatbogieType) {
		this.fiatbogieType = fiatbogieType;
	}

	public String getFiatbogieNumber() {
		return fiatbogieNumber;
	}

	public void setFiatbogieNumber(String fiatbogieNumber) {
		this.fiatbogieNumber = fiatbogieNumber;
	}

	public String getFrameMake() {
		return frameMake;
	}

	public void setFrameMake(String frameMake) {
		this.frameMake = frameMake;
	}

	public String getFrameno() {
		return frameno;
	}

	public void setFrameno(String frameno) {
		this.frameno = frameno;
	}

	

		public String getBrakecylinderno1() {
		return brakecylinderno1;
	}

	public void setBrakecylinderno1(String brakecylinderno1) {
		this.brakecylinderno1 = brakecylinderno1;
	}

	public String getBrakecylinderno2() {
		return brakecylinderno2;
	}

	public void setBrakecylinderno2(String brakecylinderno2) {
		this.brakecylinderno2 = brakecylinderno2;
	}

	public String getBrakecylinderno3() {
		return brakecylinderno3;
	}

	public void setBrakecylinderno3(String brakecylinderno3) {
		this.brakecylinderno3 = brakecylinderno3;
	}

	public String getBrakecylinderno4() {
		return brakecylinderno4;
	}

	public void setBrakecylinderno4(String brakecylinderno4) {
		this.brakecylinderno4 = brakecylinderno4;
	}

		public String getVsaprimemake() {
		return vsaprimemake;
	}

	public void setVsaprimemake(String vsaprimemake) {
		this.vsaprimemake = vsaprimemake;
	}

	public String getVsaprimeno() {
		return vsaprimeno;
	}

	public void setVsaprimeno(String vsaprimeno) {
		this.vsaprimeno = vsaprimeno;
	}

	public String getVsasecmake() {
		return vsasecmake;
	}

	public void setVsasecmake(String vsasecmake) {
		this.vsasecmake = vsasecmake;
	}

	public String getVsasecno() {
		return vsasecno;
	}

	public void setVsasecno(String vsasecno) {
		this.vsasecno = vsasecno;
	}

	public String getLateralshockmake() {
		return lateralshockmake;
	}

	public void setLateralshockmake(String lateralshockmake) {
		this.lateralshockmake = lateralshockmake;
	}

	public String getLateralshockno() {
		return lateralshockno;
	}

	public void setLateralshockno(String lateralshockno) {
		this.lateralshockno = lateralshockno;
	}

	public String getBolstermake() {
		return bolstermake;
	}

	public void setBolstermake(String bolstermake) {
		this.bolstermake = bolstermake;
	}

	public String getBolsterno() {
		return bolsterno;
	}

	public void setBolsterno(String bolsterno) {
		this.bolsterno = bolsterno;
	}

	public String getAirspringmakeno1() {
		return airspringmakeno1;
	}

	public void setAirspringmakeno1(String airspringmakeno1) {
		this.airspringmakeno1 = airspringmakeno1;
	}

	public String getAirspringmakeno2() {
		return airspringmakeno2;
	}

	public void setAirspringmakeno2(String airspringmakeno2) {
		this.airspringmakeno2 = airspringmakeno2;
	}

		public String getBogieAssetId() {
			return bogieAssetId;
		}
		public void setBogieAssetId(String bogieAssetId) {
			this.bogieAssetId = bogieAssetId;
		}
		public String getDateOfTesting() {
			return dateOfTesting;
		}
		public void setDateOfTesting(String dateOfTesting) {
			this.dateOfTesting = dateOfTesting;
		}
				public String getFiatbogieSipShift() {
			return fiatbogieSipShift;
		}
		public void setFiatbogieSipShift(String fiatbogieSipShift) {
			this.fiatbogieSipShift = fiatbogieSipShift;
		}
		
		public String getFiatbogiedrawingNo() {
			return fiatbogiedrawingNo;
		}
		public void setFiatbogiedrawingNo(String fiatbogiedrawingNo) {
			this.fiatbogiedrawingNo = fiatbogiedrawingNo;
		}
		public String getFiatbogiewino() {
			return fiatbogiewino;
		}
		public void setFiatbogiewino(String fiatbogiewino) {
			this.fiatbogiewino = fiatbogiewino;
		}
		
			
		public String getTarezoneone() {
			return tarezoneone;
		}
		public void setTarezoneone(String tarezoneone) {
			this.tarezoneone = tarezoneone;
		}
		public String getTarezthreeone() {
			return tarezthreeone;
		}
		public void setTarezthreeone(String tarezthreeone) {
			this.tarezthreeone = tarezthreeone;
		}
		public String getTarezfourone() {
			return tarezfourone;
		}
		public void setTarezfourone(String tarezfourone) {
			this.tarezfourone = tarezfourone;
		}
		public String getTareztwoone() {
			return tareztwoone;
		}
		public void setTareztwoone(String tareztwoone) {
			this.tareztwoone = tareztwoone;
		}
		public String getTarex() {
			return tarex;
		}
		public void setTarex(String tarex) {
			this.tarex = tarex;
		}
		public String getTareavgheighton() {
			return tareavgheighton;
		}
		public void setTareavgheighton(String tareavgheighton) {
			this.tareavgheighton = tareavgheighton;
		}
		public String getTareavgheighttwo() {
			return tareavgheighttwo;
		}
		public void setTareavgheighttwo(String tareavgheighttwo) {
			this.tareavgheighttwo = tareavgheighttwo;
		}
		public String getGrosszoneone() {
			return grosszoneone;
		}
		public void setGrosszoneone(String grosszoneone) {
			this.grosszoneone = grosszoneone;
		}
		public String getGrosszthreeone() {
			return grosszthreeone;
		}
		public void setGrosszthreeone(String grosszthreeone) {
			this.grosszthreeone = grosszthreeone;
		}
		public String getGrosszfourone() {
			return grosszfourone;
		}
		public void setGrosszfourone(String grosszfourone) {
			this.grosszfourone = grosszfourone;
		}
		public String getGrossztwoone() {
			return grossztwoone;
		}
		public void setGrossztwoone(String grossztwoone) {
			this.grossztwoone = grossztwoone;
		}
		public String getGrossx() {
			return grossx;
		}
		public void setGrossx(String grossx) {
			this.grossx = grossx;
		}
		public String getGrossavgheightone() {
			return grossavgheightone;
		}
		public void setGrossavgheightone(String grossavgheightone) {
			this.grossavgheightone = grossavgheightone;
		}
		public String getGrossavgheighttwo() {
			return grossavgheighttwo;
		}
		public void setGrossavgheighttwo(String grossavgheighttwo) {
			this.grossavgheighttwo = grossavgheighttwo;
		}
		public String getTarelongxonefour() {
			return tarelongxonefour;
		}
		public void setTarelongxonefour(String tarelongxonefour) {
			this.tarelongxonefour = tarelongxonefour;
		}
		public String getTarelongxtwofour() {
			return tarelongxtwofour;
		}
		public void setTarelongxtwofour(String tarelongxtwofour) {
			this.tarelongxtwofour = tarelongxtwofour;
		}
		public String getTarelatyonethree() {
			return tarelatyonethree;
		}
		public void setTarelatyonethree(String tarelatyonethree) {
			this.tarelatyonethree = tarelatyonethree;
		}
		public String getTarelatythreethree() {
			return tarelatythreethree;
		}
		public void setTarelatythreethree(String tarelatythreethree) {
			this.tarelatythreethree = tarelatythreethree;
		}
		public String getTareaside() {
			return tareaside;
		}
		public void setTareaside(String tareaside) {
			this.tareaside = tareaside;
		}
		public String getTarebside() {
			return tarebside;
		}
		public void setTarebside(String tarebside) {
			this.tarebside = tarebside;
		}
		public String getGrosslongxonefour() {
			return grosslongxonefour;
		}
		public void setGrosslongxonefour(String grosslongxonefour) {
			this.grosslongxonefour = grosslongxonefour;
		}
		public String getGrosslongxtwofour() {
			return grosslongxtwofour;
		}
		public void setGrosslongxtwofour(String grosslongxtwofour) {
			this.grosslongxtwofour = grosslongxtwofour;
		}
		public String getGrosslatyonethree() {
			return grosslatyonethree;
		}
		public void setGrosslatyonethree(String grosslatyonethree) {
			this.grosslatyonethree = grosslatyonethree;
		}
		public String getGrosslatythreethree() {
			return grosslatythreethree;
		}
		public void setGrosslatythreethree(String grosslatythreethree) {
			this.grosslatythreethree = grosslatythreethree;
		}
		public String getGrossaside() {
			return grossaside;
		}
		public void setGrossaside(String grossaside) {
			this.grossaside = grossaside;
		}
		public String getGrossbside() {
			return grossbside;
		}
		public void setGrossbside(String grossbside) {
			this.grossbside = grossbside;
		}
		public String getCheckingStatus() {
			return checkingStatus;
		}
		public void setCheckingStatus(String checkingStatus) {
			this.checkingStatus = checkingStatus;
		}

		

	
		
		
}

	