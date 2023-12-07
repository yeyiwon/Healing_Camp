package com.healingcamp.app.domain;

import java.sql.Date;

public class ReservationDto {
    private int R_num;
    private int U_num;
    private int C_ID;
    private String R_begin_date;
    private String R_end_date;

    public int getR_num() {
        return R_num;
    }

    public void setR_num(int r_num) {
        R_num = r_num;
    }

    public int getU_num() {
        return U_num;
    }

    public void setU_num(int u_num) {
        U_num = u_num;
    }

    public int getC_ID() {
        return C_ID;
    }

    public void setC_ID(int c_ID) {
        C_ID = c_ID;
    }

    public String getR_begin_date() {
        return R_begin_date;
    }

    public void setR_begin_date(String r_begin_date) {
        R_begin_date = r_begin_date;
    }

    public String getR_end_date() {
        return R_end_date;
    }

    public void setR_end_date(String r_end_date) {
        R_end_date = r_end_date;
    }

    @Override
    public String toString() {
        return "ReservationDto{" +
                "R_num=" + R_num +
                ", U_num=" + U_num +
                ", C_ID=" + C_ID +
                ", R_begin_date=" + R_begin_date +
                ", R_end_date=" + R_end_date +
                '}';
    }
}
