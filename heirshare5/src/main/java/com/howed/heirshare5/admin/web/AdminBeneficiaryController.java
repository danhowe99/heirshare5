package com.howed.heirshare5.admin.web;
import com.howed.heirshare5.domain.Beneficiary;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/beneficiary")
@Controller
@RooWebScaffold(path = "admin/beneficiary", formBackingObject = Beneficiary.class)
public class AdminBeneficiaryController {
}
