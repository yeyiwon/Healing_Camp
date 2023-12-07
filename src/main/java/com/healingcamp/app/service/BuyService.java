package com.healingcamp.app.service;

import com.healingcamp.app.dao.BuyDao;
import com.healingcamp.app.domain.CartDto;
import com.healingcamp.app.domain.ItemDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BuyService {
    @Autowired
    BuyDao buyDao;

    public ItemDto selectItemInCart(CartDto cartDto){
        return buyDao.selectItemInCart(cartDto);
    }
    public Integer selectUserPoint(Integer U_num){
        return buyDao.selectUserPoint(U_num);
    }
}
