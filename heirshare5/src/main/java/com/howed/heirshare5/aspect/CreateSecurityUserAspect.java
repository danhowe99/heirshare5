package com.howed.heirshare5.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;

import com.howed.heirshare5.domain.EstateAdministrator;
import com.howed.heirshare5.service.SecurityUserService;

@Aspect
@Configurable
public class CreateSecurityUserAspect {

	@Autowired
    SecurityUserService securityUserService;

	@Before("execution(public void com.howed.heirshare5.service.*EstateAdministratorService.saveEstateAdministrator(..))")
	public void beforeAdvice(JoinPoint jp){
	  EstateAdministrator estateAdministrator = (EstateAdministrator) jp.getArgs()[0];
	  securityUserService.saveSecurityUserEstateAdministrator(estateAdministrator);
	}
}
