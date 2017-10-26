package com.codingschool.repairWeb.Controllers.AdminControllers.RepairTasks;

import com.codingschool.repairWeb.Domain.Part;
import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Domain.User;
import com.codingschool.repairWeb.Domain.Vehicle;
import com.codingschool.repairWeb.Model.PartForm;
import com.codingschool.repairWeb.Model.VehicleForm;
import com.codingschool.repairWeb.Services.PartService;
import com.codingschool.repairWeb.Services.RepairService;
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
public class AddPartsController {

    private static final String ADD_FORM = "addForm";

    @Autowired
    private RepairService repairService;



    @RequestMapping(value = "/admin/repairs/addPart", method = RequestMethod.GET)
    public String getAddView(Model model) {
        model.addAttribute(ADD_FORM, new VehicleForm());
        return "repairs/addPart";
    }

    @RequestMapping(value = "/admin/repairs/addPart", method = RequestMethod.POST)
    public String doAdd(@ModelAttribute(ADD_FORM) PartForm partForm,
                        RedirectAttributes redirectAttributes) {

        Repair repair = repairService.findById(partForm.getId());

        Part partToAdd = new Part(partForm.getType(),partForm.getCost());

        //Initialize results list
        //List<Part> repairsParts = new LinkedList<>();

        //Edw vazw to part tou repair sth lista me ta parts tou
        repair.addPart(partToAdd);

        //edw kanw save to repair giati exei nea lista
        repairService.save(repair);
        //edw an kati paei strava mporoume na petame exception me minima pou tha emfanizetai sto modal

        //edw thelw na kanw redirect th repairspartsList ??
        redirectAttributes.addFlashAttribute("resultList", repair);
        return "redirect:/admin/repairs";




    }

}
