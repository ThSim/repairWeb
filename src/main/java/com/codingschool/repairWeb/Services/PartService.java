package com.codingschool.repairWeb.Services;

import com.codingschool.repairWeb.Domain.Part;

import java.util.ArrayList;
import java.util.List;

public interface PartService {
    List<Part> showAll();

    void save(Part part);
}
