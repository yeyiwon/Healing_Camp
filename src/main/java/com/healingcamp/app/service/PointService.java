package com.healingcamp.app.service;

import com.healingcamp.app.dao.PointDao;
import com.healingcamp.app.domain.PointDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PointService {
    @Autowired
    PointDao pointDao;

    public Integer updatePoint(PointDto pointDto){
        return pointDao.updatePoint(pointDto);
    }
    public Integer selectUserYn(Integer U_num){
        return pointDao.selectUserYn(U_num);
    }

    public Integer insertPoint(Integer U_num){
        return pointDao.insertPoint(U_num);
    }
    public Integer getPointall(int U_num_fk) {
        return pointDao.selectPointAll(U_num_fk);
    }
}
