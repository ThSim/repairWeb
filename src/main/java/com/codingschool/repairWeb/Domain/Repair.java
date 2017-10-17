package com.codingschool.repairWeb.Domain;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
public class Repair implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    /*@Temporal(TemporalType.DATE)
    private java.util.Date myDate;*/

    @Column
    private LocalDateTime dateTime;

    @Column(nullable = false, unique = true)
    private String mail;

    @Column(nullable = false)
    private String pass;

}
