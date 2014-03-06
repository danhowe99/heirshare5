package com.howed.heirshare5.service;
import org.springframework.roo.addon.layers.service.RooService;

import com.howed.heirshare5.domain.EstateAdministrator;

@RooService(domainTypes = { com.howed.heirshare5.domain.EstateAdministrator.class })
public interface EstateAdministratorService {

    public abstract void saveEstateAdministrator(EstateAdministrator estateAdministrator);    
}
