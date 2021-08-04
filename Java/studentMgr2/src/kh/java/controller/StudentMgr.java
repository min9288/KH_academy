package kh.java.controller;
import java.util.ArrayList;
import java.util.Scanner;
import kh.java.vo.Student;

public class StudentMgr {
//	private ArrayList<ArrayList<Integer>> list  // ArrayList를 이용한 2차원 배열
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
			System.out.println("\n------ 학생관리 프로그램 v2 -------\n");
			System.out.println("1. 학생 정보 등록"); 
			System.out.println("2. 학생 정보 출력(등록된 전체학생)"); 
			System.out.println("3. 학생 정보 출력(1명 이름으로 검색)"); 
			System.out.println("4. 학생 정보 수정");	
			System.out.println("5. 학생 정보 삭제");	
			System.out.println("0. 프로그램 종료");
			System.out.print("선택 > ");
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
				System.out.println("잘 못 입력하셨습니다.");
			}
		}
	}
	public void insertStudent() {
		System.out.println("\n ======= 학생 정보 등록 =======\n");
		System.out.print("1. 학생 이름 입력 : ");
		String name = sc.next();
		System.out.print("2. 학생 나이 입력 : ");
		int age = sc.nextInt();
		System.out.print("3. 학생 주소 입력 : ");
		sc.nextLine();
		String addr = sc.nextLine();
		
//		arr[index++] = new Student(name, age, addr);
		Student s = new Student(name, age, addr);
		students.add(s);
		// students.add(new Student(name, age, addr));
		System.out.println("정보등록 완료!!");
	}
	public void printAllStudent() {
		System.out.println("\n ======= 학생 전체 출력 =======\n");
		System.out.println("이름\t나이\t주소");
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
		
		System.out.println("\n------ 학생 정보 출력(1명) -------\n");
		System.out.print("조회할 학생 이름 입력 : ");
		String searchName = sc.next();
		int searchIndex = searchStudent(searchName);
		
		if(searchIndex != -1) {
//			System.out.println("이름 : "+arr[searchIndex].getName());
//			System.out.println("나이 : "+arr[searchIndex].getAge());
//			System.out.println("주소 : "+arr[searchIndex].getAddr());
			System.out.println("이름 : "+ students.get(searchIndex).getName());
			System.out.println("나이 : "+ students.get(searchIndex).getAge());
			System.out.println("주소 : "+ students.get(searchIndex).getAddr());
		}else {
			System.out.println("학생 정보가 없습니다.");
		}
	}
	public void updateStudent() {
		System.out.println("\n------ 학생 정보 수정 -------\n");
		System.out.print("수정할 학생 이름 입력 : ");
		String updateName = sc.next();
		int searchIndex = searchStudent(updateName);
		if(searchIndex != -1) {
			System.out.print("수정할 학생 이름 입력 : ");
			String name = sc.next();
			System.out.print("수정할 학생 나이 입력 : ");
			int age = sc.nextInt();
			System.out.print("수정할 학생 주소 입력 : ");
			sc.nextLine();
			String addr = sc.nextLine();
			// 1. setter를 이용해서 객체 내부의 변수값을 변경 
//			arr[searchIndex].setName(name);
//			arr[searchIndex].setAge(age);
//			arr[searchIndex].setAddr(addr);
			students.get(searchIndex).setName(name);
			students.get(searchIndex).setAge(age);
			students.get(searchIndex).setAddr(addr);
			
			// 2. 새로운 객체를 생성해서 교체
//			arr[searchIndex] = new Student(name, age, addr);
			students.set(searchIndex, new Student(name, age, addr));
		}else {
			System.out.println("학생 정보가 없습니다.");
		}
		
	}
	public void deleteStudent() {
		System.out.println("\n------ 학생 정보 삭제 -------\n");
		System.out.print("삭제할 학생 이름 입력 : ");
		String deleteName = sc.next();
		int searchIndex = searchStudent(deleteName);
		
		if(searchIndex != -1) {
//			for(int i = searchIndex; i > index - 1; i++) {
//				arr[i] = arr[i + 1];
//			}
//			arr[--index] = null;
			students.remove(searchIndex);
		}else {
			System.out.println("학생 정보가 없습니다.");
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
