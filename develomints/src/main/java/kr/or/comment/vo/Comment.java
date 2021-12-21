package kr.or.comment.vo;

import lombok.Data;

@Data
public class Comment {
	private int commentNo;
	private String memberId;
	private String commentContent;
	private String regDate;
	private int boardNo;
	private int boardType;
	private int commentType;
	private int commentRef;
	//세희가 필요해서 추가함~~! 메리크리스마스
	private String memberImg;
	
}
