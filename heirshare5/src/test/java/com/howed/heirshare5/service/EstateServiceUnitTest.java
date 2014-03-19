package com.howed.heirshare5.service;

import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.howed.heirshare5.domain.Estate;
import com.howed.heirshare5.domain.EstateAdministrator;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/spring/applicationContext*.xml" })
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=true)
@Transactional
public class EstateServiceUnitTest extends AbstractTransactionalJUnit4SpringContextTests {

	private Long estateAdminId;
	
	@Autowired
	EstateService estateService;
	
	@Autowired
	EstateAdministratorService estateAdministratorService;
	
	@Before
	public void before() {
		EstateAdministrator estateAdmin = createAndSaveEstateAdministrator();
		Estate estate = createAndSaveEstate(estateAdmin);
		Assert.assertNotNull(estate);
	}
	
	@Test
	public void testFindEstateEntriesForEstateAdministrator() {
		EstateAdministrator estateAdmin = estateAdministratorService.findEstateAdministrator(estateAdminId);
		Assert.assertNotNull(estateAdmin);
		List<Estate> estates = estateService.findEstateEntries(0, 10, estateAdmin);
		Assert.assertNotNull(estates);
		Assert.assertEquals(1, estates.size());
	}
	
	private EstateAdministrator createAndSaveEstateAdministrator() {
		EstateAdministrator estateAdmin = new EstateAdministrator();
		estateAdmin.setEmail("Estate admin email");
		estateAdmin.setPassword("password");
		estateAdministratorService.saveEstateAdministrator(estateAdmin);
		estateAdminId = estateAdmin.getId();
		return estateAdmin;
	}
	
	private Estate createAndSaveEstate(EstateAdministrator estateAdmin) {
		Estate estate = new Estate();
		estate.setTitle("Estate");
		estate.setEstateAdministrator(estateAdmin);
		estateService.saveEstate(estate);
		return estate;
	}
}
