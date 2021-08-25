package vo;

public class Member {
	private int memberNo; // 회원번호
	private String memberId; // 아이디
	private String memberPw; // 비번
	private String memberName; // 이름
	private String memberPhone; // 전화번호
	private String memberAddr; // 주소
	private int memberLevel; // 회원 구분 (고객, 직원) - 아래 코드 참고 getMemberLevelStr
	
	public Member() {
		super();
	}


	public Member(int memberNo, String memberId, String memberPw, String memberName, String memberPhone,
			String memberAddr, int memberLevel) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberAddr = memberAddr;
		this.memberLevel = memberLevel;
	}
	
	public String getMemberLevelStr() {
		if(memberLevel==1) {
			return "고객";
		}else {
			return "직원";
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

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberAddr() {
		return memberAddr;
	}

	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}

	public int getMemberLevel() {
		return memberLevel;
	}


	public void setMemberLevel(int memberLevel) {
		this.memberLevel = memberLevel;
	}

	
}
