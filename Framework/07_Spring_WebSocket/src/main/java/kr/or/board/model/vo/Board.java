package kr.or.board.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class Board {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	private String boardDate;
	private ArrayList<FileVO> list;
}
