package kr.or.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.board.model.dao.BoardDao;
import kr.or.board.model.vo.Board;

@Service
public class BoardService {
	@Autowired
	public BoardDao dao;

	public ArrayList<Board> selectBoardList() {
		ArrayList<Board> list = dao.selectBoardList();
		return list;
	}

	public Board selectBoard(int boardNo) {
		Board b = dao.selectBoard(boardNo);
		return b;
	}

	public int insertBoard1(Board b) {
		return dao.insertBoard1(b);
	}
}
