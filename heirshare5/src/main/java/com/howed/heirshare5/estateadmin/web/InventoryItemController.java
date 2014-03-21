package com.howed.heirshare5.estateadmin.web;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.howed.heirshare5.domain.EstateAdministrator;
import com.howed.heirshare5.domain.InventoryItem;
import com.howed.heirshare5.service.EstateService;
import com.howed.heirshare5.util.ControllerUtil;

@RequestMapping("/estateAdmin/inventoryItem")
@Controller
@RooWebScaffold(path = "estateAdmin/inventoryItem", formBackingObject = InventoryItem.class)
public class InventoryItemController {

    @Autowired ControllerUtil controllerUtil;
    @Autowired EstateService estateService;

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
    	EstateAdministrator estateAdmin = controllerUtil.getEstateAdministratorForSession();
        populateEditForm(uiModel, createNewInventoryItemWithDefaultEstate(estateAdmin));
        uiModel.addAttribute("dependencies", controllerUtil.retrieveEstateDependencies(estateAdmin));
        return "estateAdmin/inventoryItem/create";
    }

    private InventoryItem createNewInventoryItemWithDefaultEstate(EstateAdministrator estateAdmin) {
    	InventoryItem inventoryItem = new InventoryItem();
    	inventoryItem.setEstate(controllerUtil.findDefaultEstate(estateAdmin));
    	return inventoryItem;
    }
    
    void populateEditForm(Model uiModel, InventoryItem inventoryItem) {
        uiModel.addAttribute("inventoryItem", inventoryItem);
        uiModel.addAttribute("estates", estateService.findAllEstates(controllerUtil.getEstateAdministratorForSession()));
    }
}
