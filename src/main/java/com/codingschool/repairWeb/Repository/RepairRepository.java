package com.codingschool.repairWeb.Repository;

import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Domain.Vehicle;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.List;

public interface RepairRepository extends JpaRepository<Repair, Long> {

    Repair save(Repair rep);

    List<Repair> findTop10ByDateTimeAfterOrderByDateTimeAsc(LocalDateTime StartDate);

    List<Repair> findByDateTimeAfterAndVehicleOrderByDateTimeAsc(LocalDateTime localDateTime, Vehicle vehicle);

    List<Repair> findTop50ByDateTimeAfterOrderByDateTimeAsc(LocalDateTime StartDate);
    //or Desc
    List<Repair> findByDateTimeAfterAndDateTimeBefore(LocalDateTime dateStart, LocalDateTime dateEnd);

    Repair findById(Long id);

    void deleteById(Long id);

    List<Repair> findByVehicleId(Long id);
}
