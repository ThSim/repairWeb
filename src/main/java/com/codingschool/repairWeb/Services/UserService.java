package com.codingschool.repairWeb.Services;

import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Domain.User;
import org.springframework.security.core.AuthenticationException;

import java.util.List;


public interface UserService {

    void save(User user);

    User login(String username,String pass) throws AuthenticationException;

    User findByMail(String mail);

    List<Repair> fetchRepairs();

}
