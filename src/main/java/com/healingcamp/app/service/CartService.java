package com.healingcamp.app.service;

import com.healingcamp.app.dao.CartDao;
import com.healingcamp.app.dao.ItemDao;
import com.healingcamp.app.domain.CartDto;
import com.healingcamp.app.domain.Insert_cartDto;
import com.healingcamp.app.domain.ItemDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {
    @Autowired
    CartDao cartdao;
    public int insertcartlist(Insert_cartDto insert_cartDto){
        return cartdao.insertCartlist(insert_cartDto);
    }

    public String chkCartlist(Insert_cartDto insert_cartDto){
        return cartdao.chkCartlist(insert_cartDto);
    }

    public List<CartDto> getlist(int U_num){
        return cartdao.cartlist(U_num);
    }

    public int updateCartItemCnt(CartDto cartDto){
        return cartdao.updateCartItemCnt(cartDto);
    }

    public int deleteCartOne(CartDto cartDto){
        return  cartdao.deleteCartOne(cartDto);
    }

    public int deleteCartAll(CartDto cartDto){
        return cartdao.deleteCartAll(cartDto);
    }

}
