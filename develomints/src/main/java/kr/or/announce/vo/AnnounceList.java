package kr.or.announce.vo;

import lombok.Data;

@Data
public class AnnounceList {
	private int appNo;
	private int status;
	private int announceNo;
	private String memberNo;
	private String resumeTitle;
	private String applyDate;
}
