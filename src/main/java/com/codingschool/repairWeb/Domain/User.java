package com.codingschool.repairWeb.Domain;

import org.hibernate.Session;
import org.springframework.context.annotation.Scope;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(nullable = false, unique = true)
    private String mail;

    @Column(nullable = false)
    private String pass;

    @Column(unique = true)
    private String afm;

    @Column
    private String name;

    @Column
    private String surname;

    @Column
    private String address;

    @Column(nullable = false)
    private boolean isAdmin;

    @OneToMany(mappedBy = "user", targetEntity = Vehicle.class)
    private List<Vehicle> vehicles= new ArrayList<>();

    public User() {
    }

    public User(String mail, String pass, String afm, String name, String surname, String address, boolean isAdmin) {
        this.mail = mail;
        this.pass = pass;
        this.afm = afm;
        this.name = name;
        this.surname = surname;
        this.address = address;
        this.isAdmin = isAdmin;

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void addVeh(Vehicle veh){
        vehicles.add(veh);
    }
    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getAfm() {
        return afm;
    }

    public void setAfm(String afm) {
        this.afm = afm;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

    public List<Vehicle> getVehicles() {
        return vehicles;
    }

    public void setVehicles(List<Vehicle> vehicles) {
        this.vehicles = vehicles;
    }
}
