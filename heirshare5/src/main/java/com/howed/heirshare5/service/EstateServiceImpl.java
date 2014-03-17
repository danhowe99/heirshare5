package com.howed.heirshare5.service;

import java.util.List;

import com.howed.heirshare5.domain.Estate;
import com.howed.heirshare5.domain.EstateAdministrator;

public class EstateServiceImpl implements EstateService {

	@Override
	public List<Estate> findEstateEntries(int firstResult, int sizeNo,
			EstateAdministrator estateAdministrator) {
		return estateRepository.findEstateEntries(firstResult, sizeNo, estateAdministrator.getEmail());
	}
}
