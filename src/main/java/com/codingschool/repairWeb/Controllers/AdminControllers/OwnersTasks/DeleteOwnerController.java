package com.codingschool.repairWeb.Controllers.AdminControllers.OwnersTasks;

import com.codingschool.repairWeb.Model.OwnerForm;
import com.codingschool.repairWeb.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class DeleteOwnerController {
    private static final String ADD_FORM = "userForm";
    @Autowired
    private UserService userService;
    @RequestMapping(value = "/admin/owners/delete", method = RequestMethod.POST)
    public String delete(@ModelAttribute(ADD_FORM) OwnerForm ownerForm, RedirectAttributes redirectAttributes) {


        //here we will delete the owner base on his id

        userService.delete(ownerForm.getId());
        return "redirect:/admin/owners";
    }

}
