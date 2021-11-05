package dining.model.vo;

public class DiningTime {
	private int timeNo;
	private int diningNo;
	private int timeType;
	private String open;
	private String close;
	public DiningTime() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DiningTime(int timeNo, int diningNo, int timeType, String open, String close) {
		super();
		this.timeNo = timeNo;
		this.diningNo = diningNo;
		this.timeType = timeType;
		this.open = open;
		this.close = close;
	}
	public int getTimeNo() {
		return timeNo;
	}
	public void setTimeNo(int timeNo) {
		this.timeNo = timeNo;
	}
	public int getDiningNo() {
		return diningNo;
	}
	public void setDiningNo(int diningNo) {
		this.diningNo = diningNo;
	}
	public int getTimeType() {
		return timeType;
	}
	public void setTimeType(int timeType) {
		this.timeType = timeType;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getClose() {
		return close;
	}
	public void setClose(String close) {
		this.close = close;
	}
	
}
