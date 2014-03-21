package com.howed.heirshare5.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.howed.heirshare5.domain.Estate;
import com.howed.heirshare5.domain.EstateAdministrator;
import com.howed.heirshare5.service.EstateAdministratorService;
import com.howed.heirshare5.service.EstateService;

@Component
public class ControllerUtil {
	
    @Autowired EstateAdministratorService estateAdministratorService;
    @Autowired EstateService estateService;

    public EstateAdministrator getEstateAdministratorForSession() {
       	String userName = SecurityContextHolder.getContext().getAuthentication().getName();
       	return estateAdministratorService.findEstateAdministratorByEmail(userName);
    }
    
    public Estate findDefaultEstate(EstateAdministrator estateAdmin) {
    	List<Estate> estates = estateService.findByDefaultAdministratorEstateAndEstateAdministrator(
    			true, estateAdmin);
    	if (0 == estates.size()){
    		return null;
    	}
    	return estates.get(0);
    }
    
    public List<String[]> retrieveEstateDependencies(EstateAdministrator estateAdmin) {
        List<String[]> dependencies = new ArrayList<String[]>();
        if (estateService.countAllEstates(estateAdmin) == 0) {
            dependencies.add(new String[] { "estate", "admin/estate" });
        }
        return dependencies;
    }
}
