package com.healingcamp.app.service;

import com.healingcamp.app.dao.UserInfoDao;
import com.healingcamp.app.domain.MemberDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserInfoService {
    @Autowired
    UserInfoDao userInfoDao;

    public MemberDto selectUserInfo(String U_ID){
        return userInfoDao.selectUserInfo(U_ID);
    }
    public Integer updateUserInfo(MemberDto memberDto){
        return userInfoDao.updateUserInfo(memberDto);
    }
}
