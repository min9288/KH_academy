package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import vo.Reservation;
import vo.Member;

public class MemberDao {

	public int reservation(Connection conn, Reservation r, int memberNo) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "insert into reservation values(reservation_seq.nextval, ?, ?, default, "
				+ "to_date(?,'yyyymmdd'),to_date(?,'yyyymmdd')+?, ?)";
		
		try {
			pstmt = conn.prepareStatement(query);
			int i = 1;
			pstmt.setInt(i++, memberNo);
			pstmt.setInt(i++, r.getRoomNo());
			pstmt.setInt(i++, r.getIntCheckIn());
			pstmt.setInt(i++, r.getIntCheckIn());
			pstmt.setInt(i++, r.getIntCheckOut());
			pstmt.setInt(i++, r.getResPerson());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);;
		}
		return result;
	}

	public int cancelReservation(Connection conn, int resNo) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "delete from reservation where res_No = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, resNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public Member mypage(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		String query = "select * from member where member_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = parseMember(rset);
				/*m = new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberPhone(rset.getString("member_phone"));
				m.setMemberAddr(rset.getString("member_addr"));*/
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

	public ArrayList<Reservation> myReservationInfo(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Reservation> list = new ArrayList<Reservation>();
		String query = "select res_no, room_no, res_date, check_in,check_out, res_person from reservation join Member using (Member_no) where member_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				 list.add(parseReservation(rset));
				/*r = new Reservation();
				r.setResNo(rset.getInt("res_no"));
				r.setRoomNo(rset.getInt("room_no"));
				r.setResDate(rset.getDate("res_date"));
				r.setCheckIn(rset.getDate("check_in"));
				r.setCheckOut(rset.getDate("check_out"));
				r.setResPerson(rset.getInt("res_person"));*/
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	/////////////////////////////////////////////
	public Member parseMember(ResultSet rset) throws SQLException {
		Member m = new Member();
		m.setMemberNo(rset.getInt("member_no"));
		m.setMemberId(rset.getString("member_id"));
		m.setMemberPw(rset.getString("member_pw"));
		m.setMemberPhone(rset.getString("member_phone"));
		m.setMemberAddr(rset.getString("member_addr"));
		m.setMemberLevel(rset.getInt("member_level"));
		return m;
	}
	///////////////////////////////////////////
	public Reservation parseReservation(ResultSet rset) throws SQLException {
		Reservation r = new Reservation();
		r.setResNo(rset.getInt("res_no"));
		r.setRoomNo(rset.getInt("room_no"));
		r.setResDate(rset.getDate("res_date"));
		r.setCheckIn(rset.getDate("check_in"));
		r.setCheckOut(rset.getDate("check_out"));
		r.setResPerson(rset.getInt("res_person"));
		return r;
	}

	public Member selectOneMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		String query = "select * from member where member_id=? and member_pw=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			rset = pstmt.executeQuery();
			if(rset.next()) {
				member = parseMember(rset);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return member;
	}

}
