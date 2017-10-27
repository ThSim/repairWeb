package com.codingschool.repairWeb.Controllers.AdminControllers.OwnersTasks;

import com.codingschool.repairWeb.Model.RepairForm;
import com.codingschool.repairWeb.Services.RepairService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class LoadMoreServices {
    private static final String ADD_REPAIR_FORM = "addRepairForm";
    RepairService repairService;

    @RequestMapping(value = "/load", method = RequestMethod.POST)  //Edw se POST!!
    public ResponseEntity<List> addMore(@RequestBody RepairForm addRepairForm) {


        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String date = addRepairForm.getDateTime();
        List load = repairService.find10RepairsAfter(LocalDateTime.parse(date, formatter));
//        User owner = userService.findById(addForm.getId());
//        User owner1 = userConverter.buildEditUserObject(addForm, owner);
//        User owner1 = userConverter.buildEditUserObject(addForm);
//        userService.save(owner1);

        return new ResponseEntity<List>(load, HttpStatus.OK);
    }
}
