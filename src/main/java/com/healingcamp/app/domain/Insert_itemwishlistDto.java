package com.healingcamp.app.domain;

public class Insert_itemwishlistDto {
    public Integer I_ID_fk;
    public Integer U_num_fk;

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

    public Insert_itemwishlistDto() {
    }

    public Insert_itemwishlistDto(Integer i_ID_fk, Integer u_num_fk) {
        I_ID_fk = i_ID_fk;
        U_num_fk = u_num_fk;
    }

    @Override
    public String toString() {
        return "Insert_itemwishlistDto{" +
                "I_ID_fk=" + I_ID_fk +
                ", U_num_fk=" + U_num_fk +
                '}';
    }
}
