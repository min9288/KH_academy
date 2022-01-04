package kr.or.admin.vo;

import java.util.ArrayList;
import java.util.List;

import kr.or.notice.vo.Notice;
import kr.or.qna.vo.Qna;
import kr.or.qna.vo.NonQna;
import lombok.Data;

@Data
public class TotalData {
	private int todayTotalMember;
	private int todayJoinMember;
	private int todayOutMember;
	private int todayTotalContent;
	private List<String> dateList;
	private List<Integer> joinList;
	private List<Integer> outList;
	private List<Integer> gradeList;
	private List<Integer> cateList;
	private int yesterDayTotalMember;
	private int yesterDayTotalBoard;
	private ArrayList<Notice> noticeList;
	private ArrayList<Qna> qnaList;
	private ArrayList<NonQna> nonQnaList;
	
	public TotalData(int todayTotalMember, int todayJoinMember, int todayOutMember, int todayTotalContent,
			List<String> dateList, List<Integer> joinList, List<Integer> outList, List<Integer> gradeList,
			List<Integer> cateList, int yesterDayTotalMember, int yesterDayTotalBoard, ArrayList<Notice> noticeList, ArrayList<Qna> qnaList, ArrayList<NonQna> nonQnaList) {
		super();
		this.todayTotalMember = todayTotalMember;
		this.todayJoinMember = todayJoinMember;
		this.todayOutMember = todayOutMember;
		this.todayTotalContent = todayTotalContent;
		this.dateList = dateList;
		this.joinList = joinList;
		this.outList = outList;
		this.gradeList = gradeList;
		this.cateList = cateList;
		this.yesterDayTotalMember = yesterDayTotalMember;
		this.yesterDayTotalBoard = yesterDayTotalBoard;
		this.noticeList = noticeList;
		this.qnaList = qnaList;
		this.nonQnaList = nonQnaList;
	}
	
	
	
	
	
}
