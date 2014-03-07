package com.howed.heirshare5.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaEntity
public class InventoryItem {

    /**
     */
    @NotNull
    @Column(unique = true)
    @Size(max = 30)
    private String name;

    /**
     */
    @NotNull
    @Size(max = 100)
    private String description;

    /**
     */
    @NotNull
    private Integer itemValue;

    /**
     */
    @NotNull
    @ManyToOne
    private Estate estate;
}
