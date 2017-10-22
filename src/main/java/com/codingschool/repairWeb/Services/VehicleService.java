package com.codingschool.repairWeb.Services;

import com.codingschool.repairWeb.Domain.Vehicle;

import java.util.List;

public interface VehicleService {

    void save(Vehicle veh);

    Vehicle findByPlate(String plate);

    List<Vehicle> find50VehiclesWithPlateAfter(String plate);
}
