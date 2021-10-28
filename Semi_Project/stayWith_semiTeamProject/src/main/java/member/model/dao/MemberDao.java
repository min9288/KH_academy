package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import member.modal.vo.Member;

public class MemberDao {

	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "insert into member values(m_seq.nextval,?,?,?,?,?,2,?,?,?,0,to_char(sysdate,'yyyy-mm-dd'))";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getMemberKname());
			pstmt.setString(4, m.getMemberLname());
			pstmt.setString(5, m.getMemberFname());
			pstmt.setString(6, m.getPhone());
			pstmt.setInt(7, m.getBirth());
			pstmt.setString(8, m.getEmail());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Member searchId(Connection conn, String memberKname, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from member where member_kname=? and email=?";
		Member m = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberKname);
			pstmt.setString(2, email);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberKname(rset.getString("member_kname"));
				m.setMemberLname(rset.getString("member_lname"));
				m.setMemberFname(rset.getString("member_fname"));
				m.setMemberLevel(rset.getInt("member_level"));
				m.setPhone(rset.getString("phone"));
				m.setBirth(rset.getInt("birth"));
				m.setEmail(rset.getString("email"));
				m.setPoint(rset.getInt("point"));
				m.setEnrollDate(rset.getString("enroll_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

	public Member searchPw(Connection conn, String memberId, String memberKname, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from member where member_id=? and member_kname=? and email=?";
		Member m = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberKname);
			pstmt.setString(3, email);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberKname(rset.getString("member_kname"));
				m.setMemberLname(rset.getString("member_lname"));
				m.setMemberFname(rset.getString("member_fname"));
				m.setMemberLevel(rset.getInt("member_level"));
				m.setPhone(rset.getString("phone"));
				m.setBirth(rset.getInt("birth"));
				m.setEmail(rset.getString("email"));
				m.setPoint(rset.getInt("point"));
				m.setEnrollDate(rset.getString("enroll_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

	public Member selectOneMember(Connection conn, String memberId, String memberPw) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from member where member_id=? and member_pw=?";
		Member m = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPw);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberKname(rset.getString("member_kname"));
				m.setMemberLname(rset.getString("member_lname"));
				m.setMemberFname(rset.getString("member_fname"));
				m.setMemberLevel(rset.getInt("member_level"));
				m.setPhone(rset.getString("phone"));
				m.setBirth(rset.getInt("birth"));
				m.setEmail(rset.getString("email"));
				m.setPoint(rset.getInt("point"));
				m.setEnrollDate(rset.getString("enroll_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

	public Member selectOneMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from member where member_id=?";
		Member m = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberKname(rset.getString("member_kname"));
				m.setMemberLname(rset.getString("member_lname"));
				m.setMemberFname(rset.getString("member_fname"));
				m.setMemberLevel(rset.getInt("member_level"));
				m.setPhone(rset.getString("phone"));
				m.setBirth(rset.getInt("birth"));
				m.setEmail(rset.getString("email"));
				m.setPoint(rset.getInt("point"));
				m.setEnrollDate(rset.getString("enroll_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

	public Member checkEmail(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from member where email=?";
		Member m = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, email);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberKname(rset.getString("member_kname"));
				m.setMemberLname(rset.getString("member_lname"));
				m.setMemberFname(rset.getString("member_fname"));
				m.setMemberLevel(rset.getInt("member_level"));
				m.setPhone(rset.getString("phone"));
				m.setBirth(rset.getInt("birth"));
				m.setEmail(rset.getString("email"));
				m.setPoint(rset.getInt("point"));
				m.setEnrollDate(rset.getString("enroll_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

	public Member checkPhone(Connection conn, String phone) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from member where phone=?";
		Member m = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, phone);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberKname(rset.getString("member_kname"));
				m.setMemberLname(rset.getString("member_lname"));
				m.setMemberFname(rset.getString("member_fname"));
				m.setMemberLevel(rset.getInt("member_level"));
				m.setPhone(rset.getString("phone"));
				m.setBirth(rset.getInt("birth"));
				m.setEmail(rset.getString("email"));
				m.setPoint(rset.getInt("point"));
				m.setEnrollDate(rset.getString("enroll_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

	public Member checkPw(Connection conn, String memberPw, int memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from member where member_pw=? and member_no=?";
		Member m = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberPw);
			pstmt.setInt(2, memberNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				m = new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberKname(rset.getString("member_kname"));
				m.setMemberLname(rset.getString("member_lname"));
				m.setMemberFname(rset.getString("member_fname"));
				m.setMemberLevel(rset.getInt("member_level"));
				m.setPhone(rset.getString("phone"));
				m.setBirth(rset.getInt("birth"));
				m.setEmail(rset.getString("email"));
				m.setPoint(rset.getInt("point"));
				m.setEnrollDate(rset.getString("enroll_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

	public int deleteMember(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "delete from member where member_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, memberNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updateMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "update member set email=?, phone=? where member_id=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getMemberId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public int updatePw(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = "update member set member_pw=? where member_id=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, m.getMemberPw());
			pstmt.setString(2, m.getMemberId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

}
