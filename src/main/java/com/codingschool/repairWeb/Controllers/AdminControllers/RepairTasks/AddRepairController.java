package com.codingschool.repairWeb.Controllers.AdminControllers.RepairTasks;

import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Domain.Vehicle;
import com.codingschool.repairWeb.Model.RepairForm;
import com.codingschool.repairWeb.Services.RepairService;
import com.codingschool.repairWeb.Services.VehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

@Controller
public class AddRepairController {
    private static final String ADD_FORM = "addForm";

    @Autowired
    private VehicleService vehicleService;

    @Autowired
    private RepairService repairService;

    @RequestMapping(value = "/admin/repairs/add", method = RequestMethod.POST)
    public String doAdd(@ModelAttribute(ADD_FORM) RepairForm repairForm,
                        RedirectAttributes redirectAttributes) {

        String date = repairForm.getDateTime();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy h:mm a", Locale.US);
        Vehicle veh = vehicleService.findById(repairForm.getId());
        Repair rep = new Repair(veh,LocalDateTime.parse(date, formatter) ,repairForm.getStatus(),repairForm.getPrice());

        repairService.save(rep);

        return "redirect:/admin/repairs";
    }

}
