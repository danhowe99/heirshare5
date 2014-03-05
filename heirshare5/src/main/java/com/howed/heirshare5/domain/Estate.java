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
public class Estate {

    /**
     */
    @NotNull
    @Column(unique = true)
    @Size(max = 30)
    private String title;

    /**
     */
    @NotNull
    @ManyToOne
    private EstateAdministrator estateAdministrator;
}
