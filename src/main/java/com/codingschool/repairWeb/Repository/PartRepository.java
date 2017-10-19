package com.codingschool.repairWeb.Repository;

import com.codingschool.repairWeb.Domain.Part;
import com.codingschool.repairWeb.Domain.Repair;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface PartRepository extends JpaRepository<Part, Long> {
   ArrayList<Part> showAll();
}