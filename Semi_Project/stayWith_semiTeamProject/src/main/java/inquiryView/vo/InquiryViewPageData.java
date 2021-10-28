package inquiryView.vo;

import java.util.ArrayList;

public class InquiryViewPageData {
	private ArrayList<InquiryView> list;
	private String pageNavi;
	private int start;
	public InquiryViewPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public InquiryViewPageData(ArrayList<InquiryView> list, String pageNavi, int start) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
	}
	public ArrayList<InquiryView> getList() {
		return list;
	}
	public void setList(ArrayList<InquiryView> list) {
		this.list = list;
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
