package com.healingcamp.app.domain;

import lombok.*;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MemberDto {
    private int U_num;
    private String U_id;
    private String U_pw;
    private String U_name;
    private String U_phone;
    private String U_birth;
    private String U_gender;
    private String U_email;
    private String U_field;
    private LocalDate U_joinDate = LocalDate.now();
}