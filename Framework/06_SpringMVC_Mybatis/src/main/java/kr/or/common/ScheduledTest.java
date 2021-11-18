package kr.or.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.or.board.model.service.BoardService;

@Component
public class ScheduledTest {
	
	@Autowired
	private BoardService service;
	
//	@Scheduled(fixedDelay = 10000)
	public void test1() {
		System.out.println("5초마다 자동으로 출력!!");
	}
	
//	@Scheduled(cron="5 * * * * *")
	public void test2() {
		System.out.println("크론식으로 호출");
	}
}
