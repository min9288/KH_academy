package kr.or.gosu.vo;

import lombok.Data;

@Data
public class GosuFeedback {
	private int feedbackNo;
	private int ggosuNo;
	private String feedbackContent;
	private String feedbackTitle;
	private String feedbackDate;
	private int feedbackNum;
	private String memberId;
	private String gosuId;
	private String gosuImg;
	private String memberImg;
	private int reviewNum;//1일경우 리뷰 없음 ,2일 경우 리뷰 있음
	private int gosuCost;
	public String getFeedbackContentBr() {
		return feedbackContent.replaceAll("\r\n", "<br>");
	}

	public String getfeedbackTitlePlus() {
		if (feedbackTitle.length() >= 4) {
			return feedbackTitle.substring(0, 4) + "..";
		}
		;
		return feedbackTitle;
	}

	public String getfeedbackTitlePlus2() {
		if (feedbackTitle.length() >= 15) {
			return feedbackTitle.substring(0, 15) + "..";
		}
		;
		return feedbackTitle;
	}
	public String getMemberIdPlus() {
		if (memberId.length() > 6) {
			return memberId.substring(0, 4) + "..";
		}
		;
		return memberId;
	}	public String getGosuIdPlus() {
		if (gosuId.length() > 6) {
			return gosuId.substring(0, 4) + "..";
		}
		;
		return gosuId;
	}

}
