package com.fruitsalesplatform.dao;

import com.fruitsalesplatform.entity.Commodities;

import java.util.Map;

public interface CommoditiesDao extends BaseDao<Commodities> {
    // 这里可以直接使用继承的 BaseDao 的增删改查的方法
    // 添加新方法定义
    public int count(Map map);  // 根据条件统计结果集数量
}
