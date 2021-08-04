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
		// set은 순서가 없기에 수정 불가, 값 삭제 후 새로 운 값 생성해야됨
		// 순서가 없고, 중복 저장 안됨
		System.out.println("set의 길이 : " + set.size());
		boolean bool1 = set.add(10);							//	creat
		System.out.println("set의 길이 : " + set.size());
		System.out.println(bool1);
		boolean bool2 = set.add(10);
		System.out.println("set의 길이 : " + set.size());
		System.out.println(bool2);
		boolean bool3 = set.add(20);
		System.out.println("set의 길이 : " + set.size());
		System.out.println(bool3);
		set.add(30);
		set.add(40);
		System.out.println(set);
		set.remove(20);											// delete
		System.out.println(set);
		System.out.println("==================================");
		
		//	read
		// set은 index로 값을 관리하지 않아서 하나씩 꺼내서 사용하는 방법이 필요
		// 1. foreach
		for(Integer num : set) {
			System.out.println(num);
		}
		System.out.println("==================================");
		// 2. ArrayList 사용 		-> 	3가지 방법 중 가장 많이 사용
		ArrayList<Integer> list = new ArrayList<Integer>(set);
		Collections.sort(list);
		for(Integer num : list) {
			System.out.println(num);
		}
		System.out.println("==================================");
		// 3. 반복자(iterator)
		Iterator<Integer> iter = set.iterator();
		//	hasNext() : 꺼내올 값이 남아있으면 true / 없으면 false
		// next() : 값 한개를 꺼내옴 (잘라내기 개념)
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
			System.out.println("숫자 입력 [1 ~ 45] : ");
			int num = sc.nextInt();
			if (num > 0 && num < 46) {
				boolean bool = userNum.add(num);
				if(!bool) {
					System.out.println("중복 숫자 입니다.");
				}
			} else {
				System.out.println("1 ~ 45 사이 숫자를 입력하세요.");
			}
		}
		while (comNum.size() < 6) {
			comNum.add(r.nextInt(45) + 1);
		}
	}
}
