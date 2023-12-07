package com.healingcamp.app.dao;

import com.healingcamp.app.domain.MemberDto;

import java.sql.SQLException;

public interface MemberDao {
    void deleteAll() throws SQLException;

    int insertMember(MemberDto user);
    MemberDto selectMemberIdChk(String U_id) throws Exception;

    int updateMember(MemberDto user) throws Exception;

    int deleteMember(String uid) throws SQLException;
}
