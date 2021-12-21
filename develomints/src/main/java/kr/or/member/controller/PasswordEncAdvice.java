package kr.or.member.controller;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.or.member.model.vo.Member;
import kr.or.member.model.vo.PwChangeVO;

@Component
@Aspect
public class PasswordEncAdvice {
	@Autowired
	private SHA256enc enc;
	
	@Pointcut(value="execution(* kr.or.member.model.service..*Service.*Member(kr.or.member.model.vo.Member))")
	public void encPointcut() {}

	@Pointcut(value="execution(* kr.or.member.model.service..*Service.*Member(kr.or.member.model.vo.Member,..))")
	public void encPointcut2() {}
	
	@Before(value="encPointcut()")
	public void encPassword(JoinPoint jp) throws Exception{
		//String methodName = jp.getSignature().getName();
		Object[] args = jp.getArgs();
		Member m = (Member)args[0];
		String inputPass = m.getMemberPw();
		String encPass = enc.encData(inputPass);
		m.setMemberPw(encPass);
		//System.out.println(encPass);
	}
	
	@Pointcut(value="execution(* kr.or.member.model.service..*Service.changePw(..))")
	public void changePwPointcut() {}
	
	@Before(value="changePwPointcut()")
	public void changePw(JoinPoint jp) throws Exception{
		Object[] args = jp.getArgs();
		PwChangeVO pc = (PwChangeVO)args[0];
		String oldPw = pc.getOldPassword();
		String newPw = pc.getNewPassword();
		pc.setOldPassword(enc.encData(oldPw));
		pc.setNewPassword(enc.encData(newPw));
	}
}
