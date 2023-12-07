package com.healingcamp.app.dao;

import com.healingcamp.app.domain.Insert_cartDto;
import com.healingcamp.app.domain.Insert_itemwishlistDto;
import com.healingcamp.app.domain.ItemDto;
import com.healingcamp.app.domain.Item_wishlistDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class Item_wishlistDao {
    @Autowired
    SqlSession session;

    String namespace="com.healingcamp.app.dao.item_wishlistMapper.";
    public int insertItemwishlist(Insert_itemwishlistDto insert_itemwishlistDto){
        return session.insert(namespace+"insertItemWishlist", insert_itemwishlistDto);
    }
    public String chkItemWishlist(Insert_itemwishlistDto insert_itemwishlistDto){
        return session.selectOne(namespace+"chkItemWishlist",insert_itemwishlistDto);
    }
    public int deleteItemWishlist(Item_wishlistDto item_wishlistDto){
        return session.delete(namespace+"deleteItemWishlist", item_wishlistDto);
    }
    public List<ItemDto> itemwishlist(int U_num){
        return session.selectList(namespace+"itemwishlist", U_num);
    }
}
