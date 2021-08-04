package kh.java.func;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class CharStream {
	public void primaryStream() {
		Scanner sc = new Scanner(System.in);
		System.out.println("������ ���ϸ� �Է� : ");
		String fileName = sc.next();
		sc.nextLine();
		FileWriter fw = null;
		try {
			fw = new FileWriter(fileName);
			System.out.println("'"+fileName+"' ���Ͽ� ����� ���� �Է�");
			System.out.println("����� exit");
			int lineNumber = 1;
			while(true) {
				System.out.println((lineNumber++)+" : ");
				String str = sc.nextLine() + "\r\n";
				if(str.equals("exit\r\n")) {
					break;
				}
				// ���ڽ�Ʈ���� ���۴����� �����̹Ƿ� ����Ʈ�迭�� ��ȯ�� �ʿ� X
				fw.write(str);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				fw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	public void subStream() {
		Scanner sc = new Scanner(System.in);
		System.out.print("������ ���� �Է� : ");
		String fileName = sc.next();
		sc.nextLine();
		BufferedWriter bw = null;	// ���� ��Ʈ��
		
		
		try {
			// �ֽ�Ʈ�� ����
			FileWriter fw = new FileWriter(fileName);
			//������ �ֽ�Ʈ���� �̿��ؼ� ���� ��Ʈ�� ����
			bw = new BufferedWriter(fw);
			System.out.println("'"+fileName+"' ���Ͽ� ����� ���� �Է�");
			System.out.println("����� exit");
			int lineNumber = 1;
			while(true) {
				System.out.print((lineNumber++)+" : ");
				String str = sc.nextLine();
				if(str.equals("exit")) {
					break;
				}
				bw.write(str);	// ������Ʈ���� �̿��ؼ� ������ ����
				bw.newLine();   // ������Ʈ������ �����ϴ� �߰����� ��� (�� ����)
			}
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				bw.close();		// ������Ʈ���� �ݴ°�� �ֽ�Ʈ���� ���� ����
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	public void charStreamReader() {
		Scanner sc = new Scanner(System.in);
		// 1. ��Ʈ�� ���� -> 2. �޼ҵ带 �̿��� �Է� or ��� -> 3. �ڿ���ȯ
		System.out.print("�ε��� ���ϸ� �Է� : ");
		String fileName = sc.next();
		sc.nextLine();
		// �����͸� �о�� ������Ʈ��
		BufferedReader br = null;
		
		try {
			FileReader fr = new FileReader(fileName);
			// �� ��Ʈ���� �̿��ؼ� ������Ʈ�� ����
			br = new BufferedReader(fr);
			while(true) {
				// ���Ͽ��� 1���� �о��
				// �� �̻� �о�ð� ���� ��� null ����
				String str = br.readLine();
				if(str == null) {
					break;
				}
				System.out.println(str);
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				br.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
