package review.modal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bookingView.modal.vo.BookingViewRoom;
import common.JDBCTemplate;
import review.modal.vo.DiningReview;
import review.modal.vo.LifeReview;
import review.modal.vo.RoomReview;

public class ReviewDao {

	public int insertReview(Connection conn, RoomReview rr) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "insert into room_review values(rr_seq.nextval,?,?,to_char(sysdate,'yyyy-mm-dd'),?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, rr.getReviewWriter());
			pstmt.setString(2, rr.getReviewContent());
			pstmt.setInt(3, rr.getStar());
			pstmt.setString(4, rr.getResNum());
			pstmt.setInt(5, rr.getRoomNo());
			pstmt.setString(6, rr.getRoomName());
			pstmt.setString(7, rr.getCheckInDate());
			pstmt.setString(8, rr.getCheckOutDate());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int insertDiningReview(Connection conn, DiningReview dr) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "insert into dining_review values(dr_seq.nextval,?,?,to_char(sysdate,'yyyy-mm-dd'),?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dr.getReviewWriter());
			pstmt.setString(2, dr.getReviewContent());
			pstmt.setInt(3, dr.getStar());
			pstmt.setString(4, dr.getResNo());
			pstmt.setInt(5, dr.getDiningNo());
			pstmt.setString(6, dr.getDiningName());
			pstmt.setString(7, dr.getResDate());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int insertLifeReview(Connection conn, LifeReview lr) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "insert into life_review values(fr_seq.nextval,?,?,to_char(sysdate,'yyyy-mm-dd'),?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, lr.getReviewWriter());
			pstmt.setString(2, lr.getReviewContent());
			pstmt.setInt(3, lr.getStar());
			pstmt.setString(4, lr.getResNo());
			pstmt.setInt(5, lr.getLfNo());
			pstmt.setString(6, lr.getLfName());
			pstmt.setString(7, lr.getResDate());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<RoomReview> printRoomReviewList(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<RoomReview> rList = new ArrayList<RoomReview>();
		String query = "select * from room_review where review_writer=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				RoomReview rr = new RoomReview();
				rr.setrRNo(rset.getInt("r_r_no"));
				rr.setReviewWriter(rset.getString("review_writer"));
				rr.setReviewContent(rset.getString("review_content"));
				rr.setReviewDate(rset.getString("review_date"));
				rr.setStar(rset.getInt("star"));
				rr.setResNum(rset.getString("res_num"));
				rr.setRoomNo(rset.getInt("room_no"));
				rr.setRoomName(rset.getString("room_name"));
				rr.setCheckInDate(rset.getString("checkin_date"));
				rr.setCheckOutDate(rset.getString("checkout_date"));
				rList.add(rr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return rList;
	}

	public RoomReview printMyBookingList(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		RoomReview rr = null;
		String query = "select * from room_review where review_writer=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				rr = new RoomReview();
				rr.setrRNo(rset.getInt("r_r_no"));
				rr.setReviewWriter(rset.getString("review_writer"));
				rr.setReviewContent(rset.getString("review_content"));
				rr.setReviewDate(rset.getString("review_date"));
				rr.setStar(rset.getInt("star"));
				rr.setResNum(rset.getString("res_num"));
				rr.setRoomNo(rset.getInt("room_no"));
				rr.setRoomName(rset.getString("room_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return rr;
	}

	public int updateRoomReview(Connection conn, RoomReview rr) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "update room_review set review_content=?, review_date=to_char(sysdate,'yyyy-mm-dd'), star=? where r_r_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, rr.getReviewContent());
			pstmt.setInt(2, rr.getStar());
			pstmt.setInt(3, rr.getrRNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteRoomReview(Connection conn, int rRNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "delete from room_review where r_r_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rRNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
}
