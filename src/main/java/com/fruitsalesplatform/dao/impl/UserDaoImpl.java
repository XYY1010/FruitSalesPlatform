package com.fruitsalesplatform.dao.impl;

import com.fruitsalesplatform.dao.UserDao;
import com.fruitsalesplatform.entity.User;
import org.springframework.stereotype.Repository;


@Repository     // 为了包扫描的时候这个 Dao 被扫描到
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {
    public UserDaoImpl() {
        // 设置命名空间
        super.setNs("com.fruitsalesplatform.mapper.UserMapper");
    }
    // 如果接口 UserDao 有新的方法定义，在下面可以实现
}
