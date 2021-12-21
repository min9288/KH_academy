package kr.or.projectTeam.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProjectTeamApplicantViewData {
	private ArrayList<ProjectTeamNoticeComment> commentList;
	private ProjectEntry pe;
	private ArrayList<UseDevelopLanguage> udlList;
}
