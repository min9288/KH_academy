package kh.java.func;

public class StudentMgr {
	public void main() {
		// �⺻�����ڸ� �̿��� ���
		Student s1 = new Student();
		s1.setStuId(202101);
		s1.setName("���ο�");
		s1.setAge(30);
		s1.setAddr("����� ������");
		s1.setPhone("01087642440");
		s1.setGender('��');
		
		// �Ű����� �ִ� ������ �̿��� ���
		Student s2 = new Student(202102, "���μ�", 28, "����� ������", "01012345678", '��');
		
		Student s3[] = new Student[2];
		s3[0] = s2;
		s3[1] = new Student(202102, "���μ�", 28, "����� ������", "01012345678", '��');
		System.out.println(s3[0].getAge());
	}
}
