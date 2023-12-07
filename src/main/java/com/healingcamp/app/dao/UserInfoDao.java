package com.healingcamp.app.dao;

import com.healingcamp.app.domain.MemberDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserInfoDao {
    @Autowired
    SqlSession session;

    public MemberDto selectUserInfo(String U_ID){
        return session.selectOne("selectUserInfo", U_ID);
    }

    public Integer updateUserInfo(MemberDto memberDto){
        return session.update("updateUserInfo", memberDto);
    }
}
