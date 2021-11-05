package stay.model.vo;

public class RoomReview {
private  int RRNo;
private String ReviewWriter;
private String ReviewContent;
private String reviewDate;
private int Star;
private String resNum;
private int RoomNo;
private String RoomName;
private String CheckInDate;
private String checkOutDate;
public RoomReview() {
	super();
	// TODO Auto-generated constructor stub
}
public RoomReview(int rRNo, String reviewWriter, String reviewContent, String reviewDate, int Star, String resNum,
		int roomNo, String roomName, String checkInDate, String checkOutDate) {
	super();
	RRNo = rRNo;
	ReviewWriter = reviewWriter;
	ReviewContent = reviewContent;
	this.reviewDate = reviewDate;
	this.Star = Star;
	this.resNum = resNum;
	RoomNo = roomNo;
	RoomName = roomName;
	CheckInDate = checkInDate;
	this.checkOutDate = checkOutDate;
}
public int getRRNo() {
	return RRNo;
}
public void setRRNo(int rRNo) {
	RRNo = rRNo;
}
public String getReviewWriter() {
	return ReviewWriter;
}
public void setReviewWriter(String reviewWriter) {
	ReviewWriter = reviewWriter;
}
public String getReviewContent() {
	return ReviewContent;
}
public void setReviewContent(String reviewContent) {
	ReviewContent = reviewContent;
}
public String getReviewDate() {
	return reviewDate;
}
public void setReviewDate(String reviewDate) {
	this.reviewDate = reviewDate;
}
public int getStar() {
	return Star;
}
public void setStar(int Star) {
	this.Star = Star;
}
public String getResNum() {
	return resNum;
}
public void setResNum(String resNum) {
	this.resNum = resNum;
}
public int getRoomNo() {
	return RoomNo;
}
public void setRoomNo(int roomNo) {
	RoomNo = roomNo;
}
public String getRoomName() {
	return RoomName;
}
public void setRoomName(String roomName) {
	RoomName = roomName;
}
public String getCheckInDate() {
	return CheckInDate;
}
public void setCheckInDate(String checkInDate) {
	CheckInDate = checkInDate;
}
public String getCheckOutDate() {
	return checkOutDate;
}
public void setCheckOutDate(String checkOutDate) {
	this.checkOutDate = checkOutDate;
}

}
