package com.howed.heirshare5.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

@RooJavaBean
@RooToString
@RooJpaEntity
public class BeneficiaryItemChoice {

    /**
     */
    private Short choicePriority;

    /**
     */
    @NotNull
    @ManyToOne
    private InventoryItem inventoryItem;

    /**
     */
    @NotNull
    @ManyToOne
    private Beneficiary beneficiary;
}
