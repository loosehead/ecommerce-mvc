package com.monyLady.myapp.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public interface ISendMail {
	
	
	@Pointcut("execution(* com.monyLady.myapp.metiers.*UserManagerImpl.*(..))")
	void sendMail();

}
