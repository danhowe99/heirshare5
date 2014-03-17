package com.howed.heirshare5.repository;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

import com.howed.heirshare5.domain.Estate;

@RooJpaRepository(domainType = Estate.class)
public interface EstateRepository {

	static final String FIND_ESTATE_ENTRIES =
			"SELECT		e.*													" +
			"FROM		estate 					e							" +
			"INNER JOIN	estate_administrator	a							" +
			"	ON		a.Id					= e.estate_administrator	" +
			"WHERE		a.email					= :email					" +
			"LIMIT							  	  :sizeNo					" +
			"OFFSET							  	  :firstResult				"
			;
			
	@Query(value = FIND_ESTATE_ENTRIES, nativeQuery = true)
	public List<Estate> findEstateEntries(@Param("firstResult") int firstResult, 
			@Param("sizeNo") int sizeNo, @Param("email") String email);
}
