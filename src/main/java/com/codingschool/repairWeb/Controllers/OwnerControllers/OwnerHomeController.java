package com.codingschool.repairWeb.Controllers.OwnerControllers;


import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class OwnerHomeController {

    @Autowired
    private UserService userService;

    private static final String FULL_NAME = "fullName";
    private static final String REPAIR_LIST = "repairList";

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String admin(Model model, HttpSession session) {

        List<Repair> repairs = userService.fetchRepairs();
        model.addAttribute(REPAIR_LIST, repairs);

        addFullNameInModel(session, model);

        return "user";
    }

    private void addFullNameInModel(HttpSession session, Model model) {
        if (session.getAttribute("fullName") != null)
            model.addAttribute(FULL_NAME, session.getAttribute("fullName"));
        else
            model.addAttribute(FULL_NAME, null);
    }

   /* private void addUsernameInModel(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            String username = (String) auth.getPrincipal();
            model.addAttribute("username", username);
        } else {
            model.addAttribute("errorMessage", "User not logged in anymore!");
        }

    }*/
}
