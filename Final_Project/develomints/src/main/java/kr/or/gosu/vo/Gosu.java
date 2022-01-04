package kr.or.gosu.vo;

import kr.or.contest.vo.Contest;
import kr.or.member.model.vo.Member;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;


@Data
public class Gosu {
	private int ggsouNo;
	private int gsouNo;
	private String gosuTitle;
	private String gosuSelf;
	private String gosuExplain;
	private String gosuAct;
	private int gosuCost;
	private String gosuDate;
	private String gosuId;
	private String gosuImg;
	private Double reviewAvg;
	private int reviewCount;
	
	//검색필터
	private String type;
	private String keyword;
	
	public String getGosuExplainBr(){
		return gosuExplain.replaceAll("\r\n", "<br>");
	}

	public String getGosuActBr(){
		return gosuAct.replaceAll("\r\n", "<br>");
	}
}
