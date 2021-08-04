package kh.java.controller;
import java.util.Scanner;
import kh.java.vo.Student;
public class StudentMgr {
	private Scanner sc;
	private Student[] students; // 학생정보를 저장하기위한 객체배열
	private int index;			// 배열을 관리하기위한 변수
	
	public StudentMgr() {
		sc = new Scanner(System.in);
		students = new Student[10];
		index = 0;				// 최초 학생정보를 등록하는 경우 0번 인덱스에 넣기위해 0으로 초기화
	}
	/* 메인메뉴 메소드 */
	public void main() {
		while(true) {
			System.out.println("\n------ 학생관리 프로그램 v1 -------\n");
			System.out.println("1. 학생 정보 등록"); // Create
			System.out.println("2. 학생 정보 출력(등록된 전체학생)"); // Read
			System.out.println("3. 학생 정보 출력(1명 이름으로 검색)"); // Read
			System.out.println("4. 학생 정보 수정");	// Update
			System.out.println("5. 학생 정보 삭제");	// Delete
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
		System.out.println("\n------ 학생 정보 등록 -------\n");
		System.out.print("1. 학생 이름 입력 : ");
		String name = sc.next();
		System.out.print("2. 학생 나이 입력 : ");
		int age = sc.nextInt();
		System.out.print("3. 학생 주소 입력 : ");
		sc.nextLine();
		String addr = sc.nextLine();
//		 입력받은 정보를 Student객체로 묶어서 students에 저장
//		 1) 기본생성자를 이용한 방법
//		Student s = new Student();
//		s.setName(name);
//		s.setAge(age);
//		s.setAddr(addr);
		
		// 2) 매개변수 있는 생성자를 이용한 방법
		Student s = new Student(name, age, addr);
		students[index] = s;
		index++;
//		students[index++] = new Student(name, age, addr); //  한 줄로도 작성 가능!
		System.out.println("정보등록 완료!");

	}
	public void printAllStudent() {
		System.out.println("\n------ 전체 학생 정보 출력 -------\n");
		System.out.println("이름\t나이\t주소");
		System.out.println("---------------------------------------");
		for(int i = 0; i < index; i++) {
			System.out.println(students[i].getName()+"\t"+students[i].getAge()+"\t"+students[i].getAddr());
		}
	}
	public void printOneStudent() {
		System.out.println("\n------ 학생 정보 출력(1명) -------\n");
		System.out.print("조회할 학생 이름 입력 : ");
		String searchName = sc.next();
		int searchIndex = searchIndex(searchName);
		if(searchIndex != -1) {
			System.out.println("이름 : "+students[searchIndex].getName());
			System.out.println("나이 : "+students[searchIndex].getAge());
			System.out.println("주소 : "+students[searchIndex].getAddr());
		}else {
			System.out.println("학생 정보가 없습니다.");
		}
		
		
//		Student s = null;
//		for(int i = 0; i < index; i++) {
//			if(students[i].getName().equals(searchName)) {
//				s = students[i];
//				break;
//			}
//		}
//		if(s != null) {
//			System.out.println("이름 : "+s.getName());
//			System.out.println("나이 : "+s.getAge());
//			System.out.println("주소 : "+s.getAddr());
//		}else {
//			System.out.println("학생 정보가 없습니다.");
//		}
	}
	public void updateStudent() {
		System.out.println("\n------ 학생 정보 수정 -------\n");
		System.out.print("수정할 학생 이름 입력 : ");
		String updateName = sc.next();
		int searchIndex = searchIndex(updateName);
		if(searchIndex != -1) {
			System.out.print("수정할 학생 이름 입력 : ");
			String name = sc.next();
			System.out.print("수정할 학생 나이 입력 : ");
			int age = sc.nextInt();
			System.out.print("수정할 학생 주소 입력 : ");
			sc.nextLine();
			String addr = sc.nextLine();
			students[searchIndex].setName(name);
			students[searchIndex].setAge(age);
			students[searchIndex].setAddr(addr);
			System.out.println("정보변경 완료");
		}else {
			System.out.println("학생 정보가 없습니다.");
		}
	}
	public void deleteStudent() {
		System.out.println("\n------ 학생 정보 삭제 -------\n");
		System.out.print("삭제할 학생 이름 입력 : ");
		String deleteName = sc.next();
		int searchIndex = searchIndex(deleteName);
		if(searchIndex != -1) {
			for(int i = searchIndex; i < index - 1; i++) {
				students[i] = students[i + 1];
			}
			index--;
			students[index] = null;
			System.out.println("삭제완료!");
		}else {
			System.out.println("학생 정보가 없습니다.");
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
