package com.codingschool.repairWeb.Services;

import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Domain.User;
import com.codingschool.repairWeb.Domain.Vehicle;
import com.codingschool.repairWeb.Exceptions.InvalidCredentialsException;
import com.codingschool.repairWeb.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.LinkedList;
import java.util.List;

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
            return user;
        }
    }

    @Override
    public User findByMail(String mail){
        return userRepository.findByMail(mail);
    }

    @Override
    public List<Repair> fetchRepairs(){
        List<Repair> repairs = new LinkedList<>();
        String mail = SecurityContextHolder.getContext().getAuthentication().getPrincipal().toString();
        User user = findByMail(mail);
        List<Vehicle> vehicles = user.getVehicles();

        //add repairs for each vehicle to list //maybe by status
        for (Vehicle vehicle : vehicles){
            repairs.addAll(vehicle.getRepairs());
        }
        return repairs;
    }

}
