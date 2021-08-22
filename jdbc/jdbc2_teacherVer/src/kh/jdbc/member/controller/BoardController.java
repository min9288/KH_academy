package kh.jdbc.member.controller;

import java.util.ArrayList;

import kh.jdbc.member.dao.BoardDao;
import kh.jdbc.member.view.BoardView;
import kh.jdbc.member.vo.Board;

public class BoardController {
	private int memberNo;
	private BoardView boardView;
	private BoardDao boardDao;
	
	public BoardController() {
		super();
		boardView = new BoardView();
		boardDao = new BoardDao();
	}

	public void main (int memberNo) {
		this.memberNo = memberNo;
		while(true) {
			int sel = boardView.boardMenu();
			switch (sel) {
			case 1:
				viewPostingList();
				break;
			case 2:
				viewPostingDetails();
				break;
			case 3:
				createPosting();
				break;
			case 4:
				updatePosting();
				break;
			case 5:
				deleteposting();
				break;
			case 6:
				goBackToPostPage();
				break;
			case 0:
				goBackToMain();
				break;
			}
		}
	}
	
	public void viewPostingList() {
		ArrayList<Board> list = boardDao.selectAllPostingList();
		if(list.isEmpty()) {
			boardView.emptyPosting();
		} else {
			boardView.postingList(list);
		}
	}
	
	public void viewPostingDetails() {
		int boardNo = boardView.getBoardNo("조회");
		int result = boardDao.addReadCount(boardNo);
		
		if(result > 0) {
			Board b = boardDao.selectOneBoard(boardNo);
			if(b == null) {
				boardView.failMsg("조회");
			} else {
				boardView.selectOneBoard(b);
			}
		} else {
			boardView.failMsg("조회");
		}
	}
	
	public void createPosting() {
		Board b = boardView.createPosting();
		b.setBoardWriter(memberNo);
		int result = boardDao.createPosting(b);
		if(result > 0 ) {
			boardView.successMsg("게시글 등록");
		} else {
			boardView.failMsg("게시글 등록");
		}
	}
	
	public void updatePosting() {
		int postingNo = view.getNo("수정");

		Member up = view.updatePosting();
		int result = dao.updatePosting(up, postingNo);
	
		if (result > 0) {
			view.successMsg("수정");
		} else {
			view.failMsg("수정");
		}
	}
	
	public void deleteposting() {
		int postingNo = view.getNo("삭제");
		int result = dao.deleteMyPosting(postingNo);
		if (result > 0) {
			view.successMsg("글 삭제");
		} else {
			view.failMsg("글 삭제");
		}
	}
	
	
	
	public void goBackToPostPage() {
		bool = false;
		view.goBackPage("이전 페이지");
	}
	
	public void goBackToMain() {
		bool = false;
		login = null;
		view.goBackPage("메인 메뉴");
	}
	
}
