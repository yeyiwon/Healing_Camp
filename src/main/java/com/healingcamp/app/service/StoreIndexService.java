package com.healingcamp.app.service;

import com.healingcamp.app.dao.StoreIndexDao;
import com.healingcamp.app.domain.ItemDto;
import com.healingcamp.app.domain.Item_wishlistDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class StoreIndexService {
    @Autowired
    StoreIndexDao storeIndexDao;
    public List<ItemDto> selectBestItem(Map<String, Integer> map){
        return storeIndexDao.selectBestItem(map);
    }
    public List<ItemDto> selectMDItem(Map<String, Integer> map){
        return storeIndexDao.selectMDItem(map);
    }
    public List<ItemDto> selectNewItem(Map<String, Integer> map){
        return storeIndexDao.selectNewItem(map);
    }
    public List<Integer> selectItemInIndex(){
        return storeIndexDao.selectItemInIndex();
    }
}
