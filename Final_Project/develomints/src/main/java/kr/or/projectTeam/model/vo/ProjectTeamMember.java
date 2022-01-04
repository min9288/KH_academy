package kr.or.projectTeam.model.vo;

import lombok.Data;

@Data
public class ProjectTeamMember {
	private int teamMemberNo;
	private int projectNo;
	private int memberNo;
	private String memberRole;
	private String memberId;
	private String memberImg;
	private int memberGrade;
	private String projectName;
}
