package kh.java.func;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Scanner;

public class UserMgr {

	public void test1() {
		User u = new User("id0101", "pwpw1234", "����", 30);
		// ��ü�� �������� ���� ������Ʈ��
		ObjectOutputStream oos = null;
		try {
			// ����Ʈ�� ����ȭ�� ��ü�� ������������ �ֽ�Ʈ�� ����
			FileOutputStream fos = new FileOutputStream("object.txt");
			// �ֽ�Ʈ������ ������Ʈ�� ����
			oos = new ObjectOutputStream(fos);
			// ��ü�� �������� �޼ҵ�
			oos.writeObject(u);
			System.out.println("��ü �������� �Ϸ�");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				oos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	public void test2() {
		// ����ȭ�Ǿ� ������ ��ü�� �о���� ���� ������Ʈ��
		ObjectInputStream ois = null;
		try {
			FileInputStream fis = new FileInputStream("object.txt");
			ois = new ObjectInputStream(fis);
			
			User user = (User)ois.readObject();
			System.out.println(user.getId());
			System.out.println(user.getPw());
			System.out.println(user.getName());
			System.out.println(user.getAge());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
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
}
