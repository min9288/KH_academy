package vo;

import java.util.Date;

public class Reservation {
	private int resNo; // 예약번호
	private int memberNo; // 회원번호
	private int roomNo; // 방 호수 
	private Date resDate; // 예약일자
	private Date checkIn; // 체크인
	private Date checkOut; // 체크아웃
	private int resPerson; // 예약인원
	private int roomType;
	private int intCheckIn; // 체크인
	private int intCheckOut; // 체크아웃
	
	public Reservation() {
		super();
	}
	
	

	public Reservation(int resNo, int memberNo, int roomNo, Date resDate, int resPerson, int roomType, int intCheckIn,
			int intCheckOut) {
		super();
		this.resNo = resNo;
		this.memberNo = memberNo;
		this.roomNo = roomNo;
		this.resDate = resDate;
		this.resPerson = resPerson;
		this.roomType = roomType;
		this.intCheckIn = intCheckIn;
		this.intCheckOut = intCheckOut;
	}



	public Reservation(int resNo, int memberNo, int roomNo, Date resDate, Date checkIn, Date checkOut, int resPerson) {
		super();
		this.resNo = resNo;
		this.memberNo = memberNo;
		this.roomNo = roomNo;
		this.resDate = resDate;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.resPerson = resPerson;
		
	}
	
	
	
	public int getIntCheckIn() {
		return intCheckIn;
	}



	public void setIntCheckIn(int intCheckIn) {
		this.intCheckIn = intCheckIn;
	}



	public int getIntCheckOut() {
		return intCheckOut;
	}



	public void setIntCheckOut(int intCheckOut) {
		this.intCheckOut = intCheckOut;
	}



	public String getRoomTypeStr() {
		if(roomType == 1) {
			return "디럭스";
		}else {
			return "스위트";
		}
	}
	
	public int getRoomType() {
		return roomType;
	}

	public void setRoomType(int roomType) {
		this.roomType = roomType;
	}

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public Date getResDate() {
		return resDate;
	}

	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}

	public Date getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}

	public Date getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}

	public int getResPerson() {
		return resPerson;
	}

	public void setResPerson(int resPerson) {
		this.resPerson = resPerson;
	}
	
	
}
