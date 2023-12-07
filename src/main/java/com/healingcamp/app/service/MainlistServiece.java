package com.healingcamp.app.service;

import com.healingcamp.app.dao.MainlistDao;
import com.healingcamp.app.domain.CampDto;
import com.healingcamp.app.domain.ItemDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class MainlistServiece {

    @Autowired
    MainlistDao mainlistdao;

    public List<CampDto> getCampAll(Map map) {
        return mainlistdao.selectCampAll(map);
    }
    public List<ItemDto> itemMainlist(Map map){
        return mainlistdao.itemMainlist(map);
    }
}
