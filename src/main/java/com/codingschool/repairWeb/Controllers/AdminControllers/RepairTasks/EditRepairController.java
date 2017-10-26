package com.codingschool.repairWeb.Controllers.AdminControllers.RepairTasks;


import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Domain.Vehicle;
import com.codingschool.repairWeb.Model.RepairForm;
import com.codingschool.repairWeb.Services.RepairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;


@Controller
public class EditRepairController {

        private static final String EDIT_FORM = "editRepair"  ;

        @Autowired
        private RepairService repairService;

        @RequestMapping(value = "/admin/repairs/edit",method = RequestMethod.POST)
        public String editRepair(@ModelAttribute(EDIT_FORM) RepairForm repairForm,
                                  RedirectAttributes redirectAttributes){

            Repair repairEdit = repairService.findById(repairForm.getId());


            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy h:mm a", Locale.US);

            repairEdit.setDateTime(LocalDateTime.parse(repairForm.getDateTime(), formatter));
            repairEdit.setStatus(repairForm.getStatus());
            repairEdit.setPrice(repairForm.getPrice());


            repairService.save(repairEdit);



            List<Repair> result = new LinkedList<>();


            result.add(repairService.findById(repairForm.getId()));



            redirectAttributes.addFlashAttribute("resultList",result);
            return "redirect:/admin/repairs" ;
        }
    }


