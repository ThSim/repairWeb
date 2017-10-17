package com.codingschool.repairWeb.Controllers;

import com.codingschool.repairWeb.Domain.User;
import com.codingschool.repairWeb.Domain.Vehicle;
import com.codingschool.repairWeb.Model.AddForm;
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

@Controller
public class AddController {
    private static final String ADD_FORM = "addForm";

    @Autowired
    private UserService userService;

    @Autowired
    private VehicleService vehicleService;

    //Sample search page to demonstrate functionality. Ignore for now.
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String getAddView(Model model) {
        model.addAttribute(ADD_FORM, new AddForm());
        return "add";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String doAdd(@ModelAttribute(ADD_FORM) AddForm addForm,
                        HttpSession session,
                        RedirectAttributes redirectAttributes) {
        User userToAdd = new User(addForm.getMail(),addForm.getPass(),addForm.getAfm(),addForm.getName(),addForm.getSurname(),addForm.getAddress(),false);
        Vehicle veh = new Vehicle(addForm.getPlate(),addForm.getBrand(),userToAdd);
        userToAdd.addVeh(veh);

        userService.save(userToAdd);
        vehicleService.save(veh);

        return "redirect:/add";
    }

}
