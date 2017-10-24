package com.codingschool.repairWeb.Services;

import com.codingschool.repairWeb.Domain.Vehicle;
import com.codingschool.repairWeb.Exceptions.NoResultsFoundException;

import java.util.List;

public interface VehicleService {

    void save(Vehicle veh);

    Vehicle findByPlate(String plate);

    List<Vehicle> find50VehiclesWithPlateAfter(String plate);

    Vehicle findById(Long id);

    Vehicle searchVehicle(String plate) throws NoResultsFoundException;
}
