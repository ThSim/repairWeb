package com.codingschool.repairWeb.Controllers.AdminControllers;

import com.codingschool.repairWeb.Domain.User;
import com.codingschool.repairWeb.Model.AddOwnerForm;
import com.codingschool.repairWeb.Model.SearchForm;
import com.codingschool.repairWeb.Services.UserService;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
public class SearchController {
    private final static org.slf4j.Logger logger = LoggerFactory.getLogger(SearchController.class);

    private static final String SEARCH_FORM = "userForm";
    public static final String OWNERLIST = "owner";

    @Autowired
    private UserService userService;


    UserConverter userConverter;

    @RequestMapping(value = "/search", method = RequestMethod.GET)   //Edw akouei se GET!!!
    public String getSearchView(Model model) {
        model.addAttribute(SEARCH_FORM, new SearchForm());
        return "searchU";
    }


    @RequestMapping(value = "/results", method = RequestMethod.GET)   //Edw akouei se GET!!!
    public String resultsSearch(Model model) {
        model.addAttribute(SEARCH_FORM, new SearchForm());
        return "edit_test";
    }

    //    @RequestMapping(value = "/edit_results", method = RequestMethod.GET)   //Edw akouei se GET!!!
//    public  String editresultsSearch(Model model) {
////        model.addAttribute(SEARCH_FORM, new AddForm());
//        return "edit_results";
//    }
///
    @RequestMapping(value = "/search", method = RequestMethod.POST)  //Edw se POST!!
    public String doSearch(@ModelAttribute(SEARCH_FORM) SearchForm searchForm, Model model,
                           HttpSession session,
                           RedirectAttributes redirectAttributes) {
        User owner = null;
        if (!searchForm.getAfm().equals("")) {
            owner = userService.findByAfm(searchForm.getAfm());
        } else if (searchForm.getMail() != null) {
            owner = userService.findByMail(searchForm.getMail());

        }


        if (owner == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "No users \t" + searchForm.getAfm() + "\tfound");
        }
        //map edw key,value//
        redirectAttributes.addFlashAttribute(OWNERLIST, owner);
        return "redirect:/results";
    }


    @RequestMapping(value = "/results", method = RequestMethod.POST)  //Edw se POST!!
    public ResponseEntity<User> resultsUser(@RequestBody AddOwnerForm addForm, Model model,
                                            HttpSession session,
                                            RedirectAttributes redirectAttributes) {




//        User owner = userService.findById(addForm.getId());
//        User owner1 = userConverter.buildEditUserObject(addForm, owner);
        User owner1 = userConverter.buildEditUserObject(addForm);
        userService.save(owner1);

        return new ResponseEntity<User>(owner1, HttpStatus.OK);
    }

}
