package com.howed.heirshare5.estateadmin.web;
import com.howed.heirshare5.domain.EstateAdministrator;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/estateAdmin/estateAdministrator")
@Controller
@RooWebScaffold(path = "estateAdmin/estateAdministrator", formBackingObject = EstateAdministrator.class, delete = false)
public class EstateAdministratorController {
}
