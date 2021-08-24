package kr.or.iei.book.vo;

import java.util.Date;

public class Rental {
	private int rentalNo;
	private int memberNo;
	private int bookNo;
	private Date rentalDate;
	private Date returnDate;
	private int rentalStatus;
	private String memberName;
	private String bookTitle;
	private String strRentalStatus;
	
	public Rental() {
		super();
	}
	

	public Rental(int rentalNo, Date rentalDate, Date returnDate, String memberName, String bookTitle,
			String strRentalStatus) {
		super();
		this.rentalNo = rentalNo;
		this.rentalDate = rentalDate;
		this.returnDate = returnDate;
		this.memberName = memberName;
		this.bookTitle = bookTitle;
		this.strRentalStatus = strRentalStatus;
	}



	public Rental(int rentalNo, int memberNo, int bookNo, Date rentalDate, Date returnDate, int rentalStatus) {
		super();
		this.rentalNo = rentalNo;
		this.memberNo = memberNo;
		this.bookNo = bookNo;
		this.rentalDate = rentalDate;
		this.returnDate = returnDate;
		this.rentalStatus = rentalStatus;
	}

	public int getRentalNo() {
		return rentalNo;
	}

	public void setRentalNo(int rentalNo) {
		this.rentalNo = rentalNo;
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

	public Date getRentalDate() {
		return rentalDate;
	}

	public void setRentalDate(Date rentalDate) {
		this.rentalDate = rentalDate;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public int getRentalStatus() {
		return rentalStatus;
	}

	public void setRentalStatus(int rentalStatus) {
		this.rentalStatus = rentalStatus;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getBookTitle() {
		return bookTitle;
	}


	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}


	public String getStrRentalStatus() {
		return strRentalStatus;
	}


	public void setStrRentalStatus(String strRentalStatus) {
		this.strRentalStatus = strRentalStatus;
	}
	
	
	
}
