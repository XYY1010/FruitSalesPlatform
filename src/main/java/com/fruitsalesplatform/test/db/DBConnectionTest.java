package com.fruitsalesplatform.test.db;

import com.fruitsalesplatform.test.entity.User;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class DBConnectionTest {
    // MyBatis 配置文件
    private String resource = "beans.xml";
    private SqlSessionFactory sqlSessionFactory;
    private SqlSession sqlSession = null;
    public void testConnection() throws Exception {
        // 获取 Spring 类加载配置对象
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(resource);
        // 从配置对象中创建会话工厂，并注入 MyBatis 配置文件的信息
        sqlSessionFactory = (SqlSessionFactory) context.getBean("sessionFactory");
        sqlSession = sqlSessionFactory.openSession();
        if (sqlSession != null) {
            System.out.println("MyBatis-数据库连接成功！目前 SQL 配置数目：");
            System.out.println(sqlSession.getConfiguration().getMappedStatements().size());
        } else {
            System.out.println("MyBatis-数据库连接失败！");
        }
    }
    public SqlSession getSqlSession() throws Exception {
        // 获取 Spring 类似加载对象
        ClassPathXmlApplicationContext applicationContext = new ClassPathXmlApplicationContext(resource);
        // 从配置对象中创建会话工厂，并注入 MyBatis 配置文件的信息
        sqlSessionFactory = (SqlSessionFactory) applicationContext.getBean("sessionFactory");
        sqlSession = sqlSessionFactory.openSession();
        return sqlSession;
    }
    public void TestSelect() throws Exception {
        sqlSession = getSqlSession();
        System.out.println(sqlSession.getConfiguration().getMappedStatements());
        User user = sqlSession.selectOne("test.findUserByName", "张三");
        System.out.println("取出的用户信息：");
        System.out.println("账号：" + user.getUsername());
        System.out.println("密码：" + user.getPassword());
        System.out.println("姓名：" + user.getName());
        System.out.println("电话：" + user.getTelephone());
    }
    public static void main(String[] args) throws Exception {
        DBConnectionTest dbConnectionTest = new DBConnectionTest();
        dbConnectionTest.TestSelect();
    }
}
