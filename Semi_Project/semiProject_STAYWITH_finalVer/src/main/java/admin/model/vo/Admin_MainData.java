package admin.model.vo;

public class Admin_MainData 
{
	private String date;
	private int res_Count;
	
	public Admin_MainData()
	{
		
	}

	public Admin_MainData(String date, int res_Count) 
	{
		super();
		this.date = date;
		this.res_Count = res_Count;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getRes_Count() {
		return res_Count;
	}

	public void setRes_Count(int res_Count) {
		this.res_Count = res_Count;
	}
	
	
	
}
