package bookingView.modal.vo;

import java.util.ArrayList;

public class BookingViewPageDining {
	private ArrayList<BookingViewDining> dList;
	private String pageNavi;
	private int start;
	public BookingViewPageDining() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookingViewPageDining(ArrayList<BookingViewDining> dList, String pageNavi, int start) {
		super();
		this.dList = dList;
		this.pageNavi = pageNavi;
		this.start = start;
	}
	public ArrayList<BookingViewDining> getdList() {
		return dList;
	}
	public void setdList(ArrayList<BookingViewDining> dList) {
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
