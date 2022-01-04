package kr.or.contest.vo;

import lombok.Data;

@Data
public class ContestMember {
	
	private int cmNo;
	private int contestNo;
	private String memberId;
	private String cmGit;
	private int cmStatus;
}
