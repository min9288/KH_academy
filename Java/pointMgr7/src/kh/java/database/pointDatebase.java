package kh.java.database;

import java.util.ArrayList;

import kh.java.vo.Grade;

public class pointDatebase {
	private ArrayList<Grade> members;
	
	
	public pointDatebase() {
		super();
		members = new ArrayList<Grade>();
	}


	public void insertMember(Grade g) {
		members.add(g);
	}
	
	public ArrayList<Grade> printAllMember() {
		return members;
	}
	
	public Grade printOneMember(String name) {
		int searchIndex = searchMember(name);
		if(searchIndex == -1) {
			return null;
		}else {
			Grade g = members.get(searchIndex);
			return g;
		}
//		Grade g = null;
//		if(searchIndex != -1) {
//			g = members.get(searchIndex);
//		}
//		return g;
	}
	public boolean deleteMember(String name) {
		int searchIndex = searchMember(name);
		if(searchIndex != -1) {
			members.remove(searchIndex);
			return true;
		}else {
			return false;
		}
			
	}
	
	public int searchMember(String name) {
		for (int i = 0; i < members.size(); i++) {
			if(members.get(i).getName().equals(name)) {
				return i;
			}
		}
		return -1;
	}
}
