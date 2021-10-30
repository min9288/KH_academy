package review.modal.vo;

import java.util.ArrayList;


public class DiningReviewPage {
	private ArrayList<DiningReview> dList;
	private String pageNavi;
	private int start;
	public DiningReviewPage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DiningReviewPage(ArrayList<DiningReview> dList, String pageNavi, int start) {
		super();
		this.dList = dList;
		this.pageNavi = pageNavi;
		this.start = start;
	}
	public ArrayList<DiningReview> getdList() {
		return dList;
	}
	public void setdList(ArrayList<DiningReview> dList) {
		this.dList = dList;
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
