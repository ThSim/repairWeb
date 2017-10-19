package com.codingschool.repairWeb.Controllers.AdminControllers;

import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Services.RepairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

@Controller
public class AdminHomeController {

    @Autowired
    RepairService repairService;

    private static final String FULL_NAME = "fullName";
    private static final String ADMIN_REPAIRS = "repairList";

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String admin(Model model,HttpSession session) {
        if(session.getAttribute("fullName")!=null)
            model.addAttribute(FULL_NAME, session.getAttribute("fullName"));
        else
            model.addAttribute(FULL_NAME, null);

        List<Repair> repairs = repairService.findAdminRepairs();
        model.addAttribute(ADMIN_REPAIRS,repairs);
        return "admin";
    }

    /*private void addUsernameInModel(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            String username = (String) auth.getPrincipal();
            model.addAttribute("username", username);
        } else {
            model.addAttribute("errorMessage", "User not logged in anymore!");
        }
    }*/
}
