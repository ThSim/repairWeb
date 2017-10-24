package com.codingschool.repairWeb.Services;

import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Exceptions.NoResultsFoundException;

import java.util.List;

public interface RepairService {
    void save(Repair rep);

    List<Repair> findAdminRepairs();

    List<Repair> find50Repairs();

    List<Repair> searchRepairsDates(String dateStart, String dateEnd) throws NoResultsFoundException;
}
