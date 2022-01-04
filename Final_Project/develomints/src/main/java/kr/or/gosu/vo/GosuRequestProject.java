package kr.or.gosu.vo;

import lombok.Data;

@Data
public class GosuRequestProject {
	private int requestProjectNo;
	private int memberNo;
	private String requestProjectContent;
	private String requestProjectDate;
	private String filepath;
	private String filename;
	private int requestProjectSubNo;
	private String memberImg;
	private String memberId;
	private int ggosuNo;
	
	
	
	public String getRequestProjectContentBr(){
		return requestProjectContent.replaceAll(",", "<br>");
	}

}
