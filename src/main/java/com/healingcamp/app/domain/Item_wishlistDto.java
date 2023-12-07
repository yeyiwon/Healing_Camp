package com.healingcamp.app.domain;

public class Item_wishlistDto {
    private Integer U_num_fk;
    private Integer I_ID_fk;
    private Integer I_W_num;

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

    public Integer getI_W_num() {
        return I_W_num;
    }

    public void setI_W_num(Integer i_W_num) {
        I_W_num = i_W_num;
    }

    public Item_wishlistDto() {
    }

    @Override
    public String toString() {
        return "Item_wishlistDto{" +
                "U_num_fk=" + U_num_fk +
                ", I_ID_fk=" + I_ID_fk +
                ", I_W_num=" + I_W_num +
                '}';
    }
}
