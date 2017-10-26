package com.codingschool.repairWeb.Controllers;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class StaticsController {
    //here we can add map for pages: About, Contact etc.

    private static final String PROFILE_DES = "profile";


    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String homeOnwersView(Model model) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (auth.getAuthorities().contains(new SimpleGrantedAuthority("ADMIN"))) {
            model.addAttribute(PROFILE_DES, "/admin");
        } else {
            model.addAttribute(PROFILE_DES, "/user");
        }


        return "/about";
    }

}


