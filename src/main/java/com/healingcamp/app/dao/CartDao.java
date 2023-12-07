package com.healingcamp.app.dao;

import com.healingcamp.app.domain.CartDto;
import com.healingcamp.app.domain.Insert_cartDto;
import com.healingcamp.app.domain.ItemDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CartDao {
    @Autowired
    SqlSession session;

    String namespace="com.healingcamp.app.dao.cartMapper.";

    public int insertCartlist(Insert_cartDto insert_cartDto){
        return session.insert(namespace+"insertCartlist",insert_cartDto);
    }
    public String chkCartlist(Insert_cartDto insert_cartDto){
        return session.selectOne(namespace+"chkCartlist",insert_cartDto);
    }

    public List<CartDto>  cartlist(int U_num){
        return session.selectList(namespace+"cartlist", U_num);
    }
    public List<ItemDto>  itemlist(int U_num){
        return session.selectList(namespace+"itemlist", U_num);
    }

    public int updateCartItemCnt(CartDto cartDto){
        return session.update(namespace+"updateCartItemCnt", cartDto);
    }

    public int deleteCartOne(CartDto cartDto){
        return session.delete(namespace+"deleteCartOne", cartDto);
    }
    public int deleteCartAll(CartDto cartDto){
        return session.delete(namespace+"deleteCartAll", cartDto);
    }

    public CartDto selectItemInCart(CartDto cartDto){
        return session.selectOne("selectItemInCart", cartDto);
    }
}
