package com.codingschool.repairWeb.Services;

import com.codingschool.repairWeb.Domain.Part;
import com.codingschool.repairWeb.Repository.PartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class PartServiceImpl implements PartService {

    @Autowired
    private  PartRepository partRepository;

    @Override
    public List<Part> showAll() {
        return partRepository.findAll();
    }

    @Override
    public void save(Part part) {
        partRepository.save(part);
    }
}

