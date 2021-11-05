package admin.model.vo;

public class Room_Res 
{
	private String res_Num;
	private int room_No;
	private String member_Id;
	private String member_Kname;
	
	
	private String checkin;
	private String checkout;
	
	private String room_Type;
	private String room_Name;	
	
	private int room_Price;
	private int pay_Status;
	private int adult;
	private int kid;
	
	public Room_Res()
	{
		
	}
	
	public Room_Res(String res_Num, int room_No, String member_Id, String member_Kname, String room_Type, String room_Name,
			String checkin, String checkout, int room_Price, int pay_Status, int adult, int kid) {
		super();
		this.res_Num = res_Num;
		this.room_No = room_No;
		this.member_Id = member_Id;
		this.member_Kname = member_Kname;
		this.room_Type = room_Type;
		this.room_Name = room_Name;
		this.checkin = checkin;
		this.checkout = checkout;
		this.room_Price = room_Price;
		this.pay_Status = pay_Status;
		this.adult = adult;
		this.kid = kid;
	}
	
	public String getRoom_Type() {
		return room_Type;
	}

	public void setRoom_Type(String room_Type) {
		this.room_Type = room_Type;
	}

	public String getRoom_Name() {
		return room_Name;
	}

	public void setRoom_Name(String room_Name) {
		this.room_Name = room_Name;
	}
	public String getRes_Num() {
		return res_Num;
	}
	public void setRes_Num(String res_Num) {
		this.res_Num = res_Num;
	}

	public int getRoom_No() {
		return room_No;
	}

	public void setRoom_No(int room_No) {
		this.room_No = room_No;
	}

	public String getMember_Id() {
		return member_Id;
	}
	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}
	public String getMember_Kname() {
		return member_Kname;
	}
	public void setMember_Kname(String member_Kname) {
		this.member_Kname = member_Kname;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public int getRoom_Price() {
		return room_Price;
	}
	public void setRoom_Price(int room_Price) {
		this.room_Price = room_Price;
	}
	public int getPay_Status() {
		return pay_Status;
	}
	public void setPay_Status(int pay_Status) {
		this.pay_Status = pay_Status;
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
	
	
	
}
