package com.healingcamp.app.controller;

import com.healingcamp.app.dao.MemberDao;
import com.healingcamp.app.dao.PointDao;
import com.healingcamp.app.domain.MemberDto;
//import com.healingcamp.app.service.MemberService;
import com.healingcamp.app.service.PointService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.swing.plaf.IconUIResource;
import java.net.URLEncoder;

@Controller
@RequiredArgsConstructor
public class JoinController {//    @Autowired
//    MemberService MemberService;

    @Autowired
    MemberDao memberDao;
    @Autowired
    PointService pointService;

    @GetMapping("/join")
    public String join(){
        return "join_agreement";
    }

    @GetMapping("/join/j_membership/save")
    public String saveForm(){
        return "join_membership";
    }

    @PostMapping("/join/j_membership/save")
    public String save(@ModelAttribute MemberDto user, Model m, String U_id) throws Exception{
        if (!isVaild(user)) {
            String msg = "사용중인 아이디 입니다";
            System.out.println(msg);
            msg = URLEncoder.encode(msg, "utf-8");
            m.addAttribute("msg", msg);
            return "redirect:/join/j_membership/save";
        }
        else {
            memberDao.insertMember(user);
            MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
            int U_num = memberDto.getU_num();

            Integer selectUserYn = pointService.selectUserYn(U_num);
            System.out.println(selectUserYn);
            if(selectUserYn == 0){
                Integer insertPoint = pointService.insertPoint(U_num);
                System.out.println(insertPoint);
            }
        return "join_completed";
        }
    }
    private boolean isVaild(MemberDto user) throws Exception {
        MemberDto user2 = memberDao.selectMemberIdChk(user.getU_id());
        if(user2!=null) return false;

        return true;
    }
}
