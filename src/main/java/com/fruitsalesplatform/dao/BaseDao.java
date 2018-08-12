package com.fruitsalesplatform.dao;


import java.io.Serializable;
import java.util.List;
import java.util.Map;

// 泛型类，基础 DAO 接口
public interface BaseDao<T> {
    public T get(Serializable id);      // 只查询一个数据，常用于修改
    public List<T> find(Map map);       // 根据条件查询出多个结果
    public void insert(T entity);       // 插入，用实体作为参数
    public void update(T entity);       // 修改，用实体作为参数
    public void deleteById(Serializable id);     // 按 id 删除，删除一条，支持整型和字符串类型 id
    public void delete(Serializable[] ids);     // 批量删除，支持整型和字符串类型 id
}
