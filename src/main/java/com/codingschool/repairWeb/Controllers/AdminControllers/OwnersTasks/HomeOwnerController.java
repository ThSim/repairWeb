package com.codingschool.repairWeb.Controllers.AdminControllers.OwnersTasks;

//Here we will display the owners and display a search box for them

import com.codingschool.repairWeb.Domain.User;
import com.codingschool.repairWeb.Model.IdForm;
import com.codingschool.repairWeb.Model.OwnerForm;
import com.codingschool.repairWeb.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.LinkedList;
import java.util.List;

@Controller
public class HomeOwnerController {

    private static final String SEARCH_FORM = "searchForm";
    private static final String OWNERS_LIST = "ownersList";
    private static final String PROFILE_DES = "profile";
    private static final String ERROR = "errorMessage";
    private static final String ID_FORM = "idForm";

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/admin/owners", method = RequestMethod.GET)
    public String homeOnwersView(Model model, @ModelAttribute("resultList") LinkedList<User> resultList, @ModelAttribute("errorMessage") String errorMessage) {
        model.addAttribute(SEARCH_FORM, new OwnerForm());
        model.addAttribute(ID_FORM, new IdForm());

        List<User> result = new LinkedList<>();
        //Get attributes and check if there is a result from a search

        if (errorMessage.isEmpty()) {
            if (resultList.isEmpty()) {
                //Get Owners from database
                result.addAll(userService.find50UsersWithSurnameAfter("A"));
            } else result.addAll(resultList);
        }

        //Edw tha steiloume mprosta kai mia lista me apotelesmata owners
        //Either from database alphabetically or a search result
        model.addAttribute(OWNERS_LIST, result);
        model.addAttribute(ERROR, errorMessage);
        model.addAttribute(PROFILE_DES, "/admin");
        model.addAttribute("errorMsg","");
        return "admin/owners";
    }

}
