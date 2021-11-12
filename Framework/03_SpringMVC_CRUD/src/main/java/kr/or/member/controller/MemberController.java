package kr.or.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;

@Controller
public class MemberController {
	
	// 스프링이 서버 시작시 자동으로 생성한 객체 중 아래 변수와 일치하는 데이터 타입의 객체를 찾아서 변수에 저장
	// 의존성 주입(DI)
	@Autowired	
	private MemberService service;
	public MemberController() {
		super();
		System.out.println("MemberController 객체 생성완료");
	}
	
	@RequestMapping(value="/login.do")
	public String login(Member member, HttpSession session, Model model) {
		// Model -> request 영역에 데이터를 등록하기 위한 객체 
		
		Member m = service.selectOneMember(member);
		if(m != null) {
			session.setAttribute("m", m);
			model.addAttribute("msg", "로그인 성공");
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호를 확인하세요");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
	@RequestMapping(value="/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}
	@RequestMapping(value="/join.do")
	public String join(Member m, Model model) {
		int result = service.insertMember(m);
		if(result > 0) {
			model.addAttribute("msg", "회원가입성공");
			model.addAttribute("loc", "/");
		} else {
			model.addAttribute("msg", "회원가입실패");
			model.addAttribute("loc", "/joinFrm.do");
		}
		return "common/msg";
	}
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		// String return 시 redirect:컨트롤러 매핑값 -> viewresolver가 앞뒤에 붙이는 기능 수행하지 않음
		return "redirect:/";
	}
	
	@RequestMapping(value="/mypage.do")
	public String mypage(String memberId, HttpSession session, Model model) {
		Member m = service.mypage(memberId);
		if(m != null) {
			session.setAttribute("m", m);
			return "member/mypage";
		}else {
			model.addAttribute("msg", "정보를 불러오는데 실패했습니다.");
			return "redirect:/";
		}
	}
	
	@RequestMapping(value="/updateMember.do")
	public String updateMember(Member m, Model model) {
		int result = service.updateMember(m);
		if(result > 0) {
			model.addAttribute("msg", "정보변경 성공");
		}else {
			model.addAttribute("msg", "정보변경 실패");
		}
		model.addAttribute("loc", "/");
		return "common/msg";
	}
	
	@RequestMapping(value="/allMember.do")
	public String allMember(Model model) {
		ArrayList<Member> list = service.selectAllMember();
		model.addAttribute("list", list);
		return "member/allMember";
	}
		
}
