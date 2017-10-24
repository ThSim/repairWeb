package com.codingschool.repairWeb.Controllers.AdminControllers.VehiclesTasks;

import com.codingschool.repairWeb.Domain.User;
import com.codingschool.repairWeb.Domain.Vehicle;
import com.codingschool.repairWeb.Model.VehicleForm;
import com.codingschool.repairWeb.Services.UserService;
import com.codingschool.repairWeb.Services.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.LinkedList;
import java.util.List;

@Controller
public class AddVehicleController {

    private static final String ADD_FORM = "addForm";

    @Autowired
    private VehicleService vehicleService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/admin/vehicles/add", method = RequestMethod.GET)
    public String getAddView(Model model) {
        model.addAttribute(ADD_FORM, new VehicleForm());
        return "vehicles/add";
    }

    @RequestMapping(value = "/admin/vehicles/add", method = RequestMethod.POST)
    public String doAdd(@ModelAttribute(ADD_FORM) VehicleForm vehicleForm,
                        RedirectAttributes redirectAttributes) {

        //must get user we want to add the car
        //we will redirect here from the owners page?
        User userToAdd = userService.findById(vehicleForm.getId());

        Vehicle veh = new Vehicle(vehicleForm.getPlate(), vehicleForm.getBrand(), vehicleForm.getColor(), userToAdd);

        vehicleService.save(veh);
        List<Vehicle> result = new LinkedList<>();


        result.add(vehicleService.findByPlate(vehicleForm.getPlate()));


        redirectAttributes.addFlashAttribute("resultList",result);

        return "redirect:/admin/vehicles";
    }

}
