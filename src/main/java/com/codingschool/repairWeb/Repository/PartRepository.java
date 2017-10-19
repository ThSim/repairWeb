package com.codingschool.repairWeb.Repository;

import com.codingschool.repairWeb.Domain.Part;
import com.codingschool.repairWeb.Domain.Repair;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface PartRepository extends JpaRepository<Part, Long> {
   List<Part> findAll();

   Part save(Part part);

}