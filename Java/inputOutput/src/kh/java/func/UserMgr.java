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
		User u = new User("id0101", "pwpw1234", "유저", 30);
		// 객체를 내보내기 위한 보조스트림
		ObjectOutputStream oos = null;
		try {
			// 바이트로 직렬화된 객체를 내보내기위한 주스트림 생성
			FileOutputStream fos = new FileOutputStream("object.txt");
			// 주스트림으로 보조스트림 생성
			oos = new ObjectOutputStream(fos);
			// 객체를 내보내는 메소드
			oos.writeObject(u);
			System.out.println("객체 내보내기 완료");
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
		// 직렬화되어 내보낸 객체를 읽어오기 위한 보조스트림
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
