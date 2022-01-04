package kr.or.contest.vo;

import java.util.ArrayList;
import java.util.List;

import kr.or.comment.vo.Comment;
import lombok.Data;

@Data
public class ContestList {
	private ArrayList<Contest> newContest;
	private ArrayList<Contest> hotContest;
	private ArrayList<Comment> commentList;
	private Contest contest;
	private ArrayList<Contest> contestList;
	private int start;
	private String pageNavi;
	private int totalCount;
	private ArrayList<ContestMember> cmList;
	private List<Integer> contestMemberCount;
	private int enrollCount; 
	
	public ContestList(ArrayList<Comment> commentList, Contest contest, int enrollCount) {
		super();
		this.commentList = commentList;
		this.contest = contest;
		this.enrollCount = enrollCount;
	}

	public ContestList(ArrayList<Contest> newContest, ArrayList<Contest> hotContest) {
		super();
		this.newContest = newContest;
		this.hotContest = hotContest;
	}

	public ContestList(ArrayList<Contest> contestList, int start, String pageNavi) {
		super();
		this.contestList = contestList;
		this.start = start;
		this.pageNavi = pageNavi;
	}

	public ContestList(ArrayList<Contest> contestList,int start, int totalCount, String pageNavi) {
		super();
		this.contestList = contestList;
		this.start = start;
		this.totalCount = totalCount;
		this.pageNavi = pageNavi;
	}

	public ContestList(ArrayList<Contest> contestList, String pageNavi, int totalCount,
			ArrayList<ContestMember> cmList) {
		super();
		this.contestList = contestList;
		this.pageNavi = pageNavi;
		this.totalCount = totalCount;
		this.cmList = cmList;
	}

	public ContestList(ArrayList<Contest> contestList, int start, String pageNavi, int totalCount,
			List<Integer> contestMemberCount) {
		super();
		this.contestList = contestList;
		this.start = start;
		this.pageNavi = pageNavi;
		this.totalCount = totalCount;
		this.contestMemberCount = contestMemberCount;
	}
	
	
	

	
	
	
}
