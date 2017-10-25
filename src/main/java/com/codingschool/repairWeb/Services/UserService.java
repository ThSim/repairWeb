package com.codingschool.repairWeb.Services;

import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Domain.User;
import com.codingschool.repairWeb.Exceptions.NoResultsFoundException;
import org.springframework.security.core.AuthenticationException;

import java.util.List;


public interface UserService {

    void save(User user);

    User login(String username,String pass) throws AuthenticationException;

    User findByMail(String mail);

    void delete(Long id);

    User findByAfm(String afm);

    User findById(Long id);

    List<Repair> fetchRepairs();

    List<User> find50UsersWithSurnameAfter(String surname);

    User searchOwner(String whatToSearch, String search) throws NoResultsFoundException;

}
