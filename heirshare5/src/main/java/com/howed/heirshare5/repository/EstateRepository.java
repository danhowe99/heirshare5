package com.howed.heirshare5.repository;
import com.howed.heirshare5.domain.Estate;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Estate.class)
public interface EstateRepository {
}
