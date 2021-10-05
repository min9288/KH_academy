package member.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.StringTokenizer;

import common.JDBCTemplate;
import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {

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

	public int updateMember(Member member) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().updateMember(conn, member);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteMember(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().deleteMember(conn, memberNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public Member searchId(String memberName, String phone) {
		Connection conn = JDBCTemplate.getConnection();
		Member member = new MemberDao().searchId(conn, memberName, phone);
		JDBCTemplate.close(conn);
		return member;
	}

	public Member searchPw(String memberId, String phone) {
		Connection conn = JDBCTemplate.getConnection();
		Member member = new MemberDao().searchPw(conn, memberId, phone);
		JDBCTemplate.close(conn);
		return member;
	}

	public ArrayList<Member> selectAllMember() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Member> list = new MemberDao().selectAllMember(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public int changeLevel(int memberNo, int memberLevel) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().changeLevel(conn, memberNo, memberLevel);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public boolean chkChangeLevel(String num, String level) {
		Connection conn = JDBCTemplate.getConnection();
		StringTokenizer sT1 = new StringTokenizer(num, "/");
		StringTokenizer sT2 = new StringTokenizer(level, "/");
		MemberDao dao = new MemberDao();
		boolean result = true;
		while(sT1.hasMoreTokens()) {
			int memberNo = Integer.parseInt(sT1.nextToken());	 // sT1 다음 토큰을 1개 꺼내와 정수로 변환
			int memberLevel = Integer.parseInt(sT2.nextToken()); // sT2 다음 토큰을 1개 꺼내와 정수로 변환
			int result1 = dao.changeLevel(conn, memberNo, memberLevel);
			if (result1 == 0) {
				result = false;
				break;
			}
		}
		if(result) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

}
