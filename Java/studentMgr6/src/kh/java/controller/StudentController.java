package kh.java.controller;

import java.util.ArrayList;
import java.util.Scanner;
import java.util.Set;

import kh.java.view.StudentView;
import kh.java.vo.Student;

public class StudentController {
	public ArrayList<Student> students;
	public StudentView view;
	
	public StudentController() {
		super();
		students = new ArrayList<Student>();
		view = new StudentView();
	}
	
	public void main() {
		while(true) {
			switch(view.showMainMenu()) {
			case 1 :
				insertStudent();
				break;
			case 2 :
				break;
			case 3 :
				break;
			case 4 :
				break;
			case 5 :
				break;
			case 0 :
				view.exit();
				return;
				
			}
		}
	}
	
	public void insertStudent() {
		Student s = view.insertStudent();
		students.add(s);
	}
	
}

