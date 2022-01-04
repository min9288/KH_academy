package kr.or.announce.vo;

import lombok.Data;

@Data
public class SearchAnnounce {
	private int dDay;
	private int count;
	private int announceNo;
	private int memberNo;
	private int companyNo;
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
	
	private int placeType;
	private int workType;
	private String keyword;
	
	public String getAnnounceContentBr() {
		return announceContent.replaceAll("\r\n", "<br>");
	}

	public int getdDay() {
		return dDay;
	}

	public void setdDay(int dDay) {
		this.dDay = dDay;
	}
}
