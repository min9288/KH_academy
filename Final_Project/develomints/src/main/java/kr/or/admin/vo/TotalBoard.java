package kr.or.admin.vo;

import java.util.ArrayList;
import java.util.List;

import kr.or.announce.vo.Announce;
import kr.or.contest.vo.Contest;
import kr.or.gosu.vo.GosuNotice;
import kr.or.projectTeam.model.vo.ProjectTeam;
import kr.or.share.model.vo.Share;
import lombok.Data;

@Data
public class TotalBoard {
	private String pageNavi;
	private int totalCount;
	private int start;
	private ArrayList<Share> shareList;
	private ArrayList<ProjectTeam> projectList;
	private ArrayList<Announce> announceList;
	private ArrayList<GosuNotice> gosuList;
	private ArrayList<Contest> contesetList;
	private int allBoardCount;
	private String  bestMember;
	private List<Integer> countList5;
	private List<String> weekList;
}
