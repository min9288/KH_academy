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
		System.out.println("저장할 파일명 입력 : ");
		String fileName = sc.next();
		sc.nextLine();
		FileWriter fw = null;
		try {
			fw = new FileWriter(fileName);
			System.out.println("'"+fileName+"' 파일에 저장될 내용 입력");
			System.out.println("종료는 exit");
			int lineNumber = 1;
			while(true) {
				System.out.println((lineNumber++)+" : ");
				String str = sc.nextLine() + "\r\n";
				if(str.equals("exit\r\n")) {
					break;
				}
				// 문자스트림은 전송단위가 문자이므로 바이트배열로 변환할 필요 X
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
		System.out.print("저장할 파일 입력 : ");
		String fileName = sc.next();
		sc.nextLine();
		BufferedWriter bw = null;	// 보조 스트림
		
		
		try {
			// 주스트림 생성
			FileWriter fw = new FileWriter(fileName);
			//생성된 주스트림을 이용해서 보조 스트림 생성
			bw = new BufferedWriter(fw);
			System.out.println("'"+fileName+"' 파일에 저장될 내용 입력");
			System.out.println("종료는 exit");
			int lineNumber = 1;
			while(true) {
				System.out.print((lineNumber++)+" : ");
				String str = sc.nextLine();
				if(str.equals("exit")) {
					break;
				}
				bw.write(str);	// 보조스트림을 이용해서 데이터 전송
				bw.newLine();   // 보조스트림에만 존재하는 추가적인 기능 (줄 개행)
			}
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				bw.close();		// 보조스트림을 닫는경우 주스트림은 같이 닫힘
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	public void charStreamReader() {
		Scanner sc = new Scanner(System.in);
		// 1. 스트림 생성 -> 2. 메소드를 이용한 입력 or 출력 -> 3. 자원반환
		System.out.print("로드할 파일명 입력 : ");
		String fileName = sc.next();
		sc.nextLine();
		// 데이터를 읽어올 보조스트림
		BufferedReader br = null;
		
		try {
			FileReader fr = new FileReader(fileName);
			// 주 스트림을 이용해서 보조스트림 생성
			br = new BufferedReader(fr);
			while(true) {
				// 파일에서 1줄을 읽어옴
				// 더 이상 읽어올게 없는 경우 null 리턴
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
