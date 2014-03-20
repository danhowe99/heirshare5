package com.howed.heirshare5.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.howed.heirshare5.domain.EstateAdministrator;
import com.howed.heirshare5.service.EstateAdministratorService;

@Component
public class ControllerUtil {
	
    @Autowired
    EstateAdministratorService estateAdministratorService;

    public EstateAdministrator getEstateAdministratorForSession() {
       	String userName = SecurityContextHolder.getContext().getAuthentication().getName();
       	return estateAdministratorService.findEstateAdministratorByEmail(userName);
    }
}
