package bookingView.modal.service;

import java.sql.Connection;
import java.util.ArrayList;

import bookingView.modal.dao.BookingViewDao;
import bookingView.modal.vo.BookingViewDining;
import bookingView.modal.vo.BookingViewLife;
import bookingView.modal.vo.BookingViewPageDining;
import bookingView.modal.vo.BookingViewPageLife;
import bookingView.modal.vo.BookingViewPageRoom;
import bookingView.modal.vo.BookingViewRoom;
import common.JDBCTemplate;
import inquiryView.modal.dao.InquiryViewDao;
import inquiryView.vo.InquiryView;
import review.modal.dao.ReviewDao;

public class BookingViewService {

	public BookingViewPageRoom printBookingList(int reqPage, String memberId, String tableType) {
		Connection conn = JDBCTemplate.getConnection();
		/*
	 	페이징 처리를 위해서 지정해야할 항목
	 	1. 한페이당 게시물을 몇개 보여줄지 -> 10개
		 */
		 // 한 페이지당 게시물 수
		int numPerPage = 10;
		// reqPage = 1	start = 1 / end = 10, reqPage=2 start=11 / end=20
		int end = reqPage*numPerPage;
		int start = end - numPerPage + 1;
		BookingViewDao dao = new BookingViewDao();
		ArrayList<BookingViewRoom> rList = new BookingViewDao().printBookingList(conn, start, end, memberId);
		
		// 페이지 네비게이션을 제작
		// DB 조회해야하는 값 -> 전체 게시물의 수
		int totalCount = dao.selectTotalCount(conn, tableType, memberId);
		// 전체 페이지수를 계산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		/*
		 지정해야할 항목
		 2. 페이지 네비의 길이 (네비게이션 숫자 최대 개수)
		 */
		int pageNaviSize = 5;
		// 1 ~ 5 페이지 요청 시 (reqPage 값) -> 네비게이션 1 2 3 4 5
		// 6 ~ 10 페이지 요청 시 네비게이션 6 7 8 9 10
		// 11 ~ 15 페이지 요청 시 -> 네비게이션 11 12 13 14 15
		// 페이지 네비게이션 시작번호 계산
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		// 페이지네비 태그 제작 시작
		String pageNavi = "<ul class='pagination pagination-lg'>";
		// 이전버튼
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/mypageBookingRoomFrm?memberId="+memberId+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}
		// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/mypageBookingRoomFrm?memberId="+memberId+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/mypageBookingRoomFrm?memberId="+memberId+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		// 다음 버튼
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/mypageBookingRoomFrm?memberId="+memberId+"&reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		// 게시물 목록(ArrayList), 페이지네비(String), start(번호 표시용)
		BookingViewPageRoom bvpr = new BookingViewPageRoom(rList, pageNavi, start);
		
		JDBCTemplate.close(conn);
		return bvpr;
	}

	public BookingViewRoom printMyBookingList(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		BookingViewRoom bvr = new BookingViewDao().printMyBookingList(conn, memberId);
		JDBCTemplate.close(conn);
		return bvr;
	}

