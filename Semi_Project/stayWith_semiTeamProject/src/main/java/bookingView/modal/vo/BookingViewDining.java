package bookingView.modal.vo;

public class BookingViewDining {
	private String resNo;
	private int diningNo;
	private String memberId;
	private int guestsACnt;
	private int guestsKCnt;
	private String resDate;
	private String resTime;
	private int timeType;
	private int seatType;
	private int resStatus;
	private String diningName;
	
	public BookingViewDining() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public BookingViewDining(String resNo, int diningNo, String memberId, int guestsACnt, int guestsKCnt,
			String resDate, String resTime, int timeType, int seatType, int resStatus, String diningName) {
		super();
		this.resNo = resNo;
		this.diningNo = diningNo;
		this.memberId = memberId;
		this.guestsACnt = guestsACnt;
		this.guestsKCnt = guestsKCnt;
		this.resDate = resDate;
		this.resTime = resTime;
		this.timeType = timeType;
		this.seatType = seatType;
		this.resStatus = resStatus;
		this.diningName = diningName;
	}



	public String getResStatusStr(){
		if(resStatus == 1) {
			return "예약 중";
		}else if(resStatus == 2) {
			return "예약완료";
		}else if(resStatus == 3) {
			return "취소신청";
		}else if(resStatus == 4) {
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



	public int getDiningNo() {
		return diningNo;
	}



	public void setDiningNo(int diningNo) {
		this.diningNo = diningNo;
	}



	public String getMemberId() {
		return memberId;
	}



	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



	public int getGuestsACnt() {
		return guestsACnt;
	}



	public void setGuestsACnt(int guestsACnt) {
		this.guestsACnt = guestsACnt;
	}



	public int getGuestsKCnt() {
		return guestsKCnt;
	}



	public void setGuestsKCnt(int guestsKCnt) {
		this.guestsKCnt = guestsKCnt;
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



	public int getTimeType() {
		return timeType;
	}



	public void setTimeType(int timeType) {
		this.timeType = timeType;
	}



	public int getSeatType() {
		return seatType;
	}



	public void setSeatType(int seatType) {
		this.seatType = seatType;
	}



	public int getResStatus() {
		return resStatus;
	}



	public void setResStatus(int resStatus) {
		this.resStatus = resStatus;
	}



	public String getDiningName() {
		return diningName;
	}



	public void setDiningName(String diningName) {
		this.diningName = diningName;
	}
	
	
}
	