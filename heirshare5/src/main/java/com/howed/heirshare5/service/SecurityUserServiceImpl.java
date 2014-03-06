package com.howed.heirshare5.service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.howed.heirshare5.domain.EstateAdministrator;

@Component
public class SecurityUserServiceImpl implements SecurityUserService {

	private static final String SQL_INSERT_NEW_USER = 
			"INSERT INTO	users "														+
			"(username, "																+
			"password, "																+
			"enabled) "																	+
			"VALUES "																	+
			"( "																		+
			"?, "																		+
			"?, "																		+
			"1 "																		+
			")";
		
		private static final String SQL_INSERT_NEW_AUTHORITY_ESTATE_ADMIN = 
			"INSERT INTO	authorities "												+
			"(username, "																+
			"authority) "																+
			"VALUES "																	+
			"( "																		+
			"?, "																		+
			"'ROLE_ESTATE_ADMIN'"														+
			")";

	@Autowired(required = true)
    @PersistenceContext
	protected EntityManager entityManager;
	
    @Autowired(required = true)
    protected PasswordEncoder passwordEncoder;

	@Override
	@Transactional
	public void saveSecurityUserEstateAdministrator(EstateAdministrator estateAdministrator) {
		createSecurityUserForEstateAdministrator(estateAdministrator);		
	}

    private void createSecurityUserForEstateAdministrator(EstateAdministrator estateAdministrator) {
        createSecurityUser(estateAdministrator);
        createSecurityAuthorityForEstateAdmin(estateAdministrator);
    }
    
    private void createSecurityUser(EstateAdministrator estateAdministrator) {
        Query queryInsertUser = entityManager.createNativeQuery(SQL_INSERT_NEW_USER);
        queryInsertUser.setParameter(1, estateAdministrator.getEmail());
        queryInsertUser.setParameter(2, encryptPassword(estateAdministrator.getPassword()));
        queryInsertUser.executeUpdate();	
    }

    private void createSecurityAuthorityForEstateAdmin(EstateAdministrator estateAdministrator) {
        Query queryInsertAuthority = entityManager.createNativeQuery(SQL_INSERT_NEW_AUTHORITY_ESTATE_ADMIN);
        queryInsertAuthority.setParameter(1, estateAdministrator.getEmail());
        queryInsertAuthority.executeUpdate();
    }

    private String encryptPassword(String unencryptedPassword) {
        return passwordEncoder.encode(unencryptedPassword);
    }
}
