package kr.or.announce.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.announce.vo.Announce;
import kr.or.announce.vo.AnnounceList;
import kr.or.announce.vo.AnnounceView;
import kr.or.resume.vo.Resume;

@Repository
public class AnnounceDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/*
	 * public ArrayList<Announce> selectAllAnnounce(int memberNo) { List list =
	 * sqlSession.selectList("announce.selectAllAnnounce", memberNo); return
	 * (ArrayList<Announce>)list; }
	 */
	
	public int insertAnnounce(Announce a) {
		System.out.println("여기 announceDao");
		return sqlSession.insert("announce.insertAnnounce", a);
	}

	public Announce selectAllAnnounce(int memberNo) {
		return sqlSession.selectOne("announce.selectAnnounce", memberNo);
	}

	public Announce selectOneAnnounce(int announceNo) {
		return sqlSession.selectOne("announce.selectOneAnnounce", announceNo);
	}
	
	public AnnounceView selectAnnounceView(int announceNo) {
		return sqlSession.selectOne("announce.selectAnnounceView", announceNo);
	}

	public int updateAnnounce(Announce a) {
		return sqlSession.update("announce.updateAnnounce", a);
	}

	public int deleteApplication(int announceNo) {
		return sqlSession.delete("announce.deleteApplication", announceNo);
	}
	
	public int deleteAnnounce(int announceNo) {
		return sqlSession.delete("announce.deleteAnnounce", announceNo);
	}

	public ArrayList<AnnounceList> selectApplyAnnounce(HashMap<String, Object> map) {
			List list = sqlSession.selectList("announce.selectApplyAnnounce", map);
		return (ArrayList<AnnounceList>)list;
	}

	public int selectApplyAnnounceCount(int announceNo) {
		return sqlSession.selectOne("announce.selectApplyAnnounceCount", announceNo);
	}



}
