package kr.or.share.model.vo;

import lombok.Data;

@Data
public class Like {
	private int likeNo;
	private int boardNo;
	private int memberNo;
	private String boardWriter;
}
