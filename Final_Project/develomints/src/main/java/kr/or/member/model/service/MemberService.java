package kr.or.member.model.service;


import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.company.vo.Company;
import kr.or.contest.vo.Contest;
import kr.or.contest.vo.ContestList;
import kr.or.contest.vo.ContestMember;
import kr.or.gosu.vo.GosuNotice;
import kr.or.member.controller.RandomPassword;
import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.BoardPage;
import kr.or.member.model.vo.CertiVO;
import kr.or.member.model.vo.ContestPage;
import kr.or.member.model.vo.CrewListPage;
import kr.or.member.model.vo.CrewVO;
import kr.or.member.model.vo.GosuNoticePage;
import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.MyContest;
import kr.or.member.model.vo.MyProjectPage;
import kr.or.member.model.vo.ProjectLikes;
import kr.or.member.model.vo.ProjectLikesPage;
import kr.or.member.model.vo.ProjectPageVO;
import kr.or.projectTeam.model.vo.ProjectTeam;
import kr.or.share.model.vo.Share;

@Service
public class MemberService {
	@Autowired
	private MemberDao dao;

	public Member selectOneMember(Member member) {
		Member m = dao.selectOneMember(member);
		return m;
	}
	
	public Member checkPhone(String phone) {
		Member m = dao.checkPhone(phone);
		return m;
	}

	public Member checkId(String memberId) {
		Member m = dao.checkId(memberId);
		return m;
	}

	public Member checkEmail(String email) {
		Member m = dao.checkEmail(email);
		return m;
	}
	
	@Transactional
	public int insertMember(Member member) {
		int result = dao.insertMember(member);
		return result;
	}

	public String findId(String email) {
		String memberId = dao.findId(email);
		return memberId;
	}
	
	public String pwCheck(Member member) {
		Member m = dao.pwCheck(member);
		if(m == null) {
			return null;
		}else {
			//임시비밀번호생성
			//String newPw = new RandomPassword().setPassword(8);
			//메일전송
			String newPw = new MailSender().mailSend2(member.getEmail());
			//리턴임시비밀번호
			return newPw;
		}
	}
	
	@Transactional
	public int resetPwMember(Member member) {
		int result = dao.resetPwMember(member);
		return result;
	}
	
	@Transactional
	public int resignMember(String memberId) {
		int result = 0;
		Member m = dao.checkId(memberId);
		result += dao.insertDelete(m);
		result += dao.resignMember(memberId);
		return result;
	}
	@Transactional
	public int insertCertification(CertiVO file) {
		return dao.insertCertification(file);
	}
	
	@Transactional
	public int updateMyInfo(Member m) {
		return dao.updateMyInfo(m);
	}
	
	@Transactional
	public int updateProfile(Member m) {
		return dao.updateProfile(m);
	}

	@Transactional
	public int changePwMember(Member m) {
		return dao.changePwMember(m);
	}

	@Transactional
	public int addCompany(Member m) {
		Company com = dao.checkCompany(m);
		if(com != null) {
			m.setComNo(Integer.toString(com.getCompanyNo()));
			Member member = dao.existCompany(m);
			if(member == null) {
				return dao.addCompany(m);							
			}else {
				
				return 2;
			}
		}else {
			return 0;
		}
	}
	
	@Transactional
	public int delProfile(Member m) {
		return dao.delProfile(m);
	}

	public GosuNoticePage gosuNoticeLists(Member m, int reqPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int numPerPage = 5;
		int end = reqPage*numPerPage;
		int start = end - numPerPage + 1;
		
		map.put("memberId", m.getMemberId());
		map.put("start",start);
		map.put("end",end);
		ArrayList<GosuNotice> list = dao.gosuNoticeLists(map);
		
		int totalCount = dao.gosuTotalCount(m.getMemberId());
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class='pagination pagination-lg'>";
				
				if(pageNo != 1) {
					pageNavi += "<li class=\"page-item\">";
					pageNavi += "<a class=\"page-link\" href='/gosuKnowhow.do?reqPage="+(pageNo-1)+"&memberId="+(m.getMemberId())+"'>&laquo;</a></li>";
				}
				
				for(int i=0;i<pageNaviSize;i++){
					if(pageNo == reqPage) {
						pageNavi += "<li class=\"page-item active\">";
						pageNavi += "<a class='page-link' href='/gosuKnowhow.do?reqPage="+pageNo+"&memberId="+(m.getMemberId())+"'>"+pageNo+"</a></li>";
					} else {
						pageNavi += "<li class='page-item'>";
						pageNavi += "<a class='page-link' href='/gosuKnowhow.do?reqPage="+pageNo+"&memberId="+(m.getMemberId())+"'>";
						pageNavi += pageNo+"</a></li>";
					}
					pageNo++;
					if(pageNo>totalPage) {
						break;
					}
				}
				if(pageNo <= totalPage) {
					pageNavi += "<li class='page-item'>";
					pageNavi += "<a class='page-link' href='/gosuKnowhow.do?reqPage="+pageNo+"&memberId="+(m.getMemberId())+"'>";
					pageNavi += "&raquo;</a></li>";
				}
				pageNavi += "</ul>";
				
				GosuNoticePage gnp = new GosuNoticePage(list,pageNavi,start);
				return gnp;
	}

