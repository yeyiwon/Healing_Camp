package com.healingcamp.app.dao;

import com.healingcamp.app.domain.CampDto;
import com.healingcamp.app.domain.Camp_reviewDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class Camp_reviewDao {
    @Autowired
    SqlSession session;

    String namespace = "com.healingcamp.app.dao.camp_reviewMapper.";

    public List<Camp_reviewDto> selectCampReview(Integer C_ID_fk) {
        return session.selectList(namespace + "selectCampReview", C_ID_fk);
    }

    public List<Camp_reviewDto> campreviewlist(int C_ID){
        return session.selectList(namespace+"campreviewlist", C_ID);
    }

    public int insertCampReview(Camp_reviewDto camp_reviewDto){
        return session.insert(namespace+"insertCampReview", camp_reviewDto);
    }

    public String chkCampReviewList(Camp_reviewDto camp_reviewDto){
        return session.selectOne(namespace+"chkCampReviewList",camp_reviewDto);
    }

    public int deleteCampReview(Camp_reviewDto camp_reviewDto){
        return session.delete(namespace+"deleteCampReview", camp_reviewDto);
    }

    public int updateCampReview(Camp_reviewDto camp_reviewDto){
        return session.update(namespace+"updateCampReview", camp_reviewDto);
    }

    public List<Camp_reviewDto> usercampreviewlist(int U_num){
        return session.selectList(namespace+"usercampreviewlist", U_num);
    }

}