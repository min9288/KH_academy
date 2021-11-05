package stay.model.vo;

public class Room {
	
	private int RoomNo;
	private String RoomType;
	private String RoomName;
	private String RoomDetail;
	private String RoomLoc;
	private String RoomSize;
	private String Bed;
	private String RoomForm;
	private String RoomView;
	private int MaxNum;
	private int RoomPrice;
	private String RoomImg;
	private String RoomInfo;
	private int RoomStatus;
	public Room() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Room(int roomNo, String roomType, String roomName, String roomDetail, String roomLoc, String roomSize,
			String bed, String roomForm, String roomView, int maxNum, int roomPrice, String roomImg, String roomInfo,
			int roomStatus) {
		super();
		RoomNo = roomNo;
		RoomType = roomType;
		RoomName = roomName;
		RoomDetail = roomDetail;
		RoomLoc = roomLoc;
		RoomSize = roomSize;
		Bed = bed;
		RoomForm = roomForm;
		RoomView = roomView;
		MaxNum = maxNum;
		RoomPrice = roomPrice;
		RoomImg = roomImg;
		RoomInfo = roomInfo;
		RoomStatus = roomStatus;
	}
	public int getRoomNo() {
		return RoomNo;
	}
	public void setRoomNo(int roomNo) {
		RoomNo = roomNo;
	}
	public String getRoomType() {
		return RoomType;
	}
	public void setRoomType(String roomType) {
		RoomType = roomType;
	}
	public String getRoomName() {
		return RoomName;
	}
	public void setRoomName(String roomName) {
		RoomName = roomName;
	}
	public String getRoomDetail() {
		return RoomDetail;
	}
	public void setRoomDetail(String roomDetail) {
		RoomDetail = roomDetail;
	}
	public String getRoomLoc() {
		return RoomLoc;
	}
	public void setRoomLoc(String roomLoc) {
		RoomLoc = roomLoc;
	}
	public String getRoomSize() {
		return RoomSize;
	}
	public void setRoomSize(String roomSize) {
		RoomSize = roomSize;
	}
	public String getBed() {
		return Bed;
	}
	public void setBed(String bed) {
		Bed = bed;
	}
	public String getRoomForm() {
		return RoomForm;
	}
	public void setRoomForm(String roomForm) {
		RoomForm = roomForm;
	}
	public String getRoomView() {
		return RoomView;
	}
	public void setRoomView(String roomView) {
		RoomView = roomView;
	}
	public int getMaxNum() {
		return MaxNum;
	}
	public void setMaxNum(int maxNum) {
		MaxNum = maxNum;
	}
	public int getRoomPrice() {
		return RoomPrice;
	}
	public void setRoomPrice(int roomPrice) {
		RoomPrice = roomPrice;
	}
	public String getRoomImg() {
		return RoomImg;
	}
	public void setRoomImg(String roomImg) {
		RoomImg = roomImg;
	}
	public String getRoomInfo() {
		return RoomInfo;
	}
	public void setRoomInfo(String roomInfo) {
		RoomInfo = roomInfo;
	}
	public int getRoomStatus() {
		return RoomStatus;
	}
	public void setRoomStatus(int roomStatus) {
		RoomStatus = roomStatus;
	}
	
}