package com.healingcamp.app.dao;

import com.healingcamp.app.domain.ItemDto;
import com.healingcamp.app.domain.Item_reviewDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ItemDao {
    @Autowired
    SqlSession session;

    String namespace="com.healingcamp.app.dao.itemMapper.";

    public ItemDto selectItemOne(int I_ID){
        return session.selectOne(namespace+"selectItemOne",I_ID);
    }

    public List<ItemDto> itemlist(int U_num){
        return session.selectList(namespace+"itemlist", U_num);
    }

    public List<Item_reviewDto> itemreviewlist(int I_ID){
        return session.selectList(namespace+"itemreviewlist", I_ID);
    }
}
