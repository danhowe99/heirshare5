// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.howed.heirshare5.service;

import com.howed.heirshare5.domain.BeneficiaryItemChoice;
import com.howed.heirshare5.repository.BeneficiaryItemChoiceRepository;
import com.howed.heirshare5.service.BeneficiaryItemChoiceServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect BeneficiaryItemChoiceServiceImpl_Roo_Service {
    
    declare @type: BeneficiaryItemChoiceServiceImpl: @Service;
    
    declare @type: BeneficiaryItemChoiceServiceImpl: @Transactional;
    
    @Autowired
    BeneficiaryItemChoiceRepository BeneficiaryItemChoiceServiceImpl.beneficiaryItemChoiceRepository;
    
    public long BeneficiaryItemChoiceServiceImpl.countAllBeneficiaryItemChoices() {
        return beneficiaryItemChoiceRepository.count();
    }
    
    public void BeneficiaryItemChoiceServiceImpl.deleteBeneficiaryItemChoice(BeneficiaryItemChoice beneficiaryItemChoice) {
        beneficiaryItemChoiceRepository.delete(beneficiaryItemChoice);
    }
    
    public BeneficiaryItemChoice BeneficiaryItemChoiceServiceImpl.findBeneficiaryItemChoice(Long id) {
        return beneficiaryItemChoiceRepository.findOne(id);
    }
    
    public List<BeneficiaryItemChoice> BeneficiaryItemChoiceServiceImpl.findAllBeneficiaryItemChoices() {
        return beneficiaryItemChoiceRepository.findAll();
    }
    
    public List<BeneficiaryItemChoice> BeneficiaryItemChoiceServiceImpl.findBeneficiaryItemChoiceEntries(int firstResult, int maxResults) {
        return beneficiaryItemChoiceRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
    public void BeneficiaryItemChoiceServiceImpl.saveBeneficiaryItemChoice(BeneficiaryItemChoice beneficiaryItemChoice) {
        beneficiaryItemChoiceRepository.save(beneficiaryItemChoice);
    }
    
    public BeneficiaryItemChoice BeneficiaryItemChoiceServiceImpl.updateBeneficiaryItemChoice(BeneficiaryItemChoice beneficiaryItemChoice) {
        return beneficiaryItemChoiceRepository.save(beneficiaryItemChoice);
    }
    
}
