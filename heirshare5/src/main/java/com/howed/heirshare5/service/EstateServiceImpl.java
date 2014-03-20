package com.howed.heirshare5.service;

import java.math.BigInteger;
import java.util.List;

import com.howed.heirshare5.domain.Estate;
import com.howed.heirshare5.domain.EstateAdministrator;

public class EstateServiceImpl implements EstateService {

	@Override
	public long countAllEstates(EstateAdministrator estateAdministrator) {
		BigInteger count = estateRepository.countAllEstates(estateAdministrator.getEmail());
		return count.longValue();
	}

	@Override
	public List<Estate> findAllEstates(EstateAdministrator estateAdministrator) {
		return estateRepository.findAllEstates(estateAdministrator.getEmail());
	}

	@Override
	public List<Estate> findEstateEntries(int firstResult, int sizeNo,
			EstateAdministrator estateAdministrator) {
		return estateRepository.findEstateEntries(firstResult, sizeNo, estateAdministrator.getEmail());
	}
}
