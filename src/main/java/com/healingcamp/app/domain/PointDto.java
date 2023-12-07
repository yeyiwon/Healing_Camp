package com.healingcamp.app.domain;

public class PointDto {
    private Integer U_num_fk;
    private int C_point;
    private int Point_num;

    public Integer getU_num_fk() {
        return U_num_fk;
    }

    public void setU_num_fk(Integer u_num_fk) {
        U_num_fk = u_num_fk;
    }

    public int getC_point() {
        return C_point;
    }

    public void setC_point(int c_point) {
        C_point = c_point;
    }

    public int getPoint_num() {
        return Point_num;
    }

    public void setPoint_num(int point_num) {
        Point_num = point_num;
    }

    public PointDto() {
    }

    @Override
    public String toString() {
        return "pointDto{" +
                "U_num_fk=" + U_num_fk +
                ", C_point=" + C_point +
                ", Point_num=" + Point_num +
                '}';
    }
}
