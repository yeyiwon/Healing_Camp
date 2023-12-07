package com.healingcamp.app.service;


import com.healingcamp.app.dao.CartDao;
import com.healingcamp.app.dao.Item_wishlistDao;
import com.healingcamp.app.domain.Insert_cartDto;
import com.healingcamp.app.domain.Insert_itemwishlistDto;
import com.healingcamp.app.domain.ItemDto;
import com.healingcamp.app.domain.Item_wishlistDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Item_wishlistService {
    @Autowired
    Item_wishlistDao item_wishlistdao;
    public int insertitemwishlist(Insert_itemwishlistDto insert_itemwishlistDto){
        return item_wishlistdao.insertItemwishlist(insert_itemwishlistDto);
    }

    public String chkItemwishlist(Insert_itemwishlistDto insert_itemwishlistDto){
        return item_wishlistdao.chkItemWishlist(insert_itemwishlistDto);
    }

    public int deleteItemwishlist(Item_wishlistDto item_wishlistDto){
        return item_wishlistdao.deleteItemWishlist(item_wishlistDto);
    }
    public List<ItemDto> getitemwishlist(int U_num){
        return item_wishlistdao.itemwishlist(U_num);
    }
}
