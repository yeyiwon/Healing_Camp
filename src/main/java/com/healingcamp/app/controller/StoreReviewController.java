package com.healingcamp.app.controller;

import com.healingcamp.app.dao.Item_reviewDao;
import com.healingcamp.app.dao.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/store")
public class StoreReviewController {
    @Autowired
    MemberDao memberDao;
    @Autowired
    Item_reviewDao item_reviewDao;


//    @GetMapping("/insert_itemreview")
//    public String insert_itemreview()
}
