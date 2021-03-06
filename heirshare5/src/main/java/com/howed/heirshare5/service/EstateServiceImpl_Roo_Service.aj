// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.howed.heirshare5.service;

import com.howed.heirshare5.domain.Estate;
import com.howed.heirshare5.repository.EstateRepository;
import com.howed.heirshare5.service.EstateServiceImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

privileged aspect EstateServiceImpl_Roo_Service {
    
    declare @type: EstateServiceImpl: @Service;
    
    declare @type: EstateServiceImpl: @Transactional;
    
    @Autowired
    EstateRepository EstateServiceImpl.estateRepository;
    
    public long EstateServiceImpl.countAllEstates() {
        return estateRepository.count();
    }
    
    public void EstateServiceImpl.deleteEstate(Estate estate) {
        estateRepository.delete(estate);
    }
    
    public Estate EstateServiceImpl.findEstate(Long id) {
        return estateRepository.findOne(id);
    }
    
    public List<Estate> EstateServiceImpl.findAllEstates() {
        return estateRepository.findAll();
    }
    
    public List<Estate> EstateServiceImpl.findEstateEntries(int firstResult, int maxResults) {
        return estateRepository.findAll(new org.springframework.data.domain.PageRequest(firstResult / maxResults, maxResults)).getContent();
    }
    
}
