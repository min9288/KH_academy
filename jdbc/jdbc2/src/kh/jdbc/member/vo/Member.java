package kh.jdbc.member.vo;

import java.util.Date;

public class Member {
	private int memberCode;
	private String memberId;
	private String memberPw;
	private String memberName;
	private int memberAge;
	private String memberPhone;
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private int boardWriter;
	private int readCount;
	private Date enrollDate;
	private String boardWriterString;
	
	
	public Member() {
		super();
	}
	
	public Member(int boardNo, String boardTitle, String memberName, int readCount, Date enrollDate) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.memberName = memberName;
		this.readCount = readCount;
		this.enrollDate = enrollDate;
	}

	public Member(int boardNo, String boardTitle, String boardContent, int boardWriter, int readCount,
			Date enrollDate, String boardWriterString) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.readCount = readCount;
		this.enrollDate = enrollDate;
		this.boardWriterString = boardWriterString ;
		
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

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(int boardWriter) {
		this.boardWriter = boardWriter;
	}



	public String getBoardContent() {
		return boardContent;
	}



	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardWriterString() {
		return boardWriterString;
	}

	public void setBoardWriterString(String boardWriterString) {
		this.boardWriterString = boardWriterString;
	}
	
	
}
	