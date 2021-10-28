package bookingView.modal.vo;

public class BookingViewLife {
	private String resNo;
	private int lfNo;
	private String memberId;
	private int resPeople;
	private String resDate;
	private String resTime;
	private int status;
	private int price;
	private String lfName;
	
	public BookingViewLife() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public BookingViewLife(String resNo, int lfNo, String memberId, int resPeople, String resDate, String resTime,
			int status, int price, String lfName) {
		super();
		this.resNo = resNo;
		this.lfNo = lfNo;
		this.memberId = memberId;
		this.resPeople = resPeople;
		this.resDate = resDate;
		this.resTime = resTime;
		this.status = status;
		this.price = price;
		this.lfName = lfName;
	}



	public String getStatusStr(){
		if(status == 1) {
			return "예약 중";
		}else if(status == 2) {
			return "예약완료";
		}else if(status == 3) {
			return "취소신청";
		}else if(status == 4) {
			return "취소완료";
		}else {
			return null;
		}
	}



	public String getResNo() {
		return resNo;
	}



	public void setResNo(String resNo) {
		this.resNo = resNo;
	}



	public int getLfNo() {
		return lfNo;
	}



	public void setLfNo(int lfNo) {
		this.lfNo = lfNo;
	}



	public String getMemberId() {
		return memberId;
	}



	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



	public int getResPeople() {
		return resPeople;
	}



	public void setResPeople(int resPeople) {
		this.resPeople = resPeople;
	}



	public String getResDate() {
		return resDate;
	}



	public void setResDate(String resDate) {
		this.resDate = resDate;
	}



	public String getResTime() {
		return resTime;
	}



	public void setResTime(String resTime) {
		this.resTime = resTime;
	}



	public int getStatus() {
		return status;
	}



	public void setStatus(int status) {
		this.status = status;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public String getLfName() {
		return lfName;
	}



	public void setLfName(String lfName) {
		this.lfName = lfName;
	}

	

}