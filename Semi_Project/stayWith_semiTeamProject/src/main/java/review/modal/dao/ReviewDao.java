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
				rr.setCheckInDate(rset.getString("checkin_date"));
				rr.setCheckOutDate(rset.getString("checkout_date"));
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

	public ArrayList<RoomReview> printRoomReviewList(Connection conn, int start, int end, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<RoomReview> rList = new ArrayList<RoomReview>();
		String query = "select b.* from (select rownum rnum, a.* from (select * from room_review order by r_r_no desc )a)b "
				+ "where rnum between ? and ? and review_writer=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setString(3, memberId);
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

	public int selectTotalCount(Connection conn, String memberId, String tableType) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "select count(*) as cnt from "+tableType+" where review_writer=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<DiningReview> printDiningReviewList(Connection conn, int start, int end, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<DiningReview> dList = new ArrayList<DiningReview>();
		String query = "select b.* from (select rownum rnum, a.* from (select * from dining_review order by d_r_no desc )a)b "
				+ "where rnum between ? and ? and review_writer=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setString(3, memberId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				DiningReview dr = new DiningReview();
				dr.setdRNo(rset.getInt("d_r_no"));
				dr.setReviewWriter(rset.getString("review_writer"));
				dr.setReviewContent(rset.getString("review_content"));
				dr.setReviewDate(rset.getString("review_date"));
				dr.setStar(rset.getInt("star"));
				dr.setResNo(rset.getString("res_no"));
				dr.setDiningNo(rset.getInt("dining_no"));
				dr.setDiningName(rset.getString("dining_name"));
				dr.setResDate(rset.getString("res_date"));
				dList.add(dr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return dList;
	}

	public DiningReview printDiningReview(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		DiningReview dr = null;
		String query = "select * from dining_review where review_writer=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				dr = new DiningReview();
				dr.setdRNo(rset.getInt("d_r_no"));
				dr.setReviewWriter(rset.getString("review_writer"));
				dr.setReviewContent(rset.getString("review_content"));
				dr.setReviewDate(rset.getString("review_date"));
				dr.setStar(rset.getInt("star"));
				dr.setResNo(rset.getString("res_no"));
				dr.setDiningNo(rset.getInt("dining_no"));
				dr.setDiningName(rset.getString("dining_name"));
				dr.setResDate(rset.getString("res_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return dr;
	}

	public int deleteDiningReview(Connection conn, int dRNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "delete from dining_review where d_r_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, dRNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateDiningReview(Connection conn, DiningReview dr) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "update dining_review set review_content=?, review_date=to_char(sysdate,'yyyy-mm-dd'), star=? where d_r_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dr.getReviewContent());
			pstmt.setInt(2, dr.getStar());
			pstmt.setInt(3, dr.getdRNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public ArrayList<LifeReview> printLifeReviewList(Connection conn, int start, int end, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<LifeReview> lfList = new ArrayList<LifeReview>();
		String query = "select b.* from (select rownum rnum, a.* from (select * from life_review order by lf_r_no desc )a)b "
				+ "where rnum between ? and ? and review_writer=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setString(3, memberId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				LifeReview lr = new LifeReview();
				lr.setLfRNo(rset.getInt("lf_r_no"));
				lr.setReviewWriter(rset.getString("review_writer"));
				lr.setReviewContent(rset.getString("review_content"));
				lr.setReviewDate(rset.getString("review_date"));
				lr.setStar(rset.getInt("star"));
				lr.setResNo(rset.getString("res_no"));
				lr.setLfNo(rset.getInt("lf_no"));
				lr.setLfName(rset.getString("life_name"));
				lr.setResDate(rset.getString("res_date"));
				lfList.add(lr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return lfList;
	}

	public LifeReview printLifeReview(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		LifeReview lr = null;
		String query = "select * from life_review where review_writer=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				lr = new LifeReview();
				lr.setLfRNo(rset.getInt("lf_r_no"));
				lr.setReviewWriter(rset.getString("review_writer"));
				lr.setReviewContent(rset.getString("review_content"));
				lr.setReviewDate(rset.getString("review_date"));
				lr.setStar(rset.getInt("star"));
				lr.setResNo(rset.getString("res_no"));
				lr.setLfNo(rset.getInt("lf_no"));
				lr.setLfName(rset.getString("life_name"));
				lr.setResDate(rset.getString("res_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return lr;
	}

	public int deleteLifeReview(Connection conn, int lfRNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "delete from life_review where lf_r_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, lfRNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateLifeReview(Connection conn, LifeReview lr) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "update life_review set review_content=?, review_date=to_char(sysdate,'yyyy-mm-dd'), star=? where lf_r_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, lr.getReviewContent());
			pstmt.setInt(2, lr.getStar());
			pstmt.setInt(3, lr.getLfRNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
}
