package com.healingcamp.app.dao;

import com.healingcamp.app.domain.CartDto;
import com.healingcamp.app.domain.ItemDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BuyDao {
    @Autowired
    SqlSession session;

    public ItemDto selectItemInCart(CartDto cartDto){
        return session.selectOne("selectItemInCart", cartDto);
    }

    public Integer selectUserPoint(Integer U_num){
        return session.selectOne("selectUserPoint", U_num);
    }
}
