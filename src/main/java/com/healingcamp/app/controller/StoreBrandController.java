package com.healingcamp.app.controller;

import com.healingcamp.app.domain.ItemDto;
import com.healingcamp.app.service.StoreBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("store")
public class StoreBrandController {
    @Autowired
    StoreBrandService storeBrandService;

    @GetMapping("/s_brand")
    public String s_brandDefault(Model model){
        List<String> storeBrandName = storeBrandService.storeBrandName();

//        System.out.println(storeBrandName);
        model.addAttribute("storeBrandName", storeBrandName);
        return "store_brand";
    }

//    @GetMapping("/s_brand/b_cate")
//    public ResponseEntity<List<ItemDto>> s_cateList(){
//        try {
//
//            return new ResponseEntity<List<ItemDto>> (, HttpStatus.OK); // 200
//        } catch (Exception e) {
////            throw new RuntimeException(e);
//            e.printStackTrace();
//            return new ResponseEntity<List<ItemDto>> (HttpStatus.BAD_REQUEST); // 400
//        }
//    }
}
