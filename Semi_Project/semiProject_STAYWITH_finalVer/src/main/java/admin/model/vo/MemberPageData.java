package admin.model.vo;

import java.util.ArrayList;

public class MemberPageData 
{
	private ArrayList<Admin_Member> list;
	private String pageNavi;
	private int start;
	
	public MemberPageData()
	{
		
	}
	public MemberPageData(ArrayList<Admin_Member> list, String pageNavi, int start) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
	}
	
	public ArrayList<Admin_Member> getList() {
		return list;
	}
	public void setList(ArrayList<Admin_Member> list) {
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
