package lifestyle.model.vo;

import java.util.ArrayList;

public class LifestylePageData {
	private ArrayList<Lifestyle> list;
	private String pageNavi;
	private int start;
	public LifestylePageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LifestylePageData(ArrayList<Lifestyle> list, String pageNavi, int start) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
	}
	public ArrayList<Lifestyle> getList() {
		return list;
	}
	public void setList(ArrayList<Lifestyle> list) {
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
