package kr.or.contest.vo;

import lombok.Data;

@Data
public class ContestMemberList {
	private int cmNo;
	private int contestNo;
	private String memberId;
	private String cmGit;
	private int cmStatus;
	private String phone;
	private String email;

}
