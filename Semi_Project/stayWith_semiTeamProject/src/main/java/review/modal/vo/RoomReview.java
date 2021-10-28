package review.modal.vo;

import java.util.ArrayList;

public class RoomReview {
	private int rRNo;
	private String reviewWriter;
	private String reviewContent;
	private String reviewDate;
	private int star;
	private String resNum;
	private int roomNo;
	private String roomName;
	private String checkInDate;
	private String checkOutDate;
	private String roomImg;

	public RoomReview() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public RoomReview(int rRNo, String reviewWriter, String reviewContent, String reviewDate, int star, String resNum,
			int roomNo, String roomName, String checkInDate, String checkOutDate) {
		super();
		this.rRNo = rRNo;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.star = star;
		this.resNum = resNum;
		this.roomNo = roomNo;
		this.roomName = roomName;
		this.checkInDate = checkInDate;
		this.checkOutDate = checkOutDate;
	}


	public String getRoomImg(){
		if(roomName.equals("디럭스")) {
			return "img/review/디럭스.jpg";
		}else if(roomName.equals("이그제큐티브")) {
			return "img/review/이그제큐티브.jpg";
		}else if(roomName.equals("스위트")) {
			return "img/review/스위트.jpg";
		}else {
			return null;
		}
	}



	public int getrRNo() {
		return rRNo;
	}



	public void setrRNo(int rRNo) {
		this.rRNo = rRNo;
	}



	public String getReviewWriter() {
		return reviewWriter;
	}



	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}



	public String getReviewContent() {
		return reviewContent;
	}



	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}



	public String getReviewDate() {
		return reviewDate;
	}



	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}



	public int getStar() {
		return star;
	}



	public void setStar(int star) {
		this.star = star;
	}



	public String getResNum() {
		return resNum;
	}



	public void setResNum(String resNum) {
		this.resNum = resNum;
	}



	public int getRoomNo() {
		return roomNo;
	}



	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}



	public String getRoomName() {
		return roomName;
	}



	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}



	public String getCheckInDate() {
		return checkInDate;
	}



	public void setCheckInDate(String checkInDate) {
		this.checkInDate = checkInDate;
	}



	public String getCheckOutDate() {
		return checkOutDate;
	}



	public void setCheckOutDate(String checkOutDate) {
		this.checkOutDate = checkOutDate;
	}
	
	
}
