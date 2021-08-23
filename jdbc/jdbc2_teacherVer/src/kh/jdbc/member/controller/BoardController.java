package kh.jdbc.member.controller;

import java.util.ArrayList;

import kh.jdbc.member.dao.BoardDao;
import kh.jdbc.member.view.BoardView;
import kh.jdbc.member.vo.Board;

public class BoardController {
	private int memberNo;
	private BoardView boardView;
	private BoardDao boardDao;
	boolean bool = true;
	
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
			case 0:
				goBackToPostPage();
				return;
			default :
				missSelectNum();
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
	
	public int checkBoard(int boardNo) {
		// 1. 매개변수로 받은 보드번호를 DB에서 조회
		Board b = boardDao.selectOneBoard(boardNo);
		if(b != null) {
			// 2. 조회가 되었다면 게시글 작성자와 로그인 회원이 일치하는지 검사
			if (b.getBoardWriter() == memberNo) {
				return 1;
			} else {
				return 0;
			}
		} else {
			// 게시글이 조회되지 않은 경우
			return -1;
		}
		
	}
	
	public void updatePosting() {
		int boardNo = boardView.getBoardNo("수정");
		int result = checkBoard(boardNo);
		if(result == 1) {
			Board b = boardView.createPosting();
			b.setBoardNo(boardNo);
			int result1 = boardDao.updatePosting(b);
			if(result1 > 0) {
				boardView.successMsg("수정");
			} else {
				boardView.failMsg("수정");
			}
		} else if (result == 0) {
			boardView.printMsg("작성자만 수정이 가능합니다.");
		} else if (result == -1) {
			boardView.printMsg("게시글을 조회할 수 없습니다.");
		}
	}
	
	public void deleteposting() {
		int boardNo = boardView.getBoardNo("삭제");
		int result = checkBoard(boardNo);
		if (result == 1) {
			int result1 = boardDao.deleteMyPosting(boardNo);
			if (result1 > 0) {
				boardView.successMsg("삭제");
			} else {
				boardView.failMsg("삭제");
			}
		} else if (result == 0) {
			boardView.printMsg("본인이 작성한 글만 삭제가 가능합니다.");
		} else if (result == -1) {
			boardView.printMsg("게시글을 조회할 수 없습니다.");
		}
		
	}
	
	public void missSelectNum() {
		boardView.missSelect();
	}
	
	public void goBackToPostPage() {
		boardView.goBackPage("이전 페이지");
	}
	
}
