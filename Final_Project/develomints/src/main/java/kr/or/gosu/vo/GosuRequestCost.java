package kr.or.gosu.vo;

import lombok.Data;

@Data
public class GosuRequestCost {
	private int costNo;
	private int gosuNo;
	private int requestNo;
	private String costContent;
	private int cost;
	private String costDate;
	private String memberId;
	private String gosuImg;
	private String gosuId;
	private String type;
	
	public String getCostContentBr(){
		return costContent.replaceAll("\r\n", "<br>");
	}
	public String getCostContentPlus(){
		if(costContent.length() >= 60){
			 return costContent.substring(0,60)+"...";
		};
		return costContent;
	}
	

}
