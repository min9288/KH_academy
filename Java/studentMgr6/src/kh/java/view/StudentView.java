package kh.java.view;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;
import java.util.Set;

import kh.java.controller.StudentController;
import kh.java.vo.Student;

public class StudentView {
	private Scanner sc;
	ArrayList<Student> students;

	public StudentView() {
		super();
		sc = new Scanner(System.in);
		students = new ArrayList<Student>();
	}
	public int showMainMenu() {
		System.out.println("\n------ �л����� ���α׷� v5 -------\n");
		System.out.println("1. �л� ���� ���"); 
		System.out.println("2. �л� ���� ���(��ϵ� ��ü�л�)"); 
		System.out.println("3. �л� ���� ���(1�� �̸����� �˻�)"); 
		System.out.println("4. �л� ���� ����");	
		System.out.println("5. �л� ���� ����");	
		System.out.println("0. ���α׷� ����");
		System.out.print("���� > ");
		int sel = sc.nextInt();
		return sel;
	}
	public Student insertStudent() {
		System.out.println("\n ======= �л� ���� ��� =======\n");
		System.out.print("1. �л� �̸� �Է� : ");
		String name = sc.next();
		System.out.print("2. �л� ���� �Է� : ");
		int age = sc.nextInt();
		System.out.print("3. �л� �ּ� �Է� : ");
		sc.nextLine();
		String addr = sc.nextLine();
		
		Student s = new Student(name, age, addr);
		System.out.println("������� �Ϸ�!!");
		return s;
	}
	public void printAllStudent(ArrayList<Student> students) {
		System.out.println("\n ======= �л� ��ü ��� =======\n");
		System.out.println("�̸�\t����\t�ּ�");
		System.out.println("--------------------------------------");
		
		for(Student s : students) {
			System.out.println(s);
		}
	}
	public void printOneStudent(Student stu) {
		System.out.println("�̸� : "+ stu.getName());
		System.out.println("���� : "+ stu.getAge());
		System.out.println("�ּ� : "+ stu.getAddr());
	}
	public Student updateStudent() {
		System.out.print("������ �л� �̸� �Է� : ");
		String name = sc.next();
		System.out.print("������ �л� ���� �Է� : ");
		int age = sc.nextInt();
		System.out.print("������ �л� �ּ� �Է� : ");
		sc.nextLine();
		String addr = sc.nextLine();
		
		System.out.println("������ �Ϸ� �Ǿ����ϴ�.");
		
		Student s = new Student(name, age, addr);
		return s;
	}
	public void exit() {
		System.out.println("���α׷��� �����մϴ�.");
	}
	public void incorrectInput() {
		System.out.println("�� �� �Է��ϼ̽��ϴ�.");
	}
	public String getStudentName (String str) {
		System.out.println("\n------ �л� ����"+str+"-------\n");
		System.out.print(str+" �л� �̸� �Է� : ");
		String name = sc.next();
		return name;
	}
	public void noStudent() {
		System.out.println("�л� ������ �����ϴ�.");
	}
}
