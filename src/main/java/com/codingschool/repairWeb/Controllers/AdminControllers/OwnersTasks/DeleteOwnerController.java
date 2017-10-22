package com.codingschool.repairWeb.Controllers.AdminControllers.OwnersTasks;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class DeleteOwnerController {

    @RequestMapping(value = "/admin/owners/delete", method = RequestMethod.POST)
    public String doAdd(RedirectAttributes redirectAttributes) {

        //here we will delete the owner base on his id

        return "redirect:/admin/owners";
    }

}
