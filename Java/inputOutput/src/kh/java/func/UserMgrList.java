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
			System.out.println("1. ȸ�� ���� �߰�");
			System.out.println("2. ȸ������ ��������");
			System.out.println("3. ȸ������ �ҷ�����");
			System.out.println("4. ȸ������ ���");
			System.out.println("���� > ");
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
		System.out.print("���̵� �Է� : ");
		String id = sc.next();
		System.out.print("��й�ȣ �Է� : ");
		String pw = sc.next();
		System.out.print("�̸� �Է� : ");
		String name = sc.next();
		System.out.print("���� �Է� : ");
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
			System.out.println("�������� �Ϸ�");
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
			System.out.println("�ҷ����� �Ϸ�");
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
		System.out.println("========= ��ü ��� =========");
		System.out.println("���̵�\t��й�ȣ\t�̸�\t����");
		for (User u : list) {
			System.out.println(u.getId() + "\t\t" + u.getPw() + "\t" + u.getName() + "\t" + u.getAge());
		}
	}
}
