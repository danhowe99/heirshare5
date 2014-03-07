package com.howed.heirshare5.estateadmin.web;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.howed.heirshare5.domain.Estate;
import com.howed.heirshare5.service.EstateAdministratorService;

@RequestMapping("/estateAdmin/estate")
@Controller
@RooWebScaffold(path = "estateAdmin/estate", formBackingObject = Estate.class)
public class EstateController {
	
    @Autowired
    EstateAdministratorService estateAdministratorService;

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new Estate());
        return "estateAdmin/estate/create";
    }

    void populateEditForm(Model uiModel, Estate estate) {
    	String userName = SecurityContextHolder.getContext().getAuthentication().getName();
    	estate.setEstateAdministrator(estateAdministratorService.findEstateAdministratorByEmail(userName));
        uiModel.addAttribute("estate", estate);
    }
}
