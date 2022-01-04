package kr.or.jobSearch.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.announce.vo.Announce;
import kr.or.announce.vo.SearchAnnounce;

@Repository
public class JobSearchDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Announce> selectAllAnnounce() {
		List list = sqlSession.selectList("announce.allAnnounce");
		return (ArrayList<Announce>)list;
	}

	public ArrayList<Announce> selectJobSearchList(HashMap<String, Object> map) {
		List<Announce> list = sqlSession.selectList("announce.selectJobSearchList", map);
		return (ArrayList<Announce>)list;
	}

	public int selectTotalCount() {
		return sqlSession.selectOne("announce.announceTotalCount");
	}

	public int selectAllAnnounceCount() {
		return sqlSession.selectOne("announce.selectAllAnnounceCount");
	}

	public String selectComName(int comNo) {
		return sqlSession.selectOne("announce.selectComName", comNo);
	}

	public ArrayList<SearchAnnounce> selectSearchAllAnnounce(HashMap<String, Object> map) {
		List<SearchAnnounce> list = sqlSession.selectList("announce.selectSearchAnnounce", map);
		return (ArrayList<SearchAnnounce>)list;
	}

	public int selectSearchAllAnnounceCount() {
		return sqlSession.selectOne("announce.selectAnnounceTotalCount");
	}
	
	
	
	
	
	
}
