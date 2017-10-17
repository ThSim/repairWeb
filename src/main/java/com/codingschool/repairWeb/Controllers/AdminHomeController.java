package com.codingschool.repairWeb.Controllers;

import com.codingschool.repairWeb.Model.LoginForm;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class AdminHomeController {

    private static final String FULL_NAME = "fullName";

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model,HttpSession session) {
        if(session.getAttribute("fullName")!=null)
            model.addAttribute(FULL_NAME, session.getAttribute("fullName"));
        else
            model.addAttribute(FULL_NAME, null);
        addUsernameInModel(model);

        return "admin";
    }

    private void addUsernameInModel(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            String username = (String) auth.getPrincipal();
            model.addAttribute("username", username);
        } else {
            model.addAttribute("errorMessage", "User not logged in anymore!");
        }

    }
}
