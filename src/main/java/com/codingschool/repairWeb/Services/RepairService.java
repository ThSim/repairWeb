package com.codingschool.repairWeb.Services;

import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Domain.Vehicle;
import com.codingschool.repairWeb.Exceptions.NoResultsFoundException;

import java.time.LocalDateTime;
import java.util.List;

public interface RepairService {

    void save(Repair rep);

    void delete(Long id);

    List<Repair> findAdminRepairs();

    List<Repair> find50Repairs();

    List<Repair> searchRepairsDates(String dateStart, String dateEnd) throws NoResultsFoundException;
//???
    List<Repair> find10RepairsAfter(LocalDateTime localDateTime);

    Repair findById (Long id);
}
