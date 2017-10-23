package com.codingschool.repairWeb.Converters;

import com.codingschool.repairWeb.Domain.User;
import com.codingschool.repairWeb.Model.OwnerForm;

public class UserConverter {

    public static User buildEditUserObject(OwnerForm addForm  ) {
        User user = new User();
        user.setName(addForm.getName());
        user.setMail(addForm.getMail());
        user.setAddress(addForm.getAddress());
        user.setAfm(addForm.getAfm());
        user.setPass(addForm.getPass());
        user.setSurname(addForm.getSurname());
        user.setId(addForm.getId());
        user.setVehicles(null);

        return user;
    }
}

