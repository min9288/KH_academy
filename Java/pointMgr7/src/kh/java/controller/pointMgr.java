package kh.java.controller;

import java.util.ArrayList;

import kh.java.database.pointDatebase;
import kh.java.view.pointMgrView;
import kh.java.vo.Grade;

public class pointMgr {
	private pointMgrView view;
	private pointDatebase db;
	
	public pointMgr() {
		super();
		view = new pointMgrView();
		db = new pointDatebase();
	}
	public void main() {
		while(true) {
			int sel = view.showMainMenu();
			switch(sel) {
			case 1 :
				insertMember();
				break;
			case 2 :
				printAllMember();
				break;
			case 3 :
				printOneMember();
				break;
			case 4 :
				updateMember();
				break;
			case 5 :
				//deleteMember();
				break;
			case 0 :
				//exit();
				return;
			default :
				//incorrectInput();
				break;
			}
		}
	}
	public void insertMember() {
		Grade g = view.insertMember();
		db.insertMember(g);
	}
	public void printAllMember() {
		ArrayList<Grade> members = db.printAllMember();
		view.printAllMember(members);
	}

	public void printOneMember() {
		String name = view.getName();
		Grade member = db.printOneMember(name);
		if (member != null) {
			view.printOneMember(member);
		}else {
			view.noSearchMember();
		}
	}
	public void updateMember() {
		String name = view.getName();
		Grade member = db.printOneMember(name);
		if (member != null) {
			view.updateMember(member);
		}else {
			view.noSearchMember();
		}
	}
	public void deleteMember() {
		String name = view.getName();
		Grade member = db.printOneMember(name);
		if (member != null) {
			view.deleteMember(member);
		}else {
			view.noSearchMember();
		}
	}
	public void exit() {
		view.exit();
	}
	public void incorrectInput() {
		
	}
}
