// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.howed.heirshare5.domain;

import com.howed.heirshare5.domain.InventoryItem;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect InventoryItem_Roo_Jpa_Entity {
    
    declare @type: InventoryItem: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long InventoryItem.id;
    
    @Version
    @Column(name = "version")
    private Integer InventoryItem.version;
    
    public Long InventoryItem.getId() {
        return this.id;
    }
    
    public void InventoryItem.setId(Long id) {
        this.id = id;
    }
    
    public Integer InventoryItem.getVersion() {
        return this.version;
    }
    
    public void InventoryItem.setVersion(Integer version) {
        this.version = version;
    }
    
}