package kr.or.iei.model.vo;

import java.sql.Date;

public class Rent {
	private int rentNo;
	private int memberNo;
	private int bookNo;
	private Date startDate;
	private Date endDate;
	private int rentStatus;	
	private String memberName;
	private String bookName;
	public Rent() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Rent(int rentNo, int memberNo, int bookNo, Date startDate, Date endDate, int rentStatus) {
		super();
		this.rentNo = rentNo;
		this.memberNo = memberNo;
		this.bookNo = bookNo;
		this.startDate = startDate;
		this.endDate = endDate;
		this.rentStatus = rentStatus;
		
	}

	public int getRentNo() {
		return rentNo;
	}
	public void setRentNo(int rentNo) {
		this.rentNo = rentNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getRentStatus() {
		return rentStatus;
	}
	public void setRentStatus(int rentStatus) {
		this.rentStatus = rentStatus;
	}
	public String getRentStatusStr() {
		if(rentStatus == 1) {
			return "대여 중";
		}else {
			return "반납 완료";
		}
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	
	
}
