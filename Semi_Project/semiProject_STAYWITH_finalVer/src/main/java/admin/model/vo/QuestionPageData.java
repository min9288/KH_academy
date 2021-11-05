package admin.model.vo;

import java.util.ArrayList;

public class QuestionPageData 
{
	private ArrayList<Admin_Question> list;
	private String pageNavi;
	private int start;
	
	public QuestionPageData()
	{
		
	}
	
	
	public QuestionPageData(ArrayList<Admin_Question> list, String pageNavi, int start) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
	}


	public ArrayList<Admin_Question> getList() {
		return list;
	}
	public void setList(ArrayList<Admin_Question> list) {
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
