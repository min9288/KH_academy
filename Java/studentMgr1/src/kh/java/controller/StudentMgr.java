package kh.java.controller;
import java.util.Scanner;
import kh.java.vo.Student;
public class StudentMgr {
	private Scanner sc;
	private Student[] students; // �л������� �����ϱ����� ��ü�迭
	private int index;			// �迭�� �����ϱ����� ����
	
	public StudentMgr() {
		sc = new Scanner(System.in);
		students = new Student[10];
		index = 0;				// ���� �л������� ����ϴ� ��� 0�� �ε����� �ֱ����� 0���� �ʱ�ȭ
	}
	/* ���θ޴� �޼ҵ� */
	public void main() {
		while(true) {
			System.out.println("\n------ �л����� ���α׷� v1 -------\n");
			System.out.println("1. �л� ���� ���"); // Create
			System.out.println("2. �л� ���� ���(��ϵ� ��ü�л�)"); // Read
			System.out.println("3. �л� ���� ���(1�� �̸����� �˻�)"); // Read
			System.out.println("4. �л� ���� ����");	// Update
			System.out.println("5. �л� ���� ����");	// Delete
			System.out.println("0. ���α׷� ����");
			System.out.print("���� > ");
			int sel = sc.nextInt();
			
			switch(sel) {
			case 1 :
				insertStudent();
				break;
			case 2 :
				printAllStudent();
				break;
			case 3 :
				printOneStudent();
				break;
			case 4 :
				updateStudent();
				break;
			case 5 :
				deleteStudent();
				break;
			case 0 :
				System.out.println("Bye ~");
				return;
			default :
				System.out.println("�� �� �Է��ϼ̽��ϴ�.");
			}
		}
	}
	public void insertStudent() {
		System.out.println("\n------ �л� ���� ��� -------\n");
		System.out.print("1. �л� �̸� �Է� : ");
		String name = sc.next();
		System.out.print("2. �л� ���� �Է� : ");
		int age = sc.nextInt();
		System.out.print("3. �л� �ּ� �Է� : ");
		sc.nextLine();
		String addr = sc.nextLine();
//		 �Է¹��� ������ Student��ü�� ��� students�� ����
//		 1) �⺻�����ڸ� �̿��� ���
//		Student s = new Student();
//		s.setName(name);
//		s.setAge(age);
//		s.setAddr(addr);
		
		// 2) �Ű����� �ִ� �����ڸ� �̿��� ���
		Student s = new Student(name, age, addr);
		students[index] = s;
		index++;
//		students[index++] = new Student(name, age, addr); //  �� �ٷε� �ۼ� ����!
		System.out.println("������� �Ϸ�!");

	}
	public void printAllStudent() {
		System.out.println("\n------ ��ü �л� ���� ��� -------\n");
		System.out.println("�̸�\t����\t�ּ�");
		System.out.println("---------------------------------------");
		for(int i = 0; i < index; i++) {
			System.out.println(students[i].getName()+"\t"+students[i].getAge()+"\t"+students[i].getAddr());
		}
	}
	public void printOneStudent() {
		System.out.println("\n------ �л� ���� ���(1��) -------\n");
		System.out.print("��ȸ�� �л� �̸� �Է� : ");
		String searchName = sc.next();
		int searchIndex = searchIndex(searchName);
		if(searchIndex != -1) {
			System.out.println("�̸� : "+students[searchIndex].getName());
			System.out.println("���� : "+students[searchIndex].getAge());
			System.out.println("�ּ� : "+students[searchIndex].getAddr());
		}else {
			System.out.println("�л� ������ �����ϴ�.");
		}
		
		
//		Student s = null;
//		for(int i = 0; i < index; i++) {
//			if(students[i].getName().equals(searchName)) {
//				s = students[i];
//				break;
//			}
//		}
//		if(s != null) {
//			System.out.println("�̸� : "+s.getName());
//			System.out.println("���� : "+s.getAge());
//			System.out.println("�ּ� : "+s.getAddr());
//		}else {
//			System.out.println("�л� ������ �����ϴ�.");
//		}
	}
	public void updateStudent() {
		System.out.println("\n------ �л� ���� ���� -------\n");
		System.out.print("������ �л� �̸� �Է� : ");
		String updateName = sc.next();
		int searchIndex = searchIndex(updateName);
		if(searchIndex != -1) {
			System.out.print("������ �л� �̸� �Է� : ");
			String name = sc.next();
			System.out.print("������ �л� ���� �Է� : ");
			int age = sc.nextInt();
			System.out.print("������ �л� �ּ� �Է� : ");
			sc.nextLine();
			String addr = sc.nextLine();
			students[searchIndex].setName(name);
			students[searchIndex].setAge(age);
			students[searchIndex].setAddr(addr);
			System.out.println("�������� �Ϸ�");
		}else {
			System.out.println("�л� ������ �����ϴ�.");
		}
	}
	public void deleteStudent() {
		System.out.println("\n------ �л� ���� ���� -------\n");
		System.out.print("������ �л� �̸� �Է� : ");
		String deleteName = sc.next();
		int searchIndex = searchIndex(deleteName);
		if(searchIndex != -1) {
			for(int i = searchIndex; i < index - 1; i++) {
				students[i] = students[i + 1];
			}
			index--;
			students[index] = null;
			System.out.println("�����Ϸ�!");
		}else {
			System.out.println("�л� ������ �����ϴ�.");
		}
	}
	public int searchIndex(String name) {
		for(int i = 0; i < index; i++) {
			if(students[i].getName().equals(name)) {
				return i;
			}
		}
		return -1;
	}
}
