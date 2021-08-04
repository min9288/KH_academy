package kh.java.vo;

public class Vip extends Grade {

	public Vip() {
		super();		
	}
	public Vip(String grade, String name, int point) {
		super(grade, name, point);		
	}
	@Override
	public double getBonus() {
		return 0.07 * getPoint();
	}

}
