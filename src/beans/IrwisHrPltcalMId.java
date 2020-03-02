package beans;
// Generated 11 May, 2018 11:03:36 AM by Hibernate Tools 4.0.1.Final

import java.util.Date;

/**
 * IrwisHrPltcalMId generated by hbm2java
 */
public class IrwisHrPltcalMId implements java.io.Serializable {

	private String pcalId;
	private int calYr;
	private Date calHodyDate;
	private String hodyCode;

	public IrwisHrPltcalMId() {
	}

	public IrwisHrPltcalMId(String pcalId, int calYr, Date calHodyDate, String hodyCode) {
		this.pcalId = pcalId;
		this.calYr = calYr;
		this.calHodyDate = calHodyDate;
		this.hodyCode = hodyCode;
	}

	public String getPcalId() {
		return this.pcalId;
	}

	public void setPcalId(String pcalId) {
		this.pcalId = pcalId;
	}

	public int getCalYr() {
		return this.calYr;
	}

	public void setCalYr(int calYr) {
		this.calYr = calYr;
	}

	public Date getCalHodyDate() {
		return this.calHodyDate;
	}

	public void setCalHodyDate(Date calHodyDate) {
		this.calHodyDate = calHodyDate;
	}

	public String getHodyCode() {
		return this.hodyCode;
	}

	public void setHodyCode(String hodyCode) {
		this.hodyCode = hodyCode;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof IrwisHrPltcalMId))
			return false;
		IrwisHrPltcalMId castOther = (IrwisHrPltcalMId) other;

		return ((this.getPcalId() == castOther.getPcalId()) || (this.getPcalId() != null
				&& castOther.getPcalId() != null && this.getPcalId().equals(castOther.getPcalId())))
				&& (this.getCalYr() == castOther.getCalYr())
				&& ((this.getCalHodyDate() == castOther.getCalHodyDate())
						|| (this.getCalHodyDate() != null && castOther.getCalHodyDate() != null
								&& this.getCalHodyDate().equals(castOther.getCalHodyDate())))
				&& ((this.getHodyCode() == castOther.getHodyCode()) || (this.getHodyCode() != null
						&& castOther.getHodyCode() != null && this.getHodyCode().equals(castOther.getHodyCode())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getPcalId() == null ? 0 : this.getPcalId().hashCode());
		result = 37 * result + this.getCalYr();
		result = 37 * result + (getCalHodyDate() == null ? 0 : this.getCalHodyDate().hashCode());
		result = 37 * result + (getHodyCode() == null ? 0 : this.getHodyCode().hashCode());
		return result;
	}

}
