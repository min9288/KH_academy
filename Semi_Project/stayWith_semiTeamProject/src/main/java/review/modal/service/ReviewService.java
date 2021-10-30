package review.modal.service;

import java.sql.Connection;
import java.util.ArrayList;

import bookingView.modal.dao.BookingViewDao;
import bookingView.modal.vo.BookingViewPageRoom;
import bookingView.modal.vo.BookingViewRoom;
import common.JDBCTemplate;
import review.modal.dao.ReviewDao;
import review.modal.vo.DiningReview;
import review.modal.vo.DiningReviewPage;
import review.modal.vo.LifeReview;
import review.modal.vo.LifeReviewPage;
import review.modal.vo.RoomReview;
import review.modal.vo.RoomReviewPage;

public class ReviewService {

	public int insertReview(RoomReview rr) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().insertReview(conn, rr);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int insertDiningReview(DiningReview dr) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().insertDiningReview(conn, dr);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int insertLifeReview(LifeReview lr) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().insertLifeReview(conn, lr);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public RoomReview printRoomReview(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		RoomReview rr = new ReviewDao().printMyBookingList(conn, memberId);
		JDBCTemplate.close(conn);
		return rr;
	}


	public int updateRoomReview(RoomReview rr) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().updateRoomReview(conn, rr);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteRoomReview(int rRNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().deleteRoomReview(conn, rRNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public RoomReviewPage printRoomReviewList(int reqPage, String memberId, String tableType) {
		Connection conn = JDBCTemplate.getConnection();
		/*
	 	페이징 처리를 위해서 지정해야할 항목
	 	1. 한페이당 게시물을 몇개 보여줄지 -> 10개
		 */
		 // 한 페이지당 게시물 수
		int numPerPage = 5;
		// reqPage = 1	start = 1 / end = 10, reqPage=2 start=11 / end=20
		int end = reqPage*numPerPage;
		int start = end - numPerPage + 1;
		ReviewDao dao = new ReviewDao();
		ArrayList<RoomReview> rList = new ReviewDao().printRoomReviewList(conn, start, end, memberId);
		
		// 페이지 네비게이션을 제작
		// DB 조회해야하는 값 -> 전체 게시물의 수
		int totalCount = dao.selectTotalCount(conn, memberId, tableType);
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
			pageNavi += "<a class = 'page-link' href='/mypageMyReviewRoomFrm?memberId="+memberId+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}
		// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/mypageMyReviewRoomFrm?memberId="+memberId+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/mypageMyReviewRoomFrm?memberId="+memberId+"&reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' href='/mypageMyReviewRoomFrm?memberId="+memberId+"&reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		// 게시물 목록(ArrayList), 페이지네비(String), start(번호 표시용)
		RoomReviewPage rrp = new RoomReviewPage(rList, pageNavi, start);
		
		JDBCTemplate.close(conn);
		return rrp;
	}

	public DiningReviewPage printDiningReviewList(int reqPage, String memberId, String tableType) {
		Connection conn = JDBCTemplate.getConnection();
		/*
	 	페이징 처리를 위해서 지정해야할 항목
	 	1. 한페이당 게시물을 몇개 보여줄지 -> 10개
		 */
		 // 한 페이지당 게시물 수
		int numPerPage = 5;
		// reqPage = 1	start = 1 / end = 10, reqPage=2 start=11 / end=20
		int end = reqPage*numPerPage;
		int start = end - numPerPage + 1;
		ReviewDao dao = new ReviewDao();
		ArrayList<DiningReview> dList = new ReviewDao().printDiningReviewList(conn, start, end, memberId);
		
		// 페이지 네비게이션을 제작
		// DB 조회해야하는 값 -> 전체 게시물의 수
		int totalCount = dao.selectTotalCount(conn, memberId, tableType);
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
			pageNavi += "<a class = 'page-link' href='/mypageMyReviewDiningFrm?memberId="+memberId+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}
		// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/mypageMyReviewDiningFrm?memberId="+memberId+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/mypageMyReviewDiningFrm?memberId="+memberId+"&reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' href='/mypageMyReviewDiningFrm?memberId="+memberId+"&reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		// 게시물 목록(ArrayList), 페이지네비(String), start(번호 표시용)
		DiningReviewPage drp = new DiningReviewPage(dList, pageNavi, start);
		
		JDBCTemplate.close(conn);
		return drp ;
	}

	public DiningReview printDiningReview(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		DiningReview dr = new ReviewDao().printDiningReview(conn, memberId);
		JDBCTemplate.close(conn);
		return dr;
	}

	public int deleteDiningReview(int dRNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().deleteDiningReview(conn, dRNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateDiningReview(DiningReview dr) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().updateDiningReview(conn, dr);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public LifeReviewPage printLifeReviewList(int reqPage, String memberId, String tableType) {
		Connection conn = JDBCTemplate.getConnection();
		/*
	 	페이징 처리를 위해서 지정해야할 항목
	 	1. 한페이당 게시물을 몇개 보여줄지 -> 10개
		 */
		 // 한 페이지당 게시물 수
		int numPerPage = 5;
		// reqPage = 1	start = 1 / end = 10, reqPage=2 start=11 / end=20
		int end = reqPage*numPerPage;
		int start = end - numPerPage + 1;
		ReviewDao dao = new ReviewDao();
		ArrayList<LifeReview> lfList = new ReviewDao().printLifeReviewList(conn, start, end, memberId);
		
		// 페이지 네비게이션을 제작
		// DB 조회해야하는 값 -> 전체 게시물의 수
		int totalCount = dao.selectTotalCount(conn, memberId, tableType);
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
			pageNavi += "<a class = 'page-link' href='/mypageMyReviewFitnessFrm?memberId="+memberId+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}
		// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/mypageMyReviewFitnessFrm?memberId="+memberId+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/mypageMyReviewFitnessFrm?memberId="+memberId+"&reqPage="+pageNo+"'>";
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
			pageNavi += "<a class = 'page-link' href='/mypageMyReviewFitnessFrm?memberId="+memberId+"&reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		
		// 게시물 목록(ArrayList), 페이지네비(String), start(번호 표시용)
		LifeReviewPage lrp = new LifeReviewPage(lfList, pageNavi, start);
		
		JDBCTemplate.close(conn);
		return lrp ;
	}

	public LifeReview printLifeReview(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		LifeReview lr = new ReviewDao().printLifeReview(conn, memberId);
		JDBCTemplate.close(conn);
		return lr;
	}

	public int deleteLifeReview(int lfRNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().deleteLifeReview(conn, lfRNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int updateLifeReview(LifeReview lr) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReviewDao().updateLifeReview(conn, lr);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	

}
