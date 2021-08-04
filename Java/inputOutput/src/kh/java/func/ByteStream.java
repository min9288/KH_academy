package kh.java.func;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Scanner;

public class ByteStream {
	public void primaryStream() {
		Scanner sc = new Scanner(System.in);
		System.out.print("������ ���ϸ� �Է� : ");
		String fileName = sc.next();
		sc.nextLine();
		FileOutputStream fos = null;
		try {
			// �Է¹��� ���ϸ����� ������ �����ϰ� -> ������ �����̶� stream ����
//			fos = new FileOutputStream("C:\\Users\\admin\\Desktop\\"+fileName);			// ���� ������� �����ϴ� ���
			fos = new FileOutputStream(fileName);
			System.out.println("["+fileName+"] ���Ͽ� ����� ���� �Է�");
			System.out.println("����� exit �Է�");
			int lineNumber = 1;
			while(true) {
				System.out.print((lineNumber++)+" : ");
				String str = sc.nextLine()+"\r\n"; // window ���๮�� �߰�
				if(str.equals("exit\r\n")) {
					break;
				}
				// ���Ͽ� �Է¹��� ���� ���� �޼ҵ�
				// ���ڿ�.getBytes() -> ���ڿ��� ����Ʈ �迭�� ��ȯ�ϴ� �޼ҵ�
				fos.write(str.getBytes());
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
