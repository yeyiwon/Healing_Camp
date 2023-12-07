package com.healingcamp.app.domain;

import java.util.Date;

public class ItemDto {
    private Integer I_ID;
    private String I_name;
    private String I_company;
    private String I_img_URL;
    private int I_O_price;
    private  String I_S_Price;
    private Date I_reg_date;
    private int I_count;
    private int I_R_count;
    private int I_cate;

    private int I_sell_cnt;

    //    추가
    private int wishYn;
    private int Item_cart_cnt;
    private int price;

    public Integer getI_ID() {
        return I_ID;
    }

    public void setI_ID(Integer i_ID) {
        I_ID = i_ID;
    }

    public String getI_name() {
        return I_name;
    }

    public void setI_name(String i_name) {
        I_name = i_name;
    }

    public String getI_company() {
        return I_company;
    }

    public void setI_company(String i_company) {
        I_company = i_company;
    }

    public String getI_img_URL() {
        return I_img_URL;
    }

    public void setI_img_URL(String i_img_URL) {
        I_img_URL = i_img_URL;
    }

    public int getI_O_price() {
        return I_O_price;
    }

    public void setI_O_price(int i_O_price) {
        I_O_price = i_O_price;
    }

    public String getI_S_Price() {
        return I_S_Price;
    }

    public void setI_S_Price(String i_S_Price) {
        I_S_Price = i_S_Price;
    }

    public Date getI_reg_date() {
        return I_reg_date;
    }

    public void setI_reg_date(Date i_reg_date) {
        I_reg_date = i_reg_date;
    }

    public int getI_count() {
        return I_count;
    }

    public void setI_count(int i_count) {
        I_count = i_count;
    }

    public int getI_R_count() {
        return I_R_count;
    }

    public void setI_R_count(int i_R_count) {
        I_R_count = i_R_count;
    }

    public int getI_cate() {
        return I_cate;
    }

    public void setI_cate(int i_cate) {
        I_cate = i_cate;
    }

    public int getI_sell_cnt() {
        return I_sell_cnt;
    }

    public void setI_sell_cnt(int i_sell_cnt) {
        I_sell_cnt = i_sell_cnt;
    }

    public int getItem_cart_cnt() {
        return Item_cart_cnt;
    }

    public void setItem_cart_cnt(int item_cart_cnt) {
        Item_cart_cnt = item_cart_cnt;
    }

    public int getWishYn() {
        return wishYn;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setWishYn(int wishYn) {
        this.wishYn = wishYn;
    }

    public ItemDto() {
    }

    @Override
    public String toString() {
        return "ItemDto{" +
                "I_ID=" + I_ID +
                ", I_name='" + I_name + '\'' +
                ", I_company='" + I_company + '\'' +
                ", I_img_URL='" + I_img_URL + '\'' +
                ", I_O_price=" + I_O_price +
                ", I_S_Price='" + I_S_Price + '\'' +
                ", I_reg_date=" + I_reg_date +
                ", I_count=" + I_count +
                ", I_R_count=" + I_R_count +
                ", I_cate=" + I_cate +
                ", I_sell_cnt=" + I_sell_cnt +
                ", wishYn=" + wishYn +
                ", Item_cart_cnt=" + Item_cart_cnt +
                ", price=" + price +
                '}';
    }
}
