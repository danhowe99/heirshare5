package com.howed.heirshare5.domain;
import javax.persistence.Column;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.entity.RooJpaEntity;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaEntity
public class EstateAdministrator {

    /**
     */
    @NotNull
    @Column(unique = true)
    @Size(max = 30)
    private String email;

    /**
     */
    @NotNull
    @Size(min = 6, max = 10)
    @Transient
    private String password;
}
