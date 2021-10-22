package member.modal.service;

import java.sql.Connection;

import common.JDBCTemplate;
import member.modal.vo.Member;
import member.model.dao.MemberDao;

public class MemberService {

	public int insertMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().insertMember(conn, m);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Member searchId(String memberKname, String email) {
		Connection conn = JDBCTemplate.getConnection();
		Member member = new MemberDao().searchId(conn, memberKname, email);
		JDBCTemplate.close(conn);
		return member;
	}

	public Member searchPw(String memberId, String memberKname, String email) {
		Connection conn = JDBCTemplate.getConnection();
		Member member = new MemberDao().searchPw(conn, memberId, memberKname, email);
		JDBCTemplate.close(conn);
		return member;
	}

	public Member selectOneMember(String memberId, String memberPw) {
		Connection conn = JDBCTemplate.getConnection();
		Member member = new MemberDao().selectOneMember(conn, memberId, memberPw);
		JDBCTemplate.close(conn);
		return member;
	}

	public Member selectOneMember(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		Member member = new MemberDao().selectOneMember(conn, memberId);
		JDBCTemplate.close(conn);
		return member;
	}

	public Member checkEmail(String email) {
		Connection conn = JDBCTemplate.getConnection();
		Member member = new MemberDao().checkEmail(conn, email);
		JDBCTemplate.close(conn);
		return member;
	}

	public Member checkPhone(String phone) {
		Connection conn = JDBCTemplate.getConnection();
		Member member = new MemberDao().checkPhone(conn, phone);
		JDBCTemplate.close(conn);
		return member;
	}

}
