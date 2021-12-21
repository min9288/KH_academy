package kr.or.jobSearch.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.announce.vo.Announce;

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
	
	
	
	
	
	
}
