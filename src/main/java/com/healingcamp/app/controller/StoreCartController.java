package com.healingcamp.app.controller;

import com.healingcamp.app.dao.MemberDao;
import com.healingcamp.app.domain.CartDto;
import com.healingcamp.app.domain.Insert_cartDto;
import com.healingcamp.app.domain.ItemDto;
import com.healingcamp.app.domain.MemberDto;
import com.healingcamp.app.service.CartService;
import com.healingcamp.app.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Array;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/store")
public class StoreCartController {
    @Autowired
    ItemService itemService;
    @Autowired
    MemberDao memberDao;
    @Autowired
    CartService cartService;

    @GetMapping("/s_cart")
    public String s_cart(HttpSession session, HttpServletRequest request, Model model) throws Exception {
        if(!loginChk(request)) {
            return "login";
        }

        String U_id = (String) session.getAttribute("U_id");
        MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
        int U_num = memberDto.getU_num();

        List<ItemDto> itemlist = itemService.getlist(U_num);
        model.addAttribute("itemlist" ,itemlist);
        return "store_cart";
    }

    @PostMapping("/s_cart_update")
    public ResponseEntity<Integer> cart_cnt_update(HttpSession session, Integer I_ID,Integer Item_cart_cnt, CartDto cartDto) throws Exception {

        String U_id = (String) session.getAttribute("U_id");
        MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
        int U_num = memberDto.getU_num();

        cartDto.setI_ID_fk(I_ID);
        cartDto.setU_num_fk(U_num);
        cartDto.setItem_cart_cnt(Item_cart_cnt);

        cartService.updateCartItemCnt(cartDto);

        return new ResponseEntity<Integer> (cartDto.getItem_cart_cnt(), HttpStatus.OK);
    }

    @PostMapping("/s_cart_delete_one")
    public ResponseEntity<List<ItemDto>> cart_delete_one(HttpSession session, Integer I_ID, CartDto cartDto) throws Exception{
        String U_id = (String) session.getAttribute("U_id");
        MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
        int U_num = memberDto.getU_num();

        cartDto.setI_ID_fk(I_ID);
        cartDto.setU_num_fk(U_num);
        cartService.deleteCartOne(cartDto);

        List<ItemDto> itemlist = itemService.getlist(U_num);
        return new ResponseEntity<List<ItemDto>> (itemlist, HttpStatus.OK);
    }
    @PostMapping("/s_cart_delete_all")
    public ResponseEntity<Integer> cart_delete_all(HttpSession session, CartDto cartDto) throws Exception{
        String U_id = (String) session.getAttribute("U_id");
        MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
        int U_num = memberDto.getU_num();

        cartDto.setU_num_fk(U_num);
        cartService.deleteCartAll(cartDto);

        return new ResponseEntity<Integer> (1, HttpStatus.OK);
    }
    @PostMapping("/s_cart_delete_chk_list")
    public ResponseEntity<List<ItemDto>> cart_delete_chk_list(HttpSession session, int[] chklist, CartDto cartDto) throws Exception{
        String U_id = (String) session.getAttribute("U_id");
        MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
        int U_num = memberDto.getU_num();

        cartDto.setU_num_fk(U_num);
        for(int i=0; i<chklist.length; i++) {
            cartDto.setI_ID_fk(chklist[i]);

            cartService.deleteCartOne(cartDto);
        }

        List<ItemDto> itemlist = itemService.getlist(U_num);
        return new ResponseEntity<List<ItemDto>> (itemlist, HttpStatus.OK);
    }

    @PostMapping
    public ResponseEntity<List<ItemDto>> list(HttpSession session) throws Exception {
        String U_id = (String) session.getAttribute("U_id");
        MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
        int U_num = memberDto.getU_num();

        List<ItemDto> itemlist = itemService.getlist(U_num);
        return new ResponseEntity<List<ItemDto>>(itemlist, HttpStatus.OK);
    }

//    @GetMapping("/cart_insert")
//    public String cart_insert(int I_ID ,HttpSession session,HttpServletRequest request, Insert_cartDto insert_cartDto) throws Exception {
//        String U_id = (String) session.getAttribute("U_id");
//        MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
//        int U_num = memberDto.getU_num();
//
//        insert_cartDto.setI_ID_fk(I_ID);
//        insert_cartDto.setU_num_fk(U_num);
//
//        if(cartService.chkCartlist(insert_cartDto).equals("false")){
//            cartService.insertcartlist(insert_cartDto);
//
//            return "redirect:/store/s_cart?U_num="+U_num;
//        }
//        else {
//            return "redirect:/store/s_cart?U_num=2";
//        }
//    }

    @PostMapping("/cart_insert")
    public ResponseEntity<Integer> cart_insert2(Integer I_ID, Integer Item_cart_cnt, HttpServletRequest request, HttpSession session, Insert_cartDto insert_cartDto, Model model) throws Exception {
        if(session.getAttribute("U_id") != null){
            String U_id = (String) session.getAttribute("U_id");
            MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
            int U_num = memberDto.getU_num();

            insert_cartDto.setI_ID_fk(I_ID);  //장바구니 테이블에 상품아이디 추가
            insert_cartDto.setU_num_fk(U_num); //장바구니 테이블에 유저아이디 추가
            if(cartService.chkCartlist(insert_cartDto).equals("false")){  //장바구니에 해당 상품아이디,유저아이디 있는지 체크 없으면"false" 있으면"true"
                int re = cartService.insertcartlist(insert_cartDto); //체크해서"false"면(상품없으면) 장바구니에 해당상품 추가
                return new ResponseEntity<Integer> (re, HttpStatus.OK); // 200
            }
            else{
                return new ResponseEntity<Integer> (-1, HttpStatus.OK); // 200 //장바구니에 추가실패
            }
        }
        else {
            return new ResponseEntity<Integer>(2, HttpStatus.OK);
        }
    }

    private boolean loginChk(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("U_id")!=null;
    }

}