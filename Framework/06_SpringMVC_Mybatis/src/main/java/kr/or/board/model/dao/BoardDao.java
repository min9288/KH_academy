package kr.or.board.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.FileVO;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/*
	 * @Autowired private JdbcTemplate jdbcTemplate;
	 */

	public ArrayList<Board> selectBoardList() {
		List<Board> list = sqlSession.selectList("board.boardList");
		return (ArrayList<Board>)list;
		
//		String query = "select * from board";
//		List list = jdbcTemplate.query(query, new BoardRowMapper()); 
//		return (ArrayList<Board>) list;
	}
	public int insertBoard1(Board b) {
		return sqlSession.insert("board.insertBoard", b);
	}
	public int selectBoardNo() {
		return sqlSession.selectOne("board.getBoardNo");
	}
	public int insertFile(FileVO fv) {
		return sqlSession.insert("board.insertFile", fv);
	}
	public Board selectOneBoard(int boardNo) {
		return sqlSession.selectOne("board.selectOneBoard", boardNo);
	}
//	public ArrayList<FileVO> selectFileList(int boardNo) {
//		List list = sqlSession.selectList("board.selectFileList", boardNo);
//		return (ArrayList<FileVO>)list;
//	}
}
