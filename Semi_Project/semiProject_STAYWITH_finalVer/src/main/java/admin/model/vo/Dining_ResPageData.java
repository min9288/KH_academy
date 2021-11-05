package admin.model.vo;

import java.util.ArrayList;

public class Dining_ResPageData 
{
	private ArrayList<Dining_Res> list;
	private String pageNavi;
	private int start;
	
	public Dining_ResPageData()
	{
		
	}
	
	public Dining_ResPageData(ArrayList<Dining_Res> list, String pageNavi, int start) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
	}
	public ArrayList<Dining_Res> getList() {
		return list;
	}
	public void setList(ArrayList<Dining_Res> list) {
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
