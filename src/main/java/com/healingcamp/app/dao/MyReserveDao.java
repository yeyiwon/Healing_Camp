package com.healingcamp.app.dao;

import com.healingcamp.app.domain.CampDto;
import com.healingcamp.app.domain.ReservationDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MyReserveDao {
    @Autowired
    SqlSession session;

    String namespace = "com.healingcamp.app.dao.mypageMapper.";
    String namespace2 = "com.healingcamp.app.dao.reservationMapper.";

    public List<CampDto> selectCampReserve(Integer U_num) {
        return session.selectList("selectCampReserve", U_num);
    }

    public Integer deleteCampOne(ReservationDto reservationDto) {
        return session.delete(namespace + "deleteCampOne", reservationDto);
    }

    public Integer insertReservation(ReservationDto reservationDto){
        return session.insert(namespace2+"insertReservation", reservationDto);
    }
}
