package admin.model.vo;

public class Dining_Res 
{
	private String res_No;
	private int 	dining_No;
	private String member_Id;
	private int guests_Adt_Cnt;
	private int guests_Kid_Cnt;
	private String res_Date;
	private String res_Time;
	private int 	time_Type;
	private int 	seat_Type;
	private int 	res_Status;
	
	public Dining_Res()
	{
		
	}
	public Dining_Res(String res_No, int dining_No, String member_Id, int guests_Adt_Cnt, int guests_Kid_Cnt,
			String res_Date, String res_Time, int time_Type, int seat_Type, int res_status) {
		super();
		this.res_No = res_No;
		this.dining_No = dining_No;
		this.member_Id = member_Id;
		this.guests_Adt_Cnt = guests_Adt_Cnt;
		this.guests_Kid_Cnt = guests_Kid_Cnt;
		this.res_Date = res_Date;
		this.res_Time = res_Time;
		this.time_Type = time_Type;
		this.seat_Type = seat_Type;
		this.res_Status = res_status;
	}
	
	public String getRes_No() {
		return res_No;
	}
	public void setRes_No(String res_No) {
		this.res_No = res_No;
	}
	public int getDining_No() {
		return dining_No;
	}
	public void setDining_No(int dining_No) {
		this.dining_No = dining_No;
	}
	public String getMember_Id() {
		return member_Id;
	}
	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}
	public int getGuests_Adt_Cnt() {
		return guests_Adt_Cnt;
	}
	public void setGuests_Adt_Cnt(int guests_Adt_Cnt) {
		this.guests_Adt_Cnt = guests_Adt_Cnt;
	}
	public int getGuests_Kid_Cnt() {
		return guests_Kid_Cnt;
	}
	public void setGuests_Kid_Cnt(int guests_Kid_Cnt) {
		this.guests_Kid_Cnt = guests_Kid_Cnt;
	}
	public String getRes_Date() {
		return res_Date;
	}
	public void setRes_Date(String res_Date) {
		this.res_Date = res_Date;
	}
	public String getRes_Time() {
		return res_Time;
	}
	public void setRes_Time(String res_Time) {
		this.res_Time = res_Time;
	}
	public int getTime_Type() {
		return time_Type;
	}
	public void setTime_Type(int time_Type) {
		this.time_Type = time_Type;
	}
	public int getSeat_Type() {
		return seat_Type;
	}
	public void setSeat_Type(int seat_Type) {
		this.seat_Type = seat_Type;
	}
	public int getRes_Status() {
		return res_Status;
	}
	public void setRes_Status(int res_status) {
		this.res_Status = res_status;
	}
	
	
	
	
}
