package config;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * SqlSession 객체를 제공하는 팩토리 클래스
 */
public class MyBatisUtil {

	private static SqlSessionFactory sessionFactory;

	static {

		try {

			// 1-1. xml 설정 문서 읽어오기
			Charset charset = Charset.forName("UTF-8"); // 설정 파일에 있는 한글 처리를 위해서
			Resources.setCharset(charset);

			Reader rd = Resources.getResourceAsReader("config/mybatis-config.xml");

			// 1-2. 위에서 생성한 Reader객체를 이용하여 SqlSessionFactory 객체 생성하기
			sessionFactory = new SqlSessionFactoryBuilder().build(rd);

			// 1-3. 사용 끝난 Reader 객체 닫아주기
			rd.close();

		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
	
	
	/**
	 * SqlSesseion객체를 제공하는 팩토리 메소드
	 * @return SqlSesseion객체
	 */
	public static SqlSession getInstance() {
		return sessionFactory.openSession(); // 기본값: autoCommit => false
	}

	
	/**
	 * SqlSesseion객체를 제공하는 팩토리 메소드
	 * @param autoCommit 오토커밋 여부
	 * @return SqlSesseion객체
	 */
	public static SqlSession getInstance(boolean autoCommit) {
		return sessionFactory.openSession(autoCommit); 
	}
	
	
    public static SqlSessionFactory getSqlSessionFactory() {
        return sessionFactory;
    }

    /**
     * SqlSession 객체를 제공하는 팩토리 메소드 (오버로딩)
     * @param autoCommit 오토커밋 여부
     * @return SqlSession 객체
     */
    public static SqlSession openSession(boolean autoCommit) {
        return sessionFactory.openSession(autoCommit);
    }

    /**
     * SqlSession 객체를 제공하는 팩토리 메소드 (오버로딩)
     * @return SqlSession 객체
     */
    public static SqlSession openSession() {
        return sessionFactory.openSession();
    }
}
