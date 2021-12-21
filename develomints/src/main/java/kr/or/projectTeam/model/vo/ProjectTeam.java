package kr.or.projectTeam.model.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProjectTeam {
	private int projectNo;
	private int projectWriterMemberNo;
	private String rStartDate;
	private String rEndDate;
	private int viewCount;
	private String rTitle;
	private String rContent;
	private String projectName;
	private String projectGoal;
	private String projectReader;
	private int projectStatus;
	private String pStartDate;
	private String pEndDate;
	private String writerImgPath;
	private String readerImgPath;
	private int commentCount;
	private int dibCount;
	private String projectWriterId;
	private int projectWriterGrade;
	private int dibCountClickValue;
	private int applyValue;
	private int finalApplyValue;
	private int myApplyValue;
	private int myEntryNo;
	private int writeReviewCheck;
}
