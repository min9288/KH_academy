package kh.java.func;

import java.io.Serializable;

public class User implements Serializable{
	private static final long serialversionUID = 11111111L;
	private String id;
	private transient String  pw;		// transient가 설정된 변수는 직렬화 제외
	private String name;
	private int age;
	public User() {
		super();
	}
	public User(String id, String pw, String name, int age) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.age = age;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
}
