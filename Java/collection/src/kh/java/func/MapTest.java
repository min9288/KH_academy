package kh.java.func;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

public class MapTest {
	public void test1() {
		ArrayList<String> list = new ArrayList<String>();
		list.add("Hi");
		list.add("Hello");
		list.add("Bye");
		list.add("Hi");
		System.out.println(list.get(2));
		HashMap<Integer, String> map = new HashMap<Integer, String>();
		map.put(0, "Hi");
		map.put(1, "Hello");
		map.put(2, "Bye");
		map.put(2, "중복");
		map.put(100, "Hi");
		System.out.println(map.get(2));
		System.out.println(map.get(3));  //  없는 key를 get하는 경우 null 리턴
		System.out.println(map.get(100));	// 작성자가 직접 모두 세팅하기 때문에 순서 마음대로 지정가능
		// list의 전체 정보를 출력 -> list에 데이터가 몇개 있는지 -> list.size();
		// list.size() == 4 -> 데이터는 0 1 2 3 에  존재
		
		// map의 전체 정보 출력 -> 0 1 2 100
		// -> 전체 키값들을 Set 형태로 리턴
		Set<Integer> set = map.keySet();
		for(Integer num : set) {
			System.out.println(map.get(num));
		}
		
	}
	public void test2() {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("one", "하나");
		map.put("two", "둘");
		map.put("three", "셋");
		System.out.println(map.get("two"));
		map.put("two", "변경");
		System.out.println(map.get("two"));  // map은 키값의 중복이 허용되지 않기때문에, 동일한 키값이 선언되었을때 뒤에 선언된 값으로 기존 값을 덮어씌운다.
											//	-> 동일키로 다시 put하는 경우 나중 값으로 덮어쓰기 (기존 값이 사라짐)
		
		
		System.out.println(map.get("abc"));	// 없는 key를 get하는 경우 null 리턴
		
		Set<String> keys = map.keySet();
		for(String key : keys) {
			System.out.println(key);
		}
		// containsKey -> 매개변수로 받은 key가 존재하면 true 리턴 // 없으면 false 리턴
		boolean bool1 = map.containsKey("two");
		boolean bool2 = map.containsKey("abc");
		System.out.println(bool1);
		System.out.println(bool2);
		
		map.remove("two");	// remove -> 매개변수로 받은 key에 해당하는 데이터를 삭제
		System.out.println(map.get("two"));
		
	}
}
