package com.codingschool.repairWeb.Controllers.AdminControllers.OwnersTasks;

//Here we will display the owners and display a search box for them

import com.codingschool.repairWeb.Controllers.OwnerControllers.OwnerHomeController;
import com.codingschool.repairWeb.Domain.User;
import com.codingschool.repairWeb.Model.OwnerForm;
import com.codingschool.repairWeb.Model.SearchForm;
import com.codingschool.repairWeb.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Controller
public class HomeOwnerController {

    private static final String SEARCH_FORM = "searchForm";
    private static final String OWNERS_LIST = "ownersList";
    private static final String PROFILE_DES="profile";
    private static final String EDIT_FORM = "editOwnerForm";

    @Autowired
    private UserService userService;


    @RequestMapping(value = "/admin/owners", method = RequestMethod.GET)
    public String homeOnwersView(Model model, @ModelAttribute("resultList") LinkedList<User> resultList ) {
        model.addAttribute(SEARCH_FORM, new OwnerForm() );

        List<User> result = new LinkedList<>();
        //Get attributes and check if there is a result from a search
        if (resultList.isEmpty()){
            //Get Owners from database
            result.addAll(userService.find50UsersWithSurnameAfter("A"));
        }
        else{
            result.addAll(resultList);
        }

        //Edw tha steiloume mprosta kai mia lista me apotelesmata owners
        //Either from database alphabetically or a search result
        model.addAttribute(OWNERS_LIST,result);
        model.addAttribute(PROFILE_DES,"/admin");
        return "admin/owners";
    }

}
