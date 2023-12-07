package com.healingcamp.app.service;

import com.healingcamp.app.dao.Camp_wishilistDao;
import com.healingcamp.app.domain.CampDto;
import com.healingcamp.app.domain.Camp_wishlistDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class Camp_wishilistService {

    @Autowired
    Camp_wishilistDao camp_wishilistDao;

    // 좋아요 유무 확인 먼저
    public Integer GetCampAddLike(Map map) {
        return camp_wishilistDao.SelcetCampAddLike(map);
    }

    public Integer CampAddLike(Map map) {
        return camp_wishilistDao.CampAddLike(map);
    }

    public Integer DropCampAddLike(Map map) {
        return camp_wishilistDao.CampDeleteLike(map);
    }
    public int insertcampwishlist(Camp_wishlistDto camp_wishlistDto){
        return camp_wishilistDao.insertCampwishlist(camp_wishlistDto);
    }

    public String chkCampwishlist(Camp_wishlistDto camp_wishlistDto){
        return camp_wishilistDao.chkCampWishlist(camp_wishlistDto);
    }

    public int deleteCampwishlist(Camp_wishlistDto camp_wishlistDto){
        return camp_wishilistDao.deleteCampWishlist(camp_wishlistDto);
    }

    public List<CampDto> getcampwishlist(int U_num){
        return camp_wishilistDao.campwishlist(U_num);
    }
}

