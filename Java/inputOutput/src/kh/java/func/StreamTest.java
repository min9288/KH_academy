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
		// quiz.txt. 파일에 있는 내용을 읽어오기 위한 보조 스트림
		BufferedReader br = null;
		// 읽어온 파일을 변환해서 이미지로 내보내기위한 보조 스트림
		BufferedOutputStream bos = null;
		try {
			// quiz.txt 파일을 읽어오기 위한 주스트림 생성
			FileReader fr = new FileReader("quiz.txt");
			// 주스트림을 이용한 보조스트림 생성
			br = new BufferedReader(fr);
			// quiz.txt 파일 1줄 읽어옴 (파일이 1줄 짜리임)
			String str = br.readLine();
			ArrayList<Byte> al = new ArrayList<Byte>();
			StringTokenizer sT = new StringTokenizer(str, " ");
			while (sT.hasMoreTokens()) {
				String num = sT.nextToken();
				int iNum = Integer.parseInt(num, 16);
				al.add((byte) iNum);
			}
			System.out.println("리스트 길이 : " + al.size());
			// 이미지파일로 내보내기 위한 주스트림
			FileOutputStream fos = new FileOutputStream("test.gif");
			bos = new BufferedOutputStream(fos);
			for (Byte b : al) {
				bos.write(b);
			}
			System.out.println("파일 내보내기 완료");
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
		// quiz.txt. 파일에 있는 내용을 읽어오기 위한 주 스트림
		FileReader fr = null;
		FileOutputStream fos = null;
		try {
			fr = new FileReader("quiz.txt");
			StringBuffer sb = new StringBuffer();
			while (true) {
				// 문자 1개를 정수타입으로 읽어옴
				// 읽어올 값이 없는 경우 -1을 리턴
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
			System.out.println("리스트 길이 : " + al.size());
			fos = new FileOutputStream("test1.gif");
			for (Byte b : al) {
				fos.write(b);
			}
			System.out.println("파일 내보내기 완료");
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
