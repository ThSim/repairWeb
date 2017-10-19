package com.codingschool.repairWeb.Repository;


import com.codingschool.repairWeb.Domain.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UserRepository extends CrudRepository<User, Long> {

    User findByMail(String mail);

    User findByMailAndPass(String username, String pass);

    User save(User user);

}