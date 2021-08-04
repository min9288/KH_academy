package kh.java.func;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Scanner;

public class UserMgrList {
	Scanner sc;
	ArrayList<User> list;

	public UserMgrList() {
		super();
		sc = new Scanner(System.in);
		list = new ArrayList<User>();
		inList();
	}

	public void main() {
		while (true) {
			System.out.println("1. 회원 정보 추가");
			System.out.println("2. 회원정보 내보내기");
			System.out.println("3. 회원정보 불러오기");
			System.out.println("4. 회원정보 출력");
			System.out.println("선택 > ");
			int sel = sc.nextInt();
			switch (sel) {
			case 1:
				insertUser();
				break;
			case 2:
				outList();
				break;
			case 3:
				inList();
				break;
			case 4:
				printAllUser();
				break;
			}

		}
	}

	public void insertUser() {
		System.out.print("아이디 입력 : ");
		String id = sc.next();
		System.out.print("비밀번호 입력 : ");
		String pw = sc.next();
		System.out.print("이름 입력 : ");
		String name = sc.next();
		System.out.print("나이 입력 : ");
		int age = sc.nextInt();

		User u = new User(id, pw, name, age);
		list.add(u);
	}
	public void outList() {
		ObjectOutputStream oos = null;
		FileOutputStream fos;
		try {
			fos = new FileOutputStream("list.txt");
			oos = new ObjectOutputStream(fos);
			oos.writeObject(list);
			System.out.println("내보내기 완료");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				oos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	public void inList() {
		ObjectInputStream ois = null;
		
		try {
			FileInputStream fis = new FileInputStream("list.txt");
			ois = new ObjectInputStream(fis);
			list = (ArrayList<User>)ois.readObject();
			System.out.println("불러오기 완료");
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}finally {
			try {
				ois.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
				
	}

	public void printAllUser() {
		System.out.println("========= 전체 출력 =========");
		System.out.println("아이디\t비밀번호\t이름\t나이");
		for (User u : list) {
			System.out.println(u.getId() + "\t\t" + u.getPw() + "\t" + u.getName() + "\t" + u.getAge());
		}
	}
}
