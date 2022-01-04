package kr.or.member.model.vo;

import lombok.Data;

@Data
public class Member {
	private int memberNo;
	private String memberName;
	private String phone;
	private String memberId;
	private String memberPw;
	private String email;
	private int memberType;
	private String enrollDate;
	private String filepath;
	private int memberGrade;
	private String comNo;
	//사업자번호용
	private String businessNo;
	//카카오회원확인용
	private int kakao;
}