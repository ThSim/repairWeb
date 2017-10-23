package com.codingschool.repairWeb.Controllers.AdminControllers.VehiclesTasks;

import com.codingschool.repairWeb.Domain.Vehicle;
import com.codingschool.repairWeb.Model.VehicleForm;
import com.codingschool.repairWeb.Services.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import java.util.LinkedList;
import java.util.List;

@Controller
public class EditVehicleController {

    private static final String EDIT_FORM = "editVehicle"  ;

    @Autowired
    private VehicleService vehicleService;

    @RequestMapping(value = "/admin/vehicles/edit",method = RequestMethod.POST)
    public String editVehicle(@ModelAttribute(EDIT_FORM) VehicleForm vehicleForm,
                              RedirectAttributes redirectAttributes){



        Vehicle vehicleEdit = new Vehicle(vehicleForm.getId(),vehicleForm.getPlate(),vehicleForm.getBrand(),vehicleForm.getColor());


        vehicleService.save(vehicleEdit);

        List<Vehicle> result = new LinkedList<>();

        result.add(vehicleService.findByPlate(vehicleForm.getPlate()));

        redirectAttributes.addFlashAttribute("resultList",result);
        return "redirect:/admin/vehicles" ;
    }
}
