package com.codingschool.repairWeb.Domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Vehicle {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(nullable = false, unique = true)
    private String plate;

    @Column
    private String brand;

    @ManyToOne(optional=false)
    @JoinColumn(name = "user_id",referencedColumnName = "id")
    private User user;


    public Vehicle(String plate, String brand, User user) {
        this.plate = plate;
        this.brand = brand;
        this.user = user;
    }
}
