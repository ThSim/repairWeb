package com.codingschool.repairWeb.Services;

import com.codingschool.repairWeb.Domain.User;
import org.springframework.security.core.AuthenticationException;


public interface UserService {

    void save(User user);

    User login(String username,String pass) throws AuthenticationException;

}
