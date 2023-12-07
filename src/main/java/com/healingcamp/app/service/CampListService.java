package com.healingcamp.app.service;

import com.healingcamp.app.dao.CampListDao;
import com.healingcamp.app.domain.CampPageHandler;
import com.healingcamp.app.domain.CampDto;
import com.healingcamp.app.domain.ReservationDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CampListService {
    @Autowired
    CampListDao campListDao;

    public List<CampDto> selectCampList(CampPageHandler cph){
        return campListDao.selectCampList(cph);
    }
    public Integer selectCampListCount(CampPageHandler cph){
        return campListDao.selectCampListCount(cph);
    }
    public List<ReservationDto> selectReserveCamp(CampPageHandler cph){
        return campListDao.selectReserveCamp(cph);
    }
}
