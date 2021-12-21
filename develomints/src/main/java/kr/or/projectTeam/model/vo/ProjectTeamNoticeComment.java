package kr.or.projectTeam.model.vo;

import lombok.Data;

@Data
public class ProjectTeamNoticeComment {
	private int commentNo;
	private String memberId;
	private String commentContent;
	private String regDate;
	private int boardNo;
	private int boardType;
	private int commentType;
	private int commentRef;
	private String writerImgPath;
}
