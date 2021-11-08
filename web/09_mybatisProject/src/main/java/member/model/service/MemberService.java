package member.model.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {
	
	private SqlSession getSqlSession() {
		SqlSession session = null;
		String resource = "/mybatis-config.xml";	// 마이바티스 설정파일 경로
		try {
			InputStream is = Resources.getResourceAsStream(resource);
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
			SqlSessionFactory factory = builder.build(is);
			session = factory.openSession(false);	// 오토커밋 해제를 위해 매개변수 false 전달
		} catch (IOException e) {
			e.printStackTrace();
		}
		return session;
	}
	
	public Member selectOneMember(Member m) {
		// Connection 대신 SqlSession을 사용한다.
		SqlSession session = getSqlSession();
		Member member = new MemberDao().selectOneMember(session, m);
		session.close();
		return member;
	}

	public ArrayList<Member> selectAllMember() {
		SqlSession session = getSqlSession();
		ArrayList<Member> list = new MemberDao().selectAllMember(session);
		session.close();
		return list;
	}

	public int insertMember(Member member) {
		SqlSession session = getSqlSession();
		int result = new MemberDao().insertMember(session, member);
		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}

	public int deleteMember(String memberId) {
		SqlSession session = getSqlSession();
		int result = new MemberDao().deleteMember(session, memberId);
		if(result > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		session.close();		
		return result;
	}

	public Member selectMyMember(int memberNo) {
		SqlSession session = getSqlSession();
		Member member = new MemberDao().selectMyMember(session, memberNo);
		session.close();
		return member;
	}

	public int updateMember(Member member) {
		SqlSession session = getSqlSession();
		int result = new MemberDao().updateMember(session, member);
		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}

	public String searchId(String memberName, String phone) {
		SqlSession session = getSqlSession();
		// mybatis는 여러값을 전달해야할때 1개의 객체로 전달
		// 1) 데이터 전송용 vo생성 (memberName, phone 변수 2개짜리 vo)
		// 2) Member 타입사용 (memberName, phone 2개 변수만 사용)
		// 3) Map 사용
		// 전달해야하는 데이터의 타입이 다양한 경우를 고려해서 value을 Object로 설정
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberName", memberName);
		map.put("phone", phone);
		String memberId = new MemberDao().searchId(session, map);
		session.close();
		return memberId;
	}

	public String searchPw(String memberId, String phone) {
		SqlSession session = getSqlSession();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("phone", phone);
		String memberPw = new MemberDao().searchPw(session, map);
		session.close();
		return memberPw;
	}

}
