package com.healingcamp.app.dao;

import com.healingcamp.app.domain.CampDto;
import com.healingcamp.app.domain.CampPageHandler;
import com.healingcamp.app.domain.ReservationDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CampListDao {
    @Autowired
    SqlSession session;

    public List<CampDto> selectCampList(CampPageHandler cph){
        return session.selectList("selectCampList", cph);
    }

    public Integer selectCampListCount(CampPageHandler cph){
        return session.selectOne("selectCampListCount", cph);
    }
    public List<ReservationDto> selectReserveCamp(CampPageHandler cph){
        return session.selectList("selectReserveCamp", cph);
    }
}
