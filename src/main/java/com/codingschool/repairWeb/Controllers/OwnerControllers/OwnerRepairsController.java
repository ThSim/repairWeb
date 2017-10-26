package com.codingschool.repairWeb.Controllers.OwnerControllers;

import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Exceptions.NoResultsFoundException;
import com.codingschool.repairWeb.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class OwnerRepairsController {

    @Autowired
    private UserService userService;

    private static final String FULL_NAME = "fullName";
    private static final String REPAIR_LIST = "repairList";
    private static final String PROFILE_DES="profile";

    @RequestMapping(value = "/user/repairs",  method = RequestMethod.GET)
    public String fetchOwnerRepairs(Model model, HttpSession session) {

        if(session.getAttribute("fullName")!=null)
            model.addAttribute(FULL_NAME, session.getAttribute("fullName"));
        else
            model.addAttribute(FULL_NAME, null);

        try{
            List<Repair> repairs = userService.fetchRepairs();
            model.addAttribute(REPAIR_LIST,repairs);
        }catch (NoResultsFoundException e) {
            model.addAttribute("errorMessage", e.getMessage());
        }

        model.addAttribute(PROFILE_DES,"/user");
        return "owner/owner_repairs";
    }

    /*private void addFullNameInModel(HttpSession session, Model model){
        if(session.getAttribute("fullName")!=null)
            model.addAttribute(FULL_NAME, session.getAttribute("fullName"));
        else
            model.addAttribute(FULL_NAME, null);
    }*/


}
