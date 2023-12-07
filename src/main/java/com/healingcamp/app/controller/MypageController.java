package com.healingcamp.app.controller;

import com.healingcamp.app.dao.MemberDao;
import com.healingcamp.app.dao.MyReserveDao;
import com.healingcamp.app.domain.*;
import com.healingcamp.app.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/mypage")
public class MypageController {
    @Autowired
    UserInfoService userInfoService;
    @Autowired
    MemberDao memberDao;
    @Autowired
    MyReserveService myReserveService;
    @Autowired
    PointService pointService;
    @Autowired
    Camp_reviewService camp_reviewService;
    @Autowired
    Camp_wishilistService camp_wishilistService;
    @Autowired
    Item_wishlistService item_wishlistService;
    @Autowired
    Item_reviewService item_reviewService;


    @GetMapping("/mypage")
    public String goToMypage(HttpServletRequest request, HttpSession session, Model model, PointDto pointDto) throws Exception {
        if(!loginChk(request)) {
            return "login";
        }
        else {
            String U_id = (String) session.getAttribute("U_id");
            MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
            int U_num = memberDto.getU_num();

            List<CampDto> campwishlist = camp_wishilistService.getcampwishlist(U_num);
            List<ItemDto> itemwishlist = item_wishlistService.getitemwishlist(U_num);
            List<Camp_reviewDto> usercampreviewlist = camp_reviewService.usercampreviewlist(U_num);
            List<Item_reviewDto> useritemreviewlist = item_reviewService.useritemreviewlist(U_num);
            pointDto.setU_num_fk(U_num);
            Integer getPointall = pointService.getPointall(U_num);
            MemberDto selectUserInfo = userInfoService.selectUserInfo(U_id);
            List<CampDto> selectCampReserve = myReserveService.selectCampReserve(U_num);

            model.addAttribute("campwishlist", campwishlist);
            model.addAttribute("itemwishlist", itemwishlist);
            model.addAttribute("usercampreviewlist", usercampreviewlist);
            model.addAttribute("useritemreviewlist", useritemreviewlist);
            model.addAttribute("pointList", getPointall);
            model.addAttribute("selectUserInfo", selectUserInfo);
            model.addAttribute("selectCampReserve", selectCampReserve);
            return "my_page";
        }
    }


    @GetMapping("/userInfoModify")
    public String m_userInfoModify(@RequestParam String U_id, HttpSession session, Model model, MemberDto memberDto){

        MemberDto selectUserInfo = userInfoService.selectUserInfo(U_id);

        model.addAttribute("selectUserInfo", selectUserInfo);
        return "mypageUserInfoModify";
    }

    @PostMapping("/mypage")
    public String m_userModifySave(String U_id, String U_pw, String U_email, String U_phone, Model model, MemberDto memberDto) {

        memberDto.setU_id(U_id);
        memberDto.setU_pw(U_pw);
        memberDto.setU_email(U_email);
        memberDto.setU_phone(U_phone);
        System.out.println(U_phone);

        int result = userInfoService.updateUserInfo(memberDto);

        MemberDto selectUserInfo = userInfoService.selectUserInfo(U_id);
        model.addAttribute("selectUserInfo", selectUserInfo);
        return "my_page";
    }

    @PostMapping("/c_rev_del")
    public ResponseEntity<List<CampDto>> c_rev_del(Integer C_ID, Integer U_num, String startDate, String endDate, ReservationDto reservationDto){
        try {
            reservationDto.setC_ID(C_ID);
            reservationDto.setU_num(U_num);
            reservationDto.setR_begin_date(startDate);
            reservationDto.setR_end_date(endDate);

            Integer deleteCampOne = myReserveService.deleteCampOne(reservationDto);

            List<CampDto> selectCampReserve = myReserveService.selectCampReserve(U_num);

            return new ResponseEntity<List<CampDto>> (selectCampReserve, HttpStatus.OK); // 200
        } catch (Exception e) {
//            throw new RuntimeException(e);
            e.printStackTrace();
            return new ResponseEntity<List<CampDto>> (HttpStatus.BAD_REQUEST); // 400
        }
    }
    @PostMapping("/delete_campwishlist")
    public ResponseEntity<List<CampDto>> delete_campwishlist(HttpSession session, int C_ID, Camp_wishlistDto camp_wishlistDto, Model model) throws Exception {
        String U_id = (String) session.getAttribute("U_id");
        MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
        int U_num = memberDto.getU_num();

        camp_wishlistDto.setC_ID_fk(C_ID);
        camp_wishlistDto.setU_num_fk(U_num);
        camp_wishilistService.deleteCampwishlist(camp_wishlistDto);
        List<CampDto> campwishlist = camp_wishilistService.getcampwishlist(U_num);

        return new ResponseEntity<List<CampDto>> (campwishlist, HttpStatus.OK);
    }

    @PostMapping("/delete_itemwishlist")
    public ResponseEntity<List<ItemDto>> delete_campwishlist(HttpSession session, int I_ID, Item_wishlistDto item_wishlistDto, Model model) throws Exception {
        String U_id = (String) session.getAttribute("U_id");
        MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
        int U_num = memberDto.getU_num();

        item_wishlistDto.setI_ID_fk(I_ID);
        item_wishlistDto.setU_num_fk(U_num);
        item_wishlistService.deleteItemwishlist(item_wishlistDto);
        List<ItemDto> itemwishlist = item_wishlistService.getitemwishlist(U_num);

        return new ResponseEntity<List<ItemDto>> (itemwishlist, HttpStatus.OK);
    }


    private boolean loginChk(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("U_id")!=null;
    }
}

