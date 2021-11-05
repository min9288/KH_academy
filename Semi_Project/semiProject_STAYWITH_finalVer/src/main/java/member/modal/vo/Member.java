package member.modal.vo;

public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberKname;
	private String memberLname;
	private String memberFname;
	private int memberLevel;
	private String phone;
	private int birth;
	private String email;
	private int point;
	private String enrollDate;
	
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(int memberNo, String memberId, String memberPw, String memberKname, String memberLname,
			String memberFname, int memberLevel, String phone, int birth, String email, int point, String enrollDate) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberKname = memberKname;
		this.memberLname = memberLname;
		this.memberFname = memberFname;
		this.memberLevel = memberLevel;
		this.phone = phone;
		this.birth = birth;
		this.email = email;
		this.point = point;
		this.enrollDate = enrollDate;
	}
	
	public String getGradeName(){
		if(memberLevel == 1) {
			return "admin";
		}else if(memberLevel == 2) {
			return "Brown";
		}else if(memberLevel == 3) {
			return "Silver";
		}else if(memberLevel == 4) {
			return "Gold";
		}else if(memberLevel == 5) {
			return "Diamond";
		}else {
			return null;
		}
	}
	
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberKname() {
		return memberKname;
	}
	public void setMemberKname(String memberKname) {
		this.memberKname = memberKname;
	}
	public String getMemberLname() {
		return memberLname;
	}
	public void setMemberLname(String memberLname) {
		this.memberLname = memberLname;
	}
	public String getMemberFname() {
		return memberFname;
	}
	public void setMemberFname(String memberFname) {
		this.memberFname = memberFname;
	}
	public int getMemberLevel() {
		return memberLevel;
	}
	public void setMemberLevel(int memberLevel) {
		this.memberLevel = memberLevel;
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
	public String getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	
	
}
