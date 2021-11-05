package dining.model.vo;

public class DiningData {
	private Dining d;
	private DiningTime lunch;
	private DiningTime dinner;
	private DiningTime brunch;
	private DiningTime after;
	private DiningTime day;
	public DiningData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DiningData(Dining d, DiningTime lunch, DiningTime dinner, DiningTime brunch, DiningTime after,
			DiningTime day) {
		super();
		this.d = d;
		this.lunch = lunch;
		this.dinner = dinner;
		this.brunch = brunch;
		this.after = after;
		this.day = day;
	}
	public DiningData(Dining d, DiningTime lunch, DiningTime dinner) {
		super();
		this.d = d;
		this.lunch = lunch;
		this.dinner = dinner;
	}
	public DiningData(Dining d, DiningTime brunch, DiningTime after, DiningTime day) {
		super();
		this.d = d;
		this.brunch = brunch;
		this.after = after;
		this.day = day;
	}
	public DiningData(Dining d, DiningTime day) {
		super();
		this.d = d;
		this.day = day;
	}
	public Dining getD() {
		return d;
	}
	public void setD(Dining d) {
		this.d = d;
	}
	public DiningTime getLunch() {
		return lunch;
	}
	public void setLunch(DiningTime lunch) {
		this.lunch = lunch;
	}
	public DiningTime getDinner() {
		return dinner;
	}
	public void setDinner(DiningTime dinner) {
		this.dinner = dinner;
	}
	public DiningTime getBrunch() {
		return brunch;
	}
	public void setBrunch(DiningTime brunch) {
		this.brunch = brunch;
	}
	public DiningTime getAfter() {
		return after;
	}
	public void setAfter(DiningTime after) {
		this.after = after;
	}
	public DiningTime getDay() {
		return day;
	}
	public void setDay(DiningTime day) {
		this.day = day;
	}
	
}
