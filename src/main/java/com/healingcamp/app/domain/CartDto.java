package com.healingcamp.app.domain;

public class CartDto {
    private int I_ID_fk;
    private int U_num_fk;
    private int Cart_num;
    private int Item_cart_cnt;

    public int getItem_cart_cnt() {
        return Item_cart_cnt;
    }

    public void setItem_cart_cnt(int item_cart_cnt) {
        Item_cart_cnt = item_cart_cnt;
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

    public int getCart_num() {
        return Cart_num;
    }

    public void setCart_num(int cart_num) {
        Cart_num = cart_num;
    }

    public CartDto() {}

    @Override
    public String toString() {
        return "CartDto{" +
                "I_ID_fk=" + I_ID_fk +
                ", U_num_fk=" + U_num_fk +
                ", Cart_num=" + Cart_num +
                ", Item_cart_cnt=" + Item_cart_cnt +
                '}';
    }
}
