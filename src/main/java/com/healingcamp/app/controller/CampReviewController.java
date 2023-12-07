package com.healingcamp.app.controller;
import com.healingcamp.app.dao.Camp_reviewDao;
import com.healingcamp.app.dao.MemberDao;
import com.healingcamp.app.domain.*;
import com.healingcamp.app.service.CampService;
import com.healingcamp.app.service.Camp_reviewService;
import com.healingcamp.app.service.Camp_wishilistService;
import com.healingcamp.app.service.PointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/review")
public class CampReviewController {
    @Autowired
    Camp_reviewService camp_reviewService;
    @Autowired
    MemberDao memberDao;
    @Autowired
    PointService pointService;


    @PostMapping("/write")
    public ResponseEntity<Integer> writeCampReview(HttpSession session, int C_ID, String C_name , String R_date, String C_R_title, String C_R_text, PointDto pointDto) throws Exception {
        String U_id = (String) session.getAttribute("U_id");
        MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
        int U_num = memberDto.getU_num();

        Camp_reviewDto camp_reviewDto = new Camp_reviewDto();

        camp_reviewDto.setU_num_fk(U_num);
        camp_reviewDto.setU_ID_fk(U_id);
        camp_reviewDto.setC_ID_fk(C_ID);
        camp_reviewDto.setC_name(C_name);
        camp_reviewDto.setC_R_title(C_R_title);
        camp_reviewDto.setC_R_text(C_R_text);
        camp_reviewDto.setC_R_pic(null);
        camp_reviewDto.setR_date(R_date);

        List<Camp_reviewDto> reviewlist = camp_reviewService.usercampreviewlist(U_num);

        if(camp_reviewService.chkCampReviewList(camp_reviewDto).equals("false")){
            int re = camp_reviewService.insertcampreview(camp_reviewDto);
            Integer UserYn = pointService.selectUserYn(U_num);
            if(UserYn == 1) {
                pointDto.setU_num_fk(U_num);
                pointDto.setC_point((+pointService.getPointall(U_num))+1000);
                pointService.updatePoint(pointDto);
            }else{
                pointService.insertPoint(U_num);
            }
            return new ResponseEntity<Integer> (re, HttpStatus.OK);
        }
        else {
            return new ResponseEntity<Integer> (-1, HttpStatus.OK);
        }
    }

    @PostMapping("/update")
    public ResponseEntity<List<Camp_reviewDto>> updateCampReview(HttpSession session, int C_ID, String C_R_title, String C_R_text) throws Exception {
        String U_id = (String) session.getAttribute("U_id");
        MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
        int U_num = memberDto.getU_num();

        System.out.println(C_ID);
        System.out.println(C_R_title);
        System.out.println(C_R_text);
//        System.out.println(C_R_score);

        Camp_reviewDto camp_reviewDto = new Camp_reviewDto();

        camp_reviewDto.setU_num_fk(U_num);
        camp_reviewDto.setC_ID_fk(C_ID);
        camp_reviewDto.setC_R_title(C_R_title);
        camp_reviewDto.setC_R_text(C_R_text);
//        camp_reviewDto.setC_R_score(C_R_score);

        camp_reviewService.updateCampReview(camp_reviewDto);

        List<Camp_reviewDto> reviewlist = camp_reviewService.usercampreviewlist(U_num);

        return new ResponseEntity<List<Camp_reviewDto>>(reviewlist, HttpStatus.OK);
    }
    @PostMapping("/deletereview")
    public ResponseEntity<List<Camp_reviewDto>> deleteCampReview(HttpSession session, int C_ID)throws Exception {
        System.out.println("start");
        String U_id = (String) session.getAttribute("U_id");
        MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
        int U_num = memberDto.getU_num();
        System.out.println("aaaaaaa");
        Camp_reviewDto camp_reviewDto = new Camp_reviewDto();
        camp_reviewDto.setU_num_fk(U_num);
        camp_reviewDto.setC_ID_fk(C_ID);


        System.out.println("bbbbbb");


        camp_reviewService.deleteCampReview(camp_reviewDto);

        System.out.println("111111");
        List<Camp_reviewDto> reviewlist = camp_reviewService.usercampreviewlist(U_num);
        System.out.println("222222");
        return new ResponseEntity<List<Camp_reviewDto>>(reviewlist, HttpStatus.OK);
    }
}
