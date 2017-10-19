package com.codingschool.repairWeb.Repository;

import com.codingschool.repairWeb.Domain.Repair;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import java.time.LocalDateTime;
import java.util.List;

public interface RepairRepository extends JpaRepository<Repair, Long> {

    Repair save(Repair rep);

    List<Repair> findTop10ByDateTimeAfterOrderByDateTimeAsc(LocalDateTime StartDate);
    //or Desc
    List<Repair> findByDateTimeBefore(LocalDateTime StartDate);
}
