package util;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MybatisUtil {
	
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		InputStream is;
		try {
			is = Resources.getResourceAsStream("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(is);
			TransactionFactory factory = new JdbcTransactionFactory();
			Environment environment = new Environment("mybatis-conf", factory, HikariCPUtil.getDataSource());
			sqlSessionFactory.getConfiguration().setEnvironment(environment);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSession getSqlSession(boolean autoCommit) {
		return sqlSessionFactory.openSession(autoCommit);
	}
	
	public static SqlSession getSqlSession() {
		return getSqlSession(true);
	}
	
	public static void main(String[] args) {
		log.info("{}", sqlSessionFactory.getConfiguration().getEnvironment().getDataSource());
		log.info("{}", getSqlSession());
	}
	
}
