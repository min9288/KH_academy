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
		map.put(2, "�ߺ�");
		map.put(100, "Hi");
		System.out.println(map.get(2));
		System.out.println(map.get(3));  //  ���� key�� get�ϴ� ��� null ����
		System.out.println(map.get(100));	// �ۼ��ڰ� ���� ��� �����ϱ� ������ ���� ������� ��������
		// list�� ��ü ������ ��� -> list�� �����Ͱ� � �ִ��� -> list.size();
		// list.size() == 4 -> �����ʹ� 0 1 2 3 ��  ����
		
		// map�� ��ü ���� ��� -> 0 1 2 100
		// -> ��ü Ű������ Set ���·� ����
		Set<Integer> set = map.keySet();
		for(Integer num : set) {
			System.out.println(map.get(num));
		}
		
	}
	public void test2() {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("one", "�ϳ�");
		map.put("two", "��");
		map.put("three", "��");
		System.out.println(map.get("two"));
		map.put("two", "����");
		System.out.println(map.get("two"));  // map�� Ű���� �ߺ��� ������ �ʱ⶧����, ������ Ű���� ����Ǿ����� �ڿ� ����� ������ ���� ���� ������.
											//	-> ����Ű�� �ٽ� put�ϴ� ��� ���� ������ ����� (���� ���� �����)
		
		
		System.out.println(map.get("abc"));	// ���� key�� get�ϴ� ��� null ����
		
		Set<String> keys = map.keySet();
		for(String key : keys) {
			System.out.println(key);
		}
		// containsKey -> �Ű������� ���� key�� �����ϸ� true ���� // ������ false ����
		boolean bool1 = map.containsKey("two");
		boolean bool2 = map.containsKey("abc");
		System.out.println(bool1);
		System.out.println(bool2);
		
		map.remove("two");	// remove -> �Ű������� ���� key�� �ش��ϴ� �����͸� ����
		System.out.println(map.get("two"));
		
	}
}
