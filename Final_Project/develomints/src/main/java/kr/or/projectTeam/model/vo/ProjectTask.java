package kr.or.projectTeam.model.vo;

import lombok.Data;

@Data

public class ProjectTask {
	private String taskNo;
	private int projectNo;
	private int teamMemberNo;
	private int taskSort;
	private String taskTitle;
	private String taskContent;
	private int priority;
	private String connectIssue;
	private String referLink;
	private String linkName;
	private String startDate;
	private String completeDate;
	private String endDate;
	private int processSort;
	private int memberNo;
	private String memberId;
}