	public ContestPage contestList(Member m, int reqPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int numPerPage = 5;
		int end = reqPage*numPerPage;
		int start = end - numPerPage + 1;
		
		map.put("memberId", m.getMemberId());
		map.put("start",start);
		map.put("end",end);
		ArrayList<MyContest> list = dao.contestMemberList(map);
		
		int totalCount = dao.contestCount(m.getMemberId());
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class='pagination pagination-lg'>";
				
				if(pageNo != 1) {
					pageNavi += "<li class=\"page-item\">";
					pageNavi += "<a class=\"page-link\" href='/mycontestPage.do?reqPage="+(pageNo-1)+"&memberId="+(m.getMemberId())+"'>&laquo;</a></li>";
				}
				
				for(int i=0;i<pageNaviSize;i++){
					if(pageNo == reqPage) {
						pageNavi += "<li class=\"page-item active\">";
						pageNavi += "<a class='page-link' href='/mycontestPage.do?reqPage="+pageNo+"&memberId="+(m.getMemberId())+"'>"+pageNo+"</a></li>";
					} else {
						pageNavi += "<li class='page-item'>";
						pageNavi += "<a class='page-link' href='/mycontestPage.do?reqPage="+pageNo+"&memberId="+(m.getMemberId())+"'>";
						pageNavi += pageNo+"</a></li>";
					}
					pageNo++;
					if(pageNo>totalPage) {
						break;
					}
				}
				if(pageNo <= totalPage) {
					pageNavi += "<li class='page-item'>";
					pageNavi += "<a class='page-link' href='/mycontestPage.do?reqPage="+pageNo+"&memberId="+(m.getMemberId())+"'>";
					pageNavi += "&raquo;</a></li>";
				}
				pageNavi += "</ul>";
				
				ContestPage ctp = new ContestPage(list, pageNavi, start);
				return ctp;
	}

	public CrewListPage crewList(Member m, int reqPage) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int numPerPage = 5;
		int end = reqPage*numPerPage;
		int start = end - numPerPage + 1;
		
		map.put("memberNo", m.getMemberNo());
		map.put("start",start);
		map.put("end",end);
		
		ArrayList<CrewVO> list = dao.crewList(map);
		
		int totalCount = dao.crewListCount(m.getMemberNo());
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class='pagination pagination-lg'>";
				
				if(pageNo != 1) {
					pageNavi += "<li class=\"page-item\">";
					pageNavi += "<a class=\"page-link\" href='/crewList.do?type=0&reqPage="+(pageNo-1)+"&memberNo="+(m.getMemberNo())+"'>&laquo;</a></li>";
				}
				
				for(int i=0;i<pageNaviSize;i++){
					if(pageNo == reqPage) {
						pageNavi += "<li class=\"page-item active\">";
						pageNavi += "<a class='page-link' href='/crewList.do?type=0&reqPage="+pageNo+"&memberNo="+(m.getMemberNo())+"'>"+pageNo+"</a></li>";
					} else {
						pageNavi += "<li class='page-item'>";
						pageNavi += "<a class='page-link' href='/crewList.do?type=0&reqPage="+pageNo+"&memberNo="+(m.getMemberNo())+"'>";
						pageNavi += pageNo+"</a></li>";
					}
					pageNo++;
					if(pageNo>totalPage) {
						break;
					}
				}
				if(pageNo <= totalPage) {
					pageNavi += "<li class='page-item'>";
					pageNavi += "<a class='page-link' href='/crewList.do?type=0&reqPage="+pageNo+"&memberNo="+(m.getMemberNo())+"'>";
					pageNavi += "&raquo;</a></li>";
				}
				pageNavi += "</ul>";
				
