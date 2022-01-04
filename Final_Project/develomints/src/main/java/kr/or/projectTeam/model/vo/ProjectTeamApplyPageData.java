package kr.or.projectTeam.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProjectTeamApplyPageData {
	private ArrayList<ProjectEntry> entryList;
	private String pageNavi;
	private int start;
	private ArrayList<DevelopLanguage> developLangList;
	private ArrayList<UseDevelopLanguage> udLangList;
}
