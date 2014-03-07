// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.howed.heirshare5.estateadmin.web;

import com.howed.heirshare5.domain.Estate;
import com.howed.heirshare5.domain.EstateAdministrator;
import com.howed.heirshare5.estateadmin.web.EstateController;
import com.howed.heirshare5.service.EstateAdministratorService;
import com.howed.heirshare5.service.EstateService;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
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

privileged aspect EstateController_Roo_Controller {
    
    @Autowired
    EstateService EstateController.estateService;
    
    @Autowired
    EstateAdministratorService EstateController.estateAdministratorService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String EstateController.create(@Valid Estate estate, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, estate);
            return "estateAdmin/estate/create";
        }
        uiModel.asMap().clear();
        estateService.saveEstate(estate);
        return "redirect:/estateAdmin/estate/" + encodeUrlPathSegment(estate.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String EstateController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Estate());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (estateAdministratorService.countAllEstateAdministrators() == 0) {
            dependencies.add(new String[] { "estateadministrator", "admin/estateAdministrator" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "estateAdmin/estate/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String EstateController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("estate", estateService.findEstate(id));
        uiModel.addAttribute("itemId", id);
        return "estateAdmin/estate/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String EstateController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("estates", estateService.findEstateEntries(firstResult, sizeNo));
            float nrOfPages = (float) estateService.countAllEstates() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("estates", estateService.findAllEstates());
        }
        return "estateAdmin/estate/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String EstateController.update(@Valid Estate estate, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, estate);
            return "estateAdmin/estate/update";
        }
        uiModel.asMap().clear();
        estateService.updateEstate(estate);
        return "redirect:/estateAdmin/estate/" + encodeUrlPathSegment(estate.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String EstateController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, estateService.findEstate(id));
        return "estateAdmin/estate/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String EstateController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Estate estate = estateService.findEstate(id);
        estateService.deleteEstate(estate);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/estateAdmin/estate";
    }
    
    void EstateController.populateEditForm(Model uiModel, Estate estate) {
        uiModel.addAttribute("estate", estate);
        uiModel.addAttribute("estateadministrators", estateAdministratorService.findAllEstateAdministrators());
    }
    
    String EstateController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
