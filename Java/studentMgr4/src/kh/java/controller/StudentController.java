package kh.java.controller;

import java.util.HashMap;
import java.util.Scanner;
import java.util.Set;

import kh.java.view.StudentView;
import kh.java.vo.Student;

public class StudentController {
	private HashMap<String, Student> students;
	private StudentView view;
	
	public StudentController() {
		super();
		students = new HashMap<String, Student>();
		view = new StudentView();
	}
	public void main() {
		while(true) {
			int sel = view.showMainMenu();
			
			
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
				System.out.println("프로그램을 종료합니다.");
				return;
			default :
				System.out.println("잘 못 입력하셨습니다.");
			}
		}
	}
	public void insertStudent() {
		
		Student stu = view.insertStudent();
		students.put(stu.getName(), stu);
		System.out.println("정보등록 완료!!");
		
	}
	public void printAllStudent() {
		
		view.printAllStudent(students);	
		
	}
	public void printOneStudent() {
		String name = view.getStudentName("조회");
		
		if(students.containsKey(name)) {
			// 학생이 있는 경우
			Student s = students.get(name);
			view.printOneStudent(s);
		}else {
			// 학생이 없는 경우
			view.noStudent();
		}
	}
	public void updateStudent() {
		String name = view.getStudentName("수정");
		
		if(students.containsKey(name)) {
			Student s = view.updateStudent();		
			students.put(s.getName(), s);
			if(!s.getName().equals(name)) {
				students.remove(name);	
			}
		}else {
			view.noStudent();
		}
	}
	public void deleteStudent() {
		String name = view.getStudentName("삭제");
		
		if(students.containsKey(name)){
			students.remove(name);
		}else {
			view.noStudent();
		}
	}
}

