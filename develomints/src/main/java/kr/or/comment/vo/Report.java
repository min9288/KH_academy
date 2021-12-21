package kr.or.comment.vo;

import lombok.Data;

@Data
public class Report {
	
	public int reportNo;
	public String reporterId;
	public int reportReason;
	public String reportEtc;
	public int commentNo;
	public String commentId;
	public String reportDate;
	public int reportStatus;
	public String commentContent;
	public String enrollDate;
}
