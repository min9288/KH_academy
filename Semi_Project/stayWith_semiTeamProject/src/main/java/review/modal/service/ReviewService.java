package review.modal.service;

import java.sql.Connection;
import java.util.ArrayList;

import bookingView.modal.dao.BookingViewDao;
import bookingView.modal.vo.BookingViewRoom;
import common.JDBCTemplate;
import review.modal.dao.ReviewDao;
import review.modal.vo.DiningReview;
import review.modal.vo.LifeReview;
import review.modal.vo.RoomReview;

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

	public ArrayList<RoomReview> printRoomReviewList(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<RoomReview> rList = new ReviewDao().printRoomReviewList(conn, memberId);
		JDBCTemplate.close(conn);
		return rList;
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

}
