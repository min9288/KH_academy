package admin.model.vo;

public class Admin_Question 
{
	private int q_No;
	private String q_Category;
	private String q_Type;
	private String q_About;
	private String q_Title;
	
	private String res_No;
	
	private String q_FileName;
	private String q_FilePath;
	private String used_Date;
	
	private String q_Content;
	private String q_Name;
	private String email;
	private String phone;
	private String home;
	private String q_Auto;
	
	private Boolean q_reply;
	private int q_rowNum;
	
	public Admin_Question()
	{
		
	}
	
	public Admin_Question(int q_No, String q_Category, String q_Type, String q_About, String q_Title, String res_No,
			String q_FileName, String q_FilePath, String used_Date, String q_Content, String q_Name, String email,
			String phone, String home, String q_Auto, Boolean q_reply, int q_rowNum) {
		super();
		this.q_No = q_No;
		this.q_Category = q_Category;
		this.q_Type = q_Type;
		this.q_About = q_About;
		this.q_Title = q_Title;
		this.res_No = res_No;
		this.q_FileName = q_FileName;
		this.q_FilePath = q_FilePath;
		this.used_Date = used_Date;
		this.q_Content = q_Content;
		this.q_Name = q_Name;
		this.email = email;
		this.phone = phone;
		this.home = home;
		this.q_Auto = q_Auto;
		this.q_reply = q_reply;
		this.q_rowNum = q_rowNum;
	}

	public int getQ_No() {
		return q_No;
	}

	public void setQ_No(int q_No) {
		this.q_No = q_No;
	}

	public String getQ_Category() {
		return q_Category;
	}

	public void setQ_Category(String q_Category) {
		this.q_Category = q_Category;
	}

	public String getQ_Type() {
		return q_Type;
	}

	public void setQ_Type(String q_Type) {
		this.q_Type = q_Type;
	}

	public String getQ_About() {
		return q_About;
	}

	public void setQ_About(String q_About) {
		this.q_About = q_About;
	}

	public String getQ_Title() {
		return q_Title;
	}

	public void setQ_Title(String q_Title) {
		this.q_Title = q_Title;
	}

	public String getRes_No() {
		return res_No;
	}

	public void setRes_No(String res_No) {
		this.res_No = res_No;
	}

	public String getQ_FileName() {
		return q_FileName;
	}

	public void setQ_FileName(String q_FileName) {
		this.q_FileName = q_FileName;
	}

	public String getQ_FilePath() {
		return q_FilePath;
	}

	public void setQ_FilePath(String q_FilePath) {
		this.q_FilePath = q_FilePath;
	}

	public String getUsed_Date() {
		return used_Date;
	}

	public void setUsed_Date(String used_Date) {
		this.used_Date = used_Date;
	}

	public String getQ_Content() {
		return q_Content;
	}

	public void setQ_Content(String q_Content) {
		this.q_Content = q_Content;
	}

	public String getQ_Name() {
		return q_Name;
	}

	public void setQ_Name(String q_Name) {
		this.q_Name = q_Name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getHome() {
		return home;
	}

	public void setHome(String home) {
		this.home = home;
	}

	public String getQ_Auto() {
		return q_Auto;
	}

	public void setQ_Auto(String q_Auto) {
		this.q_Auto = q_Auto;
	}

	public Boolean getQ_reply() {
		return q_reply;
	}

	public void setQ_reply(Boolean q_reply) {
		this.q_reply = q_reply;
	}

	public int getQ_rowNum() {
		return q_rowNum;
	}

	public void setQ_rowNum(int q_rowNum) {
		this.q_rowNum = q_rowNum;
	}
	
	
	
	
}
