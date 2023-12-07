package com.healingcamp.app.service;

import com.healingcamp.app.dao.MemDao;
import com.healingcamp.app.dao.MemberDao;
import com.healingcamp.app.domain.MemberDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MemberService {
    private final MemDao memDao;

    public int save(MemberDto memberDto) {
        System.out.println("memberDto = " + memberDto);
        return memDao.save(memberDto);
    }

    public List<MemberDto> findAll() {
        return memDao.findAll();
    }

    public MemberDto findById(long U_name) {
        return memDao.findById(U_name);
    }


    public String idCheck(String U_id) {
        MemberDto memberDto = memDao.findByU_id(U_id);
        System.out.println("memberDto: " + memberDto );
        if (memberDto == null) {
            return "ok";
        } else {
            return "no";
        }
    }



    public List<MemberDto> getMemberAll(Map map) {
        System.out.println("map = " + map);
        return memDao.selectMemberAll(map);
    }
}
