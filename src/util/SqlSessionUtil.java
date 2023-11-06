package util;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

public class SqlSessionUtil {

    private static SqlSessionFactory sqlSessionFactory;

    static {
        try {
            // MyBatis 설정 파일의 경로
            String resource = "config/mybatis-config.xml";
            InputStream inputStream = SqlSessionUtil.class.getClassLoader().getResourceAsStream(resource);

            // SqlSessionFactory 만들어주기
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    //새로운 세션 생성하기
    public static SqlSession getSqlSession() {
        return sqlSessionFactory.openSession();
    }
}