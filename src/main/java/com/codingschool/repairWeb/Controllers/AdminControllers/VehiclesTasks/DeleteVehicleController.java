package com.codingschool.repairWeb.Controllers.AdminControllers.VehiclesTasks;

import com.codingschool.repairWeb.Model.VehicleForm;
import com.codingschool.repairWeb.Services.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class DeleteVehicleController {

        private static final String ADD_FORM = "vehicleForm";

        @Autowired
        private VehicleService vehicleService;

        @RequestMapping(value = "/admin/vehicles/delete", method = RequestMethod.POST)
        public String delete(@ModelAttribute(ADD_FORM) VehicleForm vehicleForm, RedirectAttributes redirectAttributes) {
            //here we will delete the owner base on his id

            vehicleService.delete(vehicleForm.getId());
            return "redirect:/admin/vehicles";
        }

    }

