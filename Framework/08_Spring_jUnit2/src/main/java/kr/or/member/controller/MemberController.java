package kr.or.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping(value="/joinFrm.do")
	public String joinFrm() {
		return "member/joinFrm";
	}
	@RequestMapping(value="/join.do")
	public String join(Member m) {
		int result = service.insertMember(m);
		return "redirect:/loginFrm.do";
	}
	@RequestMapping(value="loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}
	@RequestMapping(value="login.do")
	public String login(Member m, HttpSession session) {
		Member member = service.selectOneMember(m);
		if(member != null) {
			session.setAttribute("m", member);
			return "member/loginSuccess";
		}else {
			return "member/loginFailed";
		}
		
	}
}
