package vo;

public class Accommodation {
	private int roomNo; // 방 호수
	private int roomType; // 방 종류 - 아래코드 참고 getRoomTypeStr
	private int roomPrice; // 가격
	private int acceptPerson; // 허용인원
	
	public Accommodation() {
		super();
	}
	
	public Accommodation(int roomNo, int roomType, int roomPrice, int acceptPerson) {
		super();
		this.roomNo = roomNo;
		this.roomType = roomType;
		this.roomPrice = roomPrice;
		this.acceptPerson = acceptPerson;
	}
	
	public String getRoomTypeStr() {
		if(roomType == 1) {
			return "디럭스";
		}else {
			return "스위트";
		}
	}

	public int getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}

	public int getRoomType() {
		return roomType;
	}

	public void setRoomType(int roomType) {
		this.roomType = roomType;
	}

	public int getRoomPrice() {
		return roomPrice;
	}

	public void setRoomPrice(int roomPrice) {
		this.roomPrice = roomPrice;
	}

	public int getAcceptPerson() {
		return acceptPerson;
	}

	public void setAcceptPerson(int acceptPerson) {
		this.acceptPerson = acceptPerson;
	}
	
	
}
