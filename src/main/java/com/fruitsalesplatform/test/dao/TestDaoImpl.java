package com.fruitsalesplatform.test.dao;

import com.fruitsalesplatform.test.entity.User;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository     // 为了包扫描时这个 Dao 被扫描到
public class TestDaoImpl implements TestDao {
    @Autowired  // 注入 sqlSessionFactory
    private SqlSessionFactory sqlSessionFactory;
    private SqlSession sqlSession = null;

    public SqlSession getSqlSession() {
        if (sqlSession == null) {
            sqlSession = sqlSessionFactory.openSession();
        }
        return sqlSession;
    }

    @Override
    public List<User> findUserByName(User user) {
        List<User> uList = getSqlSession().selectList("test.findUserByName", "%" + user.getName() + "%");
        return uList;
    }
}
