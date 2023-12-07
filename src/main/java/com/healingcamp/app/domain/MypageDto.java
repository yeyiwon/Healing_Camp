package com.healingcamp.app.domain;

import java.util.Date;

public class MypageDto {
    private String U_num;
    private String Buy_num;
    private String I_ID;
    private String I_name;
    private String C_ID;
    private String C_name;
    private String C_Q_num;
    private String C_Q_title;
    private String C_R_num;
    private String C_R_title;
    private String C_R_text;
    private Date C_R_update;
    private String C_R_score;
    private String C_point;
    private String r_num;
    private Date r_date;
    private String U_ID;
    private String U_pw;
    private String U_name;
    private Date U_birth;
    private String U_email;
    private String U_phone;
    private String U_gender;
    private String U_field;
    private Date U_joindate;

    public String getU_num() {
        return U_num;
    }

    public void setU_num(String U_num) {
        this.U_num = U_num;
    }

    public String getBuy_num() {
        return Buy_num;
    }

    public void setBuy_num(String Buy_num) {
        this.Buy_num = Buy_num;
    }

    public String getI_id() {
        return I_ID;
    }

    public void setI_id(String I_ID) {
        this.I_ID = I_ID;
    }

    public String getI_name() {
        return I_name;
    }

    public void setI_name(String I_name) {
        this.I_name = I_name;
    }

    public String getC_id() {
        return C_ID;
    }

    public void setC_id(String C_ID) {
        this.C_ID = C_ID;
    }

    public String getC_name() {
        return C_name;
    }

    public void setC_name(String C_name) {
        this.C_name = C_name;
    }

    public String getC_q_num() {
        return C_Q_num;
    }

    public void setC_q_num(String C_Q_num) {
        this.C_Q_num = C_Q_num;
    }

    public String getC_q_title() {
        return C_Q_title;
    }

    public void setC_q_title(String C_Q_title) {
        this.C_Q_title = C_Q_title;
    }

    public String getC_r_num() {
        return C_R_num;
    }

    public void setC_r_num(String C_R_num) {
        this.C_R_num = C_R_num;
    }

    public String getC_r_title() {
        return C_R_title;
    }

    public void setC_r_title(String C_R_title) {
        this.C_R_title = C_R_title;
    }

    public String getC_r_text() {
        return C_R_text;
    }

    public void setC_r_text(String C_R_text) {
        this.C_R_text = C_R_text;
    }

    public Date getC_r_updat() {
        return C_R_update;
    }

    public void setC_r_updat(Date C_R_update) {
        this.C_R_update = C_R_update;
    }

    public String getC_r_score() {
        return C_R_score;
    }

    public void setC_r_score(String C_R_score) {
        this.C_R_score = C_R_score;
    }

    public String getC_point() {
        return C_point;
    }

    public void setC_point(String C_point) {
        this.C_point = C_point;
    }

    public String getR_num() {
        return r_num;
    }

    public void setR_num(String r_num) {
        this.r_num = r_num;
    }

    public Date getR_date() {
        return r_date;
    }

    public void setR_date(Date r_date) {
        this.r_date = r_date;
    }

    public String getId() {
        return U_ID;
    }

    public void setId(String U_ID) {
        this.U_ID = U_ID;
    }

    public String getPw() {
        return U_pw;
    }

    public void setPw(String U_pw) {
        this.U_pw = U_pw;
    }

    public String getName() {
        return U_name;
    }

    public void setName(String U_name) {
        this.U_name = U_name;
    }

    public Date getBirth() {
        return U_birth;
    }

    public void setBirth(Date U_birth) {
        this.U_birth = U_birth;
    }

    public String getEmail() {
        return U_email;
    }

    public void setEmail(String U_email) {
        this.U_email = U_email;
    }

    public String getPhone() {
        return U_phone;
    }

    public void setPhone(String U_phone) {
        this.U_phone = U_phone;
    }

    public String getGender() {
        return U_gender;
    }

    public void setGender(String U_gender) {
        this.U_gender = U_gender;
    }

    public String getField() {
        return U_field;
    }

    public void setField(String U_field) {
        this.U_field = U_field;
    }

    public Date getJoinDate() {
        return U_joindate;
    }

    public void setJoinDate(Date U_joindate) {
        this.U_joindate = U_joindate;
    }

    public MypageDto(String U_num, String Buy_num, String I_ID, String I_name, String C_ID, String C_name, String C_Q_num, String C_Q_title, String C_R_num, String C_R_title, String C_R_text, Date C_R_update, String C_R_score, String C_point, String r_num, Date r_date, String U_ID, String U_pw, String U_name, Date U_birth, String U_email, String U_phone, String U_gender, String U_field, Date U_joindate) {
        this.U_num = U_num;
        this.Buy_num = Buy_num;
        this.I_ID = I_ID;
        this.I_name = I_name;
        this.C_ID = C_ID;
        this.C_name = C_name;
        this.C_Q_num = C_Q_num;
        this.C_Q_title = C_Q_title;
        this.C_R_num = C_R_num;
        this.C_R_title = C_R_title;
        this.C_R_text = C_R_text;
        this.C_R_update = C_R_update;
        this.C_R_score = C_R_score;
        this.C_point = C_point;
        this.r_num = r_num;
        this.r_date = r_date;
        this.U_ID = U_ID;
        this.U_pw = U_pw;
        this.U_name = U_name;
        this.U_birth = U_birth;
        this.U_email = U_email;
        this.U_phone = U_phone;
        this.U_gender = U_gender;
        this.U_field = U_field;
        this.U_joindate = U_joindate;
    }

    @Override
    public String toString() {
        return "mypage{" +
                "U_num='" + U_num + '\'' +
                ", Buy_num='" + Buy_num + '\'' +
                ", I_ID='" + I_ID + '\'' +
                ", I_name='" + I_name + '\'' +
                ", C_ID='" + C_ID + '\'' +
                ", C_name='" + C_name + '\'' +
                ", C_Q_num='" + C_Q_num + '\'' +
                ", C_Q_title='" + C_Q_title + '\'' +
                ", C_R_num='" + C_R_num + '\'' +
                ", C_R_title='" + C_R_title + '\'' +
                ", C_R_text='" + C_R_text + '\'' +
                ", C_R_update=" + C_R_update +
                ", C_R_score='" + C_R_score + '\'' +
                ", C_point='" + C_point + '\'' +
                ", r_num='" + r_num + '\'' +
                ", r_date=" + r_date +
                ", U_ID='" + U_ID + '\'' +
                ", U_pw='" + U_pw + '\'' +
                ", U_name='" + U_name + '\'' +
                ", U_birth=" + U_birth +
                ", U_email='" + U_email + '\'' +
                ", U_phone='" + U_phone + '\'' +
                ", U_gender='" + U_gender + '\'' +
                ", U_field='" + U_field + '\'' +
                ", U_joindate=" + U_joindate +
                '}';
    }
}
