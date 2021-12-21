package kr.or.projectTeam.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class projectTeamMainPageData {
	private ArrayList<ProjectTeam> list;
	private String pageNavi;
	private int start;
	private ArrayList<projectDevLanguage> pdLangList;
	private ArrayList<DevelopLanguage> developLangList;
	private ArrayList<String> langList;
}
