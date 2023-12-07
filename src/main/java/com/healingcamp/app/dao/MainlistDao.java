package com.healingcamp.app.dao;

import com.healingcamp.app.domain.CampDto;
import com.healingcamp.app.domain.ItemDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class MainlistDao {

    @Autowired
    SqlSession session;

    private String namespace="com.healingcamp.app.dao.MainlistMapper.";

    public List<CampDto> selectCampAll(Map map) {
    return session.selectList(namespace + "campMainlist", map);
}
    public List<ItemDto> itemMainlist(Map map){
        return session.selectList(namespace+"itemMainlist", map);
    }

}
