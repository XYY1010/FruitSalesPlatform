package com.fruitsalesplatform.service;

import com.fruitsalesplatform.entity.Accessory;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface AccessoryService {
    public Accessory get(Serializable id);
    public List<Accessory> find(Map map);
    public void insert(Accessory accessory);
    public void update(Accessory accessory);
    public void deleteById(Serializable id);
    public void delete(Serializable[] ids);
    public int deleteByFruitId(Serializable fruitId);
}
