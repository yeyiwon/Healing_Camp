package com.healingcamp.app.dao;

import com.healingcamp.app.domain.ItemDto;
import com.healingcamp.app.domain.StorePageHandler;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public class StoreListDao {
    @Autowired
    SqlSession session;

    public List<ItemDto> selectItemList(StorePageHandler sph){
        return session.selectList("selectItemList", sph);
    }
    public Integer selectItemCount (StorePageHandler sph){
        return session.selectOne("selectItemCount", sph);
    }
}
