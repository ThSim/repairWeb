package com.codingschool.repairWeb.Controllers.OwnerControllers;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserHomeController {

    /*@RequestMapping(value = "/user", method = RequestMethod.GET)
    public String admin(Model model) {

        addUsernameInModel(model);

        return "user";
    }

    private void addUsernameInModel(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (auth != null) {
            String username = (String) auth.getPrincipal();
            model.addAttribute("username", username);
        } else {
            model.addAttribute("errorMessage", "User not logged in anymore!");
        }

    }*/
}
