package kh.java.controller;
import java.util.ArrayList;
import java.util.Scanner;
import kh.java.vo.Student;

public class StudentMgr {
//	private ArrayList<ArrayList<Integer>> list  // ArrayList�� �̿��� 2���� �迭
	private Scanner sc;
	private Student[] arr;
	private int index;
	private ArrayList<Student> students;
	
	public StudentMgr() {
		super();
		sc = new Scanner(System.in);
		arr = new Student[10];
		index = 0;
		students = new ArrayList<Student>();
	}
	public void main() {
		while(true) {
			System.out.println("\n------ �л����� ���α׷� v2 -------\n");
			System.out.println("1. �л� ���� ���"); 
			System.out.println("2. �л� ���� ���(��ϵ� ��ü�л�)"); 
			System.out.println("3. �л� ���� ���(1�� �̸����� �˻�)"); 
			System.out.println("4. �л� ���� ����");	
			System.out.println("5. �л� ���� ����");	
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
		System.out.println("\n ======= �л� ���� ��� =======\n");
		System.out.print("1. �л� �̸� �Է� : ");
		String name = sc.next();
		System.out.print("2. �л� ���� �Է� : ");
		int age = sc.nextInt();
		System.out.print("3. �л� �ּ� �Է� : ");
		sc.nextLine();
		String addr = sc.nextLine();
		
//		arr[index++] = new Student(name, age, addr);
		Student s = new Student(name, age, addr);
		students.add(s);
		// students.add(new Student(name, age, addr));
		System.out.println("������� �Ϸ�!!");
	}
	public void printAllStudent() {
		System.out.println("\n ======= �л� ��ü ��� =======\n");
		System.out.println("�̸�\t����\t�ּ�");
		System.out.println("--------------------------------------");
//		for(int i = 0; i < index; i++) {
//			Student s = arr[i];
//			System.out.println(s.getName() +"\t"+ s.getAge() +"\t"+ s.getAddr());
//		}
//		for(int i = 0; i < students.size(); i++) {
//			Student s = students.get(i);
//			System.out.println(students.get(i));
//			System.out.println(s);  // == System.out.println(s.toString);
//		}
		for(Student s : students) {
			System.out.println(s);
		}
	}
	public void printOneStudent() {
		
		System.out.println("\n------ �л� ���� ���(1��) -------\n");
		System.out.print("��ȸ�� �л� �̸� �Է� : ");
		String searchName = sc.next();
		int searchIndex = searchStudent(searchName);
		
		if(searchIndex != -1) {
//			System.out.println("�̸� : "+arr[searchIndex].getName());
//			System.out.println("���� : "+arr[searchIndex].getAge());
//			System.out.println("�ּ� : "+arr[searchIndex].getAddr());
			System.out.println("�̸� : "+ students.get(searchIndex).getName());
			System.out.println("���� : "+ students.get(searchIndex).getAge());
			System.out.println("�ּ� : "+ students.get(searchIndex).getAddr());
		}else {
			System.out.println("�л� ������ �����ϴ�.");
		}
	}
	public void updateStudent() {
		System.out.println("\n------ �л� ���� ���� -------\n");
		System.out.print("������ �л� �̸� �Է� : ");
		String updateName = sc.next();
		int searchIndex = searchStudent(updateName);
		if(searchIndex != -1) {
			System.out.print("������ �л� �̸� �Է� : ");
			String name = sc.next();
			System.out.print("������ �л� ���� �Է� : ");
			int age = sc.nextInt();
			System.out.print("������ �л� �ּ� �Է� : ");
			sc.nextLine();
			String addr = sc.nextLine();
			// 1. setter�� �̿��ؼ� ��ü ������ �������� ���� 
//			arr[searchIndex].setName(name);
//			arr[searchIndex].setAge(age);
//			arr[searchIndex].setAddr(addr);
			students.get(searchIndex).setName(name);
			students.get(searchIndex).setAge(age);
			students.get(searchIndex).setAddr(addr);
			
			// 2. ���ο� ��ü�� �����ؼ� ��ü
//			arr[searchIndex] = new Student(name, age, addr);
			students.set(searchIndex, new Student(name, age, addr));
		}else {
			System.out.println("�л� ������ �����ϴ�.");
		}
		
	}
	public void deleteStudent() {
		System.out.println("\n------ �л� ���� ���� -------\n");
		System.out.print("������ �л� �̸� �Է� : ");
		String deleteName = sc.next();
		int searchIndex = searchStudent(deleteName);
		
		if(searchIndex != -1) {
//			for(int i = searchIndex; i > index - 1; i++) {
//				arr[i] = arr[i + 1];
//			}
//			arr[--index] = null;
			students.remove(searchIndex);
		}else {
			System.out.println("�л� ������ �����ϴ�.");
		}
	}
	public int searchStudent(String name) {
//		for(int i = 0; i < index; i++) {
//			if(arr[i].getName().equals(name)) {
//				return i;
//			}
		for(int i = 0; i < students.size(); i++) {
			if(students.get(i).getName().equals(name)) {
				return i;
			}
		}
		return -1;
	}
		
}
