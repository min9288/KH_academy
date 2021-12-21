package kr.or.admin.vo;

import java.util.ArrayList;
import java.util.List;

import kr.or.comment.vo.Report;
import kr.or.company.vo.Company;
import kr.or.member.model.vo.CertiVO;
import kr.or.member.model.vo.Member;
import kr.or.notice.vo.Notice;
import lombok.Data;

@Data
public class TotalMember {
	private ArrayList<Member> allMemberList;
	private int start;
	private String pageNavi;
	private List<Integer> totalCountList;
	private ArrayList<Report> allReportList;
	private List<String> memberId;
	private int totalCount;
	private ArrayList<Report> report5List;
	private ArrayList<Member> allblockedList;
	private List<String> lastReport;
	private ArrayList<CertiVO> certiList;
	private ArrayList<Member> memberInfoList;
	private ArrayList<Company> companyList;
	
	public TotalMember(ArrayList<Member> allMemberList, int start, String pageNavi, List<Integer> totalCountList) {
		super();
		this.allMemberList = allMemberList;
		this.start = start;
		this.pageNavi = pageNavi;
		this.totalCountList = totalCountList;
	}
	public TotalMember(int start, String pageNavi, ArrayList<Report> allReportList, 
			int totalCount, ArrayList<Report> report5List) {
		super();
		this.start = start;
		this.pageNavi = pageNavi;
		this.allReportList = allReportList;
		this.totalCount = totalCount;
		this.report5List = report5List;
	}
	public TotalMember(String pageNavi, ArrayList<Member> allblockedList, int start, int totalCount, List<String> lastReport) {
		super();
		this.pageNavi = pageNavi;
		this.allblockedList = allblockedList;
		this.start = start;
		this.totalCount = totalCount;
		this.lastReport = lastReport;
	}
	public TotalMember(String pageNavi, int totalCount, ArrayList<CertiVO> certiList,ArrayList<Member> memberInfoList, ArrayList<Company> companyList) {
		super();
		this.pageNavi = pageNavi;
		this.totalCount = totalCount;
		this.certiList = certiList;
		this.memberInfoList = memberInfoList;
		this.companyList = companyList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
