package com.howed.heirshare5.service;

import org.springframework.stereotype.Service;

import com.howed.heirshare5.domain.EstateAdministrator;

@Service
public interface SecurityUserService {
	
	public abstract void saveSecurityUserEstateAdministrator(EstateAdministrator estateAdministrator);
}
