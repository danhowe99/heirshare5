// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.howed.heirshare5.admin.web;

import com.howed.heirshare5.admin.web.AdminBeneficiaryItemChoiceController;
import com.howed.heirshare5.domain.Beneficiary;
import com.howed.heirshare5.domain.BeneficiaryItemChoice;
import com.howed.heirshare5.domain.InventoryItem;
import com.howed.heirshare5.service.BeneficiaryItemChoiceService;
import com.howed.heirshare5.service.BeneficiaryService;
import com.howed.heirshare5.service.InventoryItemService;
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

privileged aspect AdminBeneficiaryItemChoiceController_Roo_Controller {
    
    @Autowired
    BeneficiaryItemChoiceService AdminBeneficiaryItemChoiceController.beneficiaryItemChoiceService;
    
    @Autowired
    BeneficiaryService AdminBeneficiaryItemChoiceController.beneficiaryService;
    
    @Autowired
    InventoryItemService AdminBeneficiaryItemChoiceController.inventoryItemService;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AdminBeneficiaryItemChoiceController.create(@Valid BeneficiaryItemChoice beneficiaryItemChoice, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, beneficiaryItemChoice);
            return "admin/beneficiaryItemChoice/create";
        }
        uiModel.asMap().clear();
        beneficiaryItemChoiceService.saveBeneficiaryItemChoice(beneficiaryItemChoice);
        return "redirect:/admin/beneficiaryItemChoice/" + encodeUrlPathSegment(beneficiaryItemChoice.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AdminBeneficiaryItemChoiceController.createForm(Model uiModel) {
        populateEditForm(uiModel, new BeneficiaryItemChoice());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (inventoryItemService.countAllInventoryItems() == 0) {
            dependencies.add(new String[] { "inventoryitem", "admin/inventoryItem" });
        }
        if (beneficiaryService.countAllBeneficiarys() == 0) {
            dependencies.add(new String[] { "beneficiary", "admin/beneficiary" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "admin/beneficiaryItemChoice/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AdminBeneficiaryItemChoiceController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("beneficiaryitemchoice", beneficiaryItemChoiceService.findBeneficiaryItemChoice(id));
        uiModel.addAttribute("itemId", id);
        return "admin/beneficiaryItemChoice/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AdminBeneficiaryItemChoiceController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("beneficiaryitemchoices", beneficiaryItemChoiceService.findBeneficiaryItemChoiceEntries(firstResult, sizeNo));
            float nrOfPages = (float) beneficiaryItemChoiceService.countAllBeneficiaryItemChoices() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("beneficiaryitemchoices", beneficiaryItemChoiceService.findAllBeneficiaryItemChoices());
        }
        return "admin/beneficiaryItemChoice/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AdminBeneficiaryItemChoiceController.update(@Valid BeneficiaryItemChoice beneficiaryItemChoice, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, beneficiaryItemChoice);
            return "admin/beneficiaryItemChoice/update";
        }
        uiModel.asMap().clear();
        beneficiaryItemChoiceService.updateBeneficiaryItemChoice(beneficiaryItemChoice);
        return "redirect:/admin/beneficiaryItemChoice/" + encodeUrlPathSegment(beneficiaryItemChoice.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AdminBeneficiaryItemChoiceController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, beneficiaryItemChoiceService.findBeneficiaryItemChoice(id));
        return "admin/beneficiaryItemChoice/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AdminBeneficiaryItemChoiceController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        BeneficiaryItemChoice beneficiaryItemChoice = beneficiaryItemChoiceService.findBeneficiaryItemChoice(id);
        beneficiaryItemChoiceService.deleteBeneficiaryItemChoice(beneficiaryItemChoice);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/admin/beneficiaryItemChoice";
    }
    
    void AdminBeneficiaryItemChoiceController.populateEditForm(Model uiModel, BeneficiaryItemChoice beneficiaryItemChoice) {
        uiModel.addAttribute("beneficiaryItemChoice", beneficiaryItemChoice);
        uiModel.addAttribute("beneficiarys", beneficiaryService.findAllBeneficiarys());
        uiModel.addAttribute("inventoryitems", inventoryItemService.findAllInventoryItems());
    }
    
    String AdminBeneficiaryItemChoiceController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
