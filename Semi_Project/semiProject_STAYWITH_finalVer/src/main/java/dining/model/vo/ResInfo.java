package dining.model.vo;

public class ResInfo {
	private String rDate;
	private int lunch;
	private int dinner;
	public ResInfo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ResInfo(String rDate, int lunch, int dinner) {
		super();
		this.rDate = rDate;
		this.lunch = lunch;
		this.dinner = dinner;
	}
	public String getRDate() {
		return rDate;
	}
	public void setRDate(String rDate) {
		this.rDate = rDate;
	}
	public int getLunch() {
		return lunch;
	}
	public void setLunch(int lunch) {
		this.lunch = lunch;
	}
	public int getDinner() {
		return dinner;
	}
	public void setDinner(int dinner) {
		this.dinner = dinner;
	}
	
}
