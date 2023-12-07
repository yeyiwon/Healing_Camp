package com.healingcamp.app.service;

import com.healingcamp.app.dao.CampDao;
import com.healingcamp.app.domain.CampDto;
import com.healingcamp.app.domain.CampPageHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CampService {

    @Autowired
    CampDao campdao;

    public CampDto selectone(int C_ID){
        return campdao.selectCampOne(C_ID);
    }
    public List<CampDto> getCampAll(Map map) {
        return campdao.selectCampAll(map);
    }

    public int getCampCount(Map map) {
        return campdao.getCampCount(map);
    }
    public CampDto getCDOne(int C_ID) {
        return campdao.getCDOne(C_ID);
    }


}
