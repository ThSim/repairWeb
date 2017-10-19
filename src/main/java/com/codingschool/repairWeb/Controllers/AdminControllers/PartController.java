package com.codingschool.repairWeb.Controllers.AdminControllers;

import com.codingschool.repairWeb.Domain.Part;
import com.codingschool.repairWeb.Model.AddRepairForm;
import com.codingschool.repairWeb.Model.PartForm;
import com.codingschool.repairWeb.Repository.PartRepository;
import com.codingschool.repairWeb.Services.PartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class PartController {

    private static final String PART_FORM = "partForm";

    @Autowired
    private PartService partService ;

    @RequestMapping(value = "/parts", method = RequestMethod.GET)
    public String getPartsView(Model model) {
        model.addAttribute(PART_FORM, new PartForm());
        return "parts";
    }

    @RequestMapping(value = "/parts", method = RequestMethod.POST)
    public String showParts(@ModelAttribute(PART_FORM) PartForm PartForm,
                        HttpSession session,
                        RedirectAttributes redirectAttributes) {


        ArrayList<Part> partList = partService.showAll();


    return "hello";
    }
}
