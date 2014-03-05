package com.howed.heirshare5.admin.web;
import com.howed.heirshare5.domain.Estate;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/estate")
@Controller
@RooWebScaffold(path = "admin/estate", formBackingObject = Estate.class)
public class AdminEstateController {
}
