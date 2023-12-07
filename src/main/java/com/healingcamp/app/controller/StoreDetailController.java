package com.healingcamp.app.controller;


import com.healingcamp.app.dao.MemberDao;
import com.healingcamp.app.domain.*;
import com.healingcamp.app.service.CartService;
import com.healingcamp.app.service.ItemService;
import com.healingcamp.app.service.Item_wishlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/store")
public class StoreDetailController {
    @Autowired
    ItemService itemService;
    @Autowired
    Item_wishlistService item_wishlistService;
    @Autowired
    MemberDao memberDao;


    @GetMapping("/s_detail")
    public String s_detail(int I_ID, Insert_itemwishlistDto insert_itemwishlistDto, HttpSession session, Model model) throws Exception {
        int chkwish = 0;

        ItemDto itemDto = itemService.selectone(I_ID);
        List<Item_reviewDto> itemreviewlist = itemService.getitemreviewlist(I_ID);

        model.addAttribute("itemDto" ,itemDto);
        model.addAttribute("itemreviewlist", itemreviewlist);

        if(session.getAttribute("U_id") != null){
            String U_id = (String) session.getAttribute("U_id");
            MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
            int U_num = memberDto.getU_num();

            insert_itemwishlistDto.setI_ID_fk(I_ID);
            insert_itemwishlistDto.setU_num_fk(U_num);

            if(item_wishlistService.chkItemwishlist(insert_itemwishlistDto).equals("false")){
                chkwish = 1;
            }
            else {
                chkwish = 2;
            }
            model.addAttribute("chkwish", chkwish);
            return "store_detail";
        }
        else {
            chkwish = 1;
            model.addAttribute("chkwish", chkwish);
            return "store_detail";
        }
    }

    private boolean loginChk(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("U_id")!=null;
    }

}
