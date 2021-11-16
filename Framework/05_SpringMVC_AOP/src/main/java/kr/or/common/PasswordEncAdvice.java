package kr.or.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.or.member.model.vo.Member;

@Component
@Aspect
public class PasswordEncAdvice {
	@Autowired
	private SHA256Enc enc;
	
	@Pointcut(value="execution(* kr.or.member.model.service..*Service.*Member(kr.or.member.model.vo.Member))")
	public void encPointcut() {}
	
	@Before(value="encPointcut()")
	public void encPassword(JoinPoint jp) throws Exception{
		String methodName = jp.getSignature().getName();
		Object[] args = jp.getArgs();
		Member m = (Member)args[0];
		String inputPass = m.getMemberPw();
		String encPass = enc.encData(inputPass);
		m.setMemberPw(encPass);
		System.out.println("메소드명 : " + methodName);
		System.out.println("암호화 전 비밀번호 : " + inputPass);
		System.out.println("암호화 비밀번호 : " + encPass);
	}
}
