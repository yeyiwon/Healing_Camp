package com.healingcamp.app.domain;

public class Insert_cartDto {
    public Integer I_ID_fk;

    public Integer U_num_fk;
    private Integer Item_cart_cnt;

    public Integer getI_ID_fk() {
        return I_ID_fk;
    }

    public void setI_ID_fk(Integer i_ID_fk) {
        I_ID_fk = i_ID_fk;
    }

    public Integer getU_num_fk() {
        return U_num_fk;
    }

    public void setU_num_fk(Integer u_num_fk) {
        U_num_fk = u_num_fk;
    }

    public Integer getItem_cart_cnt() {
        return Item_cart_cnt;
    }

    public void setItem_cart_cnt(Integer item_cart_cnt) {
        Item_cart_cnt = item_cart_cnt;
    }

    public Insert_cartDto() {
    }

    public Insert_cartDto(Integer i_ID_fk, Integer u_num_fk, Integer item_cart_cnt) {
        I_ID_fk = i_ID_fk;
        U_num_fk = u_num_fk;
        Item_cart_cnt = item_cart_cnt;
    }

    @Override
    public String toString() {
        return "Insert_cartDto{" +
                "I_ID_fk=" + I_ID_fk +
                ", U_num_fk=" + U_num_fk +
                ", Item_cart_cnt=" + Item_cart_cnt +
                '}';
    }
}
