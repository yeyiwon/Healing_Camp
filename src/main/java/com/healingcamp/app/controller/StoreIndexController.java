package com.healingcamp.app.controller;

import com.healingcamp.app.dao.MemberDao;
import com.healingcamp.app.domain.Insert_itemwishlistDto;
import com.healingcamp.app.domain.ItemDto;
import com.healingcamp.app.domain.Item_wishlistDto;
import com.healingcamp.app.domain.MemberDto;
import com.healingcamp.app.service.Item_wishlistService;
import com.healingcamp.app.service.StoreIndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/store")
public class StoreIndexController {
    @Autowired
    StoreIndexService storeIndexService;
    @Autowired
    Item_wishlistService item_wishlistService;
    @Autowired
    MemberDao memberDao;

    @GetMapping("/s_index")
    public String s_index(HttpSession session, Model model, Insert_itemwishlistDto insert_itemwishlistDto) throws Exception {
        Map<String, Integer> map = new HashMap<>();
        if(session.getAttribute("U_id") != null){
            String U_id = (String) session.getAttribute("U_id");
            MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
            int U_num = memberDto.getU_num();
            map.put("U_num", U_num);
        }

        Integer cnt = 5;
        map.put("cnt", cnt);

        List<ItemDto> indexBest = storeIndexService.selectBestItem(map);
        List<ItemDto> indexNew = storeIndexService.selectNewItem(map);
        cnt = 8;
        map.put("cnt", cnt);
        List<ItemDto> indexMDPick = storeIndexService.selectMDItem(map);

        model.addAttribute("indexBest", indexBest);
        model.addAttribute("indexMDPick", indexMDPick);
        model.addAttribute("indexNew", indexNew);

        return "store_index";
    }
}

