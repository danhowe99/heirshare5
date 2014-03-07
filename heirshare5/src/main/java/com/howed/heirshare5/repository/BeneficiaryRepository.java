package com.howed.heirshare5.repository;
import com.howed.heirshare5.domain.Beneficiary;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Beneficiary.class)
public interface BeneficiaryRepository {
}
