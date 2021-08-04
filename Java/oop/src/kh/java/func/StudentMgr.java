package kh.java.func;

public class StudentMgr {
	public void main() {
		// 기본생성자를 이용한 방식
		Student s1 = new Student();
		s1.setStuId(202101);
		s1.setName("정민우");
		s1.setAge(30);
		s1.setAddr("서울시 강서구");
		s1.setPhone("01087642440");
		s1.setGender('남');
		
		// 매개변수 있는 생성자 이용한 방식
		Student s2 = new Student(202102, "정민수", 28, "서울시 강남구", "01012345678", '남');
		
		Student s3[] = new Student[2];
		s3[0] = s2;
		s3[1] = new Student(202102, "정민수", 28, "서울시 강남구", "01012345678", '남');
		System.out.println(s3[0].getAge());
	}
}
