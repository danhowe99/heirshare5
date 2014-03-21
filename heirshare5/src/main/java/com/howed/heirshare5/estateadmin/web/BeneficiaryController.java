package com.howed.heirshare5.estateadmin.web;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.howed.heirshare5.domain.Beneficiary;
import com.howed.heirshare5.domain.EstateAdministrator;
import com.howed.heirshare5.service.EstateService;
import com.howed.heirshare5.util.ControllerUtil;

@RequestMapping("/estateAdmin/beneficiary")
@Controller
@RooWebScaffold(path = "estateAdmin/beneficiary", formBackingObject = Beneficiary.class)
public class BeneficiaryController {

    @Autowired ControllerUtil controllerUtil;
    @Autowired EstateService estateService;

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(Model uiModel) {
    	EstateAdministrator estateAdmin = controllerUtil.getEstateAdministratorForSession();
        populateEditForm(uiModel, createNewBeneficiaryWithDefaultEstate(estateAdmin));
        uiModel.addAttribute("dependencies", controllerUtil.retrieveEstateDependencies(estateAdmin));
        return "estateAdmin/beneficiary/create";
    }

    @RequestMapping(produces = "text/html")
    public String list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
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

    void populateEditForm(Model uiModel, Beneficiary beneficiary) {
        uiModel.addAttribute("beneficiary", beneficiary);
        uiModel.addAttribute("estates", estateService.findAllEstates(controllerUtil.getEstateAdministratorForSession()));
    }
    
    private Beneficiary createNewBeneficiaryWithDefaultEstate(EstateAdministrator estateAdmin) {
    	Beneficiary beneficiary = new Beneficiary();
    	beneficiary.setEstate(controllerUtil.findDefaultEstate(estateAdmin));
    	return beneficiary;
    }    
}
