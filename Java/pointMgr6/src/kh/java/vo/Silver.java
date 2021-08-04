package kh.java.vo;

public class Silver extends Grade{

	public Silver() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Silver(String grade, String name, int point) {
		super(grade, name, point);
		// TODO Auto-generated constructor stub
	}
	@Override
	public double getBonus() {
		return 0.02 * getPoint();
	}
}
