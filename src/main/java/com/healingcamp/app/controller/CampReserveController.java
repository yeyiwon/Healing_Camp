package com.healingcamp.app.controller;

import com.healingcamp.app.dao.MemberDao;
import com.healingcamp.app.dao.UserInfoDao;
import com.healingcamp.app.domain.CampDto;
import com.healingcamp.app.domain.ItemDto;
import com.healingcamp.app.domain.MemberDto;
import com.healingcamp.app.domain.ReservationDto;
import com.healingcamp.app.service.CampService;
import com.healingcamp.app.service.MyReserveService;
import com.healingcamp.app.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/camp")
public class CampReserveController {
    @Autowired
    CampService campService;
    @Autowired
    MemberDao memberDao;
    @Autowired
    UserInfoService userInfoService;
    @Autowired
    MyReserveService myReserveService;

    @GetMapping("/c_reserve")
    public String c_reserve(Integer C_ID, HttpSession session, Model model) throws Exception {
        String U_id = (String) session.getAttribute("U_id");
        MemberDto U_info = userInfoService.selectUserInfo(U_id);
        CampDto C_info = campService.getCDOne(C_ID);

        model.addAttribute("U_info", U_info);
        model.addAttribute("C_info", C_info);
        return "C_reservation";
    }
    @PostMapping("/c_reserve")
    public ResponseEntity<Integer> c_revInsert(HttpSession session, Integer C_ID, String startDate, String endDate, ReservationDto reservationDto) throws Exception {
        String U_id = (String) session.getAttribute("U_id");
        MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
        int U_num = memberDto.getU_num();

        reservationDto.setC_ID(C_ID);
        reservationDto.setU_num(U_num);
        reservationDto.setR_begin_date(startDate);
        reservationDto.setR_end_date(endDate);
        try {
            Integer insertReservation = myReserveService.insertReservation(reservationDto);

            return new ResponseEntity<Integer> (insertReservation, HttpStatus.OK); // 200
        } catch (Exception e) {
//            throw new RuntimeException(e);
            e.printStackTrace();
            return new ResponseEntity<Integer> (HttpStatus.BAD_REQUEST); // 400
        }
    }
}
