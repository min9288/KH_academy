package kr.or.dm.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.board.model.vo.Board;
import kr.or.dm.model.vo.DirectMessage;

@Repository
public class DmDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<DirectMessage> selectDmList(String memberId){
		List list = sqlSession.selectList("direct.dmList", memberId);
		return (ArrayList<DirectMessage>)list;
	}

	public int sendMsg(Map<String, Object> map) {
		int result = sqlSession.insert("direct.sendMsg", map);
		return result;
	}
}
