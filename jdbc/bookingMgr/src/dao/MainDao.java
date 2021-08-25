package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.JDBCTemplate;
import vo.Member;

public class MainDao {
	public Member parseMember(ResultSet rset) throws SQLException {
		Member m = new Member();
		m.setMemberNo(rset.getInt("member_no"));
		m.setMemberId(rset.getString("member_id"));
		m.setMemberPw(rset.getString("member_pw"));
		m.setMemberName(rset.getString("member_name"));
		m.setMemberPhone(rset.getString("member_phone"));
		m.setMemberPhone(rset.getString("member_addr"));
		m.setMemberLevel(rset.getInt("member_level"));

		return m;
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
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return member;
		
	}

	public boolean selectOneMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		boolean result = false;
		String query = "select * from member where member_id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			result = rset.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return result;
		
	}

	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		
		int result = 0;
		String query = "insert into member values (member_seq.nextval,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(query);
			int i = 1;
			pstmt.setString(i++, m.getMemberId());
			pstmt.setString(i++, m.getMemberPw());
			pstmt.setString(i++, m.getMemberName());
			pstmt.setString(i++, m.getMemberPhone());
			pstmt.setString(i++, m.getMemberAddr());
			pstmt.setInt(i++, m.getMemberLevel());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
}
