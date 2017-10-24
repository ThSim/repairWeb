package com.codingschool.repairWeb.Controllers.AdminControllers.OwnersTasks;

import com.codingschool.repairWeb.Domain.User;
import com.codingschool.repairWeb.Domain.Vehicle;
import com.codingschool.repairWeb.Exceptions.NoResultsFoundException;
import com.codingschool.repairWeb.Model.IdForm;
import com.codingschool.repairWeb.Model.SearchForm;
import com.codingschool.repairWeb.Services.UserService;
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
public class FindOwnersVehiclesController {

    private static final String ID_FORM = "idForm";

    @Autowired
    private VehicleService vehicleService;

    @RequestMapping(value = "/admin/owners/findVehicles", method = RequestMethod.POST)
    public String searchOwner(@ModelAttribute(ID_FORM) IdForm idForm,
                              RedirectAttributes redirectAttributes) {

        //Initialize results list
        List<Vehicle> result = new LinkedList<>();

        try {
            //Here we are searching for the vehicle:
            result = vehicleService.findOwnersVehicles(idForm.getId());
            //add result list to attributes
            redirectAttributes.addFlashAttribute("resultList", result);
        } catch (NoResultsFoundException e) {
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
        }

        return "redirect:/admin/vehicles";
    }
}
