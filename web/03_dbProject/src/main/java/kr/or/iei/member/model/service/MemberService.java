package kr.or.iei.member.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import kr.or.iei.member.model.dao.MemberDao;
import kr.or.iei.member.model.vo.Member;

public class MemberService {

	public int insertMember(Member member) {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		int result = dao.insertMember(conn, member);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<Member> allMember() {
		Connection conn = JDBCTemplate.getConnection();
		MemberDao dao = new MemberDao();
		ArrayList<Member> list = dao.allMember(conn);
		JDBCTemplate.close(conn);
		return list;
	}

}
