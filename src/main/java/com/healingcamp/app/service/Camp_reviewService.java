package com.healingcamp.app.service;


import com.healingcamp.app.dao.Camp_reviewDao;
import com.healingcamp.app.domain.CampDto;
import com.healingcamp.app.domain.Camp_reviewDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class Camp_reviewService {

    @Autowired
    Camp_reviewDao camp_reviewDao;

    public List<Camp_reviewDto> selectCampReview(Integer C_ID_fk){
        return camp_reviewDao.selectCampReview(C_ID_fk);

    }
    public List<Camp_reviewDto> getcampreviewlist(int C_ID){
        return camp_reviewDao.campreviewlist(C_ID);
    }

    public int insertcampreview(Camp_reviewDto camp_reviewDto){
        return camp_reviewDao.insertCampReview(camp_reviewDto);
    }

    public String chkCampReviewList(Camp_reviewDto camp_reviewDto){
        return camp_reviewDao.chkCampReviewList(camp_reviewDto);
    }

    public int updateCampReview(Camp_reviewDto camp_reviewDto){
        return camp_reviewDao.updateCampReview(camp_reviewDto);
    }

    public int deleteCampReview(Camp_reviewDto camp_reviewDto){
        return  camp_reviewDao.deleteCampReview(camp_reviewDto);
    }

    public List<Camp_reviewDto> usercampreviewlist(int U_num){
        return camp_reviewDao.usercampreviewlist(U_num);
    }
}
