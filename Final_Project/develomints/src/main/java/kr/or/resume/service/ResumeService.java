package kr.or.resume.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.announce.vo.Announce;
import kr.or.announce.vo.AnnouncePageData;
import kr.or.announce.vo.ApplicationCompany;
import kr.or.announce.vo.ApplicationCompanyPageData;
import kr.or.member.model.vo.Member;
import kr.or.resume.dao.ResumeDao;
import kr.or.resume.vo.Resume;
import kr.or.resume.vo.ResumePageData;

@Service
public class ResumeService {

	@Autowired
	private ResumeDao dao;

	public ResumePageData selectAllResume(int memberNo, int reqPage) {
		int numPerPage = 10;
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberNo", memberNo);
		ArrayList<Resume> list = dao.selectAllResumeList(map);
		
		int totalCount = dao.selectResumeTotalCount(memberNo);
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
		String pageNavi = "<ul class='pagination pagination-lg'>";
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/resumeManage.do?memberNo="+memberNo+"&reqPage="+(pageNo-1)+"'>";
			pageNavi += "&lt;</a></li>";
		}// 페이지 숫자
		for(int i=0; i < pageNaviSize; i++) {
			if(pageNo == reqPage) {
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class = 'page-link' href='/resumeManage.do?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			} else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/resumeManage.do?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
				pageNavi += pageNo + "</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		// 다음 버튼
		if(pageNo <= totalPage) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class = 'page-link' href='/resumeManage.do?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
			pageNavi += "&gt;</a></li>";
		}
		pageNavi += "</ul>";
		ResumePageData rpd = new ResumePageData(list, pageNavi, start);
		return rpd;
	}

	public Resume selectOneResume(int resumeNo) {
		return dao.selectOneResume(resumeNo);
	}

	public int insertResume(Resume r) {
		return dao.insertResume(r);
	}

	public int selectResumeCount(int memberNo) {
		return dao.selectCountResume(memberNo);
	}

	
	 public Resume resetCeoResume(int resumeNo, int memberNo) { 
		 int reset = dao.resetCeoResume(memberNo);
		 if(reset > 0) {
			 int ceoResume = dao.updateCeoResume(resumeNo);
			 if(ceoResume > 0) {
				 Resume resume = dao.selectCeoResume(ceoResume, memberNo);
				 return resume; 
			 } else {
				 return null;
			 }
		 } else {
			 return null;
		 }
	 }

	public Resume selectCeoResume(int ceoResume, int memberNo) {
		return dao.selectCeoResume(ceoResume, memberNo);
	}

	public int updateResume(Resume r) {
		return dao.updateResume(r);
	}

	public Member selectOneMember(int memberNo) {
		return dao.selectOneMember(memberNo);
	}

	public Resume selectResume(int resumeNo) {
		return dao.selectResume(resumeNo);
	}

	/* 지원한 회사 리스트 가져오기 */
	 public ApplicationCompanyPageData selectAllAnnounce(int memberNo, int reqPage) {
		 int numPerPage = 5;
			int end = reqPage * numPerPage;
			int start = end - numPerPage + 1;
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("memberNo", memberNo);
			ArrayList<ApplicationCompany> list = dao.selectAllAnnounce(map);
			
			int totalCount = dao.applicationCount(memberNo);
			int totalPage = 0;
			if(totalCount % numPerPage == 0) {
				totalPage = totalCount / numPerPage;
			} else {
				totalPage = totalCount / numPerPage + 1;
			}
			
			int pageNaviSize = 5;
			int pageNo = ((reqPage-1) / pageNaviSize) * pageNaviSize + 1;
			String pageNavi = "<ul class='pagination pagination-lg'>";
			if(pageNo != 1) {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/applicationCompany.do?memberNo="+memberNo+"&reqPage="+(pageNo-1)+"'>";
				pageNavi += "&lt;</a></li>";
			}// 페이지 숫자
			for(int i=0; i < pageNaviSize; i++) {
				if(pageNo == reqPage) {
					pageNavi += "<li class='page-item active'>";
					pageNavi += "<a class = 'page-link' href='/applicationCompany.do?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
					pageNavi += pageNo + "</a></li>";
				} else {
					pageNavi += "<li class='page-item'>";
					pageNavi += "<a class = 'page-link' href='/applicationCompany.do?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
					pageNavi += pageNo + "</a></li>";
				}
				pageNo++;
				if(pageNo > totalPage) {
					break;
				}
			}
			// 다음 버튼
			if(pageNo <= totalPage) {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class = 'page-link' href='/applicationCompany.do?memberNo="+memberNo+"&reqPage="+pageNo+"'>";
				pageNavi += "&gt;</a></li>";
			}
			pageNavi += "</ul>";
			ApplicationCompanyPageData acpd = new ApplicationCompanyPageData(list, pageNavi, start);
			return acpd;
	 }
	 
	public int deleteResume(int resumeNo) {
		int deleteApplication = dao.deleteApplycation(resumeNo);
			int deleteResume = dao.deleteResume(resumeNo);
			return deleteResume;
	}

	public int applicationCount(int memberNo) {
		return dao.applicationCount(memberNo);
	}

	
	 

	/*
	 * public int updateCeoResume(int resumeNo) { return
	 * dao.updateCeoResume(resumeNo); }
	 */
}
