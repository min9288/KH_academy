package kr.or.board.model.vo;

import lombok.Data;

@Data
public class FileVO {
	private int fileNo;
	private int boardNo;
	private String filename;
	private String filepath;
}
