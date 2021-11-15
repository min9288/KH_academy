package kr.or.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.board.model.dao.BoardDao;
import kr.or.board.model.vo.Board;
import kr.or.board.model.vo.FileVO;

@Service
public class BoardService {
	@Autowired
	public BoardDao dao;

	public ArrayList<Board> selectBoardList() {
		ArrayList<Board> list = dao.selectBoardList();
		return list;
	}

	public int insertBoard(Board b, ArrayList<FileVO> list) {
		int checkValue = dao.insertBoard(b); 
		int result = 0;
		if(checkValue > 0) {
			int boardNo = dao.selectBoardNo();
			for (FileVO fv : list) {
				fv.setBoardNo(boardNo);
				result += dao.insertFile(fv);
			}
		}else {
			return -1;
		}
		return result;
	}

	public Board selectOneBoard(int boardNo) {
		Board b = dao.selectBoard(boardNo);
		ArrayList<FileVO> list = dao.selectFileList(boardNo);
		b.setList(list);
		return b;
	}
}
