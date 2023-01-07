package util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class MyBatisUtil {
    private static SqlSessionFactory sessionFactory;
    static {
        try {
            //加载配置文件
            InputStream is = Resources.getResourceAsStream("mybatis.xml");
            //创建sessionFactory对象
            sessionFactory = new SqlSessionFactoryBuilder().build(is);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    //获取session对象
    public static SqlSession openSession() {
        return sessionFactory.openSession(true);
    }
}
