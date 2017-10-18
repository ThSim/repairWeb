package com.codingschool.repairWeb.Controllers.AdminControllers;

import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Domain.Vehicle;
import com.codingschool.repairWeb.Model.AddRepairForm;
import com.codingschool.repairWeb.Services.RepairService;
import com.codingschool.repairWeb.Services.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Controller
public class AddRepairController {
    private static final String ADD_FORM = "addForm";

    @Autowired
    private VehicleService vehicleService;

    @Autowired
    private RepairService repairService;

    @RequestMapping(value = "/addrepair", method = RequestMethod.GET)
    public String getAddView(Model model) {
        model.addAttribute(ADD_FORM, new AddRepairForm());
        return "addrepair";
    }

    @RequestMapping(value = "/addrepair", method = RequestMethod.POST)
    public String doAdd(@ModelAttribute(ADD_FORM) AddRepairForm addRepairForm,
                        HttpSession session,
                        RedirectAttributes redirectAttributes) {

        //
        String str = "2017-10-18 12:30";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        //

        Vehicle veh = vehicleService.findByPlate("MKO-1234");
        Repair rep = new Repair(veh, LocalDateTime.parse(str, formatter),addRepairForm.getStatus(),addRepairForm.getPrice());
        veh.addRep(rep);

        vehicleService.save(veh);
        repairService.save(rep);

        return "redirect:/addrepair";
    }

}
