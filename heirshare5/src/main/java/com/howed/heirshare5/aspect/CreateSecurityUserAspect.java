package com.howed.heirshare5.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class CreateSecurityUserAspect {

	@Before("execution(public void com.howed.heirshare5.service.*EstateAdministratorService.saveEstateAdministrator(..))")
	public void beforeAdvice(JoinPoint jp){
	  System.out.println("Creating security user before "+jp.getSignature().getName()+"()");
	}
}
