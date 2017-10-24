package com.codingschool.repairWeb.Controllers.AdminControllers.OwnersTasks;

//here we get the search value and return the result as a list to home controller

import com.codingschool.repairWeb.Domain.User;
import com.codingschool.repairWeb.Model.SearchForm;
import com.codingschool.repairWeb.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.LinkedList;
import java.util.List;

@Controller
public class SearchOwnerController {

    private static final String SEARCH_FORM = "searchForm";

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/admin/owners/search", method = RequestMethod.POST)
    public String searchOwner(@ModelAttribute(SEARCH_FORM) SearchForm searchForm,
                        HttpSession session,
                        RedirectAttributes redirectAttributes) {

        //Initialize results list
        List<User> result = new LinkedList<>();

        //Here we are searching for the owner:
        if (searchForm.getWhatToSearch().equals("afm")){
            //search by afm
            result.add(userService.findByAfm(searchForm.getSearch()));

        }else if(searchForm.getWhatToSearch().equals("mail")){
            //search by mail
            result.add(userService.findByMail(searchForm.getSearch()));

        }else{
            //throw some error
        }

        //add result list to attributes
        redirectAttributes.addFlashAttribute("resultList", result);

        return "redirect:/admin/owners";
    }

}
