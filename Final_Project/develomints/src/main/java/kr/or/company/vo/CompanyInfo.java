package kr.or.company.vo;

import lombok.Data;

@Data
public class CompanyInfo {
	private String announceTitle;
	private int career;
	private int school;
	private String workPlace;
	private int workForm;
	private int companyNo;
	private String companyName;
	private String openDate;
	private int employee;
	private String category;
	private String ceo;
	private String address;
	private String content;
	private int businessNo;
	private String filepath;
	private String writeDate;
	private int announceNo;

	public String getcontentBr() {
		return content.replaceAll("\r\n", "<br>");
	}
}
