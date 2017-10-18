package com.codingschool.repairWeb.Services;

import com.codingschool.repairWeb.Domain.Repair;

import java.util.List;

public interface RepairService {
    void save(Repair rep);

    List<Repair> findAdminRepairs();
}
