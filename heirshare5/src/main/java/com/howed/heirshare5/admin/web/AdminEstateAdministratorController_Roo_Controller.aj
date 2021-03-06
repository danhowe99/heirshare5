// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.howed.heirshare5.admin.web;

import com.howed.heirshare5.admin.web.AdminEstateAdministratorController;
import com.howed.heirshare5.domain.EstateAdministrator;
import com.howed.heirshare5.service.EstateAdministratorService;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect AdminEstateAdministratorController_Roo_Controller {
    
    @Autowired
    EstateAdministratorService AdminEstateAdministratorController.estateAdministratorService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AdminEstateAdministratorController.create(@Valid EstateAdministrator estateAdministrator, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, estateAdministrator);
            return "admin/estateAdministrator/create";
        }
        uiModel.asMap().clear();
        estateAdministratorService.saveEstateAdministrator(estateAdministrator);
        return "redirect:/admin/estateAdministrator/" + encodeUrlPathSegment(estateAdministrator.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AdminEstateAdministratorController.createForm(Model uiModel) {
        populateEditForm(uiModel, new EstateAdministrator());
        return "admin/estateAdministrator/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AdminEstateAdministratorController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("estateadministrator", estateAdministratorService.findEstateAdministrator(id));
        uiModel.addAttribute("itemId", id);
        return "admin/estateAdministrator/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AdminEstateAdministratorController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("estateadministrators", estateAdministratorService.findEstateAdministratorEntries(firstResult, sizeNo));
            float nrOfPages = (float) estateAdministratorService.countAllEstateAdministrators() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("estateadministrators", estateAdministratorService.findAllEstateAdministrators());
        }
        return "admin/estateAdministrator/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AdminEstateAdministratorController.update(@Valid EstateAdministrator estateAdministrator, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, estateAdministrator);
            return "admin/estateAdministrator/update";
        }
        uiModel.asMap().clear();
        estateAdministratorService.updateEstateAdministrator(estateAdministrator);
        return "redirect:/admin/estateAdministrator/" + encodeUrlPathSegment(estateAdministrator.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AdminEstateAdministratorController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, estateAdministratorService.findEstateAdministrator(id));
        return "admin/estateAdministrator/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AdminEstateAdministratorController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        EstateAdministrator estateAdministrator = estateAdministratorService.findEstateAdministrator(id);
        estateAdministratorService.deleteEstateAdministrator(estateAdministrator);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/estateAdministrator";
    }
    
    void AdminEstateAdministratorController.populateEditForm(Model uiModel, EstateAdministrator estateAdministrator) {
        uiModel.addAttribute("estateAdministrator", estateAdministrator);
    }
    
    String AdminEstateAdministratorController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
