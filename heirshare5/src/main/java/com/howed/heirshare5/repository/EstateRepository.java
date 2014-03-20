package com.howed.heirshare5.repository;
import java.math.BigInteger;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.howed.heirshare5.domain.Estate;
import com.howed.heirshare5.domain.EstateAdministrator;

@RooJpaRepository(domainType = Estate.class)
public interface EstateRepository {

	static final String FIND_ALL_ESTATES =
			"SELECT		e.*													" +
			"FROM		estate 					e							" +
			"INNER JOIN	estate_administrator	a							" +
			"	ON		a.Id					= e.estate_administrator	" +
			"WHERE		a.email					= :email					"
			;
			
	static final String FIND_ESTATE_ENTRIES =
			"SELECT		e.*													" +
			"FROM		estate 					e							" +
			"INNER JOIN	estate_administrator	a							" +
			"	ON		a.Id					= e.estate_administrator	" +
			"WHERE		a.email					= :email					" +
			"LIMIT							  	  :sizeNo					" +
			"OFFSET							  	  :firstResult				"
			;
			
	static final String COUNT_ALL_ESTATES =
			"SELECT		COUNT(e.id)											" +
			"FROM		estate 					e							" +
			"INNER JOIN	estate_administrator	a							" +
			"	ON		a.Id					= e.estate_administrator	" +
			"WHERE		a.email					= :email					"
			;
			
	@Query(value = FIND_ESTATE_ENTRIES, nativeQuery = true)
	public List<Estate> findEstateEntries(@Param("firstResult") int firstResult, 
			@Param("sizeNo") int sizeNo, @Param("email") String email);

	@Query(value = COUNT_ALL_ESTATES, nativeQuery = true)
	public BigInteger countAllEstates(@Param("email") String email);
	
	@Query(value = FIND_ALL_ESTATES, nativeQuery = true)
	public List<Estate> findAllEstates(@Param("email") String email);
	
	@Query
	public List<Estate> findByDefaultAdministratorEstateAndEstateAdministrator(boolean defaultEstate, EstateAdministrator estateAdmin);
}
