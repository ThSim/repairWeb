package com.codingschool.repairWeb.Domain;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Repair implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(optional=false)
    @JoinColumn(name = "vehicle_id", referencedColumnName = "id")
    private Vehicle vehicle;

    @Column(nullable = false)
    private LocalDateTime dateTime;

    @Column(nullable = false)
    private String status;

    @Column
    private double price;


    @ManyToMany(fetch=FetchType.LAZY)
    @JoinTable( joinColumns =@JoinColumn(name="repair_id", referencedColumnName="id"),
                                inverseJoinColumns= @JoinColumn(name="part_id", referencedColumnName="partId") )
    private List<Part> parts = new ArrayList<>();



    public Repair() {
    }

    public Repair(Vehicle vehicle, LocalDateTime dateTime, String status, double price) {
        this.vehicle = vehicle;
        this.dateTime = dateTime;
        this.status = status;
        this.price = price;
    }

    public void addPart(Part part){
        parts.add(part);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Vehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }


    public List<Part> getParts() {
        return parts;
    }

    public void setParts(List<Part> parts) {
        this.parts = parts;
    }
}
