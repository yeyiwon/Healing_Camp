package com.healingcamp.app.dao;

import com.healingcamp.app.domain.Camp_reviewDto;
import com.healingcamp.app.domain.Insert_itemwishlistDto;
import com.healingcamp.app.domain.Item_reviewDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class Item_reviewDao {
    @Autowired
    SqlSession session;

    String namespace="com.healingcamp.app.dao.item_reviewMapper.";

    public int insertItemReview(Item_reviewDto item_reviewDto){
        return session.insert(namespace+"insertItemReview", item_reviewDto);
    }

    public int deleteItemReview(Item_reviewDto item_reviewDto){
        return session.delete(namespace+"deleteItemReview", item_reviewDto);
    }

    public int updateItemReview(Item_reviewDto item_reviewDto){
        return session.update(namespace+"updateItemReview", item_reviewDto);
    }

    public List<Item_reviewDto> useritemreviewlist(int U_num){
        return session.selectList(namespace+"useritemreviewlist", U_num);
    }
}
