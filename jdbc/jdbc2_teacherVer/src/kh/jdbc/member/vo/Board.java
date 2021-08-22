package kh.jdbc.member.vo;

import java.util.Date;

public class Board {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private int boardWriter;
	private int readCount;
	private Date enrollDate;
	private String boardWriterString;
	
	public Board() {
		super();
	}
	
	public Board(int boardNo, String boardTitle, String boardContent, int boardWriter, int readCount, Date enrollDate,
			String boardWriterString) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.readCount = readCount;
		this.enrollDate = enrollDate;
		this.boardWriterString = boardWriterString;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(int boardWriter) {
		this.boardWriter = boardWriter;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getBoardWriterString() {
		return boardWriterString;
	}
	public void setBoardWriterString(String boardWriterString) {
		this.boardWriterString = boardWriterString;
	}
	
	
}
