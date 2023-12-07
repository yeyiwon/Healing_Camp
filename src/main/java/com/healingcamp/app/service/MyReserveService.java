package com.healingcamp.app.service;

import com.healingcamp.app.dao.MyReserveDao;
import com.healingcamp.app.domain.CampDto;
import com.healingcamp.app.domain.ReservationDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyReserveService {
    @Autowired
    MyReserveDao myReserveDao;

    public List<CampDto> selectCampReserve(Integer U_num){
        return myReserveDao.selectCampReserve(U_num);
    }
    public Integer deleteCampOne(ReservationDto reservationDto){
        return myReserveDao.deleteCampOne(reservationDto);
    }
    public Integer insertReservation(ReservationDto reservationDto){
        return myReserveDao.insertReservation(reservationDto);
    }
}
