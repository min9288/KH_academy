package kr.or.projectTeam.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProjectTaskViewData {
	private ArrayList<ProjectTask> tasklist;
	private String pageNavi;
	private int start;
	private ArrayList<ProjectTeamMember> ptmList;
}
