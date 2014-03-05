package com.howed.heirshare5.admin.web;
import com.howed.heirshare5.domain.EstateAdministrator;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/estateAdministrator")
@Controller
@RooWebScaffold(path = "admin/estateAdministrator", formBackingObject = EstateAdministrator.class)
public class AdminEstateAdministratorController {
}
