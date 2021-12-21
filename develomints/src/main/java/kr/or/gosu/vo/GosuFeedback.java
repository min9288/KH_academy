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

}
