package kh.java.controller;

import java.util.HashMap;
import java.util.Scanner;
import java.util.Set;

import kh.java.vo.Student;

public class StudentController {
	private Scanner sc;
	private HashMap<String, Student> students;
	public StudentController() {
		super();
		sc = new Scanner(System.in);
		students = new HashMap<String, Student>();
	}
	public void main() {
		while(true) {
			System.out.println("\n------ �л����� ���α׷� v3 -------\n");
			System.out.println("1. �л� ���� ���"); 
			System.out.println("2. �л� ���� ���(��ϵ� ��ü�л�)"); 
			System.out.println("3. �л� ���� ���(1�� �̸����� �˻�)"); 
			System.out.println("4. �л� ���� ����");	
			System.out.println("5. �л� ���� ����");	
			System.out.println("0. ���α׷� ����");
			System.out.print("���� > ");
			int sel = sc.nextInt();
			System.out.println();
			
			switch (sel) {
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
				System.out.println("���α׷��� �����մϴ�.");
				return;
			default :
				System.out.println("�� �� �Է��ϼ̽��ϴ�.");
			}
		}
	}
	public void insertStudent() {
		System.out.println("\n ======= �л� ���� ��� =======\n");
		String name = "";
		while(true) {
			System.out.print("1. �л� �̸� �Է� : ");
			 name = sc.next();
			 if(!students.containsKey(name)) {
				 break;
			 }
		}
		System.out.print("2. �л� ���� �Է� : ");
		int age = sc.nextInt();
		System.out.print("3. �л� �ּ� �Է� : ");
		sc.nextLine();
		String addr = sc.nextLine();
		
		Student s = new Student(name, age, addr);
		students.put(name, s);
		System.out.println("������� �Ϸ�!!");
	}
	public void printAllStudent() {
		System.out.println("\n ======= �л� ��ü ��� =======\n");
		System.out.println("�̸�\t����\t�ּ�");
		System.out.println("--------------------------------------");
		
		Set<String> keys = students.keySet();
		for(String key : keys) {
			System.out.println(students.get(key));
		}
	}
	public void printOneStudent() {
		System.out.println("\n------ �л� ���� ���(1��) -------\n");
		System.out.print("��ȸ�� �л� �̸� �Է� : ");
		String searchName = sc.next();
		
		Student s = students.get(searchName);
		
		// ��� 1
		// containsKey �޼ҵ� ���
		boolean bool = students.containsKey(searchName);
		if(bool) {
			System.out.println("�̸� : "+ s.getName());
			System.out.println("���� : "+ s.getAge());
			System.out.println("�ּ� : "+ s.getAddr());
		}else {
			System.out.println("�л� ������ �����ϴ�.");
		}
		
		// ��� 2
		// map�� �������� �ʴ� key�� get�ϴ� ��� null�� ���ϵǴ°� �̿�
//		if (s != null) {
//			System.out.println("�̸� : "+ s.getName());
//			System.out.println("�̸� : "+ s.getAge());
//			System.out.println("�̸� : "+ s.getAddr());
//		}else {
//			System.out.println("�л� ������ �����ϴ�.");
//		}
	}
	public void updateStudent() {
		System.out.println("\n------ �л� ���� ���� -------\n");
		System.out.print("������ �л� �̸� �Է� : ");
		String updateName = sc.next();
		
		if(students.containsKey(updateName)) {
			
			System.out.print("������ �л� �̸� �Է� : ");
			String name = sc.next();
			System.out.print("������ �л� ���� �Է� : ");
			int age = sc.nextInt();
			System.out.print("������ �л� �ּ� �Է� : ");
			sc.nextLine();
			String addr = sc.nextLine();
			
		
			
			if(updateName.equals(name)) {
				// �̸��� ������� �ʴ� ���
				// 1) setter�� ���ؼ� Student ��ü ������ ���� ���� ����, ���� ���� �ּҴ� ����	
				// -> ���ο�.�ּ�1 => ���ο�.�ּ�1
//				Student s = students.get(updateName);
//				s.setName(name); // �̸��� ���� �������
//				s.setAge(age);
//				s.setAddr(addr);
				
				// 2) �������̵� (�����)�� ��ü ���� ���� �� ����, ���� �ּҵ� �����
				// -> ���ο�.�ּ�1 => ���ο�.�ּ�2
				Student s = new Student(name, age, addr);
				students.put(name, s);
				
				
				
			}else {
				// �̸��� ����Ǵ� ���1 -> key�� ����
				// ���� Ű�� �ش��ϴ� ������ ����
				students.remove(updateName);
				// ���� ��ü�� �����ؼ� map�� ���
				Student s = new Student(name, age, addr);
				students.put(name, s);
			
			}
			// �̸��� ����Ǵ� ��� 2
//			Student s = new Student(name, age, addr);
//			students.put(name, s);
//			if(!updateName.equals(name)) {
//				students.remove(updateName);
//			}
		}else {
			System.out.println("�л� ������ �����ϴ�.");
		}
	}
	public void deleteStudent() {
		System.out.println("\n------ �л� ���� ���� -------\n");
		System.out.print("������ �л� �̸� �Է� : ");
		String deleteName = sc.next();
		
		if(students.containsKey(deleteName)) {
			students.remove(deleteName);
		}else {
			System.out.println("�л� ������ �����ϴ�.");
		}
	}
}

