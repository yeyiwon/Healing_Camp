package com.healingcamp.app.dao;

import com.healingcamp.app.domain.PointDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PointDao {
    @Autowired
    SqlSession session;

    String namespace="com.healingcamp.app.dao.pointMapper.";;
    public Integer updatePoint(PointDto pointDto){
        System.out.println(pointDto);
        System.out.println(session.update(namespace+"updatePoints", pointDto));
        System.out.println("===");
        return session.update(namespace+"updatePoints", pointDto);
    }

    public Integer selectUserYn(Integer U_num){
        return session.selectOne(namespace+"selectUserYn", U_num);
    }

    public Integer insertPoint(Integer U_num){
        return session.insert(namespace+"insertPoint", U_num);
    }
    public Integer selectPointAll(int U_num_fk) {
        System.out.println("U_num_fk = " + U_num_fk);
        return session.selectOne(namespace + "Pointlist", U_num_fk);
    }
}
