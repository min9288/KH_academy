package kh.java.func;

import java.util.Random;
import java.util.StringTokenizer;


public class StringClass {
	public void test1() {
		StringBuffer sb = new StringBuffer();
		System.out.println(sb.length());	// ����� ���ڿ� ����
		sb.append("hi");					// ���� ����� ���ڿ� ���� �Ű������� ���޵� �� �߰�
		System.out.println(sb.toString());
		sb.append(" �ȳ�");
		System.out.println(sb.toString());
		sb.append(" test");
		System.out.println(sb.toString());
		sb.insert(3, "���Ա��� ");
		System.out.println(sb.toString());
		sb.insert(8, "���� ");
		System.out.println(sb.toString());
		sb.replace(0, 2, "��������"); // 0~1 ���� �ٲ�, for(int i=0; i < 2; i++) �̷��� �����ϸ� ��.
		System.out.println(sb.toString());
		sb.delete(5, 8); // 5 ~ 7 ���� ����, for(int i = 5; i < 7; i++) �̷��� �����ϸ� ��.
		System.out.println(sb.toString());
		sb.reverse();
		System.out.println(sb.toString());
		sb.reverse();
		System.out.println(sb.toString());
		
		Random r = new Random();
		StringBuffer joinCode = new StringBuffer();
		for(int i = 0; i < 6; i++) {
			int num = r.nextInt(10);
			joinCode.append(num);
		}
		System.out.println(joinCode);
	}
	public void test2() {
		String str = "������/����/����";
		StringTokenizer sT = new StringTokenizer(str, "/");
		while(sT.hasMoreTokens()) {
			String str1 = sT.nextToken();
			System.out.println(str1);
		}
//		System.out.println(" ��ū �� : "+sT.countTokens());
//		System.out.println("��ū�� �����ִ��� Ȯ�� : "+sT.hasMoreTokens());
//		String str1 = sT.nextToken();  // ���� ���� ��ū�� ������
//		System.out.println("ù��° ��ū �� : "+str1);
//		System.out.println(" ��ū �� : "+sT.countTokens());
//		System.out.println("��ū�� �����ִ��� Ȯ�� : "+sT.hasMoreTokens());
//		String str2 = sT.nextToken();
//		System.out.println("�ι�° ��ū �� : "+str2);
//		System.out.println(" ��ū �� : "+sT.countTokens());
//		System.out.println("��ū�� �����ִ��� Ȯ�� : "+sT.hasMoreTokens());
//		String str3 = sT.nextToken();
//		System.out.println("����° ��ū �� : "+str3);
//		System.out.println(" ��ū �� : "+sT.countTokens());
//		System.out.println("��ū�� �����ִ��� Ȯ�� : "+sT.hasMoreTokens());
//		String str4 = sT.nextToken();
//		System.out.println("�׹�° ��ū �� : "+str4); // ������ �� �ִ� ��ū�� ������ ���� �߻�
	}
	public void exam() {
		String str = "J a v a P r o g r a m";
		StringTokenizer sT = new StringTokenizer(str, " ");
		while(sT.hasMoreTokens()) {
			char ch = sT.nextToken().charAt(0);
			if(ch >= 'a' && ch <= 'z') {
				ch -= 32;
			}
			System.out.print(ch);
//			String str1 = sT.nextToken();
//			System.out.print(str1.toUpperCase());
		}	
	}
}
