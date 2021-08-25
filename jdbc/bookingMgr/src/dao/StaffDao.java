package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import vo.Accommodation;
import vo.Member;
import vo.Reservation;

public class StaffDao {
	public ArrayList<Accommodation> selectAccList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Accommodation>accList = new ArrayList<Accommodation>();
		String query = "select * from accommodation";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				accList.add(parseAcc(rset));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return accList;
	}

	private Accommodation parseAcc(ResultSet rset) throws SQLException {
		Accommodation acc = new Accommodation();
		acc.setRoomNo(rset.getInt("room_no"));
		acc.setRoomType(rset.getInt("room_type"));
		acc.setRoomPrice(rset.getInt("room_price"));
		acc.setAcceptPerson(rset.getInt("accep_person"));
		return acc;
	}

	public int insertAcc(Connection conn, Accommodation acc) {
		PreparedStatement pstmt = null;
		int result =0;
		String query ="insert into accommodation values (acc_seq.nextval,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			int i =1;
			pstmt.setInt(i++, acc.getRoomType());
			pstmt.setInt(i++, acc.getRoomPrice());
			pstmt.setInt(i++,acc.getAcceptPerson());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int deleteAcc(Connection conn, int acc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from accommodation where room_no=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, acc);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
		}
		return result;
	}

	public ArrayList<Reservation> selectAllRes(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		ArrayList<Reservation>resList = new ArrayList<Reservation>();
		String query = "select * from reservation";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				resList.add(parseRes(rset));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return resList;
	}

	private Reservation parseRes(ResultSet rset) throws SQLException {
		Reservation res = new Reservation();
		res.setResNo(rset.getInt("res_no"));
		res.setMemberNo(rset.getInt("member_no"));
		res.setRoomNo(rset.getInt("room_no"));
		res.setResDate(rset.getDate("res_date"));
		res.setCheckIn(rset.getDate("check_in"));
		res.setCheckOut(rset.getDate("check_out"));
		res.setResPerson(rset.getInt("res_person"));
		return res;
	}

	public ArrayList<Member> selectAllMember(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> memList = new ArrayList<Member>();
		String query = "select * from member ";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				memList.add(parseMember(rset));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return memList;
	}

	private Member parseMember(ResultSet rset) throws SQLException {
		Member m =new Member();
		m.setMemberNo(rset.getInt("member_no"));
		m.setMemberId(rset.getString("member_id"));
		m.setMemberPw(rset.getString("member_pw"));
		m.setMemberName(rset.getString("member_name"));
		m.setMemberPhone(rset.getString("member_phone"));
		m.setMemberAddr(rset.getString("member_addr"));
		m.setMemberLevel(rset.getInt("member_level"));
				
		return m;
	}
}
