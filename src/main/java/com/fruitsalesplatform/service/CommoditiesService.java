package com.fruitsalesplatform.service;

import com.fruitsalesplatform.entity.Commodities;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface CommoditiesService {
    public Commodities get(Serializable id);    // 只查询一个数据，常用于修改
    public List<Commodities> find(Map map);     // 根据条件查询多个结果
    public void insert(Commodities commodities);    // 插入，用实体作为参数
    public void update(Commodities commodities);    // 修改，用实体作为参数
    public void deleteById(Serializable id);        // 按 id 删除，删除一条数据，支持整型和字符串类型 id
    public void delete(Serializable[] ids);         // 批量删除，支持整型和字符串类型 id
    public int count(Map map);             // 根据条件统计结果集数量
}
