package admin.model.vo;

import java.util.ArrayList;

public class Room_ResPageData 
{
	private ArrayList<Room_Res> list;
	private String pageNavi;
	private int start;
	
	public Room_ResPageData()
	{
		
	}
	
	public Room_ResPageData(ArrayList<Room_Res> list, String pageNavi, int start) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
	}
	public ArrayList<Room_Res> getList() {
		return list;
	}
	public void setList(ArrayList<Room_Res> list) {
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
