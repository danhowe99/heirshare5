// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.howed.heirshare5.repository;

import com.howed.heirshare5.domain.Beneficiary;
import com.howed.heirshare5.repository.BeneficiaryRepository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect BeneficiaryRepository_Roo_Jpa_Repository {
    
    declare parents: BeneficiaryRepository extends JpaRepository<Beneficiary, Long>;
    
    declare parents: BeneficiaryRepository extends JpaSpecificationExecutor<Beneficiary>;
    
    declare @type: BeneficiaryRepository: @Repository;
    
}
