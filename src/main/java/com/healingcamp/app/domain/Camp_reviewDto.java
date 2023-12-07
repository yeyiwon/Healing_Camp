package com.healingcamp.app.domain;

import java.util.Date;

public class Camp_reviewDto {
    private int C_R_num;
    private int C_ID_fk;
    private int U_num_fk;
    private String U_ID_fk;
    private String C_R_title;
    private String C_R_text;
    private Date C_R_update;
    private int C_R_score;
    private String C_R_pic;
    private String C_name;
    private String R_date;

    public int getC_R_num() {
        return C_R_num;
    }

    public void setC_R_num(int c_R_num) {
        C_R_num = c_R_num;
    }

    public int getC_ID_fk() {
        return C_ID_fk;
    }

    public void setC_ID_fk(int c_ID_fk) {
        C_ID_fk = c_ID_fk;
    }

    public int getU_num_fk() {
        return U_num_fk;
    }

    public void setU_num_fk(int u_num_fk) {
        U_num_fk = u_num_fk;
    }

    public String getC_R_title() {
        return C_R_title;
    }

    public void setC_R_title(String c_R_title) {
        C_R_title = c_R_title;
    }

    public String getC_R_text() {
        return C_R_text;
    }

    public void setC_R_text(String c_R_text) {
        C_R_text = c_R_text;
    }

    public Date getC_R_update() {
        return C_R_update;
    }

    public void setC_R_update(Date c_R_update) {
        C_R_update = c_R_update;
    }

    public int getC_R_score() {
        return C_R_score;
    }

    public void setC_R_score(int c_R_score) {
        C_R_score = c_R_score;
    }

    public String getC_R_pic() {
        return C_R_pic;
    }

    public String getU_ID_fk() {
        return U_ID_fk;
    }

    public void setU_ID_fk(String u_ID_fk) {
        U_ID_fk = u_ID_fk;
    }

    public String getC_name() {
        return C_name;
    }

    public void setC_name(String c_name) {
        C_name = c_name;
    }

    public String getR_date() {
        return R_date;
    }

    public void setR_date(String r_date) {
        R_date = r_date;
    }

    public void setC_R_pic(String c_R_pic) {
        C_R_pic = c_R_pic;
    }

    @Override
    public String toString() {
        return "Camp_reviewDto{" +
                "C_R_num=" + C_R_num +
                ", C_ID_fk=" + C_ID_fk +
                ", U_num_fk=" + U_num_fk +
                ", U_ID_fk='" + U_ID_fk + '\'' +
                ", C_R_title='" + C_R_title + '\'' +
                ", C_R_text='" + C_R_text + '\'' +
                ", C_R_update=" + C_R_update +
                ", C_R_score=" + C_R_score +
                ", C_R_pic='" + C_R_pic + '\'' +
                ", C_name='" + C_name + '\'' +
                ", R_date='" + R_date + '\'' +
                '}';
    }
}
