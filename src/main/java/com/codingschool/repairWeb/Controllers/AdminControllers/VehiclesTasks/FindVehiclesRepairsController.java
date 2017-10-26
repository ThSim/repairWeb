package com.codingschool.repairWeb.Controllers.AdminControllers.VehiclesTasks;

import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Exceptions.NoResultsFoundException;
import com.codingschool.repairWeb.Model.IdForm;
import com.codingschool.repairWeb.Services.RepairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.LinkedList;
import java.util.List;

@Controller
public class FindVehiclesRepairsController {

    private static final String ID_FORM = "idForm";

    @Autowired
    private RepairService repairService;

    @RequestMapping(value = "/admin/vehicles/findRepairs", method = RequestMethod.POST)
    public String searchOwner(@ModelAttribute(ID_FORM) IdForm idForm,
                              RedirectAttributes redirectAttributes) {

        //Initialize results list
        List<Repair> result;

        try {
            //Here we are searching for the reapirs:
            result = repairService.findVehiclesRepairs(idForm.getId());
            //add result list to attributes
            redirectAttributes.addFlashAttribute("resultList", result);
        } catch (NoResultsFoundException e) {
            redirectAttributes.addFlashAttribute("errorMessage", e.getMessage());
        }

        return "redirect:/admin/repairs";
    }

}
