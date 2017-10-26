package com.codingschool.repairWeb.Services;

import com.codingschool.repairWeb.Domain.Vehicle;
import com.codingschool.repairWeb.Exceptions.NoResultsFoundException;

import java.util.List;

public interface VehicleService {

    void save(Vehicle veh);

    void delete(Long id);

    Vehicle findByPlate(String plate);

    List<Vehicle> find50VehiclesWithPlateAfter(String plate);

    Vehicle findById(Long id);

    Vehicle searchVehicle(String plate) throws NoResultsFoundException;

    List<Vehicle> findOwnersVehicles(Long id) throws NoResultsFoundException;
}
