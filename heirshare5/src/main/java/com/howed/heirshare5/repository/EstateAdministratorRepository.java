package com.howed.heirshare5.repository;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.howed.heirshare5.domain.EstateAdministrator;

@RooJpaRepository(domainType = EstateAdministrator.class)
public interface EstateAdministratorRepository {
	
	public EstateAdministrator findEstateAdministratorByEmail(String email);
}