	public BookingViewPageDining printBookingDiningList(int reqPage, String memberId, String tableType) {
		Connection conn = JDBCTemplate.getConnection();
		/*
	 	페이징 처리를 위해서 지정해야할 항목
	 	1. 한페이당 게시물을 몇개 보여줄지 -> 10개
		 */
		 // 한 페이지당 게시물 수
		int numPerPage = 10;
		// reqPage = 1	start = 1 / end = 10, reqPage=2 start=11 / end=20
		int end = reqPage*numPerPage;
		int start = end - numPerPage + 1;
		BookingViewDao dao = new BookingViewDao();
		ArrayList<BookingViewDining> dList = new BookingViewDao().printBookingDiningList(conn, start, end, memberId);
		
		// 페이지 네비게이션을 제작
		// DB 조회해야하는 값 -> 전체 게시물의 수
		int totalCount = dao.selectTotalCount(conn, tableType, memberId);
		// 전체 페이지수를 계산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		/* 여기입니당
		 지정해야할 항목
		 2. 페이지 네비의 길이 (네비게이션 숫자 최대 개수)
		 */
		int pageNaviSize = 5;
		// 1 ~ 5 페이지 요청 시 (reqPage 값) -> 네비게이션 1 2 3 4 5
		// 6 ~ 10 페이지 요청 시 네비게이션 6 7 8 9 10
		// 11 ~ 15 페이지 요청 시 -> 네비게이션 11 12 13 14 15
		// 페이지 네비게이션 시작번호 계산
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		// 페이지네비 태그 제작 시작
		String pageNavi = "<ul class='pagination pagination-lg'>";
		// 이전버튼
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/mypageBookingDiningFrm?memberId="+memberId+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}
		// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/mypageBookingDiningFrm?memberId="+memberId+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/mypageBookingDiningFrm?memberId="+memberId+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		// 다음 버튼
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/mypageBookingDiningFrm?memberId="+memberId+"&reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		// 게시물 목록(ArrayList), 페이지네비(String), start(번호 표시용)
		BookingViewPageDining bvpd = new BookingViewPageDining (dList, pageNavi, start);
		
		JDBCTemplate.close(conn);
		return bvpd;
	}

	public BookingViewDining printMyBookingDiningList(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		BookingViewDining bvd = new BookingViewDao().printMyBookingDiningList(conn, memberId);
		JDBCTemplate.close(conn);
		return bvd;
	}

	public BookingViewPageLife printBookingLifeList(int reqPage, String memberId, String tableType) {
		Connection conn = JDBCTemplate.getConnection();
		/*
	 	페이징 처리를 위해서 지정해야할 항목
	 	1. 한페이당 게시물을 몇개 보여줄지 -> 10개
		 */
		 // 한 페이지당 게시물 수
		int numPerPage = 10;
		// reqPage = 1	start = 1 / end = 10, reqPage=2 start=11 / end=20
		int end = reqPage*numPerPage;
		int start = end - numPerPage + 1;
		BookingViewDao dao = new BookingViewDao();
		ArrayList<BookingViewLife> lfList = new BookingViewDao().printBookingLifeList(conn, start, end, memberId);
		
		// 페이지 네비게이션을 제작
		// DB 조회해야하는 값 -> 전체 게시물의 수
		int totalCount = dao.selectTotalCount(conn, tableType, memberId);
		// 전체 페이지수를 계산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		/*
		 지정해야할 항목
		 2. 페이지 네비의 길이 (네비게이션 숫자 최대 개수)
		 */
		int pageNaviSize = 5;
		// 1 ~ 5 페이지 요청 시 (reqPage 값) -> 네비게이션 1 2 3 4 5
		// 6 ~ 10 페이지 요청 시 네비게이션 6 7 8 9 10
		// 11 ~ 15 페이지 요청 시 -> 네비게이션 11 12 13 14 15
		// 페이지 네비게이션 시작번호 계산
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		// 페이지네비 태그 제작 시작
		String pageNavi = "<ul class='pagination pagination-lg'>";
		// 이전버튼
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/mypageBookingFitnessFrm?memberId="+memberId+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}
		// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/mypageBookingFitnessFrm?memberId="+memberId+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/mypageBookingFitnessFrm?memberId="+memberId+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		// 다음 버튼
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/mypageBookingFitnessFrm?memberId="+memberId+"&reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		// 게시물 목록(ArrayList), 페이지네비(String), start(번호 표시용)
		BookingViewPageLife bvpl = new BookingViewPageLife (lfList, pageNavi, start);
		
		JDBCTemplate.close(conn);
		return bvpl;
	}

	public BookingViewLife printMyBookingLifeList(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		BookingViewLife bvl = new BookingViewDao().printMyBookingLifeList(conn, memberId);
		JDBCTemplate.close(conn);
		return bvl;
	}

	public int updateRoomStatus(String memberId, String resNum) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BookingViewDao().updateRoomStatus(conn, resNum, memberId);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateDiningStatus(String memberId, String resNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BookingViewDao().updateDiningStatus(conn, resNo, memberId);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateLifeStatus(String memberId, String resNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BookingViewDao().updateLifeStatus(conn, resNo, memberId);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
