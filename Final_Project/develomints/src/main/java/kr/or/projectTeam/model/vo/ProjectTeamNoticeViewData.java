package kr.or.projectTeam.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProjectTeamNoticeViewData {
	private ArrayList<ProjectTeamNoticeComment> list;
	private ProjectTeam pt;
	private ArrayList<projectDevLanguage> pdLangList;
}
