package com.codingschool.repairWeb.Controllers.AdminControllers.VehiclesTasks;

import com.codingschool.repairWeb.Domain.Vehicle;
import com.codingschool.repairWeb.Exceptions.NoResultsFoundException;
import com.codingschool.repairWeb.Model.SearchVehicleForm;
import com.codingschool.repairWeb.Services.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.LinkedList;
import java.util.List;

@Controller
public class SearchVehicleController {

    private static final String SEARCH_FORM = "searchForm";

    @Autowired
    private VehicleService vehicleService;

    @RequestMapping(value = "/admin/vehicles/search", method = RequestMethod.POST)
    public String doAdd(@ModelAttribute(SEARCH_FORM) SearchVehicleForm searchVehicleForm,
                        RedirectAttributes redirectAttributes) {

        //Initialize results list
        List<Vehicle> result = new LinkedList<>();

        try {
            //Here we are searching for the vehicle:
            result.add(vehicleService.searchVehicle(searchVehicleForm.getPlate()));
            //add result list to attributes
            redirectAttributes.addFlashAttribute("resultList", result);
        } catch (NoResultsFoundException e) {
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
        }

        return "redirect:/admin/vehicles";
    }

}
