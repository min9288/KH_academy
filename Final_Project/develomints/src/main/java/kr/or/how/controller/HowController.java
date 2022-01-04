package kr.or.how.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HowController {

	@RequestMapping(value="/how.do")
	public String how() {
		return "how/how";
	}
	
}