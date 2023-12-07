package com.healingcamp.app.service;

import com.healingcamp.app.dao.StoreBrandDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StoreBrandService {
    @Autowired
    StoreBrandDao storeBrandDao;

    public List<String> storeBrandName(){
        return storeBrandDao.storeBrandName();
    }
}
