package kr.or.iei.book.vo;

public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberPhone;
	private int memberGrade;
	private int unpaidBook;
	
	public Member() {
		super();
	}
	
	public Member(String memberPw, String memberName, String memberPhone,
			int memberGrade) {
		super();
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberGrade = memberGrade;
	}

	public Member(int memberNo, String memberId, String memberPw, String memberName, String memberPhone,
			int memberGrade, int unpaidBook) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.memberGrade = memberGrade;
		this.unpaidBook = unpaidBook;
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

	public int getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(int memberGrade) {
		this.memberGrade = memberGrade;
	}

	public int getUnpaidBook() {
		return unpaidBook;
	}

	public void setUnpaidBook(int unpaidBook) {
		this.unpaidBook = unpaidBook;
	}
	
	
	
}
