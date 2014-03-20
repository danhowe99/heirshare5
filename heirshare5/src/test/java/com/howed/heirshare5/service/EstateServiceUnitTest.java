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

	private Long estateAdmin1Id;
	
	@Autowired
	EstateService estateService;
	
	@Autowired
	EstateAdministratorService estateAdministratorService;
	
	@Before
	public void before() {
		EstateAdministrator estateAdmin1 = createAndSaveEstateAdministrator("Estate admin 1");
		estateAdmin1Id = estateAdmin1.getId();
		EstateAdministrator estateAdmin2 = createAndSaveEstateAdministrator("Estate admin 2");
		createAndSaveEstate("Estate 1 (admin 1)", estateAdmin1);
		createAndSaveEstate("Estate 2 (admin 1)", estateAdmin1);
		createAndSaveEstate("Estate 3 (admin 1)", estateAdmin1);
		createAndSaveEstate("Estate 4 (admin 1)", estateAdmin1);
		createAndSaveEstate("Estate 5 (admin 1)", estateAdmin1);
		createAndSaveEstate("Estate 6 (admin 2)", estateAdmin2);
	}
	
	@Test
	public void testCountAllEstates() {
		EstateAdministrator estateAdmin1 = estateAdministratorService.findEstateAdministrator(estateAdmin1Id);
		Assert.assertNotNull(estateAdmin1);
		long estateCount = estateService.countAllEstates(estateAdmin1);
		Assert.assertEquals(5, estateCount);
	}
	
	@Test
	public void testFindAllEstates() {
		EstateAdministrator estateAdmin1 = estateAdministratorService.findEstateAdministrator(estateAdmin1Id);
		Assert.assertNotNull(estateAdmin1);
		List<Estate> estates = estateService.findEstateEntries(0, 10, estateAdmin1);
		Assert.assertNotNull(estates);
		Assert.assertEquals(5, estates.size());
	}
	
	@Test
	public void testFindEstateEntriesForEstateAdministrator() {
		EstateAdministrator estateAdmin1 = estateAdministratorService.findEstateAdministrator(estateAdmin1Id);
		Assert.assertNotNull(estateAdmin1);
		List<Estate> estates = estateService.findEstateEntries(1, 2, estateAdmin1);
		Assert.assertNotNull(estates);
		Assert.assertEquals(2, estates.size());
		Estate estate2 = estates.get(0);
		Assert.assertNotNull(estate2);
		Assert.assertEquals("Estate 2 (admin 1)", estate2.getTitle());
		EstateAdministrator estateAdmin = estate2.getEstateAdministrator();
		Assert.assertNotNull(estateAdmin);
		Assert.assertEquals("Estate admin 1", estateAdmin.getEmail());
	}
	
	private EstateAdministrator createAndSaveEstateAdministrator(String email) {
		EstateAdministrator estateAdmin = new EstateAdministrator();
		estateAdmin.setEmail(email);
		estateAdmin.setPassword("password");
		estateAdministratorService.saveEstateAdministrator(estateAdmin);
		return estateAdmin;
	}
	
	private Estate createAndSaveEstate(String title, EstateAdministrator estateAdmin) {
		Estate estate = new Estate();
		estate.setTitle(title);
		estate.setEstateAdministrator(estateAdmin);
		estateService.saveEstate(estate);
		return estate;
	}
}
