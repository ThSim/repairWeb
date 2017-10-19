package com.codingschool.repairWeb.Domain;

import javax.persistence.*;
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

    @Column
    private String color;

    @ManyToOne(optional=false)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    @OneToMany(mappedBy = "vehicle", targetEntity = Repair.class)
    private List<Repair> repairs = new ArrayList<>();

    public Vehicle() {
    }

    public Vehicle(String plate, String brand, String color, User user) {
        this.plate = plate;
        this.brand = brand;
        this.color = color;
        this.user = user;
    }

    public void addRep(Repair rep){
        repairs.add(rep);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getPlate() {
        return plate;
    }

    public void setPlate(String plate) {
        this.plate = plate;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Repair> getRepairs() {
        return repairs;
    }

    public void setRepairs(List<Repair> repairs) {
        this.repairs = repairs;
    }
}
