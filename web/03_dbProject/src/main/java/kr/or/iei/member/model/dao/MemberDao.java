package kr.or.iei.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import kr.or.iei.member.model.vo.Member;

public class MemberDao {

	public int insertMember(Connection conn, Member member) {
			PreparedStatement pstmt = null;
			int result = 0;
			String query = "insert into member values(member_seq.nextval,?,?,?,?,?,2,to_char(sysdate,'yyyy-mm-dd'))";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, member.getMemberId());
				pstmt.setString(2, member.getMemberPw());
				pstmt.setString(3, member.getMemberName());
				pstmt.setString(4, member.getPhone());
				pstmt.setString(5, member.getAddress());
				result = pstmt.executeUpdate();
			} catch(SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(pstmt);
			}
			return result;
	}

	public ArrayList<Member> allMember(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Member> list = new ArrayList<Member>();
		String query = "select * from member";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Member m = new Member();
				m.setMemberNo(rset.getInt("member_no"));
				m.setMemberId(rset.getString("member_id"));
				m.setMemberPw(rset.getString("member_pw"));
				m.setMemberName(rset.getString("member_name"));
				m.setPhone(rset.getString("phone"));
				m.setAddress(rset.getString("address"));
				m.setMemberLevel(rset.getInt("member_level"));
				m.setEnrollDate(rset.getString("enroll_date"));
				list.add(m);
			} 
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}

}
