package com.howed.heirshare5.service;

import com.howed.heirshare5.domain.EstateAdministrator;


public class EstateAdministratorServiceImpl implements EstateAdministratorService {

	@Override
	public EstateAdministrator findEstateAdministratorByEmail(String email) {
		return estateAdministratorRepository.findEstateAdministratorByEmail(email);
	}
}
