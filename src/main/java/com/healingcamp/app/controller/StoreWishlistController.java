package com.healingcamp.app.controller;

import com.healingcamp.app.dao.MemberDao;
import com.healingcamp.app.domain.Insert_cartDto;
import com.healingcamp.app.domain.Insert_itemwishlistDto;
import com.healingcamp.app.domain.Item_wishlistDto;
import com.healingcamp.app.domain.MemberDto;
import com.healingcamp.app.service.ItemService;
import com.healingcamp.app.service.Item_wishlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/store")
public class StoreWishlistController {
    @Autowired
    ItemService itemService;
    @Autowired
    MemberDao memberDao;
    @Autowired
    Item_wishlistService item_wishlistService;

    @PostMapping("/itemwishlist_insert")
    public ResponseEntity<Integer> itemwishlist_insert2(int I_ID, HttpServletRequest request, HttpSession session, Insert_itemwishlistDto insert_itemwishlistDto, Item_wishlistDto item_wishlistDto, Model model) throws Exception {
        if(!loginChk(request)){
            return new ResponseEntity<Integer>(2, HttpStatus.OK);
        }

        String U_id = (String) session.getAttribute("U_id");
        MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
        int U_num = memberDto.getU_num();

        insert_itemwishlistDto.setI_ID_fk(I_ID);  // 찜목록에 상품아이디 추가
        insert_itemwishlistDto.setU_num_fk(U_num); //찜목록에 유저아이디 추가
        item_wishlistDto.setI_ID_fk(I_ID);
        item_wishlistDto.setU_num_fk(U_num);

        if(item_wishlistService.chkItemwishlist(insert_itemwishlistDto).equals("false")){  //찜목록에 해당 상품아이디,유저아이디 있는지 체크 없으면"false" 있으면"true"
            int re1 = item_wishlistService.insertitemwishlist(insert_itemwishlistDto);
            return new ResponseEntity<Integer> (re1, HttpStatus.OK); // 200
        }
        else{
            item_wishlistService.deleteItemwishlist(item_wishlistDto);
            return new ResponseEntity<Integer> (-1, HttpStatus.OK); // 200 //장바구니에 추가실패
        }
    }
    private boolean loginChk(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("U_id")!=null;
    }
}
