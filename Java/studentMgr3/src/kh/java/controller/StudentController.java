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
			System.out.println("\n------ 학생관리 프로그램 v3 -------\n");
			System.out.println("1. 학생 정보 등록"); 
			System.out.println("2. 학생 정보 출력(등록된 전체학생)"); 
			System.out.println("3. 학생 정보 출력(1명 이름으로 검색)"); 
			System.out.println("4. 학생 정보 수정");	
			System.out.println("5. 학생 정보 삭제");	
			System.out.println("0. 프로그램 종료");
			System.out.print("선택 > ");
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
				System.out.println("프로그램을 종료합니다.");
				return;
			default :
				System.out.println("잘 못 입력하셨습니다.");
			}
		}
	}
	public void insertStudent() {
		System.out.println("\n ======= 학생 정보 등록 =======\n");
		String name = "";
		while(true) {
			System.out.print("1. 학생 이름 입력 : ");
			 name = sc.next();
			 if(!students.containsKey(name)) {
				 break;
			 }
		}
		System.out.print("2. 학생 나이 입력 : ");
		int age = sc.nextInt();
		System.out.print("3. 학생 주소 입력 : ");
		sc.nextLine();
		String addr = sc.nextLine();
		
		Student s = new Student(name, age, addr);
		students.put(name, s);
		System.out.println("정보등록 완료!!");
	}
	public void printAllStudent() {
		System.out.println("\n ======= 학생 전체 출력 =======\n");
		System.out.println("이름\t나이\t주소");
		System.out.println("--------------------------------------");
		
		Set<String> keys = students.keySet();
		for(String key : keys) {
			System.out.println(students.get(key));
		}
	}
	public void printOneStudent() {
		System.out.println("\n------ 학생 정보 출력(1명) -------\n");
		System.out.print("조회할 학생 이름 입력 : ");
		String searchName = sc.next();
		
		Student s = students.get(searchName);
		
		// 방법 1
		// containsKey 메소드 사용
		boolean bool = students.containsKey(searchName);
		if(bool) {
			System.out.println("이름 : "+ s.getName());
			System.out.println("나이 : "+ s.getAge());
			System.out.println("주소 : "+ s.getAddr());
		}else {
			System.out.println("학생 정보가 없습니다.");
		}
		
		// 방법 2
		// map이 존재하지 않는 key를 get하는 경우 null이 리턴되는걸 이용
//		if (s != null) {
//			System.out.println("이름 : "+ s.getName());
//			System.out.println("이름 : "+ s.getAge());
//			System.out.println("이름 : "+ s.getAddr());
//		}else {
//			System.out.println("학생 정보가 없습니다.");
//		}
	}
	public void updateStudent() {
		System.out.println("\n------ 학생 정보 수정 -------\n");
		System.out.print("수정할 학생 이름 입력 : ");
		String updateName = sc.next();
		
		if(students.containsKey(updateName)) {
			
			System.out.print("수정할 학생 이름 입력 : ");
			String name = sc.next();
			System.out.print("수정할 학생 나이 입력 : ");
			int age = sc.nextInt();
			System.out.print("수정할 학생 주소 입력 : ");
			sc.nextLine();
			String addr = sc.nextLine();
			
		
			
			if(updateName.equals(name)) {
				// 이름이 변경되지 않는 경우
				// 1) setter를 통해서 Student 객체 내부의 변수 값만 변경, 기존 값의 주소는 유지	
				// -> 정민우.주소1 => 정민우.주소1
//				Student s = students.get(updateName);
//				s.setName(name); // 이름은 빼도 상관없음
//				s.setAge(age);
//				s.setAddr(addr);
				
				// 2) 오버라이드 (덮어쓰기)로 객체 내부 변수 값 변경, 값의 주소도 변경됨
				// -> 정민우.주소1 => 정민우.주소2
				Student s = new Student(name, age, addr);
				students.put(name, s);
				
				
				
			}else {
				// 이름이 변경되는 경우1 -> key가 변경
				// 기존 키에 해당하는 데이터 삭제
				students.remove(updateName);
				// 새로 객체를 생성해서 map에 등록
				Student s = new Student(name, age, addr);
				students.put(name, s);
			
			}
			// 이름이 변경되는 경우 2
//			Student s = new Student(name, age, addr);
//			students.put(name, s);
//			if(!updateName.equals(name)) {
//				students.remove(updateName);
//			}
		}else {
			System.out.println("학생 정보가 없습니다.");
		}
	}
	public void deleteStudent() {
		System.out.println("\n------ 학생 정보 삭제 -------\n");
		System.out.print("삭제할 학생 이름 입력 : ");
		String deleteName = sc.next();
		
		if(students.containsKey(deleteName)) {
			students.remove(deleteName);
		}else {
			System.out.println("학생 정보가 없습니다.");
		}
	}
}

