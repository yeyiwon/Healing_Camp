package com.healingcamp.app.service;


import com.healingcamp.app.dao.ItemDao;
import com.healingcamp.app.domain.CartDto;
import com.healingcamp.app.domain.ItemDto;
import com.healingcamp.app.domain.Item_reviewDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemService {
    @Autowired
    ItemDao itemdao;
    public ItemDto selectone(int I_ID){
        return itemdao.selectItemOne(I_ID);
    }

    public List<ItemDto> getlist(int U_num){
        return itemdao.itemlist(U_num);
    }

    public List<Item_reviewDto> getitemreviewlist(int I_ID){
        return itemdao.itemreviewlist(I_ID);
    }
}
