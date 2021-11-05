package admin.model.vo;

import java.util.ArrayList;

public class Lf_ResPageData 
{
	private ArrayList<Lf_Res> list;
	private String pageNavi;
	private int start;
	
	public Lf_ResPageData()
	{
		
	}	
	
	public Lf_ResPageData(ArrayList<Lf_Res> list, String pageNavi, int start) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
	}
	public ArrayList<Lf_Res> getList() {
		return list;
	}
	public void setList(ArrayList<Lf_Res> list) {
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
