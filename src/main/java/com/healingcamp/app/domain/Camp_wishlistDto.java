package com.healingcamp.app.domain;

public class Camp_wishlistDto {
    private Integer U_num_fk;
    private int C_ID_fk;
    private int C_W_num;

    private int likeCheck;

    public int getLikeCheck() {
        return likeCheck;
    }

    public void setLikeCheck(int likeCheck) {
        this.likeCheck = likeCheck;
    }

    public Integer getU_num_fk() {
        return U_num_fk;
    }

    public void setU_num_fk(Integer u_num_fk) {
        U_num_fk = u_num_fk;
    }

    public int getC_ID_fk() {
        return C_ID_fk;
    }

    public void setC_ID_fk(int c_ID_fk) {
        C_ID_fk = c_ID_fk;
    }

    public int getC_W_num() {
        return C_W_num;
    }

    public void setC_W_num(int c_W_num) {
        C_W_num = c_W_num;
    }

    public Camp_wishlistDto() {
    }
}
