package notice.model.vo;

import java.util.ArrayList;

public class NoticeViewData {
	private ArrayList<NoticeComment> list;
	private Notice n;
	public NoticeViewData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeViewData(ArrayList<NoticeComment> list, Notice n) {
		super();
		this.list = list;
		this.n = n;
	}
	public ArrayList<NoticeComment> getList() {
		return list;
	}
	public void setList(ArrayList<NoticeComment> list) {
		this.list = list;
	}
	public Notice getN() {
		return n;
	}
	public void setN(Notice n) {
		this.n = n;
	}
	
	
	
}
