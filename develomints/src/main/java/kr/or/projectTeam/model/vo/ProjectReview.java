package kr.or.projectTeam.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class ProjectReview {
	private int reviewNo;
	private int teamMemberNo;
	private int projectNo;
	private int reviewPoint;
	private String reviewContent;
	private int reviewWriter;
	private String enrollDate;
	private int memberNo;
}
