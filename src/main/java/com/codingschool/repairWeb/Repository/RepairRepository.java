package com.codingschool.repairWeb.Repository;

import com.codingschool.repairWeb.Domain.Repair;
import org.springframework.data.repository.CrudRepository;

public interface RepairRepository extends CrudRepository<Repair, Long> {

    Repair save(Repair rep);

}
