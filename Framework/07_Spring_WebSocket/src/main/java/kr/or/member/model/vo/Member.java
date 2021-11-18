package kr.or.member.model.vo;

import lombok.Data;

@Data
public class Member {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String address;
	private String enrollDate;
	
}
