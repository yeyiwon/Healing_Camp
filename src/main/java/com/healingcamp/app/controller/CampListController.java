package com.healingcamp.app.controller;

import com.healingcamp.app.dao.MemberDao;
import com.healingcamp.app.domain.*;
//import com.healingcamp.app.domain.CampPageHandler;
import com.healingcamp.app.service.CampListService;
import com.healingcamp.app.service.CampService;
//import com.healingcamp.app.service.Camp_reviewService;
import com.healingcamp.app.service.Camp_reviewService;
import com.healingcamp.app.service.Camp_wishilistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.*;

@Controller
@RequestMapping("/camp")
public class CampListController {

    @Autowired
    CampService campservice;
    @Autowired
    MemberDao memberDao;
    @Autowired
    CampListService campListService;
    @Autowired
    Camp_wishilistService camp_wishilistService;
    @Autowired
    Camp_reviewService camp_reviewService;

    @GetMapping("/c_list")
    public String c_list(
                        Model model
                        , HttpSession session){
        return "camp_list";
    }

    @PostMapping("/c_list")
    public ResponseEntity<Map<String, Object>> c_listAjax( String keyword
                                                    , String type
                                                    , Integer page
                                                    , Integer sort
                                                    , String startDate
                                                    , String endDate
                                                    , CampPageHandler cph){

        if(page == null){
            cph.setPage(0);
        }else{
            cph.setPage(page);
        }
        cph.setKeyword(keyword);
        cph.setType(type);
        cph.setSort(sort);
        cph.setStartDate(startDate);
        cph.setEndDate(endDate);

        Map<String, Object> response = new HashMap<>();
        try {
            List<CampDto> list = campListService.selectCampList(cph);

            Integer selectCampListCount = campListService.selectCampListCount(cph);

            response.put("c_List", list);
            response.put("c_count", selectCampListCount);
            return new ResponseEntity<Map<String, Object>> (response, HttpStatus.OK); // 200
        } catch (Exception e) {
//            throw new RuntimeException(e);
            e.printStackTrace();
            return new ResponseEntity<Map<String, Object>> (HttpStatus.BAD_REQUEST); // 400
        }
    }

    @GetMapping("/c_list/{C_ID}")
    public String c_detail2(@PathVariable int C_ID, Camp_wishlistDto camp_wishlistDto, HttpSession session, Model model) throws Exception {
        //===========================================================
        CampDto c_detail = campservice.getCDOne(C_ID);
        double rand = Math.random();
        int randomimg = (int)(rand * 140 + 1);

        model.addAttribute("campdetail", c_detail);
        session.setAttribute("randomimg", randomimg);


        List<Camp_reviewDto> camp_reviewDto = null;

        camp_reviewDto = camp_reviewService.selectCampReview(C_ID);

        model.addAttribute("campRv_list", camp_reviewDto);
//===========================================================
        int chkwish = 0;
        List<Camp_reviewDto> campreviewlist = camp_reviewService.getcampreviewlist(C_ID);
        CampDto campDto = campservice.selectone(C_ID);
        model.addAttribute("campreviewlist", campreviewlist);
        model.addAttribute("campDto" ,campDto);

        if(session.getAttribute("U_id") != null){
            String U_id = (String) session.getAttribute("U_id");
            MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
            int U_num = memberDto.getU_num();

            camp_wishlistDto.setC_ID_fk(C_ID);
            camp_wishlistDto.setU_num_fk(U_num);

            if(camp_wishilistService.chkCampwishlist(camp_wishlistDto).equals("false")){
                chkwish = 1;
            }
            else {
                chkwish = 2;
            }
            model.addAttribute("chkwish", chkwish);
            return "camp_detail";
        }
        else {
            chkwish = 1;
            model.addAttribute("chkwish", chkwish);
            return "camp_detail";
        }
    }


    @PostMapping("/campwishlist_insert")
    public ResponseEntity<Integer> campwishlist_insert2(int C_ID, HttpServletRequest request, HttpSession session, Camp_wishlistDto camp_wishlistDto, Model model) throws Exception {
        if(!loginChk(request)){
            return new ResponseEntity<Integer>(2, HttpStatus.OK);
        }

        String U_id = (String) session.getAttribute("U_id");
        MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
        int U_num = memberDto.getU_num();

        camp_wishlistDto.setC_ID_fk(C_ID);
        camp_wishlistDto.setU_num_fk(U_num);

        if(camp_wishilistService.chkCampwishlist(camp_wishlistDto).equals("false")){  //찜목록에 해당 상품아이디,유저아이디 있는지 체크 없으면"false" 있으면"true"
            int re1 = camp_wishilistService.insertcampwishlist(camp_wishlistDto);
            return new ResponseEntity<Integer> (re1, HttpStatus.OK); // 200
        }
        else{
            camp_wishilistService.deleteCampwishlist(camp_wishlistDto);
            return new ResponseEntity<Integer> (-1, HttpStatus.OK); // 200 //장바구니에 추가실패
        }
    }

    private boolean loginChk(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("U_id")!=null;
    }
}


