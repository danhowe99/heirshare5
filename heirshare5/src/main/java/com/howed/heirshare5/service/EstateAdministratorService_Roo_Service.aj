// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.howed.heirshare5.service;

import com.howed.heirshare5.domain.EstateAdministrator;
import com.howed.heirshare5.service.EstateAdministratorService;
import java.util.List;

privileged aspect EstateAdministratorService_Roo_Service {
    
    public abstract long EstateAdministratorService.countAllEstateAdministrators();    
    public abstract void EstateAdministratorService.deleteEstateAdministrator(EstateAdministrator estateAdministrator);    
    public abstract EstateAdministrator EstateAdministratorService.findEstateAdministrator(Long id);    
    public abstract List<EstateAdministrator> EstateAdministratorService.findAllEstateAdministrators();    
    public abstract List<EstateAdministrator> EstateAdministratorService.findEstateAdministratorEntries(int firstResult, int maxResults);    
    public abstract EstateAdministrator EstateAdministratorService.updateEstateAdministrator(EstateAdministrator estateAdministrator);    
}
