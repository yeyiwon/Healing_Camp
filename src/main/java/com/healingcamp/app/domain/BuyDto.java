package com.healingcamp.app.domain;

public class BuyDto {
    private Integer Buy_num;
    private Integer U_num_fk;
    private Integer I_ID_fk;
    private Integer buy_count;

    public Integer getBuy_count() {
        return buy_count;
    }

    public void setBuy_count(Integer buy_count) {
        this.buy_count = buy_count;
    }

    public Integer getBuy_num() {
        return Buy_num;
    }

    public void setBuy_num(Integer buy_num) {
        Buy_num = buy_num;
    }

    public Integer getU_num_fk() {
        return U_num_fk;
    }

    public void setU_num_fk(Integer u_num_fk) {
        U_num_fk = u_num_fk;
    }

    public Integer getI_ID_fk() {
        return I_ID_fk;
    }

    public void setI_ID_fk(Integer i_ID_fk) {
        I_ID_fk = i_ID_fk;
    }

    public BuyDto() {
    }
}
