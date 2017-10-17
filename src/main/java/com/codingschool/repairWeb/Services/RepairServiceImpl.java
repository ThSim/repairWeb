package com.codingschool.repairWeb.Services;

import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Repository.RepairRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RepairServiceImpl implements RepairService{

    @Autowired
    private RepairRepository repairRepository;

    @Override
    public void save(Repair rep) {
        repairRepository.save(rep);
    }
}
