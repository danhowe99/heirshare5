package com.howed.heirshare5.estateadmin.web;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.howed.heirshare5.domain.Estate;
import com.howed.heirshare5.domain.EstateAdministrator;
import com.howed.heirshare5.service.EstateAdministratorService;
import com.howed.heirshare5.util.ControllerUtil;

@RequestMapping("/estateAdmin/estate")
@Controller
@RooWebScaffold(path = "estateAdmin/estate", formBackingObject = Estate.class)
public class EstateController {
	
    @Autowired ControllerUtil controllerUtil;
    @Autowired EstateAdministratorService estateAdministratorService;

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
        populateEditForm(uiModel, new Estate());
        return "estateAdmin/estate/create";
    }

    @RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
    	EstateAdministrator estateAdminForSession = controllerUtil.getEstateAdministratorForSession();
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("estates", estateService.findEstateEntries(firstResult, sizeNo, estateAdminForSession));
            float nrOfPages = (float) estateService.countAllEstates(estateAdminForSession) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("estates", estateService.findAllEstates(estateAdminForSession));
        }
        return "estateAdmin/estate/list";
    }

    void populateEditForm(Model uiModel, Estate estate) {
    	estate.setEstateAdministrator(controllerUtil.getEstateAdministratorForSession());
        uiModel.addAttribute("estate", estate);
    }
}