				CrewListPage clp = new CrewListPage(list, pageNavi, start);
				return clp;
	}

	public MyProjectPage myproject(Member m, int reqPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int numPerPage = 5;
		int end = reqPage*numPerPage;
		int start = end - numPerPage + 1;
		
		map.put("memberNo", m.getMemberNo());
		map.put("start",start);
		map.put("end",end);
		
		ArrayList<ProjectPageVO> list = dao.myproject(map);
		
		int totalCount = dao.myproejtCount(m.getMemberNo());
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class='pagination pagination-lg'>";
				
				if(pageNo != 1) {
					pageNavi += "<li class=\"page-item\">";
					pageNavi += "<a class=\"page-link\" href='/crewList.do?type=1&reqPage="+(pageNo-1)+"&memberNo="+(m.getMemberNo())+"'>&laquo;</a></li>";
				}
				
				for(int i=0;i<pageNaviSize;i++){
					if(pageNo == reqPage) {
						pageNavi += "<li class=\"page-item active\">";
						pageNavi += "<a class='page-link' href='/crewList.do?type=1&reqPage="+pageNo+"&memberNo="+(m.getMemberNo())+"'>"+pageNo+"</a></li>";
					} else {
						pageNavi += "<li class='page-item'>";
						pageNavi += "<a class='page-link' href='/crewList.do?type=1&reqPage="+pageNo+"&memberNo="+(m.getMemberNo())+"'>";
						pageNavi += pageNo+"</a></li>";
					}
					pageNo++;
					if(pageNo>totalPage) {
						break;
					}
				}
				if(pageNo <= totalPage) {
					pageNavi += "<li class='page-item'>";
					pageNavi += "<a class='page-link' href='/crewList.do?type=1&reqPage="+pageNo+"&memberNo="+(m.getMemberNo())+"'>";
					pageNavi += "&raquo;</a></li>";
				}
				pageNavi += "</ul>";
				
				MyProjectPage mpj = new MyProjectPage(list, pageNavi, start);
				return mpj;
	}

	public ProjectLikesPage projectLikes(Member m, int reqPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int numPerPage = 5;
		int end = reqPage*numPerPage;
		int start = end - numPerPage + 1;
		
		map.put("memberNo", m.getMemberNo());
		map.put("start",start);
		map.put("end",end);
		
		ArrayList<ProjectLikes> list = dao.projectLikes(map);
		
		int totalCount = dao.projectLikeCount(m.getMemberNo());
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class='pagination pagination-lg'>";
				
				if(pageNo != 1) {
					pageNavi += "<li class=\"page-item\">";
					pageNavi += "<a class=\"page-link\" href='/crewList.do?type=2&reqPage="+(pageNo-1)+"&memberNo="+(m.getMemberNo())+"'>&laquo;</a></li>";
				}
				
				for(int i=0;i<pageNaviSize;i++){
					if(pageNo == reqPage) {
						pageNavi += "<li class=\"page-item active\">";
						pageNavi += "<a class='page-link' href='/crewList.do?type=2&reqPage="+pageNo+"&memberNo="+(m.getMemberNo())+"'>"+pageNo+"</a></li>";
					} else {
						pageNavi += "<li class='page-item'>";
						pageNavi += "<a class='page-link' href='/crewList.do?type=2&reqPage="+pageNo+"&memberNo="+(m.getMemberNo())+"'>";
						pageNavi += pageNo+"</a></li>";
					}
					pageNo++;
					if(pageNo>totalPage) {
						break;
					}
				}
				if(pageNo <= totalPage) {
					pageNavi += "<li class='page-item'>";
					pageNavi += "<a class='page-link' href='/crewList.do?type=2&reqPage="+pageNo+"&memberNo="+(m.getMemberNo())+"'>";
					pageNavi += "&raquo;</a></li>";
				}
				pageNavi += "</ul>";
				
				ProjectLikesPage plp = new ProjectLikesPage(list, pageNavi, start);
				return plp;
	}

	public BoardPage myboardPage(Member m , int reqPage) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int numPerPage = 5;
		int end = reqPage*numPerPage;
		int start = end - numPerPage + 1;
		
		map.put("memberNo", m.getMemberNo());
		map.put("start",start);
		map.put("end",end);
		ArrayList<Share> list = dao.myboardPageList(map);
		
		int totalCount = dao.boardCount(m.getMemberNo());
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		String pageNavi = "<ul class='pagination pagination-lg'>";
				
				if(pageNo != 1) {
					pageNavi += "<li class=\"page-item\">";
					pageNavi += "<a class=\"page-link\" href='/myBoardPage.do?reqPage="+(pageNo-1)+"&memberNo="+(m.getMemberNo())+"'>&laquo;</a></li>";
				}
				
				for(int i=0;i<pageNaviSize;i++){
					if(pageNo == reqPage) {
						pageNavi += "<li class=\"page-item active\">";
						pageNavi += "<a class='page-link' href='/myBoardPage.do?reqPage="+pageNo+"&memberNo="+(m.getMemberNo())+"'>"+pageNo+"</a></li>";
					} else {
						pageNavi += "<li class='page-item'>";
						pageNavi += "<a class='page-link' href='/myBoardPage.do?reqPage="+pageNo+"&memberNo="+(m.getMemberNo())+"'>";
						pageNavi += pageNo+"</a></li>";
					}
					pageNo++;
					if(pageNo>totalPage) {
						break;
					}
				}
				if(pageNo <= totalPage) {
					pageNavi += "<li class='page-item'>";
					pageNavi += "<a class='page-link' href='/myBoardPage.do?reqPage="+pageNo+"&memberNo="+(m.getMemberNo())+"'>";
					pageNavi += "&raquo;</a></li>";
				}
				pageNavi += "</ul>";
				
				BoardPage bpg = new BoardPage(list, pageNavi, start);
				return bpg;
	}
	
	public int announceNo(String comNo) {
		return dao.announceNo(Integer.parseInt(comNo));
	}
	@Transactional
	public int insertCompany(Company com) {
		return dao.insertCompnay(com);
	}

	public Company selectCompany(String comNo) {
		return dao.selectOneMember(comNo);
	}

	public int updateCompany(Company com) {
		return dao.updateCompany(com);
	}

	public int rollbackCompnay(String memberId) {
		return dao.rollbackCompany(memberId);
	}
	@Transactional
	public int kakaoInsertMember(Member member) {
		int result = dao.kakaoInsertMember(member);
		return result;
	}
	
}