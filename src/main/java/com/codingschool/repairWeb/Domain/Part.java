package com.codingschool.repairWeb.Domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
public class Part implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long partId ;

    @Column
    private String type ;

    @Column
    private double cost ;


    @ManyToMany(mappedBy="parts",fetch=FetchType.LAZY,targetEntity = Repair.class)
    private List repairs;


    Part(){
    }

    public Part(String type, double cost) {
        this.type = type ;
        this.cost = cost ;
    }



    public long getPartId() {
        return partId;
    }

    public void setPartId(long partId) {
        this.partId = partId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getCost() { return cost; }

    public void setCost(double cost) { this.cost = cost; }

    public List getRepairList() {
        return repairs;
    }

    public void setRepairList(List repairs) {
        this.repairs = repairs;
    }
}
