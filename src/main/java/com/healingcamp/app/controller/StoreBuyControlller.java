package com.healingcamp.app.controller;

import com.healingcamp.app.dao.MemberDao;
import com.healingcamp.app.domain.*;
import com.healingcamp.app.service.BuyService;
import com.healingcamp.app.service.CartService;
import com.healingcamp.app.service.ItemService;
import com.healingcamp.app.service.PointService;
import com.mysql.cj.x.protobuf.Mysqlx;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/store")
public class StoreBuyControlller {

    @Autowired
    BuyService buyService;
    @Autowired
    MemberDao memberDao;
    @Autowired
    CartService cartService;
    @Autowired
    PointService pointService;

    @GetMapping("/s_buy")
    public String s_buyGet(int[] I_ID, Model model, HttpSession session, CartDto cartDto) throws Exception {
        String U_id = (String)session.getAttribute("U_id");
        MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
        int U_num = memberDto.getU_num();

        cartDto.setU_num_fk(U_num);

        List<ItemDto> selectItemInCart = new ArrayList<>();
        Integer sum = 0;

        for(int i=0; i< I_ID.length; i++){
            cartDto.setI_ID_fk(I_ID[i]);
            selectItemInCart.add(buyService.selectItemInCart(cartDto));

            sum += (selectItemInCart.get(i).getPrice() * selectItemInCart.get(i).getItem_cart_cnt());
        }
        Integer currPoint = buyService.selectUserPoint(U_num);

        model.addAttribute("selectItemInCart", selectItemInCart);
        model.addAttribute("currPoint", currPoint);
        model.addAttribute("sum", sum);
        return "store_payment";
    }

    @PostMapping("/s_buy")
    public ResponseEntity<Integer> s_buyUpdate(HttpSession session , PointDto pointDto, CartDto cartDto , @RequestParam Integer[] chklist, @RequestParam Integer updatePoint) throws Exception {
//
        String U_id = (String)session.getAttribute("U_id");
        MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
        int U_num = memberDto.getU_num();
        cartDto.setU_num_fk(U_num);
        pointDto.setU_num_fk(U_num);

        for(int i=0; i< chklist.length; i++){
            cartDto.setI_ID_fk(chklist[i]);
            Integer deleteResult =cartService.deleteCartOne(cartDto);
        }

        Integer currPoint = buyService.selectUserPoint(U_num);
        currPoint = currPoint - (+updatePoint);
        pointDto.setC_point(currPoint);
        Integer updateResult = pointService.updatePoint(pointDto);
        try {
            return new ResponseEntity<Integer> (HttpStatus.OK); // 200
        } catch (Exception e) {
//            throw new RuntimeException(e);
            e.printStackTrace();
            return new ResponseEntity<Integer> (HttpStatus.BAD_REQUEST); // 400
        }
    }

}