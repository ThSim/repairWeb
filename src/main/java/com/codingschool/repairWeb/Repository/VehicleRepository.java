package com.codingschool.repairWeb.Repository;

import com.codingschool.repairWeb.Domain.Vehicle;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VehicleRepository extends CrudRepository<Vehicle, Long> {

    Vehicle findByPlate(String plate);

    Vehicle save(Vehicle veh);

    List<Vehicle> findTop50ByPlateAfterOrderByPlate(String plate);
}
