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

	public Board selectBoard(int boardNo) {
		Board b = dao.selectBoard(boardNo);
		return b;
	}

	public int insertBoard1(Board b) {
		return dao.insertBoard1(b);
	}

	public int insertBoard2(Board b, ArrayList<FileVO> list) {
		int result1 = dao.insertBoard1(b);
		int result = 0;
		if(result1 > 0) {
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
