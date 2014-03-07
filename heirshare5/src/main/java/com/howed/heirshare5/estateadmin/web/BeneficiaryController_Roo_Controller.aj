// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.howed.heirshare5.estateadmin.web;

import com.howed.heirshare5.domain.Beneficiary;
import com.howed.heirshare5.domain.Estate;
import com.howed.heirshare5.estateadmin.web.BeneficiaryController;
import com.howed.heirshare5.service.BeneficiaryService;
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

privileged aspect BeneficiaryController_Roo_Controller {
    
    @Autowired
    BeneficiaryService BeneficiaryController.beneficiaryService;
    
    @Autowired
    EstateService BeneficiaryController.estateService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String BeneficiaryController.create(@Valid Beneficiary beneficiary, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, beneficiary);
            return "estateAdmin/beneficiary/create";
        }
        uiModel.asMap().clear();
        beneficiaryService.saveBeneficiary(beneficiary);
        return "redirect:/estateAdmin/beneficiary/" + encodeUrlPathSegment(beneficiary.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String BeneficiaryController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Beneficiary());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (estateService.countAllEstates() == 0) {
            dependencies.add(new String[] { "estate", "admin/estate" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "estateAdmin/beneficiary/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String BeneficiaryController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("beneficiary", beneficiaryService.findBeneficiary(id));
        uiModel.addAttribute("itemId", id);
        return "estateAdmin/beneficiary/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String BeneficiaryController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("beneficiarys", beneficiaryService.findBeneficiaryEntries(firstResult, sizeNo));
            float nrOfPages = (float) beneficiaryService.countAllBeneficiarys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("beneficiarys", beneficiaryService.findAllBeneficiarys());
        }
        return "estateAdmin/beneficiary/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String BeneficiaryController.update(@Valid Beneficiary beneficiary, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, beneficiary);
            return "estateAdmin/beneficiary/update";
        }
        uiModel.asMap().clear();
        beneficiaryService.updateBeneficiary(beneficiary);
        return "redirect:/estateAdmin/beneficiary/" + encodeUrlPathSegment(beneficiary.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String BeneficiaryController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, beneficiaryService.findBeneficiary(id));
        return "estateAdmin/beneficiary/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String BeneficiaryController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Beneficiary beneficiary = beneficiaryService.findBeneficiary(id);
        beneficiaryService.deleteBeneficiary(beneficiary);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/estateAdmin/beneficiary";
    }
    
    void BeneficiaryController.populateEditForm(Model uiModel, Beneficiary beneficiary) {
        uiModel.addAttribute("beneficiary", beneficiary);
        uiModel.addAttribute("estates", estateService.findAllEstates());
    }
    
    String BeneficiaryController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
