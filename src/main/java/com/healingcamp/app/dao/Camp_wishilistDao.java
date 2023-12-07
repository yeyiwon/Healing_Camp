package com.healingcamp.app.dao;

import com.healingcamp.app.domain.CampDto;
import com.healingcamp.app.domain.Camp_wishlistDto;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class Camp_wishilistDao {
    @Autowired
    SqlSession session;

    String namespace="com.healingcamp.app.dao.camp_wishlistMapper.";

    // 로그인한 아이디에 좋아요 유무 확인
    public Integer SelcetCampAddLike(Map map){
        return session.selectOne(namespace + "selectCampAddLike", map);
    }
    public int CampAddLike(Map map){
        return session.update(namespace + "CampAddLike", map);
    }

    public int CampDeleteLike(Map map) {
        return session.delete("CampDeleteLike", map);
    }


    public int insertCampwishlist(Camp_wishlistDto camp_wishlistDto){
        return session.insert(namespace+"insertCampWishlist", camp_wishlistDto);
    }
    public String chkCampWishlist(Camp_wishlistDto camp_wishlistDto){
        return session.selectOne(namespace+"chkCampWishlist",camp_wishlistDto);
    }
    public int deleteCampWishlist(Camp_wishlistDto camp_wishlistDto){
        return session.delete(namespace+"deleteCampWishlist", camp_wishlistDto);
    }

    public List<CampDto> campwishlist(int U_num){
        return session.selectList(namespace+"campwishlist", U_num);
    }
}

