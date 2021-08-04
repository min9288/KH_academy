package kh.java.vo;

public class Silver {
	private String grade;
	private String name;
	private int point;
	
	public Silver() {
		super();		
	}
	public Silver(String grade, String name, int point) {
		super();
		this.grade = grade;
		this.name = name;
		this.point = point;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public double getBonus() {
		return 0.02 * point;
	}
}
