package stay.model.vo;

public class RoomReserve {

	private  String resNum;
	private  int roomNo;
	private  String memberId;
	private  String memberKname;
	private  String roomType;
	private String roomName;
	private  String checkIn;
	private  String checkOut;
	private  int  roomPrice;
	private int payStatus;
	private int adult;
	private int kid;
	private String bed;
	public RoomReserve() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RoomReserve(String resNum, int roomNo, String memberId, String memberKname, String roomType, String roomName,
			String checkIn, String checkOut, int roomPrice, int payStatus, int adult, int kid, String bed) {
		super();
		this.resNum = resNum;
		this.roomNo = roomNo;
		this.memberId = memberId;
		this.memberKname = memberKname;
		this.roomType = roomType;
		this.roomName = roomName;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.roomPrice = roomPrice;
		this.payStatus = payStatus;
		this.adult = adult;
		this.kid = kid;
		this.bed = bed;
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
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberKname() {
		return memberKname;
	}
	public void setMemberKname(String memberKname) {
		this.memberKname = memberKname;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public int getRoomPrice() {
		return roomPrice;
	}
	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}
	public int getPayStatus() {
		return payStatus;
	}
	public void setPayStatus(int payStatus) {
		this.payStatus = payStatus;
	}
	public int getAdult() {
		return adult;
	}
	public void setAdult(int adult) {
		this.adult = adult;
	}
	public int getKid() {
		return kid;
	}
	public void setKid(int kid) {
		this.kid = kid;
	}
	public String getBed() {
		return bed;
	}
	public void setBed(String bed) {
		this.bed = bed;
	}
	

}
