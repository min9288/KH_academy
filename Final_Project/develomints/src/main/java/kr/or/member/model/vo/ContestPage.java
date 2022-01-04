package kr.or.member.model.vo;

import java.util.ArrayList;

import kr.or.contest.vo.Contest;
import lombok.Data;

@Data
public class ContestPage {
	private ArrayList<MyContest> list;
	private String pageNavi;
	private int start;
	
	public ContestPage(ArrayList<MyContest> list, String pageNavi, int start) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
	}

}