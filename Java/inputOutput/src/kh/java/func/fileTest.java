package kh.java.func;

import java.io.File;
import java.util.Scanner;

public class fileTest {
	public void fileTest() {
		Scanner sc = new Scanner(System.in);
		System.out.print("���ϸ� �Է� : ");
		String fileName = sc.next();
		File file = new File(fileName);
		
		if (file.exists()) { // exists() -> �ش������� �����ϸ� true, �������� ������ false
			System.out.println("���ϸ� : " + file.getName());
			System.out.println("���� ��� ��� : " + file.getPath());
			System.out.println("���� ���� ��� : " + file.getAbsolutePath());
			System.out.println("���� ũ�� : " + file.length() + "Byte");
			System.out.println("������ �����Ͻðڽ��ϱ�(1. ����, 2.����)? ");
			int sel = sc.nextInt();
			if(sel == 1) {
				boolean bool =  file.delete();	// ������ �����ϰ� ����� ���� (�������� -> true / �������� -> false)
				System.out.println(bool);
			}
		} else {
			System.out.println("���� ����");
		}
	}
}
