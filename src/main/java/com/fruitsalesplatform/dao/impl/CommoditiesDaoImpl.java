package com.fruitsalesplatform.dao.impl;

import com.fruitsalesplatform.dao.CommoditiesDao;
import com.fruitsalesplatform.entity.Commodities;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository     // 为了包扫描时这个 Dao 被扫描到
public class CommoditiesDaoImpl extends BaseDaoImpl<Commodities> implements CommoditiesDao {
    public CommoditiesDaoImpl() {
        // 设置命名空间
        super.setNs("com.fruitsalesplatform.mapper.CommoditiesMapper");
    }
    // 实现接口自己的方法定义
    @Override
    public int count(Map map) {
        return this.getSqlSession().selectOne(this.getNs() + ".count", map);
    }
}
