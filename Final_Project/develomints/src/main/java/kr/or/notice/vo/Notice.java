package kr.or.notice.vo;

import lombok.Data;

@Data
public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String regDate;
	private String filename;
	private String filepath;
	private int pin;
	private String noticeWriter;
	private int readCount;
	
}
