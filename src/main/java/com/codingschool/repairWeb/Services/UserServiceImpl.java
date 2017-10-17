package com.codingschool.repairWeb.Services;

import com.codingschool.repairWeb.Domain.User;
import com.codingschool.repairWeb.Exceptions.InvalidCredentialsException;
import com.codingschool.repairWeb.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.security.core.AuthenticationException;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public void save(User user) {
        userRepository.save(user);
    }

    @Override
    public User login(String mail, String pass) {
        User user =  userRepository.findByMailAndPass(mail, pass);
        if(user == null){
            throw new InvalidCredentialsException("User not found man!");
        }
        else {
            //save user?
            return user;
        }
    }

}
