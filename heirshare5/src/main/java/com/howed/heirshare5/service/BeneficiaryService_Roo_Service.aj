// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.howed.heirshare5.service;

import com.howed.heirshare5.domain.Beneficiary;
import com.howed.heirshare5.service.BeneficiaryService;
import java.util.List;

privileged aspect BeneficiaryService_Roo_Service {
    
    public abstract long BeneficiaryService.countAllBeneficiarys();    
    public abstract void BeneficiaryService.deleteBeneficiary(Beneficiary beneficiary);    
    public abstract Beneficiary BeneficiaryService.findBeneficiary(Long id);    
    public abstract List<Beneficiary> BeneficiaryService.findAllBeneficiarys();    
    public abstract List<Beneficiary> BeneficiaryService.findBeneficiaryEntries(int firstResult, int maxResults);    
    public abstract void BeneficiaryService.saveBeneficiary(Beneficiary beneficiary);    
    public abstract Beneficiary BeneficiaryService.updateBeneficiary(Beneficiary beneficiary);    
}
