package kh.java.func;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Random;
import java.util.Scanner;

public class SetTest {
	public void test1() {
		HashSet<Integer> set = new HashSet<Integer>();
		// set�� ������ ���⿡ ���� �Ұ�, �� ���� �� ���� �� �� �����ؾߵ�
		// ������ ����, �ߺ� ���� �ȵ�
		System.out.println("set�� ���� : " + set.size());
		boolean bool1 = set.add(10);							//	creat
		System.out.println("set�� ���� : " + set.size());
		System.out.println(bool1);
		boolean bool2 = set.add(10);
		System.out.println("set�� ���� : " + set.size());
		System.out.println(bool2);
		boolean bool3 = set.add(20);
		System.out.println("set�� ���� : " + set.size());
		System.out.println(bool3);
		set.add(30);
		set.add(40);
		System.out.println(set);
		set.remove(20);											// delete
		System.out.println(set);
		System.out.println("==================================");
		
		//	read
		// set�� index�� ���� �������� �ʾƼ� �ϳ��� ������ ����ϴ� ����� �ʿ�
		// 1. foreach
		for(Integer num : set) {
			System.out.println(num);
		}
		System.out.println("==================================");
		// 2. ArrayList ��� 		-> 	3���� ��� �� ���� ���� ���
		ArrayList<Integer> list = new ArrayList<Integer>(set);
		Collections.sort(list);
		for(Integer num : list) {
			System.out.println(num);
		}
		System.out.println("==================================");
		// 3. �ݺ���(iterator)
		Iterator<Integer> iter = set.iterator();
		//	hasNext() : ������ ���� ���������� true / ������ false
		// next() : �� �Ѱ��� ������ (�߶󳻱� ����)
		while(iter.hasNext()) {
			Integer num = iter.next();
			System.out.println(num);
		}
	}
	public void lotto() {
		Scanner sc = new Scanner(System.in);
		Random r = new Random();
		HashSet<Integer> userNum = new HashSet<Integer>();
		HashSet<Integer> comNum = new HashSet<Integer>();

		while (userNum.size() < 6) {
			System.out.println("���� �Է� [1 ~ 45] : ");
			int num = sc.nextInt();
			if (num > 0 && num < 46) {
				boolean bool = userNum.add(num);
				if(!bool) {
					System.out.println("�ߺ� ���� �Դϴ�.");
				}
			} else {
				System.out.println("1 ~ 45 ���� ���ڸ� �Է��ϼ���.");
			}
		}
		while (comNum.size() < 6) {
			comNum.add(r.nextInt(45) + 1);
		}
	}
}
