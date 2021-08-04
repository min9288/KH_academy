package kh.java.func;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

public class StreamTest {
	public void test1() {
		// quiz.txt. ���Ͽ� �ִ� ������ �о���� ���� ���� ��Ʈ��
		BufferedReader br = null;
		// �о�� ������ ��ȯ�ؼ� �̹����� ������������ ���� ��Ʈ��
		BufferedOutputStream bos = null;
		try {
			// quiz.txt ������ �о���� ���� �ֽ�Ʈ�� ����
			FileReader fr = new FileReader("quiz.txt");
			// �ֽ�Ʈ���� �̿��� ������Ʈ�� ����
			br = new BufferedReader(fr);
			// quiz.txt ���� 1�� �о�� (������ 1�� ¥����)
			String str = br.readLine();
			ArrayList<Byte> al = new ArrayList<Byte>();
			StringTokenizer sT = new StringTokenizer(str, " ");
			while (sT.hasMoreTokens()) {
				String num = sT.nextToken();
				int iNum = Integer.parseInt(num, 16);
				al.add((byte) iNum);
			}
			System.out.println("����Ʈ ���� : " + al.size());
			// �̹������Ϸ� �������� ���� �ֽ�Ʈ��
			FileOutputStream fos = new FileOutputStream("test.gif");
			bos = new BufferedOutputStream(fos);
			for (Byte b : al) {
				bos.write(b);
			}
			System.out.println("���� �������� �Ϸ�");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
				bos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
	}

	public void test2() {
		// quiz.txt. ���Ͽ� �ִ� ������ �о���� ���� �� ��Ʈ��
		FileReader fr = null;
		FileOutputStream fos = null;
		try {
			fr = new FileReader("quiz.txt");
			StringBuffer sb = new StringBuffer();
			while (true) {
				// ���� 1���� ����Ÿ������ �о��
				// �о�� ���� ���� ��� -1�� ����
				int data = fr.read();
				if (data == -1) {
					break;
				}
				sb.append((char) data);
			}
			ArrayList<Byte> al = new ArrayList<Byte>();
			StringTokenizer sT = new StringTokenizer(sb.toString(), " ");
			while (sT.hasMoreTokens()) {
				String num = sT.nextToken();
				int iNum = Integer.parseInt(num, 16);
				al.add((byte) iNum);
			}
			System.out.println("����Ʈ ���� : " + al.size());
			fos = new FileOutputStream("test1.gif");
			for (Byte b : al) {
				fos.write(b);
			}
			System.out.println("���� �������� �Ϸ�");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fr.close();
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
