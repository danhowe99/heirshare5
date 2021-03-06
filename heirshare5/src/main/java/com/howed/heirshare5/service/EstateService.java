package com.howed.heirshare5.service;
import java.util.List;

import org.springframework.roo.addon.layers.service.RooService;

import com.howed.heirshare5.domain.Estate;
import com.howed.heirshare5.domain.EstateAdministrator;

@RooService(domainTypes = { com.howed.heirshare5.domain.Estate.class })
public interface EstateService {
	
	public abstract long countAllEstates(EstateAdministrator estateAdministrator);
	public abstract List<Estate> findAllEstates(EstateAdministrator estateAdministrator);
	public abstract List<Estate> findEstateEntries(int firstResult, int sizeNo, EstateAdministrator estateAdministrator);
	public abstract List<Estate> findByDefaultAdministratorEstateAndEstateAdministrator(boolean defaultEstate, EstateAdministrator estateAdmin);
}
