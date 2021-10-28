package bookingView.modal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bookingView.modal.vo.BookingViewDining;
import bookingView.modal.vo.BookingViewLife;
import bookingView.modal.vo.BookingViewRoom;
import common.JDBCTemplate;
import inquiryView.vo.InquiryView;

public class BookingViewDao {

	public ArrayList<BookingViewRoom> printBookingList(Connection conn, int start, int end, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BookingViewRoom> rlist = new ArrayList<BookingViewRoom>();
		String query = "SELECT ROWNUM, TO_CHAR(CHECKIN, 'YYYY/MM/DD')TRANSINDATE, TO_CHAR(CHECKOUT, 'YYYY/MM/DD')TRANSOUTDATE, B.* FROM (SELECT * FROM ROOM_RES ORDER BY RES_NUM DESC)B WHERE ROWNUM BETWEEN ? AND ? AND MEMBER_ID=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setString(3, memberId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				BookingViewRoom bvr = new BookingViewRoom();
				bvr.setResNum(rset.getString("res_num"));
				bvr.setRoomNo(rset.getInt("room_no"));
				bvr.setMemberId(rset.getString("member_id"));
				bvr.setMemberKName(rset.getString("member_kname"));
				bvr.setRoomType(rset.getString("room_type"));
				bvr.setRoomName(rset.getString("room_name"));
				bvr.setCheckIn(rset.getString("transindate"));
				bvr.setCheckOut(rset.getString("transoutdate"));
				bvr.setRoomPrice(rset.getInt("room_price"));
				bvr.setPayStatus(rset.getInt("pay_status"));
				bvr.setAdult(rset.getInt("adult"));
				bvr.setKid(rset.getInt("kid"));
				rlist.add(bvr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return rlist;
	}

	public int selectTotalCount(Connection conn, String tableType, String memberId ) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "select count(*) as cnt from "+tableType+" where member_id=?";
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

	public BookingViewRoom printMyBookingList(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT TO_CHAR(CHECKIN, 'YYYY/MM/DD')TRANSINDATE, TO_CHAR(CHECKOUT, 'YYYY/MM/DD')TRANSOUTDATE, "
				+ "B.* FROM (SELECT * FROM ROOM_RES ORDER BY RES_NUM DESC)B WHERE MEMBER_ID=?";
		BookingViewRoom bvr = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				bvr = new BookingViewRoom();
				bvr.setResNum(rset.getString("res_num"));
				bvr.setRoomNo(rset.getInt("room_no"));
				bvr.setMemberId(rset.getString("member_id"));
				bvr.setMemberKName(rset.getString("member_kname"));
				bvr.setRoomType(rset.getString("room_type"));
				bvr.setRoomName(rset.getString("room_name"));
				bvr.setCheckIn(rset.getString("transindate"));
				bvr.setCheckOut(rset.getString("transoutdate"));
				bvr.setRoomPrice(rset.getInt("room_price"));
				bvr.setPayStatus(rset.getInt("pay_status"));
				bvr.setAdult(rset.getInt("adult"));
				bvr.setKid(rset.getInt("kid"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return bvr;
	}

	public ArrayList<BookingViewDining> printBookingDiningList(Connection conn, int start, int end, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT ROWNUM, DINING_NAME, TO_CHAR(RES_DATE, 'YYYY/MM/DD')TRANSDATE, D.* FROM (SELECT * FROM DINING_RES ORDER BY RES_NO DESC)D JOIN DINING B ON (D.DINING_NO = B.DINING_NO) WHERE ROWNUM BETWEEN ? AND ? AND MEMBER_ID=?";
		ArrayList<BookingViewDining> dList = new ArrayList<BookingViewDining>();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setString(3, memberId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				BookingViewDining bvd = new BookingViewDining();
				bvd.setResNo(rset.getString("res_no"));
				bvd.setDiningNo(rset.getInt("dining_no"));
				bvd.setMemberId(rset.getString("member_id"));
				bvd.setGuestsACnt(rset.getInt("guests_adt_cnt"));
				bvd.setGuestsKCnt(rset.getInt("guests_kid_cnt"));
				bvd.setResDate(rset.getString("transdate"));
				bvd.setResTime(rset.getString("res_time"));
				bvd.setTimeType(rset.getInt("time_type"));
				bvd.setSeatType(rset.getInt("seat_type"));
				bvd.setResStatus(rset.getInt("res_status"));
				bvd.setDiningName(rset.getString("dining_name"));
				dList.add(bvd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return dList;
	}

	public BookingViewDining printMyBookingDiningList(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT DINING_NAME, TO_CHAR(RES_DATE, 'YYYY/MM/DD')TRANSDATE, D.* FROM (SELECT * FROM DINING_RES ORDER BY RES_NO DESC)D "
				+ "JOIN DINING B ON (D.DINING_NO = B.DINING_NO) WHERE MEMBER_ID=?";
		BookingViewDining bvd = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				bvd = new BookingViewDining();
				bvd.setResNo(rset.getString("res_no"));
				bvd.setDiningNo(rset.getInt("dining_no"));
				bvd.setMemberId(rset.getString("member_id"));
				bvd.setGuestsACnt(rset.getInt("guests_adt_cnt"));
				bvd.setGuestsKCnt(rset.getInt("guests_kid_cnt"));
				bvd.setResDate(rset.getString("transdate"));
				bvd.setResTime(rset.getString("res_time"));
				bvd.setTimeType(rset.getInt("time_type"));
				bvd.setSeatType(rset.getInt("seat_type"));
				bvd.setResStatus(rset.getInt("res_status"));
				bvd.setDiningName(rset.getString("dining_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return bvd;
	}

	public ArrayList<BookingViewLife> printBookingLifeList(Connection conn, int start, int end, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT ROWNUM, LF_TITLE, TO_CHAR(RES_DATE, 'YYYY/MM/DD')TRANSDATE, LF.* FROM (SELECT * FROM LF_RES ORDER BY RES_NO DESC)LF JOIN LIFESTYLE LS ON (LF.LF_NO = LS.LF_NO) WHERE ROWNUM BETWEEN ? AND ? AND MEMBER_ID=?";
		ArrayList<BookingViewLife> lfList = new ArrayList<BookingViewLife>();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setString(3, memberId);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				BookingViewLife bvl = new BookingViewLife();
				bvl.setResNo(rset.getString("res_no"));
				bvl.setLfNo(rset.getInt("lf_no"));
				bvl.setMemberId(rset.getString("member_id"));
				bvl.setResPeople(rset.getInt("res_people"));
				bvl.setResDate(rset.getString("transdate"));
				bvl.setResTime(rset.getString("res_time"));
				bvl.setStatus(rset.getInt("status"));
				bvl.setPrice(rset.getInt("price"));
				bvl.setLfName(rset.getString("lf_title"));
				lfList.add(bvl);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return lfList;
	}

	public BookingViewLife printMyBookingLifeList(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT LF_TITLE, TO_CHAR(RES_DATE, 'YYYY/MM/DD')TRANSDATE, "
				+ "LF.* FROM (SELECT * FROM LF_RES ORDER BY RES_NO DESC)LF JOIN LIFESTYLE LS ON (LF.LF_NO = LS.LF_NO) WHERE MEMBER_ID=?";
		BookingViewLife bvl = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				bvl = new BookingViewLife();
				bvl.setResNo(rset.getString("res_no"));
				bvl.setLfNo(rset.getInt("lf_no"));
				bvl.setMemberId(rset.getString("member_id"));
				bvl.setResPeople(rset.getInt("res_people"));
				bvl.setResDate(rset.getString("transdate"));
				bvl.setResTime(rset.getString("res_time"));
				bvl.setStatus(rset.getInt("status"));
				bvl.setPrice(rset.getInt("price"));
				bvl.setLfName(rset.getString("lf_title"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return bvl;
	}

}
