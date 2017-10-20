package com.codingschool.repairWeb.Model;

public class SearchForm {
    private String title;
    private String afm;
    private String mail;

    public String getAfm() { return afm; }

    public void setAfm(String afm) {
        this.afm = afm;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

}
