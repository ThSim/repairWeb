package com.codingschool.repairWeb.Controllers.AdminControllers.OwnersTasks;

import com.codingschool.repairWeb.Converters.UserConverter;
import com.codingschool.repairWeb.Domain.User;
import com.codingschool.repairWeb.Model.AddOwnerForm;
import com.codingschool.repairWeb.Services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.LinkedList;
import java.util.List;

@Controller
public class EditOwnerController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/admin/owner/edit", method = RequestMethod.POST)  //Edw se POST!!
    public String resultsUser(@RequestBody AddOwnerForm addForm,
                              RedirectAttributes redirectAttributes) {

//        User owner = userService.findById(addForm.getId());
//        User owner1 = userConverter.buildEditUserObject(addForm, owner);
        User owner1 = UserConverter.buildEditUserObject(addForm);
        userService.save(owner1);

        List<User> result = new LinkedList<>();
        result.add(owner1);
        //return new ResponseEntity<User>(owner1, HttpStatus.OK);
        redirectAttributes.addFlashAttribute("resultList", result);
        return "redirect:/admin/owners";
    }

}
