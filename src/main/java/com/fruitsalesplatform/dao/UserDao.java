package com.fruitsalesplatform.dao;

import com.fruitsalesplatform.entity.User;

public interface UserDao extends BaseDao<User> {
    // 这里可以直接使用继承的 BaseDao 类的增、删、改、查方法
    // 以后还可以再添加新的方法定义
}
