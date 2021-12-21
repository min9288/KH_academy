package kr.or.share.model.vo;

import lombok.Data;

@Data
public class Share {
	private int boardNo;
	private int memberNo;
	private String boardTitle;
	private String boardContent;
	private int boardType;
	private String regDate;
	private String filename;
	private String filepath;
	private int readCount;
	private String memberId;
	private String profiles;
	private int memberGrade;
	private int likes;
	private int comments;
	
	public String getType() {
		if(boardType == 1) {
			return "사는얘기";
		}else if(boardType == 2) {
			return "Tech Q&A";
		}else if(boardType == 3) {
			return "Tips & 강좌";
		}else if(boardType == 4) {
			return "IT NEWS & 정보";
		}
		return null;
	}
	//jsp에서 게터 호출시 ${s.type}로 불러오기~
}
