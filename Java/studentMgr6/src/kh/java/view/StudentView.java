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
		System.out.println("\n------ 학생관리 프로그램 v5 -------\n");
		System.out.println("1. 학생 정보 등록"); 
		System.out.println("2. 학생 정보 출력(등록된 전체학생)"); 
		System.out.println("3. 학생 정보 출력(1명 이름으로 검색)"); 
		System.out.println("4. 학생 정보 수정");	
		System.out.println("5. 학생 정보 삭제");	
		System.out.println("0. 프로그램 종료");
		System.out.print("선택 > ");
		int sel = sc.nextInt();
		return sel;
	}
	public Student insertStudent() {
		System.out.println("\n ======= 학생 정보 등록 =======\n");
		System.out.print("1. 학생 이름 입력 : ");
		String name = sc.next();
		System.out.print("2. 학생 나이 입력 : ");
		int age = sc.nextInt();
		System.out.print("3. 학생 주소 입력 : ");
		sc.nextLine();
		String addr = sc.nextLine();
		
		Student s = new Student(name, age, addr);
		System.out.println("정보등록 완료!!");
		return s;
	}
	public void printAllStudent(ArrayList<Student> students) {
		System.out.println("\n ======= 학생 전체 출력 =======\n");
		System.out.println("이름\t나이\t주소");
		System.out.println("--------------------------------------");
		
		for(Student s : students) {
			System.out.println(s);
		}
	}
	public void printOneStudent(Student stu) {
		System.out.println("이름 : "+ stu.getName());
		System.out.println("나이 : "+ stu.getAge());
		System.out.println("주소 : "+ stu.getAddr());
	}
	public Student updateStudent() {
		System.out.print("수정할 학생 이름 입력 : ");
		String name = sc.next();
		System.out.print("수정할 학생 나이 입력 : ");
		int age = sc.nextInt();
		System.out.print("수정할 학생 주소 입력 : ");
		sc.nextLine();
		String addr = sc.nextLine();
		
		System.out.println("수정이 완료 되었습니다.");
		
		Student s = new Student(name, age, addr);
		return s;
	}
	public void exit() {
		System.out.println("프로그램을 종료합니다.");
	}
	public void incorrectInput() {
		System.out.println("잘 못 입력하셨습니다.");
	}
	public String getStudentName (String str) {
		System.out.println("\n------ 학생 정보"+str+"-------\n");
		System.out.print(str+" 학생 이름 입력 : ");
		String name = sc.next();
		return name;
	}
	public void noStudent() {
		System.out.println("학생 정보가 없습니다.");
	}
}
