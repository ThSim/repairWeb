
package com.codingschool.repairWeb.Controllers.AdminControllers;

import com.codingschool.repairWeb.Domain.Part;
import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Domain.Vehicle;
import com.codingschool.repairWeb.Model.PartForm;
import com.codingschool.repairWeb.Services.PartService;
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
import java.util.List;

@Controller
public class PartController {

    private static final String PART_FORM = "partForm";

    @Autowired
    private PartService partService ;

    @Autowired
    private VehicleService vehicleService;

    @Autowired
    private RepairService repairService;

    @RequestMapping(value = "/parts", method = RequestMethod.GET)
    public String getPartsView(Model model) {
        model.addAttribute(PART_FORM, new PartForm());



/* List<Part> parts = new ArrayList<>();
        parts = partService.showAll();*/


        Vehicle vehicle = vehicleService.findByPlate("MKO-1234");

        List<Repair> repairs = vehicle.getRepairs();
        if(!repairs.isEmpty()){
            Repair repair = repairs.get(0);
            Part part = new Part("Axonas Strofaloforou",150.0);
            partService.save(part);
            repair.addPart(part);
            repairService.save(repair);
        }

        return "parts";
    }

    @RequestMapping(value = "/parts", method = RequestMethod.POST)
    public String showParts(@ModelAttribute(PART_FORM) PartForm PartForm,
                        HttpSession session,
                        RedirectAttributes redirectAttributes) {

    return "parts";
    }
}

