package kr.or.notice.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class NoticePageData {
	private ArrayList<Notice> fixlist;
	private int fixPage;
	private String pageNavi;
	private int start;
	private int totalCount;
	
	public NoticePageData(ArrayList<Notice> fixlist, int fixPage, String pageNavi, int start, int totalCount) {
		super();
		this.fixlist = fixlist;
		this.fixPage = fixPage;
		this.pageNavi = pageNavi;
		this.start = start;
		this.totalCount = totalCount;
	}
	
}
