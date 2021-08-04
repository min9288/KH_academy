package kh.java.func;

public class Bclass extends Aclass {
	public String str;
	
	public Bclass() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Bclass(int num, int no, String str) {
		super(num, no);
		this.str = str;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	@Override
	public void testMsg() {
		System.out.println("³­ Bclass!!!");
	}
}
