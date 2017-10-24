package com.codingschool.repairWeb.Controllers.AdminControllers.RepairTasks;


import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Exceptions.NoResultsFoundException;
import com.codingschool.repairWeb.Model.SearchForm;
import com.codingschool.repairWeb.Model.SearchRepairsForm;
import com.codingschool.repairWeb.Services.RepairService;
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
public class SearchRepairController {

    private static final String SEARCH_FORM = "searchForm";

    @Autowired
    private RepairService repairService;

    @RequestMapping(value = "/admin/repairs/search", method = RequestMethod.POST)
    public String searchOwner(@ModelAttribute(SEARCH_FORM) SearchRepairsForm searchRepairsForm,
                              HttpSession session,
                              RedirectAttributes redirectAttributes) {

        //Initialize results list
        List<Repair> result;

        try {
            result = repairService.searchRepairsDates(searchRepairsForm.getDateStart(),searchRepairsForm.getDateEnd());
            //add result list to attributes
            redirectAttributes.addFlashAttribute("resultList", result);
        } catch (NoResultsFoundException e) {
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());

        }


        return "redirect:/admin/repairs";
    }


}
