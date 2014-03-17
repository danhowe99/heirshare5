package com.howed.heirshare5.service;

import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.howed.heirshare5.domain.Estate;
import com.howed.heirshare5.domain.EstateAdministrator;
import com.howed.heirshare5.service.EstateAdministratorService;
import com.howed.heirshare5.service.EstateService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/META-INF/spring/applicationContext*.xml" })
public class EstateServiceUnitTest extends AbstractJUnit4SpringContextTests {

	@Autowired
	EstateService estateService;
	
	@Autowired
	EstateAdministratorService estateAdministratorService;
	
	@Test
	public void testFindEstateEntriesForEstateAdministrator() {
		EstateAdministrator estateAdmin = estateAdministratorService.findEstateAdministrator(1L);
		Assert.assertNotNull(estateAdmin);
		List<Estate> estates = estateService.findEstateEntries(0, 10, estateAdmin);
		Assert.assertNotNull(estates);
		Assert.assertEquals(1, estates.size());
	}
}
