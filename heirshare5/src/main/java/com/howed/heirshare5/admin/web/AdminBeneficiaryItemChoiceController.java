package com.howed.heirshare5.admin.web;
import com.howed.heirshare5.domain.BeneficiaryItemChoice;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/beneficiaryItemChoice")
@Controller
@RooWebScaffold(path = "admin/beneficiaryItemChoice", formBackingObject = BeneficiaryItemChoice.class)
public class AdminBeneficiaryItemChoiceController {
}
