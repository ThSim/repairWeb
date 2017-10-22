package com.codingschool.repairWeb.Controllers.AdminControllers.OwnersTasks;

import com.codingschool.repairWeb.Domain.User;
import com.codingschool.repairWeb.Domain.Vehicle;
import com.codingschool.repairWeb.Model.AddOwnerForm;
import com.codingschool.repairWeb.Services.UserService;
import com.codingschool.repairWeb.Services.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.LinkedList;
import java.util.List;

@Controller
public class AddOwnerController {
    private static final String ADD_FORM = "addForm";

    @Autowired
    private UserService userService;


    @RequestMapping(value = "/admin/owners/add", method = RequestMethod.POST)
    public String doAdd(@ModelAttribute(ADD_FORM) AddOwnerForm addOwnerForm,
                        HttpSession session,
                        RedirectAttributes redirectAttributes) {
        User userToAdd = new User(addOwnerForm.getMail(), addOwnerForm.getPass(), addOwnerForm.getAfm(), addOwnerForm.getName(), addOwnerForm.getSurname(), addOwnerForm.getAddress(),false);

        //Initialize results list
        List<User> result = new LinkedList<>();

        userService.save(userToAdd);
        //edw an kati paei strava mporoume na petame exception me minima pou tha emfanizetai sto modal
        result.add(userToAdd);
        redirectAttributes.addFlashAttribute("resultList", result);
        return "redirect:/admin/owners";
    }

}
