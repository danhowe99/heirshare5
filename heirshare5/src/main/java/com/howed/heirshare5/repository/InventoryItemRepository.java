package com.howed.heirshare5.repository;
import com.howed.heirshare5.domain.InventoryItem;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = InventoryItem.class)
public interface InventoryItemRepository {
}
