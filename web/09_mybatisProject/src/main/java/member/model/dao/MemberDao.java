package member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import member.model.vo.Member;
import member.model.vo.PwSearchVo;

public class MemberDao {

	public Member selectOneMember(SqlSession session, Member m) {
		// 로그인은 select 쿼리문 수행 -> 수행결과는 없거나 무조건 1명 정보 -> 사용메소드 selectOne
		// 매개변수 1 -> 어떤 mapper에서 어떤 쿼리문을 수행할지, 매개변수2 -> 쿼리문 수행에 필요한 값 전달
		Member member = session.selectOne("member.selectOneMember", m);
		return member;
	}

	public ArrayList<Member> selectAllMember(SqlSession session) {
		// 전체회원 조회 select 쿼리문 수행 -> 수행결과는 여러 row -> 사용하는 메소드 selectLists
		// 전달해줄 데이터가 없는 경우 생략
		List<Member> list = session.selectList("member.selectAllMember");
		return (ArrayList<Member>)list;
	}

	public int insertMember(SqlSession session, Member member) {
		int result = session.insert("member.insertMember", member);
		return result;
	}

	public int deleteMember(SqlSession session, String memberId) {
		int result = session.delete("member.deleteMember", memberId);
		return result;
	}

	public Member selectMyMember(SqlSession session, int memberNo) {
		Member member = session.selectOne("member.selectMyMember", memberNo);
		return member;
	}

	public int updateMember(SqlSession session, Member member) {
		return session.update("member.updateMember", member);
	}

	public String searchId(SqlSession session, HashMap<String, Object> map) {
		String memberId = session.selectOne("member.searchId", map);
		return memberId;
	}

	public String searchPw(SqlSession session, HashMap<String, Object> map) {
		String memberPw = session.selectOne("member.searchPw", map);
		return memberPw;
	}

	public String pwSearch(SqlSession session, PwSearchVo pwSearch) {
		String memberPw = session.selectOne("member.pwSearch", pwSearch);
		return memberPw;
	}

	public ArrayList<Member> ifTest(SqlSession session, HashMap<String, Object> map) {
		List<Member> list = session.selectList("member.ifTest", map);
		return (ArrayList<Member>) list;
	}

	public ArrayList<Member> chooseTest(SqlSession session, HashMap<String, Object> map) {
		List<Member> list = session.selectList("member.chooseTest", map);
		return (ArrayList<Member>) list;
	}

	public ArrayList<Member> trimTest(SqlSession session, HashMap<String, Object> map) {
		List<Member> list = session.selectList("member.trimTest", map);
		return (ArrayList<Member>) list;
	}

	public ArrayList<Member> foreachTest(SqlSession session, String[] arr) {
		List<Member> list = session.selectList("member.foreachTest", arr);
		return (ArrayList<Member>) list;
	}

}
