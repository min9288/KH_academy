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
}