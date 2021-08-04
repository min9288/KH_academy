package kh.java.func;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Scanner;

public class ByteStream {
	public void primaryStream() {
		Scanner sc = new Scanner(System.in);
		System.out.print("저장할 파일명 입력 : ");
		String fileName = sc.next();
		sc.nextLine();
		FileOutputStream fos = null;
		try {
			// 입력받은 파일명으로 파일을 생성하고 -> 생성된 파일이랑 stream 연결
//			fos = new FileOutputStream("C:\\Users\\admin\\Desktop\\"+fileName);			// 파일 생성경로 설정하는 방법
			fos = new FileOutputStream(fileName);
			System.out.println("["+fileName+"] 파일에 저장될 내용 입력");
			System.out.println("종료는 exit 입력");
			int lineNumber = 1;
			while(true) {
				System.out.print((lineNumber++)+" : ");
				String str = sc.nextLine()+"\r\n"; // window 개행문자 추가
				if(str.equals("exit\r\n")) {
					break;
				}
				// 파일에 입력받은 값을 쓰는 메소드
				// 문자열.getBytes() -> 문자열을 바이트 배열로 변환하는 메소드
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
