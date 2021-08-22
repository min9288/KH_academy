package kh.jdbc.member.vo;

import java.util.Date;

public class Member {
	private int memberCode;
	private String memberId;
	private String memberPw;
	private String memberName;
	private int memberAge;
	private String memberPhone;
	
	public Member() {
		super();
	}
	
	public Member(String memberPw, String memberName, int memberAge,
			String memberPhone) {
		super();

		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberAge = memberAge;
		this.memberPhone = memberPhone;
	}

	public Member(int memberCode, String memberId, String memberPw, String memberName, int memberAge,
			String memberPhone) {
		super();
		this.memberCode = memberCode;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberAge = memberAge;
		this.memberPhone = memberPhone;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
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

	public int getMemberAge() {
		return memberAge;
	}

	public void setMemberAge(int memberAge) {
		this.memberAge = memberAge;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	
}
	