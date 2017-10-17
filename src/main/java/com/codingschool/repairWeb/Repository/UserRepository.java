package com.codingschool.repairWeb.Repository;


import com.codingschool.repairWeb.Domain.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


// Repositories should be used instead of DAOS when we add the JPA imlementation.
// We dont use BOTH- we either use a custom made dao ( we write the queries to the DB, we dont use ORM) or we
//use JPA repos instead where the queries are provided for us.
@Repository
public interface UserRepository extends CrudRepository<User, Long> {

    User findByMail(String Mail);

    User findByMailAndPass(String username, String pass);

    User save(User user);

}
