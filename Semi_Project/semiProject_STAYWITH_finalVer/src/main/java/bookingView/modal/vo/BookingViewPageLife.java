package bookingView.modal.vo;

import java.util.ArrayList;

public class BookingViewPageLife {
	private ArrayList<BookingViewLife> lfList;
	private String pageNavi;
	private int start;
	public BookingViewPageLife() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BookingViewPageLife(ArrayList<BookingViewLife> lfList, String pageNavi, int start) {
		super();
		this.lfList = lfList;
		this.pageNavi = pageNavi;
		this.start = start;
	}
	public ArrayList<BookingViewLife> getLfList() {
		return lfList;
	}
	public void setLfList(ArrayList<BookingViewLife> lfList) {
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
