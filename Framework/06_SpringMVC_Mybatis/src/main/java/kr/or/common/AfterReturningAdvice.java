package kr.or.common;

import org.aspectj.lang.JoinPoint;

import kr.or.member.model.vo.Member;

public class AfterReturningAdvice {
	public void afterReturning(JoinPoint jp, Object returnObj) {
		String methodName = jp.getSignature().getName();
		Object[] args = jp.getArgs(); 
		Member member = (Member)args[0];
		System.out.println("로그인 시도 아이디 : "+member.getMemberId());
		System.out.println("메소드명 : "+methodName);
		if(returnObj != null) {
			Member m = (Member)returnObj;
			System.out.println(m.getMemberName()+"님이 로그인하셨습니다.");
		} else {
			System.out.println("로그인결과 : 실패");
		}
	}
}
