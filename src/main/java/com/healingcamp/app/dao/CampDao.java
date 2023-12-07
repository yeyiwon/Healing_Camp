package com.healingcamp.app.dao;

import com.healingcamp.app.domain.CampDto;
//import com.healingcamp.app.domain.CampPageHandler;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CampDao {

    @Autowired
    SqlSession session;

    String namespace = "com.healingcamp.app.dao.campMapper.";

    public List<CampDto> selectCampAll(Map map) {
        return session.selectList(namespace + "camplist", map);
    }
    public int getCampCount(Map map) {
        return session.selectOne(namespace+"getCampCount",map);
    }

    public CampDto selectCampOne(int C_ID){
        return session.selectOne(namespace+"selectCampOne",C_ID);
    }
    public CampDto getCDOne(int C_ID) {
        return session.selectOne(namespace + "campdetail", C_ID);
    }

}



