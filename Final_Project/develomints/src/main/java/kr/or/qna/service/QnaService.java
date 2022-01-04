package kr.or.qna.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.member.model.vo.Member;
import kr.or.projectTeam.model.vo.ProjectTeamFileVO;
import kr.or.qna.dao.QnaDao;
import kr.or.qna.vo.Faq;
import kr.or.qna.vo.NonQna;
import kr.or.qna.vo.Qna;

@Service
public class QnaService {
	
	@Autowired
	private QnaDao dao;

	public int insertCounselNonQna(NonQna nq) {
		int result = dao.insertCountNonQna(nq);
		return result;
	}

	@Transactional
	public int insertCounselQna(Member m, Qna q, ArrayList<ProjectTeamFileVO> list) {
		System.out.println("insert 전 :"+q.getQnaNo());
		int result1 = dao.insertCounselQna(q);
		System.out.println("insert 후 :"+q.getQnaNo());
		System.out.println("멤버 넘버"+m.getMemberNo());
		int result = 0;
		if(result1>0) {
			for(ProjectTeamFileVO ptfv : list) {
				ptfv.setMemberNo(m.getMemberNo());
				ptfv.setBoardNo(q.getQnaNo());
				System.out.println("파일"+ptfv.getFileName());
				System.out.println("파일"+ptfv.getFilePath());
				result += dao.insertFile(ptfv);
			}
		}else {
			return -1;
		}
		return result;
	}


	public ArrayList<Qna> counselList() {
		return dao.counselList();
	}


	public ArrayList<NonQna> counselList2() {
		// TODO Auto-generated method stub
		return dao.counselList2();
	}


	@Transactional
	public int updateCounsel(String qnaAnswer, int type, int num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("qnaAnswer", qnaAnswer);
		map.put("type", type);
		map.put("num", num);
		
		int result = dao.updateCounsel(map);
		/*
		int result=0;
		if(type==1) {
			result = dao.updateCounsel1(qnaAnswer);
		}else if(type==2){
			result = dao.updateCounsel2(qnaAnswer);
		}
		*/
		return result;
	}

	public ArrayList<Qna> myCounselOne(String memberId) {
		// TODO Auto-generated method stub
		return dao.myCounselOne(memberId);
	}

	public ArrayList<Qna> searchBox1(int category, int state) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("state", state);
		return dao.searchBox1(map);
	}

	public ArrayList<NonQna> searchBox2(int category, int state) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("state", state);
		return dao.searchBox2(map);
	}

	public ArrayList<Faq> selectFaqlist(int category) {
		// TODO Auto-generated method stub
		return dao.selectFaqlist(category);
	}

	public ArrayList<ProjectTeamFileVO> selectOnefileList(int qnaNo) {
		// TODO Auto-generated method stub
		return dao.selectOnefileList(qnaNo);
	}


	public ArrayList<Qna> userSearchbox(int category, int state, String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("state", state);
		map.put("memberId", memberId);
		return dao.userSearchBox(map);
	}

	public int deleteQna(int qnaNo) {
		// TODO Auto-generated method stub
		return dao.deleteMyQna(qnaNo);
	}

	public NonQna searchPw(int nonQnaNo, String qnaPw) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("nonQnaNo", nonQnaNo);
		map.put("qnaPw", qnaPw);
		return dao.enterThePw(map);
	}

	public ArrayList<NonQna> nonSearchList(int category, String keyword) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("keyword", keyword);
		// TODO Auto-generated method stub
		return dao.nonSearchList(map);
	}

	public ProjectTeamFileVO boardFileDown(int fileNo) {
		return dao.boardFileList(fileNo);
	}


	



}
