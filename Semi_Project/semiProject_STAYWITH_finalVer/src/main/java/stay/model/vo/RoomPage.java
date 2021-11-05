package stay.model.vo;
import java.util.ArrayList;


public class RoomPage {
	private ArrayList<Room> list;
	private String pageNavi;
	private int start;
	public RoomPage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RoomPage(ArrayList<Room> list, String pageNavi, int start) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.start = start;
	}
	public ArrayList<Room> getList() {
		return list;
	}
	public void setList(ArrayList<Room> list) {
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
