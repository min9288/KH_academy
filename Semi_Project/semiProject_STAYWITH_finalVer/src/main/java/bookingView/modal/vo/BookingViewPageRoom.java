package bookingView.modal.vo;

import java.util.ArrayList;

public class BookingViewPageRoom {
	private ArrayList<BookingViewRoom> rList;
	private String pageNavi;
	private int start;
	public BookingViewPageRoom() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookingViewPageRoom(ArrayList<BookingViewRoom> rList, String pageNavi, int start) {
		super();
		this.rList = rList;
		this.pageNavi = pageNavi;
		this.start = start;
	}
	public ArrayList<BookingViewRoom> getrList() {
		return rList;
	}
	public void setrList(ArrayList<BookingViewRoom> rList) {
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
