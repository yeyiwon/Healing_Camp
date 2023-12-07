package com.healingcamp.app.controller;

import com.healingcamp.app.dao.MemberDao;
import com.healingcamp.app.domain.ItemDto;
import com.healingcamp.app.domain.MemberDto;
import com.healingcamp.app.domain.StorePageHandler;
import com.healingcamp.app.service.StoreListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/store")
public class StoreListController {
    @Autowired
    StoreListService storeListService;
    @Autowired
    MemberDao memberDao;

    @GetMapping("/s_list")
    public String s_listDefault(StorePageHandler sph, Model model){
        sph.setMenu("I_ID");

        return "store_list";
    }

    @PostMapping("/s_list")
    public ResponseEntity<Map<String, Object>> s_listAjax(@RequestParam Integer cate,
                                                    @RequestParam Integer sort,
                                                    @RequestParam Integer page,
                                                    @RequestParam String keyword,
                                                    @RequestParam char option
                                                    , StorePageHandler sph
                                                    , Model model
                                                    , HttpSession session) throws Exception {
        sph.setCate(cate);
        sph.setSort(sort);
        sph.setPage(page);
        sph.setKeyword(keyword);
        sph.setOption(option);

        Map<String, Object> response = new HashMap<>();
        if(session.getAttribute("U_id") != null){
            String U_id = (String) session.getAttribute("U_id");
            MemberDto memberDto = memberDao.selectMemberIdChk(U_id);
            int U_num = memberDto.getU_num();
            response.put("U_num", U_num);
        }

        try {
            List<ItemDto> list = storeListService.selectItemList(sph);
            Integer selectItemCount = storeListService.selectItemCount(sph);
            response.put("list", list);
            response.put("count", selectItemCount);
            return new ResponseEntity<Map<String, Object>> (response, HttpStatus.OK); // 200
        } catch (Exception e) {
//            throw new RuntimeException(e);
            e.printStackTrace();
            return new ResponseEntity<Map<String, Object>> (HttpStatus.BAD_REQUEST); // 400
        }
    }
}
