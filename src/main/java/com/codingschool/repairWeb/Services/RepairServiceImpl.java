package com.codingschool.repairWeb.Services;

import com.codingschool.repairWeb.Domain.Repair;
import com.codingschool.repairWeb.Repository.RepairRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
@Transactional
public class RepairServiceImpl implements RepairService{

    @Autowired
    private RepairRepository repairRepository;

    @Override
    public void save(Repair rep) {
        repairRepository.save(rep);
    }

    @Override
    public List<Repair> findAdminRepairs() {
        LocalDateTime localDateTime = LocalDateTime.now();
        return repairRepository.findTop10ByDateTimeAfterOrderByDateTimeAsc(localDateTime);
    }

    @Override
    public List<Repair> find50Repairs() {
        LocalDateTime localDateTime = LocalDateTime.now();
        return repairRepository.findTop50ByDateTimeAfterOrderByDateTimeAsc(localDateTime);
    }


}
