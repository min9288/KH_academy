package kr.or.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;

import kr.or.member.model.vo.Member;

public class BeforeAdvice {
	public void beforeTest(JoinPoint jp) {
		// AOP가 동작하는 메소드의 정보
		Signature sig = jp.getSignature();
		System.out.println(sig.getName());
		System.out.println(sig.toLongString());
		// AOP가 동작하는 메소드의 매개변수
		Object[] args = jp.getArgs();
		System.out.println("매개변수 정보 : "+ args[0].toString());
	}
}
