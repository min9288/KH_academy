package kh.java.controller;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.Set;

import kh.java.view.StudentView;
import kh.java.vo.Student;

public class StudentController {
	private ArrayList<Student> students;
	private StudentView view;
	
	public StudentController() {
		super();
		students = new ArrayList<Student>();
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
				view.exit();
				return;
			default :
				view.incorrectInput();
			}
		}
	}
	public void insertStudent() {
		Student s = view.insertStudent();
		students.add(s);
		
	}
	public void printAllStudent() {
		
		view.printAllStudent(students);	
		
	}
	public void printOneStudent() {
		String name = view.getStudentName("조회");
		int searchIndex = searchStudent(name);
		
		if(searchIndex != -1) {
			view.printOneStudent(students.get(searchIndex));
		}else {
			view.noStudent();
		}
	}
	public void updateStudent() {
		String name = view.getStudentName("수정");
		int searchIndex = searchStudent(name);
		
		if(searchIndex != -1) {
			Student s = view.updateStudent();	
			students.set(searchIndex, s);
		}else {
			view.noStudent();
		}
	}
	public void deleteStudent() {
		String name = view.getStudentName("삭제");
		int searchIndex = searchStudent(name);
		
		if(searchIndex != -1){
			students.remove(searchIndex);
		}else {
			view.noStudent();
		}
	}
	public int searchStudent(String name) {
		for(int i = 0; i < students.size(); i++) {
			if(students.get(i).getName().equals(name)) {
				return i;
			}
		}
		return -1;
	}
}

