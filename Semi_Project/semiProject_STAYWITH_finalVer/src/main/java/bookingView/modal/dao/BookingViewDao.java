package bookingView.modal.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import bookingView.modal.service.BookingViewService;
import bookingView.modal.vo.BookingViewDining;
import bookingView.modal.vo.BookingViewLife;
import bookingView.modal.vo.BookingViewRoom;
import common.JDBCTemplate;

public class BookingViewDao {

	public ArrayList<BookingViewRoom> printBookingList(Connection conn, int start, int end, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		DateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date nowDate = new Date();
		String today = sdFormat.format(nowDate);

		ArrayList<BookingViewRoom> rlist = new ArrayList<BookingViewRoom>();
		String query = "SELECT R.ROOM_IMG RI, RE.RES_NUM CHECK_REVIEW, TO_CHAR(CHECKIN, 'YYYY/MM/DD')TRANSINDATE, TO_CHAR(CHECKOUT, 'YYYY/MM/DD')TRANSOUTDATE, B.* "
				+ "FROM (SELECT ROWNUM AS RNUM, A.* FROM (SELECT * FROM ROOM_RES WHERE MEMBER_ID=? ORDER BY RES_NUM DESC)A)B "
				+ "JOIN ROOM R ON(R.ROOM_NO = B.ROOM_NO) "
				+ "LEFT OUTER JOIN ROOM_REVIEW RE ON(B.RES_NUM = RE.RES_NUM)"
				+ "WHERE RNUM BETWEEN ? AND ? ORDER BY LPAD(B.RES_NUM,4,'0') DESC";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				String comDate = rset.getString("transindate");
				int checkStatus = rset.getInt("pay_status");
				String resNum = rset.getString("res_num");
				int compare = today.compareTo(comDate);
				if(compare >= 0 && checkStatus == 1) {
					int result = new BookingViewService().updateRoomStatus(memberId, resNum);
					if(result > 0) {
						System.out.println("업데이트 성공");
					}else {
						System.out.println("업데이트 실패");
					}
				}else {
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
					bvr.setReviewCheck(rset.getString("check_review"));
					bvr.setRoomImg(rset.getString("ri"));
					rlist.add(bvr);
				}
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
		String query = "SELECT  R.ROOM_IMG RI, RE.RES_NUM CHECK_REVIEW, TO_CHAR(CHECKIN, 'YYYY/MM/DD')TRANSINDATE, TO_CHAR(CHECKOUT, 'YYYY/MM/DD')TRANSOUTDATE, B.* "
				+ "FROM (SELECT * FROM ROOM_RES ORDER BY RES_NUM DESC)B "
				+ "JOIN ROOM R ON(R.ROOM_NO = B.ROOM_NO) "
				+ "LEFT OUTER JOIN ROOM_REVIEW RE ON(B.RES_NUM = RE.RES_NUM) WHERE MEMBER_ID=?";
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
				bvr.setReviewCheck(rset.getString("check_review"));
				bvr.setRoomImg(rset.getString("ri"));
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
		String query = "SELECT B.THUMBNAIL_IMG TI, DR.RES_NO CHECK_REVIEW, B.DINING_NAME DN, TO_CHAR(DE.RES_DATE, 'YYYY/MM/DD')TRANSDATE, DE.* "
				+ "FROM (SELECT ROWNUM AS RNUM, D.* FROM(SELECT * FROM DINING_RES WHERE MEMBER_ID=? ORDER BY LPAD(RES_NO,4,'0') DESC)D)DE "
				+ "JOIN DINING B ON (DE.DINING_NO = B.DINING_NO) "
				+ "LEFT OUTER JOIN DINING_REVIEW DR ON(DE.RES_NO = DR.RES_NO)"
				+ "WHERE RNUM BETWEEN ? AND ? ORDER BY LPAD(DE.RES_NO,4,'0') DESC";
		
		DateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date nowDate = new Date();
		String today = sdFormat.format(nowDate);
		
		ArrayList<BookingViewDining> dList = new ArrayList<BookingViewDining>();
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				String comDate = rset.getString("transdate");
				int checkStatus = rset.getInt("res_status");
				String resNo = rset.getString("res_no");
				int compare = today.compareTo(comDate);
				if(compare >= 0 && checkStatus == 1) {
					int result = new BookingViewService().updateDiningStatus(memberId, resNo);
					if(result > 0) {
						System.out.println("업데이트 성공");
					}else {
						System.out.println("업데이트 실패");
					}
				}else {
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
					bvd.setDiningName(rset.getString("dn"));
					bvd.setReviewCheck(rset.getString("check_review"));
					bvd.setDiningImg(rset.getString("ti"));
					dList.add(bvd);
				}
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
		String query = "SELECT B.THUMBNAIL_IMG TI, DR.RES_NO CHECK_REVIEW, B.DINING_NAME dn, TO_CHAR(DE.RES_DATE, 'YYYY/MM/DD')TRANSDATE, DE.* "
				+ "FROM (SELECT * FROM DINING_RES ORDER BY RES_NO DESC)DE "
				+ "JOIN DINING B ON (DE.DINING_NO = B.DINING_NO) "
				+ "LEFT OUTER JOIN DINING_REVIEW DR ON(DE.RES_NO = DR.RES_NO) WHERE MEMBER_ID=?";
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
				bvd.setDiningName(rset.getString("dn"));
				bvd.setReviewCheck(rset.getString("check_review"));
				bvd.setDiningImg(rset.getString("ti"));
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
		String query = "SELECT LS.FILEPATH FP, LR.RES_NO CHECK_REVIEW, LS.LF_TITLE LT, TO_CHAR(LF.RES_DATE, 'YYYY/MM/DD')TRANSDATE, LF.* "
				+ "FROM (SELECT ROWNUM AS RNUM, L.* FROM (SELECT * FROM LF_RES WHERE MEMBER_ID=? ORDER BY LPAD(RES_NO,4,'0') DESC)L)LF "
				+ "JOIN LIFESTYLE LS ON (LF.LF_NO = LS.LF_NO) "
				+ "LEFT OUTER JOIN LIFE_REVIEW LR ON(LF.RES_NO = LR.RES_NO) "
				+ "WHERE RNUM BETWEEN ? AND ? ORDER BY LPAD(LF.RES_NO,4,'0') DESC";
		ArrayList<BookingViewLife> lfList = new ArrayList<BookingViewLife>();
		
		DateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date nowDate = new Date();
		String today = sdFormat.format(nowDate);
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				String comDate = rset.getString("transdate");
				int checkStatus = rset.getInt("status");
				String resNo = rset.getString("res_no");
				int compare = today.compareTo(comDate);
				if(compare >= 0 && checkStatus == 1) {
					int result = new BookingViewService().updateLifeStatus(memberId, resNo);
					if(result > 0) {
						System.out.println("업데이트 성공");
					}else {
						System.out.println("업데이트 실패");
					}
				}else {
					BookingViewLife bvl = new BookingViewLife();
					bvl.setResNo(rset.getString("res_no"));
					bvl.setLfNo(rset.getInt("lf_no"));
					bvl.setMemberId(rset.getString("member_id"));
					bvl.setResPeople(rset.getInt("res_people"));
					bvl.setResDate(rset.getString("transdate"));
					bvl.setResTime(rset.getString("res_time"));
					bvl.setStatus(rset.getInt("status"));
					bvl.setPrice(rset.getInt("price"));
					bvl.setLfName(rset.getString("lt"));
					bvl.setReviewCheck(rset.getString("check_review"));
					bvl.setLfImg(rset.getString("fp"));
					lfList.add(bvl);
				}
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
		String query = "SELECT LS.FILEPATH FP, LR.RES_NO CHECK_REVIEW, LS.LF_TITLE LT, TO_CHAR(LF.RES_DATE, 'YYYY/MM/DD')TRANSDATE, LF.* "
				+ "FROM (SELECT * FROM LF_RES ORDER BY RES_NO DESC)LF "
				+ "JOIN LIFESTYLE LS ON (LF.LF_NO = LS.LF_NO) "
				+ "LEFT OUTER JOIN LIFE_REVIEW LR ON(LF.RES_NO = LR.RES_NO) "
				+ "WHERE MEMBER_ID=?";
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
				bvl.setLfName(rset.getString("lt"));
				bvl.setReviewCheck(rset.getString("check_review"));
				bvl.setLfImg(rset.getString("fp"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return bvl;
	}


	public int updateRoomStatus(Connection conn, String resNum, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update room_res set pay_status = 2 where member_id = ? and res_num = ? and pay_status = 1";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, resNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateDiningStatus(Connection conn, String resNo, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update dining_res set res_status = 2 where member_id = ? and res_no = ? and res_status = 1";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, resNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateLifeStatus(Connection conn, String resNo, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "update lf_res set status = 2 where member_id = ? and res_no = ? and status = 1";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, resNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
