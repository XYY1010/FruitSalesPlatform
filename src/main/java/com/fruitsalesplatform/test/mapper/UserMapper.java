package com.fruitsalesplatform.test.mapper;

import com.fruitsalesplatform.test.entity.User;

public interface UserMapper {
    public User findUserByName(String name);
}
