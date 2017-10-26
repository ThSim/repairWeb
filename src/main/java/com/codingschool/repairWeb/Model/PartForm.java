package com.codingschool.repairWeb.Model;

public class PartForm {

    //To id tou repair??
    private Long id ;

    private String partId ;

    private String type ;

    private Double cost ;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPartId() {
        return partId;
    }

    public void setPartid(String partid) {
        this.partId = partid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }
}
