package review.modal.vo;

import java.util.ArrayList;


public class RoomReviewPage {
	private ArrayList<RoomReview> rList;
	private String pageNavi;
	private int start;
	public RoomReviewPage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RoomReviewPage(ArrayList<RoomReview> rList, String pageNavi, int start) {
		super();
		this.rList = rList;
		this.pageNavi = pageNavi;
		this.start = start;
	}
	public ArrayList<RoomReview> getrList() {
		return rList;
	}
	public void setrList(ArrayList<RoomReview> rList) {
		this.rList = rList;
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
