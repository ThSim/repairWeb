package com.codingschool.repairWeb.Controllers.AdminControllers.OwnersTasks;

import com.codingschool.repairWeb.Converters.UserConverter;
import com.codingschool.repairWeb.Domain.User;
import com.codingschool.repairWeb.Model.OwnerForm;
import com.codingschool.repairWeb.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.LinkedList;
import java.util.List;

@Controller
public class EditOwnerController {

    @Autowired
    private UserService userService;

    private static final String EDIT_FORM = "editOwnerForm";

    @RequestMapping(value = "/admin/owners/edit", method = RequestMethod.POST)  //Edw se POST!!
    public String editUser(@ModelAttribute(EDIT_FORM) OwnerForm ownerForm,
                              RedirectAttributes redirectAttributes) {


        User userEdit = new User(ownerForm.getId(),ownerForm.getMail(),ownerForm.getAfm(),ownerForm.getName(),ownerForm.getSurname(),ownerForm.getAddress());

        userService.save(userEdit);

        List<User> result = new LinkedList<>();


        result.add(userService.findByAfm(ownerForm.getAfm()));

        redirectAttributes.addFlashAttribute("resultList", result);
        return "redirect:/admin/owners";
    }

}
