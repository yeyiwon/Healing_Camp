package com.healingcamp.app.domain;

import java.util.Date;

public class Item_reviewDto {
    private Integer I_R_num;
    private int I_ID_fk;
    private int U_num_fk;
    private String U_ID_fk;
    private String I_R_title;
    private String I_R_text;
    private Date I_R_update;
    private int I_R_score;

    public Integer getI_R_num() {
        return I_R_num;
    }

    public void setI_R_num(Integer i_R_num) {
        I_R_num = i_R_num;
    }

    public int getI_ID_fk() {
        return I_ID_fk;
    }

    public void setI_ID_fk(int i_ID_fk) {
        I_ID_fk = i_ID_fk;
    }

    public int getU_num_fk() {
        return U_num_fk;
    }

    public void setU_num_fk(int u_num_fk) {
        U_num_fk = u_num_fk;
    }

    public String getI_R_title() {
        return I_R_title;
    }

    public void setI_R_title(String i_R_title) {
        I_R_title = i_R_title;
    }

    public String getI_R_text() {
        return I_R_text;
    }

    public void setI_R_text(String i_R_text) {
        I_R_text = i_R_text;
    }

    public Date getI_R_update() {
        return I_R_update;
    }

    public void setI_R_update(Date i_R_update) {
        I_R_update = i_R_update;
    }

    public int getI_R_score() {
        return I_R_score;
    }

    public void setI_R_score(int i_R_score) {
        I_R_score = i_R_score;
    }

    public String getU_ID_fk() {
        return U_ID_fk;
    }

    public void setU_ID_fk(String u_ID_fk) {
        U_ID_fk = u_ID_fk;
    }

    public Item_reviewDto() {}

    @Override
    public String toString() {
        return "Item_reviewDto{" +
                "I_R_num=" + I_R_num +
                ", I_ID_fk=" + I_ID_fk +
                ", U_num_fk=" + U_num_fk +
                ", U_ID_fk='" + U_ID_fk + '\'' +
                ", I_R_title='" + I_R_title + '\'' +
                ", I_R_text='" + I_R_text + '\'' +
                ", I_R_update=" + I_R_update +
                ", I_R_score=" + I_R_score +
                '}';
    }
}
