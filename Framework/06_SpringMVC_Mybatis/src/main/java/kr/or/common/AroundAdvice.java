package kr.or.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.springframework.util.StopWatch;

public class AroundAdvice {
	public Object aroundTest(ProceedingJoinPoint pjp) throws Throwable {
		String methodName = pjp.getSignature().getName();
		
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		Object obj = pjp.proceed();	// 포인트컷 메소드를 실행하고 그 결과를 리턴
		stopWatch.stop();
		System.out.println(methodName + "() 메소드 수행 시간 : " + stopWatch.getTotalTimeMillis() + " ms");
		
		return obj;
	}
}
