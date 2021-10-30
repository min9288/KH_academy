package review.modal.vo;

import java.util.ArrayList;


public class LifeReviewPage {
	private ArrayList<LifeReview> lfList;
	private String pageNavi;
	private int start;
	public LifeReviewPage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LifeReviewPage(ArrayList<LifeReview> lfList, String pageNavi, int start) {
		super();
		this.lfList = lfList;
		this.pageNavi = pageNavi;
		this.start = start;
	}
	public ArrayList<LifeReview> getLfList() {
		return lfList;
	}
	public void setLfList(ArrayList<LifeReview> lfList) {
		this.lfList = lfList;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	
	
}
