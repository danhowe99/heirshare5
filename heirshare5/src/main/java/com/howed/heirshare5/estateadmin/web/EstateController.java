package com.howed.heirshare5.estateadmin.web;
import com.howed.heirshare5.domain.Estate;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/estateAdmin/estate")
@Controller
@RooWebScaffold(path = "estateAdmin/estate", formBackingObject = Estate.class)
public class EstateController {
}
