package kr.or.member.model.vo;

import java.util.ArrayList;

import kr.or.gosu.vo.GosuNotice;
import lombok.Data;

@Data
public class GosuNoticePage {
	private ArrayList<GosuNotice> list;
	private String pageNavi;
	private int start;
	
	public GosuNoticePage(ArrayList<GosuNotice> list, String pageNavi, int start) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
	}
	
}
