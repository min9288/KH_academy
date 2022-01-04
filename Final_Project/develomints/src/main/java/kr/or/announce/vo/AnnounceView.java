package kr.or.announce.vo;

import lombok.Data;

@Data
public class AnnounceView {
	private int announceNo;
	private int memberNo;
	private int companyNo;
	private String memberId;
	private String companyName;
	private String category;
	private String fields;
	private String school;
	private String workForm;
	private String announceTitle;
	private String announceContent;
	private String skills;
	private String money;
	private String workPlace;
	private String endDate;
	private int veterans;
	private int military;
	private String writeDate;
	private String career;
	private String openDate;
	private int employee;
	private String ceo;
	private String address;
	private String content;
	private String filepath;
	
	public String getAnnounceContentBr() {
		return announceContent.replaceAll("\r\n", "<br>");
	}
}


