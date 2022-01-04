package kr.or.member.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.regex.Matcher;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)		//스프링 테스트용 객체 어노테이션
@WebAppConfiguration						//클래스에서 스프링 설정파일을 읽어오기위한 어노테이션
//서버구동 시 읽어와야할 설정파일 경로
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class MemberControllerTest {
	//로그를 작성할 객체
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerTest.class);
	@Autowired
	private WebApplicationContext wac; 	//설정파일을 사용하기위한 객체로(@WebAppConfiguration으로 생성된 객체 주입)
	private MockMvc mockMvc;		//테스트 시 웹을 요청하고 결과를 받아서 검사하는 객체
	
	@Before 		//테스트를 위해 사전작업을 위한 메소드
	public void setup() {
		//설정파일 정보를 갖고있는 객체를 매개변수로 전달해서 mockMvc 객체 생성
		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		logger.info("테스트 준비 완료");
	}
	/*
	@Test		//실제 테스트를 수행할 메소드에 사용하는 어노테이션
	public void loginTest() {
		logger.info("로그인 테스트 시작");
		try {
			mockMvc.perform(post("/login.do").param("memberId", "user01").param("memberPw", "1234")).andDo(print()).andExpect(status().isOk());
			logger.info("로그인 테스트 끝");
		} catch (Exception e) {
			logger.error("로그인 테스트 실패");
			logger.error(e.getMessage());
		}
	}
	*/
	
	@Test
	public void insertTest() {
		logger.info("회원가입테스트 시작");
		try {
			mockMvc.perform(post("/join.do").param("memberId", "user02").param("memberPw", "1234").param("memberName", "유저투").param("memberAge", "50")).andDo(print()).andExpect(status().is3xxRedirection());
			logger.info("회원가입테스트 끝");
		} catch (Exception e) {
			logger.error("회원가입 테스트 실패");
			logger.error(e.getMessage());
		}
	}
}





















