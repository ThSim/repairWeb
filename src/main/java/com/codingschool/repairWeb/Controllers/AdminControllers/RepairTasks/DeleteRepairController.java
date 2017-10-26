package com.codingschool.repairWeb.Controllers.AdminControllers.RepairTasks;

import com.codingschool.repairWeb.Model.RepairForm;
import com.codingschool.repairWeb.Services.RepairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class DeleteRepairController {

        private static final String ADD_FORM = "repairForm";

        @Autowired
        private RepairService repairService;

        @RequestMapping(value = "/admin/repairs/delete", method = RequestMethod.POST)
        public String delete(@ModelAttribute(ADD_FORM) RepairForm repairForm, RedirectAttributes redirectAttributes) {
            //here we will delete the owner base on his id

            repairService.delete(repairForm.getId());
            return "redirect:/admin/repairs";
        }

    }
