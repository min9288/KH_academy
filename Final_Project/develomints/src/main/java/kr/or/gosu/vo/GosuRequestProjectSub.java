package kr.or.gosu.vo;

import lombok.Data;

@Data
public class GosuRequestProjectSub {
	private int requestProjectSubNo;
	private int requestNo;
	private int costNo;
	private int requestProjectSubNum;
	private String requestProjectSubDate;
	private String requestWriterId;
	private String gosuId;
	private String requestWriterImg;
	private String gosuImg;
	private int cost;

	private int reviewNum;//1일경우 리뷰 없음 ,2일 경우 리뷰 있음
	
	public String getRequestWriterIdPlus() {
		if (requestWriterId.length() > 6) {
			return requestWriterId.substring(0, 4) + "..";
		}
		;
		return requestWriterId;
	}
	public String getGosuIdPlus() {
		if (gosuId.length() > 6) {
			return gosuId.substring(0, 4) + "..";
		}
		;
		return gosuId;
	}
	
}
