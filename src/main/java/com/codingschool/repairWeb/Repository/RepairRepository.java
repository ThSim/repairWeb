package com.codingschool.repairWeb.Repository;

import com.codingschool.repairWeb.Domain.Repair;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface RepairRepository extends JpaRepository<Repair, Long> {

    Repair save(Repair rep);

}
