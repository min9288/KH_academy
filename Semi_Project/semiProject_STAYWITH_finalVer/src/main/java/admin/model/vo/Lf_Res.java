package admin.model.vo;

public class Lf_Res 
{
	private String res_No;
	private int lf_No;
	private String member_Id;
	private int res_People;
	private String	res_Date;
	private String res_Time;
	private int 	status;
	private int 	price;
	
	public Lf_Res()
	{
		
	}
	
	public Lf_Res(String res_No, int lf_No, String member_Id, int res_People, String res_Date, String res_Time, int status,
			int price) {
		super();
		this.res_No = res_No;
		this.lf_No = lf_No;
		this.member_Id = member_Id;
		this.res_People = res_People;
		this.res_Date = res_Date;
		this.res_Time = res_Time;
		this.status = status;
		this.price = price;
	}
	public String getRes_No() {
		return res_No;
	}
	public void setRes_No(String res_No) {
		this.res_No = res_No;
	}
	public int getLf_No() {
		return lf_No;
	}
	public void setLf_No(int lf_No) {
		this.lf_No = lf_No;
	}
	public String getMember_Id() {
		return member_Id;
	}
	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}
	public int getRes_People() {
		return res_People;
	}
	public void setRes_People(int res_People) {
		this.res_People = res_People;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}	
	
}
