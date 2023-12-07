package com.healingcamp.app.controller;

import com.healingcamp.app.dao.MemberDao;
import com.healingcamp.app.domain.MemberDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

@Controller
public class LoginController {
    private String referer = " ";
    @GetMapping("/login/login")
    public String loginForm(HttpSession session,HttpServletRequest request) {
        referer = request.getHeader("Referer");
        return "login";
    }

    @GetMapping("/login/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:"+referer;
    }

    @Autowired
    MemberDao memberDao;

    @PostMapping("/login/login")
    public String login(String U_id, String U_pw, boolean rememberId, Model m,
                        HttpServletResponse response,
                        HttpServletRequest request,
                        String prevPage) throws Exception {
        if(prevPage==null) {
            prevPage=" ";
        }

        if(!loginChk(U_id, U_pw)) {
            // DB에 해당 회원 정보가 없는경우
            String msg = URLEncoder.encode("일치하는 회원정보가 없습니다.", "utf-8");
            m.addAttribute("msg",msg);
            m.addAttribute("prevPage",prevPage);
            return "redirect:/login/login?msg="+msg;
        }

        Cookie cookie = new Cookie("U_id", U_id);
        if(rememberId) {
            cookie.setMaxAge(60 * 60 * 24);
            cookie.setPath("/");
        }
        else if(!rememberId) {
            cookie.setMaxAge(0);
            cookie.setPath("/");
        }
        response.addCookie(cookie);

        HttpSession session = request.getSession();
        session.setAttribute("U_id", U_id);

        if(session == null){
            //세션이 존재하지 않을 때의 로직
            System.out.println("dsfaas");
        }
        prevPage=prevPage.trim().replace(",", "");
        prevPage=(prevPage==null || ("").equals(prevPage))?"/":prevPage;
        return "redirect:"+referer;
    }

    private boolean loginChk(String U_id, String U_pw) throws Exception {
        MemberDto user = memberDao.selectMemberIdChk(U_id);
        if(user==null) return false;
        return user.getU_pw().equals(U_pw);
    }
}


