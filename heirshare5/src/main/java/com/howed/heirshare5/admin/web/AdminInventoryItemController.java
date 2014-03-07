package com.howed.heirshare5.admin.web;
import com.howed.heirshare5.domain.InventoryItem;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin/inventoryItem")
@Controller
@RooWebScaffold(path = "admin/inventoryItem", formBackingObject = InventoryItem.class)
public class AdminInventoryItemController {
}
