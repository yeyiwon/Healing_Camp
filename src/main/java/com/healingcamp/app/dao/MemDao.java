package com.healingcamp.app.dao;

import com.healingcamp.app.domain.MemberDto;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@RequiredArgsConstructor
public class MemDao {
    private final SqlSessionTemplate sql;

    @Autowired
    SqlSession session;

    String namespace="com.healingcamp.app.dao.MemberMapper.";
    public int save(MemberDto memberDto){
        System.out.println("memberDto = " + memberDto);
        return sql.insert("com.healingcamp.app.dao.MemberMapper.insertMember.insertPoint", memberDto);
    }

    public List<MemberDto> findAll() {
        return sql.selectList("com.healingcamp.app.dao.MemberMapper.findAll");
    }

    public MemberDto findById(long U_name) {
        return sql.selectOne("com.healingcamp.app.dao.MemberMapper.findById", U_name);
    }

    public MemberDto findByU_id(String loginId) {

        System.out.println("loginId: " + loginId );
        return sql.selectOne("com.healingcamp.app.dao.MemberMapper.findByU_id", loginId);
    }


    public List<MemberDto> selectMemberAll(Map map) {
        System.out.println("map3 = " + map);
        return session.selectList(namespace + "selectmemberidf", map);
    }
}
