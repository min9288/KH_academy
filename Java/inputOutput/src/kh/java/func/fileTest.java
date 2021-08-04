package kh.java.func;

import java.io.File;
import java.util.Scanner;

public class fileTest {
	public void fileTest() {
		Scanner sc = new Scanner(System.in);
		System.out.print("파일명 입력 : ");
		String fileName = sc.next();
		File file = new File(fileName);
		
		if (file.exists()) { // exists() -> 해당파일이 존재하면 true, 존재하지 않으면 false
			System.out.println("파일명 : " + file.getName());
			System.out.println("파일 상대 경로 : " + file.getPath());
			System.out.println("파일 절대 경로 : " + file.getAbsolutePath());
			System.out.println("파일 크기 : " + file.length() + "Byte");
			System.out.println("파일을 삭제하시겠습니까(1. 삭제, 2.ㄴㄴ)? ");
			int sel = sc.nextInt();
			if(sel == 1) {
				boolean bool =  file.delete();	// 파일을 삭제하고 결과를 리턴 (삭제성공 -> true / 삭제실패 -> false)
				System.out.println(bool);
			}
		} else {
			System.out.println("파일 없음");
		}
	}
}
