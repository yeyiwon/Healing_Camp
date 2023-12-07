package com.healingcamp.app.service;

import com.healingcamp.app.dao.Item_reviewDao;
import com.healingcamp.app.domain.Camp_reviewDto;
import com.healingcamp.app.domain.Insert_itemwishlistDto;
import com.healingcamp.app.domain.Item_reviewDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Item_reviewService {
    @Autowired
    Item_reviewDao item_reviewDao;

    public int insertItemReview(Item_reviewDto item_reviewDto){
        return item_reviewDao.insertItemReview(item_reviewDto);
    }

    public int updateItemReview(Item_reviewDto item_reviewDto){
        return item_reviewDao.updateItemReview(item_reviewDto);
    }

    public int deleteItemReview(Item_reviewDto item_reviewDto){
        return  item_reviewDao.deleteItemReview(item_reviewDto);
    }

    public List<Item_reviewDto> useritemreviewlist(int U_num){
        return item_reviewDao.useritemreviewlist(U_num);
    }
}
