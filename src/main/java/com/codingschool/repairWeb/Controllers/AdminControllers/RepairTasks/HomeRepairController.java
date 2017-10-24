package com.codingschool.repairWeb.Controllers.AdminControllers.RepairTasks;

//Here we will display the repairs and display a search box for them

import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Model.RepairForm;
import com.codingschool.repairWeb.Model.SearchRepairsForm;
import com.codingschool.repairWeb.Services.RepairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.LinkedList;
import java.util.List;

@Controller
public class HomeRepairController {

    @Autowired
    private RepairService repairService;

    private static final String SEARCH_FORM = "searchRepairsForm";
    private static final String REPAIRS_LIST = "repairList";
    private static final String PROFILE_DES="profile";
    private static final String ERROR = "errorMessage";

    @RequestMapping(value = "/admin/repairs", method = RequestMethod.GET)
    public String homeOnwersView(Model model, @ModelAttribute("resultList") LinkedList<Repair> resultList, @ModelAttribute("errorMessage") String errorMessage ) {
        model.addAttribute(SEARCH_FORM, new SearchRepairsForm());

        List<Repair> result = new LinkedList<>();
        //Get attributes and check if there is a result from a search
        if (resultList.isEmpty()){
            //Get Owners from database
            result.addAll(repairService.find50Repairs());
        }
        else{
            if(errorMessage==null) result.addAll(resultList);
        }

        //Edw tha steiloume mprosta kai mia lista me apotelesmata repairs
        model.addAttribute(REPAIRS_LIST,result);
        model.addAttribute(ERROR,errorMessage);
        model.addAttribute(PROFILE_DES,"/admin");
        return "admin/repairs";
    }


}
