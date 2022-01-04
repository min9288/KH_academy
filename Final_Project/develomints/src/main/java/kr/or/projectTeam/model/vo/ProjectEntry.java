package kr.or.projectTeam.model.vo;

import lombok.Data;

@Data
public class ProjectEntry {
	private int entryNo;
	private int memberNo;
	private int projectNo;
	private String ambition;
	private String applyContent;
	private String applyDate;
	private int entryStatus;
	private String imgPath;
	private int commentCount;
	private String memberId;
	private int memberGrade;
	private int availableNum;
	private int projectStatus;
	
}
