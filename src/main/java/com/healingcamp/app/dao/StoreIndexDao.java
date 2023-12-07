package com.healingcamp.app.dao;

import com.healingcamp.app.domain.ItemDto;
import com.healingcamp.app.domain.Item_wishlistDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class StoreIndexDao {
    @Autowired
    SqlSession session;
    String namespace = "com.healingcamp.app.dao.storeIndexMapper.";

    public List<ItemDto> selectBestItem (Map<String, Integer> map){
        return session.selectList("selectBestItem", map);
    }

    public List<ItemDto> selectMDItem (Map<String, Integer> map){
        return session.selectList("selectMDItem", map);
    }

    public List<ItemDto> selectNewItem (Map<String, Integer> map){
        return session.selectList("selectNewItem", map);
    }
    public List<Integer> selectItemInIndex(){
        return session.selectList("selectItemInIndex");
    }
}
