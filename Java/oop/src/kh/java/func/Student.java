package kh.java.func;
// VO Ŭ����
public class Student {
	// �������� 6�� ����
	// �⺻������, �Ű����� 6�� ���� ������
	// getter, setter
	private int stuId, age;
	private String name, addr, phone;
	private char gender;
	
	public Student() {
		
	}
	public Student(int stuId, String name, int age, String addr, String phone, char gender) {
		this.stuId = stuId;
		this.name = name;
		this.age = age;
		this.addr = addr;
		this.phone = phone;
		this.gender = gender;
	}
	
	public int getStuId() {
		return stuId;
	}
	public void setStuId(int stuId) {
		this.stuId = stuId;
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
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	
}
