package kr.or.dm.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.or.dm.model.service.DmService;
import kr.or.dm.model.vo.DirectMessage;
import kr.or.member.model.vo.Member;

@Controller
public class DmController {
	@Autowired
	private DmService service;
	
	@RequestMapping(value="/dmList.do")
	public String dmList(@SessionAttribute Member m, Model model) {
		// 보낸쪽지 / 받은쪽지		db - > date, vo -> String
		ArrayList<DirectMessage> list = service.selectDmList(m.getMemberId());
		model.addAttribute("list", list);
		return "dm/dmList";
	}
	
	@RequestMapping(value="/ajaxSendMsg.do")
	public String sentMsg(@SessionAttribute Member m, Model model, String target, String msgContent) {
		System.out.println(m.getMemberId());
		System.out.println(target);
		System.out.println(msgContent);
		int result = service.sendMsg(m.getMemberId(), target, msgContent);
		if(result > 0) {
			model.addAttribute("msg", "쪽지전송 성공");
		} else {
			model.addAttribute("msg", "쪽지전송 실패");
		}
		model.addAttribute("loc", "/dm/dmList");
		return "common/msg";
	}
}
