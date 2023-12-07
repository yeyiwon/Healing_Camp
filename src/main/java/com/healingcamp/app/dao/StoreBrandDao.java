package com.healingcamp.app.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StoreBrandDao {
    @Autowired
    SqlSession session;

    public List<String> storeBrandName(){
        return session.selectList("storeBrandName");
    }


}
