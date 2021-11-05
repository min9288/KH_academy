package dining.model.vo;

import java.util.ArrayList;

public class DiningListData {
	private ArrayList<Dining> list;	
	private String pageNavi;
	private int start;
	public DiningListData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DiningListData(ArrayList<Dining> list, String pageNavi, int start) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
	}
	public ArrayList<Dining> getList() {
		return list;
	}
	public void setList(ArrayList<Dining> list) {
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
