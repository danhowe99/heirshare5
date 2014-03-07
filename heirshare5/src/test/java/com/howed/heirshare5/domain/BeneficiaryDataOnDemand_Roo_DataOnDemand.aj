// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.howed.heirshare5.domain;

import com.howed.heirshare5.domain.Beneficiary;
import com.howed.heirshare5.domain.BeneficiaryDataOnDemand;
import com.howed.heirshare5.domain.Estate;
import com.howed.heirshare5.domain.EstateDataOnDemand;
import com.howed.heirshare5.repository.BeneficiaryRepository;
import com.howed.heirshare5.service.BeneficiaryService;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect BeneficiaryDataOnDemand_Roo_DataOnDemand {
    
    declare @type: BeneficiaryDataOnDemand: @Component;
    
    private Random BeneficiaryDataOnDemand.rnd = new SecureRandom();
    
    private List<Beneficiary> BeneficiaryDataOnDemand.data;
    
    @Autowired
    EstateDataOnDemand BeneficiaryDataOnDemand.estateDataOnDemand;
    
    @Autowired
    BeneficiaryService BeneficiaryDataOnDemand.beneficiaryService;
    
    @Autowired
    BeneficiaryRepository BeneficiaryDataOnDemand.beneficiaryRepository;
    
    public Beneficiary BeneficiaryDataOnDemand.getNewTransientBeneficiary(int index) {
        Beneficiary obj = new Beneficiary();
        setEmail(obj, index);
        setEstate(obj, index);
        return obj;
    }
    
    public void BeneficiaryDataOnDemand.setEmail(Beneficiary obj, int index) {
        String email = "foo" + index + "@bar.com";
        if (email.length() > 30) {
            email = new Random().nextInt(10) + email.substring(1, 30);
        }
        obj.setEmail(email);
    }
    
    public void BeneficiaryDataOnDemand.setEstate(Beneficiary obj, int index) {
        Estate estate = estateDataOnDemand.getRandomEstate();
        obj.setEstate(estate);
    }
    
    public Beneficiary BeneficiaryDataOnDemand.getSpecificBeneficiary(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Beneficiary obj = data.get(index);
        Long id = obj.getId();
        return beneficiaryService.findBeneficiary(id);
    }
    
    public Beneficiary BeneficiaryDataOnDemand.getRandomBeneficiary() {
        init();
        Beneficiary obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return beneficiaryService.findBeneficiary(id);
    }
    
    public boolean BeneficiaryDataOnDemand.modifyBeneficiary(Beneficiary obj) {
        return false;
    }
    
    public void BeneficiaryDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = beneficiaryService.findBeneficiaryEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Beneficiary' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Beneficiary>();
        for (int i = 0; i < 10; i++) {
            Beneficiary obj = getNewTransientBeneficiary(i);
            try {
                beneficiaryService.saveBeneficiary(obj);
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            beneficiaryRepository.flush();
            data.add(obj);
        }
    }
    
}