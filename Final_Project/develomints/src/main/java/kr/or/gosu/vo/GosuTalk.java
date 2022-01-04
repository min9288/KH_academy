package kr.or.gosu.vo;

import lombok.Data;

@Data
public class GosuTalk {
	private int talkNo;
	private int feedbackNo;
	private String writer;
	private String talkContent;
	private String talkDate;
	private String filepath;
	private String filename;
	private String gosuImg;
	private String memberImg;
	
	public String getTalkContentBr(){
		return talkContent.replaceAll("\r\n", "<br>");
	}
}
