package com.codingschool.repairWeb.Controllers.AdminControllers.VehiclesTasks;

//Here we will display the vehicles and display a search box for them

import com.codingschool.repairWeb.Domain.Vehicle;
import com.codingschool.repairWeb.Model.RepairForm;
import com.codingschool.repairWeb.Model.SearchVehicleForm;
import com.codingschool.repairWeb.Services.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.LinkedList;
import java.util.List;

@Controller
public class HomeVehicleController {

    private static final String SEARCH_FORM = "searchForm";
    private static final String ADD_REPAIR_FORM = "addRepairForm";
    private static final String VEHICLES_LIST = "vehiclesList";
    private static final String PROFILE_DES="profile";
    private static final String ERROR = "errorMessage";

    @Autowired
    private VehicleService vehicleService;


    @RequestMapping(value = "/admin/vehicles", method = RequestMethod.GET)
    public String getAddView(Model model, @ModelAttribute("resultList") LinkedList<Vehicle> resultList, @ModelAttribute("errorMessage") String errorMessage) {
        model.addAttribute(SEARCH_FORM, new SearchVehicleForm());
        model.addAttribute(ADD_REPAIR_FORM, new RepairForm());

        List<Vehicle> result = new LinkedList<>();
        //Get attributes and check if there is a result from a search
        if (errorMessage.isEmpty()) {
            if (resultList.isEmpty()) {
                //Get Owners from database
                result.addAll(vehicleService.find50VehiclesWithPlateAfter("A"));
            } else result.addAll(resultList);
        }

        model.addAttribute(VEHICLES_LIST,result);
        model.addAttribute(ERROR,errorMessage);
        model.addAttribute(PROFILE_DES,"/admin");
        return "admin/vehicles";
    }

}
