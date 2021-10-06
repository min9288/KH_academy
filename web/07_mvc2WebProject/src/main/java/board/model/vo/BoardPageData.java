package board.model.vo;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import common.JDBCTemplate;

public class BoardPageData {
	private ArrayList<Board> list;
	private String pageNavi;
	private int start;
	public BoardPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardPageData(ArrayList<Board> list, String pageNavi, int start) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
	}
	public ArrayList<Board> getList() {
		return list;
	}
	public void setList(ArrayList<Board> list) {
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
