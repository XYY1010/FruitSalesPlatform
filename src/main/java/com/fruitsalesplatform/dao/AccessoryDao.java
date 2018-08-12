package com.fruitsalesplatform.dao;

import com.fruitsalesplatform.entity.Accessory;

import java.io.Serializable;

public interface AccessoryDao extends BaseDao<Accessory> {
    // 这里可以直接使用继承的 BaseDao 的增删改查的方法
    // 定义新的方法
    public int deleteByFruitId(Serializable fruitId);
}
