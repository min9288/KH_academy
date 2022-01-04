package kr.or.gosu.vo;

import lombok.Data;

@Data
public class GosuNotice {
	private int gnoticeNo;
	private String writeId;
	private String gnoticeTitle;
	private String gnoticeContent;
	private String gnoticePhoto;
	private String gnoticeDate;
	private String writeImg;
	
	//검색필터
	private String type;
	private String keyword;
	
	public String getGnoticeContentBr(){
		return gnoticeContent.replaceAll("\r\n", "<br>");
	}
	public String getGnoticeTitlePlus(){
		 if(gnoticeTitle.length() >= 35){
			 return gnoticeTitle.substring(0,32)+"...";
		};
		return gnoticeTitle;
	}
}
