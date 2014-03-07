package com.howed.heirshare5.estateadmin.web;
import com.howed.heirshare5.domain.Beneficiary;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/estateAdmin/beneficiary")
@Controller
@RooWebScaffold(path = "estateAdmin/beneficiary", formBackingObject = Beneficiary.class)
public class BeneficiaryController {
}
