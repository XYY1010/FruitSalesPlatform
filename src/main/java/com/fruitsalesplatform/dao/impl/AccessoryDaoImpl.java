package com.fruitsalesplatform.dao.impl;

import com.fruitsalesplatform.dao.AccessoryDao;
import com.fruitsalesplatform.entity.Accessory;
import org.springframework.stereotype.Repository;

import java.io.Serializable;

@Repository // 为了包扫描时此 Dao 类被扫描到
public class AccessoryDaoImpl extends BaseDaoImpl<Accessory> implements AccessoryDao {
    public AccessoryDaoImpl() {
        super.setNs("com.fruitsalesplatform.mapper.AccessoryMapper");
    }
    public int deleteByFruitId(Serializable fruitId) {
        return this.getSqlSession().delete(this.getNs() + ".deleteByFruitId", fruitId);
    }
}
