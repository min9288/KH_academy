package board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import board.model.vo.BoardPageData;
import common.JDBCTemplate;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import notice.model.vo.NoticePageData;

public class BoardService {

	public int insertBoard(Board b) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDao().insertNotice(conn, b);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public BoardPageData selectBoardList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		BoardDao dao = new BoardDao();
		ArrayList<Board> list = new BoardDao().selectBoardList(conn, start, end);
		
		int totalCount = dao.selectTotalCount(conn);
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/boardList?reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}
		for (int i = 0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/boardList?reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/boardList?reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/boardList?reqPage="+pageNo+"'>";
				pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
			
		BoardPageData bpd = new BoardPageData(list, pageNavi, start);
		JDBCTemplate.close(conn);
		return bpd;
	}

	public Board selectOneBoard(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		BoardDao dao = new BoardDao();
		int result = dao.updateReadCount(conn, boardNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
			JDBCTemplate.close(conn);
			return null;
		}
		Board b = dao.selectOneBoard(conn, boardNo);
		JDBCTemplate.close(conn);
		return b;
	}

	public Board getBoard(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		Board b = new BoardDao().selectOneBoard(conn, boardNo);
		JDBCTemplate.close(conn);
		return b;
	}

	public int deleteBoard(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDao().deleteBoard(conn, boardNo);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateBoard(Board b) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDao().updateBoard(conn, b);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public BoardPageData searchBoard(int reqPage, String type, String keyword) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		BoardDao dao = new BoardDao();
		ArrayList<Board> list = dao.selectSearchBoard(conn, start, end, type, keyword);
		
		int totalCount = dao.selectTotalCount(conn, type, keyword);
		// ?????? ??????????????? ??????
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		/*
		??????????????? ??????
		2. ????????? ????????? ?????? (??????????????? ?????? ?????? ??????)
		*/
		int pageNaviSize = 5;
		// 1 ~ 5 ????????? ?????? ??? (reqPage ???) -> ??????????????? 1 2 3 4 5
		// 6 ~ 10 ????????? ?????? ??? ??????????????? 6 7 8 9 10
		// 11 ~ 15 ????????? ?????? ??? -> ??????????????? 11 12 13 14 15
		// ????????? ??????????????? ???????????? ??????
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		// ??????????????? ?????? ?????? ??????
		String pageNavi = "<ul class='pagination pagination-lg'>";
		// ????????????
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/searchBoard?reqPage="+(pageNo-1)+"&type="+type+"&keyword="+keyword+"'>";
			pageNavi += "&lt;</a></li>";
		}
		// ????????? ??????
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/searchBoard?reqPage="+pageNo+"&type="+type+"&keyword="+keyword+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/searchBoard?reqPage="+pageNo+"&type="+type+"&keyword="+keyword+"'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		// ?????? ??????
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/searchBoard?reqPage="+pageNo+"&type="+type+"&keyword="+keyword+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
				
		// ????????? ??????(ArrayList), ???????????????(String), start(?????? ?????????)
		BoardPageData bpd = new BoardPageData(list, pageNavi, start);
				
		JDBCTemplate.close(conn);
		return bpd;
	}

	

	

}
