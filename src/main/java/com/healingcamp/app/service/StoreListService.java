package com.healingcamp.app.service;


import com.healingcamp.app.dao.StoreListDao;
import com.healingcamp.app.domain.ItemDto;
import com.healingcamp.app.domain.StorePageHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class StoreListService {
    @Autowired
    StoreListDao storeListDao;

    public List<ItemDto> selectItemList(StorePageHandler sph){

        return storeListDao.selectItemList(sph);
    }
    public Integer selectItemCount(StorePageHandler sph){
        return storeListDao.selectItemCount(sph);
    }
}
