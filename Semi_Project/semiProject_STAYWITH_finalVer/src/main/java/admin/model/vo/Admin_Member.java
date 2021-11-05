package admin.model.vo;

public class Admin_Member 
{
	private int 	member_No;
	private String member_Id;
	private String member_Pw;
	private String member_Kname;
	private String member_Lname;
	private String member_Fname;
	private int 	member_Level;
	private String phone;
	private int 	birth;
	private String email;
	private int 	point;
	private String enroll_Date;
	
	public Admin_Member()
	{
		
	}
	
	public Admin_Member(int member_No, String member_Id, String member_Pw, String member_Kname, String member_Lname,
			String member_Fname, int member_Level, String phone, int birth, String email, int point,
			String enroll_Date) {
		super();
		this.member_No = member_No;
		this.member_Id = member_Id;
		this.member_Pw = member_Pw;
		this.member_Kname = member_Kname;
		this.member_Lname = member_Lname;
		this.member_Fname = member_Fname;
		this.member_Level = member_Level;
		this.phone = phone;
		this.birth = birth;
		this.email = email;
		this.point = point;
		this.enroll_Date = enroll_Date;
	}

	public int getMember_No() {
		return member_No;
	}

	public void setMember_No(int member_No) {
		this.member_No = member_No;
	}

	public String getMember_Id() {
		return member_Id;
	}

	public void setMember_Id(String member_Id) {
		this.member_Id = member_Id;
	}

	public String getMember_Pw() {
		return member_Pw;
	}

	public void setMember_Pw(String member_Pw) {
		this.member_Pw = member_Pw;
	}

	public String getMember_Kname() {
		return member_Kname;
	}

	public void setMember_Kname(String member_Kname) {
		this.member_Kname = member_Kname;
	}

	public String getMember_Lname() {
		return member_Lname;
	}

	public void setMember_Lname(String member_Lname) {
		this.member_Lname = member_Lname;
	}

	public String getMember_Fname() {
		return member_Fname;
	}

	public void setMember_Fname(String member_Fname) {
		this.member_Fname = member_Fname;
	}

	public int getMember_Level() {
		return member_Level;
	}

	public void setMember_Level(int member_Level) {
		this.member_Level = member_Level;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getBirth() {
		return birth;
	}

	public void setBirth(int birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getEnroll_Date() {
		return enroll_Date;
	}

	public void setEnroll_Date(String enroll_Date) {
		this.enroll_Date = enroll_Date;
	}
	
	
	
	
}
